import 'package:fisiomate/features/exercise/domain/angle_rule_evaluator.dart';
import 'package:fisiomate/features/exercise/domain/entities/exercise.dart';
import 'package:fisiomate/features/exercise/domain/entities/pose_validation_state.dart';

enum RepPhase { unknown, up, down }

/// State machine for rep-counting exercises (squat, push-up, ...). A rep
/// is counted on the down -> up transition. Call [processFrame] once per
/// detection frame with this frame's computed angles
/// (`computeAllCatalogAngles`) and how much wall-clock time passed since
/// the last frame.
///
/// Only binary sesuai/tidak-valid, unlike [DurationBasedTracker] — the
/// gap between [RepBasedExercise.upRules] and [RepBasedExercise.downRules]
/// already acts as the "close but not quite" neutral zone, so a third
/// graded state would be redundant here.
class RepBasedTracker {
  final RepBasedExercise exercise;

  RepBasedTracker(this.exercise);

  int repCount = 0;
  RepPhase phase = RepPhase.unknown;
  PoseValidationState state = PoseValidationState.tidakValid;
  String? feedback;

  /// Time spent in [PoseValidationState.sesuai] vs total time processed —
  /// feeds `ExerciseSessionProgress`'s accuracy score.
  Duration validTime = Duration.zero;
  Duration totalTime = Duration.zero;

  void processFrame(Map<String, double?> computedAngles, Duration elapsed) {
    totalTime += elapsed;

    final downMessage = evaluateAngleRules(exercise.downRules, computedAngles);
    final upMessage = evaluateAngleRules(exercise.upRules, computedAngles);

    if (downMessage == null) {
      phase = RepPhase.down;
      state = PoseValidationState.sesuai;
      feedback = null;
      validTime += elapsed;
    } else if (upMessage == null) {
      if (phase == RepPhase.down) repCount++;
      phase = RepPhase.up;
      state = PoseValidationState.sesuai;
      feedback = null;
      validTime += elapsed;
    } else {
      // Neutral zone: surface guidance toward whichever state comes next.
      state = PoseValidationState.tidakValid;
      feedback = phase == RepPhase.down ? upMessage : downMessage;
    }
  }
}
