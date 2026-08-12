part of '_pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static Map<DateTime, DayExerciseStatus> _calendarStatusFor(
    DateTime month,
    List<RoutineItem> routineItems,
  ) {
    final sessionsByDate = {
      for (final session in buildSessionLogs(routineItems))
        session.date: session.status,
    };
    final daysInMonth = DateUtils.getDaysInMonth(month.year, month.month);

    return {
      for (var day = 1; day <= daysInMonth; day++)
        DateTime(month.year, month.month, day): _statusForDay(
          DateTime(month.year, month.month, day),
          sessionsByDate,
          routineItems,
        ),
    };
  }

  static DayExerciseStatus _statusForDay(
    DateTime date,
    Map<DateTime, SessionLogStatus> sessionsByDate,
    List<RoutineItem> routineItems,
  ) {
    final status = sessionsByDate[date];
    if (status != null) {
      return status == SessionLogStatus.completed
          ? DayExerciseStatus.completed
          : DayExerciseStatus.missed;
    }

    final isScheduled = routineItems.any(
      (item) => item.days.contains(DayOfWeek.fromDate(date)),
    );
    return isScheduled ? DayExerciseStatus.scheduled : DayExerciseStatus.none;
  }

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
                BlocBuilder<CurrentPatientCubit, CurrentPatientState>(
                  builder: (context, state) {
                    final name = switch (state) {
                      CurrentPatientLoaded(:final patient) => patient.name,
                      _ => 'Pasien',
                    };
                    return PersonalizedGreeting(
                      name: name,
                      quote: "Konsistensi adalah kunci pemulihan Anda.",
                    );
                  },
                ),
                SizedBox(height: 16),
                BlocBuilder<RoutineItemsCubit, RoutineItemsState>(
                  builder: (context, state) {
                    return switch (state) {
                      RoutineItemsLoaded(:final items) => _HomeProgress(
                        routineItems: items,
                      ),
                      RoutineItemsFailureState(:final message) =>
                        _TodaySessionError(
                          message: message,
                          onRetry: () =>
                              context.read<RoutineItemsCubit>().fetch(),
                        ),
                      _ => const _TodaySessionLoading(),
                    };
                  },
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

class _HomeProgress extends StatelessWidget {
  final List<RoutineItem> routineItems;

  const _HomeProgress({required this.routineItems});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final todaysRoutineItems = routineItems
        .where((item) => item.days.contains(DayOfWeek.fromDate(now)))
        .toList();
    final sessions = buildSessionLogs(routineItems);
    final monthlyStats = computeMonthlyProgressStats(sessions);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TodaySessionCard(
          exerciseCount: todaysRoutineItems.length,
          totalMinutes: estimateRoutineDurationMinutes(todaysRoutineItems),
          onStartSession: () =>
              context.push('/exercise', extra: todaysRoutineItems),
        ),
        SizedBox(height: 48),
        ExerciseCalendarCard(
          month: DateTime(now.year, now.month),
          statusByDate: HomePage._calendarStatusFor(
            DateTime(now.year, now.month),
            routineItems,
          ),
        ),
        SizedBox(height: 48),
        MonthlyProgressSection(
          dailyAccuracy: monthlyStats.accuracyTrend,
          compliancePercent: monthlyStats.compliancePercent,
          accuracyPercent: monthlyStats.averageAccuracy,
          completedSessions: monthlyStats.completed,
          totalSessions: monthlyStats.total,
        ),
      ],
    );
  }
}

class _TodaySessionLoading extends StatelessWidget {
  const _TodaySessionLoading();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40),
      decoration: BoxDecoration(
        color: BaseColors.primary50,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Center(
        child: CircularProgressIndicator(color: BaseColors.primary),
      ),
    );
  }
}

class _TodaySessionError extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _TodaySessionError({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: BaseColors.errorLight,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Gagal memuat data latihan',
            style: FontTheme.titleMedium.copyWith(
              color: BaseColors.error,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            message,
            style: FontTheme.bodySmall.copyWith(color: BaseColors.error),
          ),
          const SizedBox(height: 12),
          MainButton(
            label: 'Coba Lagi',
            variant: ButtonVariant.error,
            styleType: ButtonStyleType.outlined,
            onPressed: onRetry,
          ),
        ],
      ),
    );
  }
}
