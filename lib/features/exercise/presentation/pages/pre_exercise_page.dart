part of '_pages.dart';

class PreExercisePage extends StatelessWidget {
  final List<RoutineItem> routineItems;

  const PreExercisePage({super.key, required this.routineItems});

  @override
  Widget build(BuildContext context) {
    if (routineItems.isEmpty) {
      return Scaffold(
        appBar: MainAppBar(label: 'Sesi Hari Ini', showNotification: true),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Text(
              'Tidak ada latihan yang dijadwalkan hari ini.\n'
              'Nikmati hari istirahat Anda!',
              textAlign: TextAlign.center,
              style: FontTheme.bodyLarge.copyWith(
                color: BaseColors.textSecondary,
              ),
            ),
          ),
        ),
      );
    }

    final estimatedMinutes = estimateRoutineDurationMinutes(routineItems);

    return Scaffold(
      appBar: MainAppBar(label: 'Sesi Hari Ini', showNotification: true),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Home Exercise Program', style: FontTheme.headlineLarge),
              const SizedBox(height: 4),
              Text(
                '${routineItems.length} Gerakan • Estimasi $estimatedMinutes menit',
                style: FontTheme.bodyMedium.copyWith(
                  color: BaseColors.textSecondary,
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: ListView.separated(
                  itemCount: routineItems.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 12),
                  itemBuilder: (context, index) =>
                      RoutineItemCard(item: routineItems[index]),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: MainButton(
                  label: 'Mulai Latihan',
                  onPressed: () => context.push(
                    '/exercise/guide',
                    extra: ExerciseFlowArgs(
                      routineItems: routineItems,
                      itemIndex: 0,
                      currentSet: 1,
                      session: ExerciseSessionProgress(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
