import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:fisiomate/services/logger_service.dart';
import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';

// Wraps the device camera + ML Kit pose detector into a single
// frame -> [Pose] stream.
class PoseDetectionService {
  CameraController? _controller;
  CameraDescription? _camera;

  final PoseDetector _poseDetector = PoseDetector(
    options: PoseDetectorOptions(mode: PoseDetectionMode.stream),
  );

  bool _isDetecting = false;
  final StreamController<Pose?> _poseStreamController =
      StreamController<Pose?>.broadcast();

  CameraController? get controller => _controller;
  Stream<Pose?> get poseStream => _poseStreamController.stream;

  Future<void> initialize({
    CameraLensDirection lensDirection = CameraLensDirection.back,
  }) async {
    final cameras = await availableCameras();
    _camera = cameras.firstWhere(
      (camera) => camera.lensDirection == lensDirection,
      orElse: () => cameras.first,
    );

    _controller = CameraController(
      _camera!,
      ResolutionPreset.medium,
      enableAudio: false,
      imageFormatGroup: ImageFormatGroup.nv21,
    );

    await _controller!.initialize();
    await _controller!.startImageStream(_onFrame);
  }

  void _onFrame(CameraImage image) {
    if (_isDetecting || _camera == null) return;
    _isDetecting = true;

    final inputImage = _toInputImage(image, _camera!);
    if (inputImage == null) {
      _isDetecting = false;
      return;
    }

    _poseDetector
        .processImage(inputImage)
        .then((poses) {
          _poseStreamController.add(poses.isNotEmpty ? poses.first : null);
        })
        .catchError((Object error, StackTrace stackTrace) {
          LoggerService.e('Pose detection failed', error, stackTrace);
        })
        .whenComplete(() => _isDetecting = false);
  }

  /// Both platforms are configured to emit NV21 via [ImageFormatGroup.nv21],
  /// so one conversion path covers Android and iOS instead of branching on
  /// BGRA8888 for iOS. Ported from the pose-detection-demo spike, where
  /// this was the most fragile part of the pipeline — if landmarks look
  /// consistently offset or rotated on a given device, check here first.
  InputImage? _toInputImage(CameraImage image, CameraDescription camera) {
    final rotation =
        InputImageRotationValue.fromRawValue(camera.sensorOrientation) ??
        InputImageRotation.rotation0deg;

    final bytes = Uint8List.fromList(
      image.planes.fold<List<int>>(
        [],
        (previous, plane) => previous..addAll(plane.bytes),
      ),
    );

    return InputImage.fromBytes(
      bytes: bytes,
      metadata: InputImageMetadata(
        size: Size(image.width.toDouble(), image.height.toDouble()),
        rotation: rotation,
        format: InputImageFormat.nv21,
        bytesPerRow: image.planes.first.bytesPerRow,
      ),
    );
  }

  Future<void> dispose() async {
    await _controller?.stopImageStream();
    await _controller?.dispose();
    await _poseDetector.close();
    await _poseStreamController.close();
  }
}
