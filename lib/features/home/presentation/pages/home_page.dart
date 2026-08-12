part of '_pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const String _dummyPatientName = 'Zika';

  /// Merges this month's actual session log (completed/missed) with the
  /// weekly routine schedule (scheduled) so the calendar's numbers stay
  /// consistent with the Progress and Profile screens instead of being a
  /// separately hardcoded month.
  static Map<DateTime, DayExerciseStatus> _calendarStatusFor(DateTime month) {
    final logsByDate = {
      for (final log in dummySessionLogs)
        DateTime(log.date.year, log.date.month, log.date.day): log,
    };
    final daysInMonth = DateUtils.getDaysInMonth(month.year, month.month);

    return {
      for (var day = 1; day <= daysInMonth; day++)
        DateTime(month.year, month.month, day): _statusForDay(
          DateTime(month.year, month.month, day),
          logsByDate,
        ),
    };
  }

  static DayExerciseStatus _statusForDay(
    DateTime date,
    Map<DateTime, SessionLog> logsByDate,
  ) {
    final log = logsByDate[date];
    if (log != null) {
      return log.status == SessionLogStatus.completed
          ? DayExerciseStatus.completed
          : DayExerciseStatus.missed;
    }

    final isScheduled = dummyRoutineItems.any(
      (item) => item.days.contains(DayOfWeek.fromDate(date)),
    );
    return isScheduled ? DayExerciseStatus.scheduled : DayExerciseStatus.none;
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final todaysRoutineItems = dummyRoutineItems
        .where((item) => item.days.contains(DayOfWeek.fromDate(now)))
        .toList();
    final monthlyStats = computeMonthlyProgressStats(dummySessionLogs);

    return Scaffold(
      appBar: MainAppBar(showLogo: true, showNotification: true),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                PersonalizedGreeting(
                  name: _dummyPatientName,
                  quote: "Konsistensi adalah kunci pemulihan Anda.",
                ),
                SizedBox(height: 16),
                TodaySessionCard(
                  exerciseCount: todaysRoutineItems.length,
                  totalMinutes: estimateRoutineDurationMinutes(
                    todaysRoutineItems,
                  ),
                  onStartSession: () =>
                      context.push('/exercise', extra: todaysRoutineItems),
                ),
                SizedBox(height: 48),
                ExerciseCalendarCard(
                  month: DateTime(now.year, now.month),
                  statusByDate: _calendarStatusFor(now),
                ),
                SizedBox(height: 48),
                MonthlyProgressSection(
                  dailyAccuracy: monthlyStats.accuracyTrend,
                  compliancePercent: monthlyStats.compliancePercent,
                  accuracyPercent: monthlyStats.averageAccuracy,
                  completedSessions: monthlyStats.completed,
                  totalSessions: monthlyStats.total,
                ),
                SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
