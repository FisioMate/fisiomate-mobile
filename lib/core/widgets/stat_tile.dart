part of '_widgets.dart';

/// A single "big number + label" pill — compliance %, pose accuracy %,
/// sessions completed, etc. Reused wherever monthly/weekly stats show up
/// (home screen summary, the dedicated Progress page).
class StatTile extends StatelessWidget {
  final String value;
  final String label;

  const StatTile({super.key, required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: BoxDecoration(
        color: BaseColors.accentLight,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: BaseColors.accent.withValues(alpha: 0.25)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value,
            style: FontTheme.headlineMedium.copyWith(
              color: BaseColors.accent,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: FontTheme.bodySmall.copyWith(
              color: BaseColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
