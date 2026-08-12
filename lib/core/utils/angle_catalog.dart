import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';

/// The three landmarks that form one anatomically meaningful joint angle,
/// e.g. rightKnee = rightHip-rightKnee-rightAnkle.
class AngleDefinition {
  final PoseLandmarkType start;
  final PoseLandmarkType mid;
  final PoseLandmarkType end;

  const AngleDefinition({
    required this.start,
    required this.mid,
    required this.end,
  });
}

/// Fixed catalog of joint angles computable from ML Kit's pose landmarks.
const Map<String, AngleDefinition> angleCatalog = {
  'leftElbow': AngleDefinition(
    start: PoseLandmarkType.leftShoulder,
    mid: PoseLandmarkType.leftElbow,
    end: PoseLandmarkType.leftWrist,
  ),
  'rightElbow': AngleDefinition(
    start: PoseLandmarkType.rightShoulder,
    mid: PoseLandmarkType.rightElbow,
    end: PoseLandmarkType.rightWrist,
  ),
  'leftShoulder': AngleDefinition(
    start: PoseLandmarkType.leftElbow,
    mid: PoseLandmarkType.leftShoulder,
    end: PoseLandmarkType.leftHip,
  ),
  'rightShoulder': AngleDefinition(
    start: PoseLandmarkType.rightElbow,
    mid: PoseLandmarkType.rightShoulder,
    end: PoseLandmarkType.rightHip,
  ),
  'leftHip': AngleDefinition(
    start: PoseLandmarkType.leftShoulder,
    mid: PoseLandmarkType.leftHip,
    end: PoseLandmarkType.leftKnee,
  ),
  'rightHip': AngleDefinition(
    start: PoseLandmarkType.rightShoulder,
    mid: PoseLandmarkType.rightHip,
    end: PoseLandmarkType.rightKnee,
  ),
  'leftKnee': AngleDefinition(
    start: PoseLandmarkType.leftHip,
    mid: PoseLandmarkType.leftKnee,
    end: PoseLandmarkType.leftAnkle,
  ),
  'rightKnee': AngleDefinition(
    start: PoseLandmarkType.rightHip,
    mid: PoseLandmarkType.rightKnee,
    end: PoseLandmarkType.rightAnkle,
  ),
  'leftNeck': AngleDefinition(
    start: PoseLandmarkType.leftEar,
    mid: PoseLandmarkType.leftShoulder,
    end: PoseLandmarkType.leftHip,
  ),
  'rightNeck': AngleDefinition(
    start: PoseLandmarkType.rightEar,
    mid: PoseLandmarkType.rightShoulder,
    end: PoseLandmarkType.rightHip,
  ),
  'leftBody': AngleDefinition(
    start: PoseLandmarkType.leftShoulder,
    mid: PoseLandmarkType.leftHip,
    end: PoseLandmarkType.leftAnkle,
  ),
  'rightBody': AngleDefinition(
    start: PoseLandmarkType.rightShoulder,
    mid: PoseLandmarkType.rightHip,
    end: PoseLandmarkType.rightAnkle,
  ),
};
