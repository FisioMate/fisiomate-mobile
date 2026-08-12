/// Mirrors the backend's `ExerciseLogRead` — one completed-exercise
/// record, embedded under its [RoutineItem] (`exercises[].logs` on `GET
/// /patients/me`). This is what the Progress feature derives session
/// history and stats from — there's no separate "session" concept on
/// the backend, only per-exercise completion logs.
class ExerciseLog {
  final String id;
  final String exerciseId;
  final int activeDurationSeconds;
  final int? completedReps;
  final int? completedSets;
  final double accuracyScore;
  final DateTime completedAt;

  const ExerciseLog({
    required this.id,
    required this.exerciseId,
    required this.activeDurationSeconds,
    this.completedReps,
    this.completedSets,
    required this.accuracyScore,
    required this.completedAt,
  });
}
