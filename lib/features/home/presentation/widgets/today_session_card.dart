part of '_widgets.dart';

/// "Sesi hari ini" summary card on the home screen
class TodaySessionCard extends StatelessWidget {
  final int exerciseCount;
  final int totalMinutes;
  final VoidCallback onStartSession;

  const TodaySessionCard({
    super.key,
    required this.exerciseCount,
    required this.totalMinutes,
    required this.onStartSession,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
      decoration: BoxDecoration(
        color: BaseColors.primary,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sesi hari ini',
            style: FontTheme.bodyLarge.copyWith(color: Colors.white),
          ),
          const SizedBox(height: 4),
          Text(
            '$exerciseCount Latihan Menunggu • $totalMinutes menit',
            style: FontTheme.headlineMedium.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: MainButton(
              label: 'Mulai sesi hari ini',
              variant: ButtonVariant.surface,
              rightIcon: const Icon(Icons.arrow_forward_rounded),
              onPressed: onStartSession,
            ),
          ),
        ],
      ),
    );
  }
}
