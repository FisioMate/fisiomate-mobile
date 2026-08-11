import 'package:fisiomate/features/exercise/domain/entities/day_of_week.dart';
import 'package:fisiomate/features/exercise/domain/entities/exercise.dart';

/// Mirrors the backend's `ExerciseRead` — a catalog [Exercise] plus the
/// per-patient prescription (sets, target reps or seconds, scheduled
/// days). Kept separate from [Exercise] itself since the catalog item
/// doesn't change per patient, but this does.
class RoutineItem {
  final String id;
  final Exercise exercise;
  final int sets;

  /// Reps if [exercise] is [RepBasedExercise], seconds to hold if
  /// [DurationBasedExercise].
  final int targetRepsOrSeconds;

  /// Days of the week this item is scheduled for — the backend doesn't
  /// hand us a pre-filtered "today's routine", so screens filter this
  /// list themselves (see `estimateRoutineDurationMinutes` and the
  /// home page's day filter).
  final List<DayOfWeek> days;

  const RoutineItem({
    required this.id,
    required this.exercise,
    required this.sets,
    required this.targetRepsOrSeconds,
    required this.days,
  });
}
