import 'package:fisiomate/features/exercise/domain/entities/day_of_week.dart';
import 'package:fisiomate/features/exercise/domain/entities/exercise.dart';
import 'package:fisiomate/features/exercise/domain/entities/exercise_log.dart';

/// Mirrors the backend's `ExerciseWithLogsRead` — a catalog [Exercise]
/// plus the per-patient prescription (sets, target reps or seconds,
/// scheduled days) and its completion history. Kept separate from
/// [Exercise] itself since the catalog item doesn't change per patient,
/// but this does.
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

  /// Completion history for this exercise — the Progress feature derives
  /// its session history/stats from these instead of a separate
  /// "session" concept, since the backend doesn't have one.
  final List<ExerciseLog> logs;

  const RoutineItem({
    required this.id,
    required this.exercise,
    required this.sets,
    required this.targetRepsOrSeconds,
    required this.days,
    this.logs = const [],
  });
}
