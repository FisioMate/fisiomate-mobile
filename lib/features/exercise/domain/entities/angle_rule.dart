/// Mirrors the backend's `RuleConfig` — a threshold check against one
/// named angle from `core/utils/angle_catalog.dart`, plus the feedback
/// message for each way it can fail.
class AngleRule {
  final String angleName;
  final double minAngle;
  final double maxAngle;
  final String missingMessage;
  final String belowMinMessage;
  final String aboveMaxMessage;

  const AngleRule({
    required this.angleName,
    required this.minAngle,
    required this.maxAngle,
    required this.missingMessage,
    required this.belowMinMessage,
    required this.aboveMaxMessage,
  });
}
