import 'dart:math';

import 'package:fisiomate/features/progress/domain/entities/session_log.dart';

// TODO: replace with real data fetched from the backend's full exercise
// log once that endpoint exists — filtering/searching/aggregation stays
// client-side either way, only the data source swaps out.
//
// Single source of truth for progress dummy data — the Progress feature,
// the home screen's calendar/monthly summary, and the profile screen's
// stat tiles all derive their numbers from this same list so they never
// drift out of sync with each other.
final List<SessionLog> dummySessionLogs = _generateDummySessionLogs();

/// ~30 days of history ending today, skipping Sundays (rest day in the
/// prescribed program, so no log entry at all — not "missed"). Fixed
/// seed so the dummy data is stable across hot reloads.
List<SessionLog> _generateDummySessionLogs() {
  final today = DateTime.now();
  final random = Random(42);
  final logs = <SessionLog>[];

  for (var i = 0; i < 15; i++) {
    final date = DateTime(
      today.year,
      today.month,
      today.day,
    ).subtract(Duration(days: i));

    if (date.weekday == DateTime.sunday) continue;

    final isMissed = random.nextDouble() < 0.30;
    final dateId =
        '${date.year}${date.month.toString().padLeft(2, '0')}${date.day.toString().padLeft(2, '0')}';

    logs.add(
      SessionLog(
        id: 'session-$dateId',
        date: date,
        completedAt: isMissed
            ? null
            : date.add(
                Duration(
                  hours: 10 + random.nextInt(9),
                  minutes: random.nextInt(60),
                ),
              ),
        exerciseCount: 3 + random.nextInt(3),
        accuracy: isMissed ? null : (65 + random.nextInt(31)).toDouble(),
        status: isMissed ? SessionLogStatus.missed : SessionLogStatus.completed,
      ),
    );
  }

  return logs..sort((a, b) => b.date.compareTo(a.date));
}
