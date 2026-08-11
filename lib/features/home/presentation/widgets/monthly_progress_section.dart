part of '_widgets.dart';

/// "Progress Bulan Ini" section — a daily pose-accuracy chart (design
/// mock originally labeled this "Persentase Kepatuhan"; swapped to
/// accuracy since compliance already has its own stat tile below) plus
/// three summary stat tiles.
class MonthlyProgressSection extends StatelessWidget {
  final List<double> dailyAccuracy; // percentage 0-100, index 0 = day 1
  final double compliancePercent;
  final double accuracyPercent;
  final int completedSessions;
  final int totalSessions;

  const MonthlyProgressSection({
    super.key,
    required this.dailyAccuracy,
    required this.compliancePercent,
    required this.accuracyPercent,
    required this.completedSessions,
    required this.totalSessions,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Progress Bulan Ini', style: FontTheme.headlineMedium),
        const SizedBox(height: 4),
        Text(
          'Kamu di jalur yang tepat. Tingkatkan terus progressmu!',
          style: FontTheme.bodyMedium.copyWith(color: BaseColors.textSecondary),
        ),
        const SizedBox(height: 20),
        AccuracyLineChart(data: dailyAccuracy),
        const SizedBox(height: 24),
        Row(
          children: [
            Expanded(
              child: StatTile(
                value: '${compliancePercent.round()}%',
                label: 'Kepatuhan',
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: StatTile(
                value: '${accuracyPercent.round()}%',
                label: 'Akurasi Pose',
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: StatTile(
                value: '$completedSessions/$totalSessions',
                label: 'Sesi Selesai',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
