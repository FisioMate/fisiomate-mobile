part of '_widgets.dart';

/// Area/line chart used for pose-accuracy trends — home's "Progress
/// Bulan Ini" and the Progress feature's history pages share this same
/// look, so it lives here instead of being duplicated per feature.
class AccuracyLineChart extends StatelessWidget {
  final List<double> data;
  final String xAxisLabel;
  final String yAxisLabel;
  final double bottomInterval;

  const AccuracyLineChart({
    super.key,
    required this.data,
    this.xAxisLabel = 'Hari dalam Bulan',
    this.yAxisLabel = 'Persentase akurasi',
    this.bottomInterval = 5,
  });

  @override
  Widget build(BuildContext context) {
    final spots = [
      for (var i = 0; i < data.length; i++) FlSpot((i + 1).toDouble(), data[i]),
    ];

    return AspectRatio(
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
                    yAxisLabel,
                    style: FontTheme.labelSmall.copyWith(
                      color: BaseColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 4),
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
                xAxisLabel,
                style: FontTheme.labelSmall.copyWith(
                  color: BaseColors.textSecondary,
                ),
              ),
              sideTitles: SideTitles(
                showTitles: true,
                interval: bottomInterval,
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
                      const FlLine(color: Colors.transparent, strokeWidth: 3),
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
    );
  }
}
