/// Mutable accumulator threaded through the guide-screen <-> camera-view
/// navigation loop for one exercise session, so active time and accuracy
/// survive across exercises and sets. Deliberately a plain object rather
/// than a Cubit — this session is scoped to a single linear navigation
/// flow, not app-wide state, matching the rest of the exercise feature's
/// no-Cubit domain layer.
///
/// Tracked per [RoutineItem.id] (not just one grand total) because the
/// backend logs completions per exercise — `GET /patients/me`'s
/// `exercises[].logs` — not per whole-routine session. [totalActiveTime]/
/// [accuracyPercent] below are still exposed as an overall summary for
/// the result screen, but [perExerciseSummaries] is what gets submitted.
class ExerciseSessionProgress {
  final Map<String, _ExerciseProgress> _byExerciseId = {};

  void addFrame(String exerciseId, Duration elapsed, Duration validElapsed) {
    final progress = _byExerciseId.putIfAbsent(
      exerciseId,
      () => _ExerciseProgress(),
    );
    progress.totalActiveTime += elapsed;
    progress.totalValidTime += validElapsed;
  }

  Duration get totalActiveTime => _byExerciseId.values.fold(
    Duration.zero,
    (sum, progress) => sum + progress.totalActiveTime,
  );

  Duration get totalValidTime => _byExerciseId.values.fold(
    Duration.zero,
    (sum, progress) => sum + progress.totalValidTime,
  );

  /// Accuracy is "how much of the session was spent holding a valid (or
  /// close-to-valid) pose" — per product decision, based on time spent
  /// invalid rather than, say, rep-by-rep scoring.
  double get accuracyPercent {
    final active = totalActiveTime;
    if (active.inMilliseconds == 0) return 0;
    return (totalValidTime.inMilliseconds / active.inMilliseconds) * 100;
  }

  int get totalActiveMinutes => (totalActiveTime.inSeconds / 60).ceil();

  List<({String exerciseId, Duration activeDuration, double accuracyPercent})>
  get perExerciseSummaries => _byExerciseId.entries
      .map(
        (entry) => (
          exerciseId: entry.key,
          activeDuration: entry.value.totalActiveTime,
          accuracyPercent: entry.value.accuracyPercent,
        ),
      )
      .toList();
}

class _ExerciseProgress {
  Duration totalActiveTime = Duration.zero;
  Duration totalValidTime = Duration.zero;

  double get accuracyPercent {
    if (totalActiveTime.inMilliseconds == 0) return 0;
    return (totalValidTime.inMilliseconds / totalActiveTime.inMilliseconds) *
        100;
  }
}
