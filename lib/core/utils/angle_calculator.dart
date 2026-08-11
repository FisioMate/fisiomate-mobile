import 'dart:math';

import 'package:fisiomate/core/utils/angle_catalog.dart';
import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';

/// A bare 2D point
class Point2D {
  final double x;
  final double y;

  const Point2D(this.x, this.y);
}

/// Matches Google's official ML Kit "Classifying poses" reference formula
/// verbatim
double calculateAngle(Point2D first, Point2D mid, Point2D last) {
  var result =
      (atan2(last.y - mid.y, last.x - mid.x) -
          atan2(first.y - mid.y, first.x - mid.x)) *
      180 /
      pi;
  result = result.abs();
  if (result > 180) result = 360.0 - result;
  return result;
}

/// Runs [calculateAngle] once per frame for every angle in [angleCatalog]
/// (not just the ones the current exercise needs), so any `AngleRule` can
/// look up any angle by name without knowing how to compute it. `null`
/// means one of the three landmarks wasn't detected this frame.
Map<String, double?> computeAllCatalogAngles(
  Map<PoseLandmarkType, PoseLandmark> landmarks,
) {
  return angleCatalog.map((name, definition) {
    final start = landmarks[definition.start];
    final mid = landmarks[definition.mid];
    final end = landmarks[definition.end];

    if (start == null || mid == null || end == null) {
      return MapEntry(name, null);
    }

    return MapEntry(
      name,
      calculateAngle(
        Point2D(start.x, start.y),
        Point2D(mid.x, mid.y),
        Point2D(end.x, end.y),
      ),
    );
  });
}
