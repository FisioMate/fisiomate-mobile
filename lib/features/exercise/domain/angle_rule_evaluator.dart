import 'package:fisiomate/features/exercise/domain/entities/angle_rule.dart';

/// Evaluates [rules] short-circuit, in array order, against this frame's
/// computed angles (from `computeAllCatalogAngles`). Order = priority —
/// e.g. check back angle before knee angle, since injury-risk feedback
/// should outrank a "go deeper" prompt.
///
/// Returns `null` if every rule passes, otherwise the first failing
/// rule's message (missing/belowMin/aboveMax).
String? evaluateAngleRules(
  List<AngleRule> rules,
  Map<String, double?> computedAngles,
) {
  for (final rule in rules) {
    final angle = computedAngles[rule.angleName];

    if (angle == null) return rule.missingMessage;
    if (angle < rule.minAngle) return rule.belowMinMessage;
    if (angle > rule.maxAngle) return rule.aboveMaxMessage;
  }

  return null;
}
