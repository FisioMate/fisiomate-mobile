import 'package:fisiomate/features/progress/domain/entities/session_log.dart';

/// Aggregated numbers derived from a list of [SessionLog]s — compliance,
/// completion count, and the accuracy trend for whatever range of
/// sessions was passed in. Shared by the Progress, Home, and Profile
/// screens so they always show the same numbers for the same data.
class ProgressStats {
  final double compliancePercent;
  final int completed;
  final int total;
  final List<double> accuracyTrend;

  const ProgressStats({
    required this.compliancePercent,
    required this.completed,
    required this.total,
    required this.accuracyTrend,
  });

  double get averageAccuracy => accuracyTrend.isEmpty
      ? 0
      : accuracyTrend.reduce((a, b) => a + b) / accuracyTrend.length;
}

ProgressStats computeAllTimeProgressStats(List<SessionLog> sessions) {
  return _statsFor([...sessions]..sort((a, b) => a.date.compareTo(b.date)));
}

ProgressStats computeMonthlyProgressStats(
  List<SessionLog> sessions, {
  DateTime? month,
}) {
  final now = month ?? DateTime.now();
  final filtered =
      sessions
          .where(
            (session) =>
                session.date.year == now.year &&
                session.date.month == now.month,
          )
          .toList()
        ..sort((a, b) => a.date.compareTo(b.date));
  return _statsFor(filtered);
}

ProgressStats computeWeeklyProgressStats(List<SessionLog> sessions) {
  final now = DateTime.now();
  final filtered =
      sessions.where((session) => now.difference(session.date).inDays <= 7).toList()
        ..sort((a, b) => a.date.compareTo(b.date));
  return _statsFor(filtered);
}

ProgressStats _statsFor(List<SessionLog> sessions) {
  final completed = sessions
      .where((session) => session.status == SessionLogStatus.completed)
      .length;
  final total = sessions.length;
  final accuracyTrend = sessions
      .where((session) => session.accuracy != null)
      .map((session) => session.accuracy!)
      .toList();

  return ProgressStats(
    compliancePercent: total == 0 ? 0 : (completed / total) * 100,
    completed: completed,
    total: total,
    accuracyTrend: accuracyTrend,
  );
}

/// Consecutive completed days ending today, walking backward. Days with
/// no log at all (rest days, e.g. Sundays) don't break the streak; the
/// first missed day does.
int computeCurrentStreak(List<SessionLog> sessions) {
  if (sessions.isEmpty) return 0;

  final logsByDate = {
    for (final session in sessions)
      DateTime(session.date.year, session.date.month, session.date.day):
          session,
  };
  final earliest = logsByDate.keys.reduce(
    (a, b) => a.isBefore(b) ? a : b,
  );

  var streak = 0;
  var cursor = DateTime.now();
  cursor = DateTime(cursor.year, cursor.month, cursor.day);

  while (!cursor.isBefore(earliest)) {
    final session = logsByDate[cursor];
    if (session != null) {
      if (session.status == SessionLogStatus.completed) {
        streak++;
      } else {
        break;
      }
    }
    cursor = cursor.subtract(const Duration(days: 1));
  }

  return streak;
}
