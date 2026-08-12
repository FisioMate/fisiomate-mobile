import 'package:fisiomate/features/exercise/domain/entities/exercise.dart';
import 'package:fisiomate/features/exercise/domain/entities/routine_item.dart';

// The backend doesn't send session-timing data — this is app-side
// guesswork (not ported from a reference project), used to keep the
// "estimated minutes" shown on the home page and the pre-exercise page
// in sync since both derive it from the same routine list.
const _secondsPerRep = 3;
const _restSecondsBetweenSets = 15;

int estimateRoutineDurationMinutes(List<RoutineItem> items) {
  final totalSeconds = items.fold<int>(0, (sum, item) {
    final activeSeconds = item.exercise is RepBasedExercise
        ? item.targetRepsOrSeconds * _secondsPerRep
        : item.targetRepsOrSeconds;
    return sum + item.sets * (activeSeconds + _restSecondsBetweenSets);
  });
  return (totalSeconds / 60).ceil();
}
