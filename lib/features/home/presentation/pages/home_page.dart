part of '_pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // TODO: replace with real data once ExerciseRepository is wired up.
  static final Map<DateTime, DayExerciseStatus> _dummyExerciseStatus = {
    for (final day in [1, 6, 9, 14, 17, 20, 21])
      DateTime(2026, 8, day): DayExerciseStatus.scheduled,
    for (final day in [2, 3, 4, 5, 7, 8, 10, 11, 12, 13, 15, 16, 18, 19, 22])
      DateTime(2026, 8, day): DayExerciseStatus.completed,
  };

  // TODO: replace with real data once ProgressRepository is wired up.
  static const List<double> _dummyDailyAccuracy = [
    0,
    25,
    40,
    48,
    52,
    53,
    58,
    62,
    63,
    60,
    58,
    55,
    59,
    58,
    62,
    70,
    75,
    78,
    79,
    75,
    68,
    64,
    70,
    78,
    82,
    85,
    88,
    90,
    91,
    90,
    92,
  ];

  @override
  Widget build(BuildContext context) {
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
                  name: "Lefi",
                  quote: "Konsistensi adalah kunci pemulihan Anda.",
                ),
                SizedBox(height: 16),
                TodaySessionCard(
                  exerciseCount: 3,
                  totalMinutes: 16,
                  onStartSession: () {},
                ),
                SizedBox(height: 48),
                ExerciseCalendarCard(
                  month: DateTime(2026, 8),
                  statusByDate: _dummyExerciseStatus,
                ),
                SizedBox(height: 48),
                MonthlyProgressSection(
                  dailyAccuracy: _dummyDailyAccuracy,
                  compliancePercent: 62,
                  accuracyPercent: 82,
                  completedSessions: 15,
                  totalSessions: 29,
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
