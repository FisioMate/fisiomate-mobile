import 'package:fisiomate/features/exercise/domain/angle_rule_evaluator.dart';
import 'package:fisiomate/features/exercise/domain/entities/exercise.dart';
import 'package:fisiomate/features/exercise/domain/entities/pose_validation_state.dart';

/// Timer state machine for hold-based exercises (plank, shoulder raise,
/// ...). Call [processFrame] once per detection frame with this frame's
/// computed angles (`computeAllCatalogAngles`) and how much wall-clock
/// time passed since the last frame.
///
/// Unlike a real-world plank where breaking form means starting over, an
/// invalid frame here only *pauses* [heldDuration] instead of resetting
/// it — matches the product decision that the hold counter should be
/// paused, not wiped, while the patient re-adjusts.
class DurationBasedTracker {
  final DurationBasedExercise exercise;
  final int targetSeconds;

  DurationBasedTracker(this.exercise, this.targetSeconds);

  Duration heldDuration = Duration.zero;
  PoseValidationState state = PoseValidationState.tidakValid;
  String? feedback;

  /// Time spent in sesuai/kurangSesuai (both count as "valid enough") vs
  /// total time processed — feeds `ExerciseSessionProgress`'s accuracy
  /// score. Only a fully tidakValid frame counts against accuracy.
  Duration validTime = Duration.zero;
  Duration totalTime = Duration.zero;

  bool get isComplete =>
      heldDuration.inMilliseconds >= targetSeconds * 1000;

  void processFrame(Map<String, double?> computedAngles, Duration elapsed) {
    totalTime += elapsed;

    final result = evaluateHoldRules(exercise.holdRules, computedAngles);
    state = result.state;
    feedback = result.message;

    switch (result.state) {
      case PoseValidationState.sesuai:
        validTime += elapsed;
        if (!isComplete) heldDuration += elapsed;
      case PoseValidationState.kurangSesuai:
        validTime += elapsed;
      case PoseValidationState.tidakValid:
        break;
    }
  }
}
