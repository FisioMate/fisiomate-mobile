part of '_widgets.dart';

/// Pill overlaid on the camera view showing the current frame's
/// [PoseValidationState] — "Sesuai" (green), "Kurang Sesuai" (amber, hold
/// exercises only), or "Tidak Valid" (red).
class PoseStateBadge extends StatelessWidget {
  final PoseValidationState state;

  const PoseStateBadge({super.key, required this.state});

  ({Color color, IconData icon, String label}) get _config => switch (state) {
    PoseValidationState.sesuai => (
      color: BaseColors.success,
      icon: Icons.check_circle,
      label: 'Sesuai',
    ),
    PoseValidationState.kurangSesuai => (
      color: BaseColors.warning,
      icon: Icons.error_outline,
      label: 'Kurang Sesuai',
    ),
    PoseValidationState.tidakValid => (
      color: BaseColors.error,
      icon: Icons.cancel,
      label: 'Tidak Valid',
    ),
  };

  @override
  Widget build(BuildContext context) {
    final config = _config;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: config.color),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 6,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(config.icon, size: 16, color: config.color),
          const SizedBox(width: 6),
          Text(
            config.label,
            style: FontTheme.bodySmall.copyWith(
              color: config.color,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
