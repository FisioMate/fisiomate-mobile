/// Mutable accumulator threaded through the guide-screen <-> camera-view
/// navigation loop for one exercise session, so total active time and
/// accuracy survive across exercises and sets. Deliberately a plain
/// object rather than a Cubit — this session is scoped to a single
/// linear navigation flow, not app-wide state, matching the rest of the
/// exercise feature's no-Cubit domain layer.
class ExerciseSessionProgress {
  Duration totalActiveTime = Duration.zero;
  Duration totalValidTime = Duration.zero;

  void addFrame(Duration elapsed, Duration validElapsed) {
    totalActiveTime += elapsed;
    totalValidTime += validElapsed;
  }

  /// Accuracy is "how much of the session was spent holding a valid (or
  /// close-to-valid) pose" — per product decision, based on time spent
  /// invalid rather than, say, rep-by-rep scoring.
  double get accuracyPercent {
    if (totalActiveTime.inMilliseconds == 0) return 0;
    return (totalValidTime.inMilliseconds / totalActiveTime.inMilliseconds) *
        100;
  }

  int get totalActiveMinutes => (totalActiveTime.inSeconds / 60).ceil();
}
