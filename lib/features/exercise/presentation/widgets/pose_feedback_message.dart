part of '_widgets.dart';

/// Correction message shown below the camera view while
/// [PoseValidationState.tidakValid] — the rule's own feedback message
/// plus a static note that rep/hold counting is paused, not reset, while
/// the patient adjusts.
class PoseFeedbackMessage extends StatelessWidget {
  final String message;

  const PoseFeedbackMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: BaseColors.errorLight,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: BaseColors.error.withValues(alpha: 0.3)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.warning_amber_rounded,
            color: BaseColors.error,
            size: 20,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  message,
                  style: FontTheme.bodySmall.copyWith(
                    color: BaseColors.error,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Hitungan dijeda hingga posisi benar',
                  style: FontTheme.bodySmall.copyWith(color: BaseColors.error),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
