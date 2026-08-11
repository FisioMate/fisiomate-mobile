import 'package:fisiomate/features/exercise/domain/entities/angle_rule.dart';
import 'package:fisiomate/features/exercise/domain/entities/pose_validation_state.dart';

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

/// Degrees outside [min, max] that still counts as "close" instead of an
/// outright miss — e.g. an angle 3° short of the target reads as
/// [PoseValidationState.kurangSesuai], not [PoseValidationState.tidakValid].
const nearMissMarginDegrees = 5.0;

/// Same short-circuit, array-order evaluation as [evaluateAngleRules], but
/// graded into three states instead of pass/fail — used for duration-based
/// (hold) exercises only, where "almost holding it" is worth telling apart
/// from "way off". A rep-based exercise's up/down state machine already
/// has an equivalent neutral zone built in, so it sticks with
/// [evaluateAngleRules].
PoseValidationResult evaluateHoldRules(
  List<AngleRule> rules,
  Map<String, double?> computedAngles,
) {
  for (final rule in rules) {
    final angle = computedAngles[rule.angleName];

    if (angle == null) {
      return PoseValidationResult(
        PoseValidationState.tidakValid,
        rule.missingMessage,
      );
    }

    if (angle < rule.minAngle) {
      final isNearMiss = angle >= rule.minAngle - nearMissMarginDegrees;
      return isNearMiss
          ? const PoseValidationResult(PoseValidationState.kurangSesuai)
          : PoseValidationResult(
              PoseValidationState.tidakValid,
              rule.belowMinMessage,
            );
    }

    if (angle > rule.maxAngle) {
      final isNearMiss = angle <= rule.maxAngle + nearMissMarginDegrees;
      return isNearMiss
          ? const PoseValidationResult(PoseValidationState.kurangSesuai)
          : PoseValidationResult(
              PoseValidationState.tidakValid,
              rule.aboveMaxMessage,
            );
    }
  }

  return const PoseValidationResult(PoseValidationState.sesuai);
}
