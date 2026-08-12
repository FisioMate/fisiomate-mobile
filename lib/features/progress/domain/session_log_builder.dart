import 'package:fisiomate/features/exercise/domain/entities/day_of_week.dart';
import 'package:fisiomate/features/exercise/domain/entities/routine_item.dart';
import 'package:fisiomate/features/progress/domain/entities/session_log.dart';

/// Derives day-by-day session history from [routineItems]' embedded
/// completion logs — the backend has no "session" concept of its own,
/// only per-exercise logs (`exercises[].logs` on `GET /patients/me`), so
/// this is where a "session" (one row per day, like the old dummy data
/// modeled it) gets reconstructed for the Progress UI.
///
/// A day becomes a [SessionLog] if either:
/// - it has at least one log (status `completed`, `accuracy` = that
///   day's average `accuracyScore`), or
/// - it's in the past and at least one [RoutineItem] was scheduled for
///   that weekday but has no log for it (status `missed`).
///
/// Days with nothing scheduled and nothing logged are omitted entirely
/// (never happened, not part of the program).
List<SessionLog> buildSessionLogs(List<RoutineItem> routineItems) {
  final today = DateTime.now();
  final todayDate = DateTime(today.year, today.month, today.day);

  final logsByDate = <DateTime, List<({DateTime completedAt, double accuracy})>>{};
  for (final item in routineItems) {
    for (final log in item.logs) {
      final date = DateTime(
        log.completedAt.year,
        log.completedAt.month,
        log.completedAt.day,
      );
      (logsByDate[date] ??= []).add((
        completedAt: log.completedAt,
        accuracy: log.accuracyScore,
      ));
    }
  }

  if (logsByDate.isEmpty) return [];

  final earliestDate = logsByDate.keys.reduce(
    (a, b) => a.isBefore(b) ? a : b,
  );

  final sessions = <SessionLog>[];
  for (
    var date = earliestDate;
    !date.isAfter(todayDate);
    date = date.add(const Duration(days: 1))
  ) {
    final dateId =
        '${date.year}${date.month.toString().padLeft(2, '0')}${date.day.toString().padLeft(2, '0')}';
    final logsForDate = logsByDate[date];

    if (logsForDate != null && logsForDate.isNotEmpty) {
      final accuracySum = logsForDate.fold<double>(
        0,
        (sum, log) => sum + log.accuracy,
      );
      final latestCompletedAt = logsForDate
          .map((log) => log.completedAt)
          .reduce((a, b) => a.isAfter(b) ? a : b);

      sessions.add(
        SessionLog(
          id: 'session-$dateId',
          date: date,
          completedAt: latestCompletedAt,
          exerciseCount: logsForDate.length,
          accuracy: accuracySum / logsForDate.length,
          status: SessionLogStatus.completed,
        ),
      );
      continue;
    }

    final scheduledCount = routineItems
        .where((item) => item.days.contains(DayOfWeek.fromDate(date)))
        .length;
    if (scheduledCount > 0) {
      sessions.add(
        SessionLog(
          id: 'session-$dateId',
          date: date,
          completedAt: null,
          exerciseCount: scheduledCount,
          accuracy: null,
          status: SessionLogStatus.missed,
        ),
      );
    }
  }

  return sessions..sort((a, b) => b.date.compareTo(a.date));
}
