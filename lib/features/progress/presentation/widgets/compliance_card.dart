part of '_widgets.dart';

class ComplianceCard extends StatelessWidget {
  final double percent;
  final String label;
  final int completed;
  final int total;

  const ComplianceCard({
    super.key,
    required this.percent,
    required this.label,
    required this.completed,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: BaseColors.secondary50,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: BaseColors.secondary),
      ),
      child: Row(
        children: [
          CircularProgress(
            value: percent / 100,
            size: 72,
            strokeWidth: 4,
            progressColor: BaseColors.secondary,
            child: Text(
              '${percent.round()}%',
              style: FontTheme.titleMedium.copyWith(
                fontSize: 10,
                color: BaseColors.secondary700,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: FontTheme.titleMedium.copyWith(
                    color: BaseColors.secondary700,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '$completed dari $total sesi selesai',
                  style: FontTheme.bodySmall.copyWith(
                    color: BaseColors.secondary700,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
