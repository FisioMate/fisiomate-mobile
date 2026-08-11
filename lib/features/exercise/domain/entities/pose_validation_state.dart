/// The three states the camera-tracking screen can show for the current
/// frame. [kurangSesuai] only ever comes out of [evaluateHoldRules] (see
/// `angle_rule_evaluator.dart`) — rep-based exercises stay binary, since
/// their up/down state machine already has its own neutral zone between
/// the two rule sets.
enum PoseValidationState { sesuai, kurangSesuai, tidakValid }

/// Result of grading one frame against a rule set: the state plus, for
/// [PoseValidationState.tidakValid], the feedback message to show.
/// [PoseValidationState.kurangSesuai] never carries a message — it's a
/// silent "close, keep adjusting" state, not a correction the patient
/// needs typed out.
class PoseValidationResult {
  final PoseValidationState state;
  final String? message;

  const PoseValidationResult(this.state, [this.message]);
}
