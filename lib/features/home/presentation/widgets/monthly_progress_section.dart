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
        _AccuracyChart(dailyAccuracy: dailyAccuracy),
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

class _AccuracyChart extends StatelessWidget {
  final List<double> dailyAccuracy;

  const _AccuracyChart({required this.dailyAccuracy});

  @override
  Widget build(BuildContext context) {
    final spots = [
      for (var i = 0; i < dailyAccuracy.length; i++)
        FlSpot((i + 1).toDouble(), dailyAccuracy[i]),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 1.6,
          child: LineChart(
            LineChartData(
              minY: 0,
              maxY: 100,
              gridData: FlGridData(
                drawVerticalLine: false,
                horizontalInterval: 20,
                getDrawingHorizontalLine: (value) =>
                    FlLine(color: BaseColors.border, strokeWidth: 1),
              ),
              borderData: FlBorderData(show: false),
              titlesData: FlTitlesData(
                topTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                leftTitles: AxisTitles(
                  axisNameSize: 20,
                  axisNameWidget: Column(
                    children: [
                      Text(
                        'Persentase akurasi',
                        style: FontTheme.labelSmall.copyWith(
                          color: BaseColors.textSecondary,
                        ),
                      ),
                      SizedBox(height: 4),
                    ],
                  ),
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 20,
                    reservedSize: 40,
                    getTitlesWidget: (value, meta) => Text(
                      '${value.toInt()}%',
                      style: FontTheme.labelSmall.copyWith(
                        color: BaseColors.textSecondary,
                      ),
                    ),
                  ),
                ),
                bottomTitles: AxisTitles(
                  axisNameSize: 20,
                  axisNameWidget: Text(
                    'Hari dalam Bulan',
                    style: FontTheme.labelSmall.copyWith(
                      color: BaseColors.textSecondary,
                    ),
                  ),
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 5,
                    reservedSize: 24,
                    getTitlesWidget: (value, meta) => Text(
                      value.toInt().toString(),
                      style: FontTheme.labelSmall.copyWith(
                        color: BaseColors.textSecondary,
                      ),
                    ),
                  ),
                ),
              ),
              lineTouchData: LineTouchData(
                enabled: true,
                getTouchedSpotIndicator:
                    (LineChartBarData barData, List<int> spotIndexes) {
                      return spotIndexes.map((spotIndex) {
                        return TouchedSpotIndicatorData(
                          const FlLine(
                            color: Colors.transparent,
                            strokeWidth: 3,
                          ), // Indicator line style
                          FlDotData(
                            getDotPainter: (spot, percent, barData, index) =>
                                FlDotCirclePainter(
                                  strokeColor: Colors.white,
                                  strokeWidth: 2,
                                  color: BaseColors.secondary,
                                  radius: 6,
                                ),
                          ),
                        );
                      }).toList();
                    },
                touchTooltipData: LineTouchTooltipData(
                  getTooltipColor: (spot) => BaseColors.secondary,
                  tooltipBorderRadius: BorderRadius.circular(8),
                  getTooltipItems: (touchedSpots) => touchedSpots.map((spot) {
                    return LineTooltipItem(
                      'Hari ke-${spot.x.toInt()}\n${spot.y.toInt()}%',
                      FontTheme.labelSmall.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  }).toList(),
                ),
              ),
              lineBarsData: [
                LineChartBarData(
                  spots: spots,
                  isCurved: true,
                  color: BaseColors.primary,
                  barWidth: 3,
                  dotData: const FlDotData(show: false),
                  belowBarData: BarAreaData(
                    show: true,
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        BaseColors.primary.withValues(alpha: 0.3),
                        BaseColors.primary.withValues(alpha: 0.0),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
