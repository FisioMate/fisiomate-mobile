part of '_widgets.dart';

/// Draws the ML Kit [Pose] skeleton (bones + landmark dots) over the
/// camera preview, plus a numeric angle label for each entry in
/// [relevantAngleNames]. Coordinate-mapping and temporal smoothing are
/// ported from the pose-detection-demo spike's `PosePainter`, trimmed to
/// just the skeleton — that spike's separate posture-alignment overlay
/// isn't part of this design; [PoseStateBadge] carries that signal
/// instead, driven by the actual exercise rule evaluation rather than a
/// generic spine/shoulder/hip check.
class PosePainter extends CustomPainter {
  final Pose pose;
  final Size imageSize;
  final int sensorOrientation;
  final Map<String, double?> computedAngles;
  final List<String> relevantAngleNames;

  static final Map<PoseLandmarkType, List<double>> _smoothX = {};
  static final Map<PoseLandmarkType, List<double>> _smoothY = {};
  static const int _smoothingWindow = 4;

  PosePainter({
    required this.pose,
    required this.imageSize,
    required this.sensorOrientation,
    required this.computedAngles,
    required this.relevantAngleNames,
  });

  Offset _translate(PoseLandmark landmark, Size canvasSize) {
    double x = landmark.x / imageSize.width;
    double y = landmark.y / imageSize.height;

    // 270 is the front camera's sensor orientation on most Android
    // devices (the only camera this screen uses) — ported as-is from
    // pose-detection-demo, not derived from a general rotation
    // transform, so double check here first if landmarks ever look
    // mirrored/offset on a new device.
    if (sensorOrientation == 270) x = 1.0 - x;

    return Offset(x * canvasSize.width, y * canvasSize.height);
  }

  Offset _smooth(PoseLandmarkType type, Offset raw) {
    final xs = _smoothX.putIfAbsent(type, () => []);
    final ys = _smoothY.putIfAbsent(type, () => []);
    xs.add(raw.dx);
    ys.add(raw.dy);
    if (xs.length > _smoothingWindow) xs.removeAt(0);
    if (ys.length > _smoothingWindow) ys.removeAt(0);
    return Offset(
      xs.reduce((a, b) => a + b) / xs.length,
      ys.reduce((a, b) => a + b) / ys.length,
    );
  }

  @override
  void paint(Canvas canvas, Size size) {
    final bonePaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;
    final dotFill = Paint()..color = Colors.red;
    final dotBorder = Paint()
      ..color = Colors.white
      ..strokeWidth = 1.2
      ..style = PaintingStyle.stroke;

    Offset? point(PoseLandmarkType type) {
      final landmark = pose.landmarks[type];
      if (landmark == null || landmark.likelihood < 0.55) return null;
      return _smooth(type, _translate(landmark, size));
    }

    final points = {
      for (final type in PoseLandmarkType.values) type: point(type),
    };

    void bone(PoseLandmarkType a, PoseLandmarkType b) {
      final pa = points[a];
      final pb = points[b];
      if (pa == null || pb == null) return;
      canvas.drawLine(pa, pb, bonePaint);
    }

    // Face
    bone(PoseLandmarkType.leftEar, PoseLandmarkType.nose);
    bone(PoseLandmarkType.rightEar, PoseLandmarkType.nose);
    bone(PoseLandmarkType.leftEar, PoseLandmarkType.leftShoulder);
    bone(PoseLandmarkType.rightEar, PoseLandmarkType.rightShoulder);
    // Torso
    bone(PoseLandmarkType.leftShoulder, PoseLandmarkType.rightShoulder);
    bone(PoseLandmarkType.leftShoulder, PoseLandmarkType.leftHip);
    bone(PoseLandmarkType.rightShoulder, PoseLandmarkType.rightHip);
    bone(PoseLandmarkType.leftHip, PoseLandmarkType.rightHip);
    // Arms
    bone(PoseLandmarkType.leftShoulder, PoseLandmarkType.leftElbow);
    bone(PoseLandmarkType.leftElbow, PoseLandmarkType.leftWrist);
    bone(PoseLandmarkType.rightShoulder, PoseLandmarkType.rightElbow);
    bone(PoseLandmarkType.rightElbow, PoseLandmarkType.rightWrist);
    // Legs
    bone(PoseLandmarkType.leftHip, PoseLandmarkType.leftKnee);
    bone(PoseLandmarkType.leftKnee, PoseLandmarkType.leftAnkle);
    bone(PoseLandmarkType.leftAnkle, PoseLandmarkType.leftHeel);
    bone(PoseLandmarkType.leftAnkle, PoseLandmarkType.leftFootIndex);
    bone(PoseLandmarkType.rightHip, PoseLandmarkType.rightKnee);
    bone(PoseLandmarkType.rightKnee, PoseLandmarkType.rightAnkle);
    bone(PoseLandmarkType.rightAnkle, PoseLandmarkType.rightHeel);
    bone(PoseLandmarkType.rightAnkle, PoseLandmarkType.rightFootIndex);

    for (final p in points.values) {
      if (p == null) continue;
      canvas.drawCircle(p, 4, dotFill);
      canvas.drawCircle(p, 4, dotBorder);
    }

    for (final name in relevantAngleNames) {
      final angle = computedAngles[name];
      final mid = angleCatalog[name]?.mid;
      final anchor = mid == null ? null : points[mid];
      if (angle == null || anchor == null) continue;
      _drawAngleLabel(canvas, '${angle.toStringAsFixed(0)} deg', anchor);
    }
  }

  void _drawAngleLabel(Canvas canvas, String text, Offset anchor) {
    final painter = TextPainter(
      text: TextSpan(
        text: text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          backgroundColor: Colors.black45,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    painter.paint(canvas, Offset(anchor.dx + 8, anchor.dy - 8));
  }

  @override
  bool shouldRepaint(covariant PosePainter oldDelegate) => true;
}
