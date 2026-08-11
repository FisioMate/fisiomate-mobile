part of '_widgets.dart';

class RoutineItemCard extends StatelessWidget {
  final RoutineItem item;

  const RoutineItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final isRepBased = item.exercise is RepBasedExercise;
    final subtitle = isRepBased
        ? '${item.sets} set x ${item.targetRepsOrSeconds} repetisi'
        : '${item.sets} set x ${item.targetRepsOrSeconds} detik hold';

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: BaseColors.primary50,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: BaseColors.primary,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.directions_run, color: Colors.white),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.exercise.name,
                  style: FontTheme.titleMedium.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: FontTheme.bodySmall.copyWith(
                    color: BaseColors.textSecondary,
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
