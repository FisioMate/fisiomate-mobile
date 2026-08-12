part of '_widgets.dart';

class SessionLogCard extends StatelessWidget {
  final SessionLog session;

  const SessionLogCard({super.key, required this.session});

  @override
  Widget build(BuildContext context) {
    final isMissed = session.status == SessionLogStatus.missed;
    final subtitle = isMissed
        ? '${session.exerciseCount} gerakan'
        : '${formatTime(session.completedAt!)} · ${session.exerciseCount} gerakan';

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isMissed
            ? Colors.black.withValues(alpha: 0.03)
            : BaseColors.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  formatIndonesianDate(session.date),
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
          const SizedBox(width: 12),
          if (isMissed)
            _SessionBadge.outlined(label: 'Sesi\nTerlewat')
          else
            _SessionBadge.filled(
              label: '${session.accuracy!.round()}%\nAkurat',
            ),
        ],
      ),
    );
  }
}

class _SessionBadge extends StatelessWidget {
  final String label;
  final bool isFilled;

  const _SessionBadge.filled({required this.label}) : isFilled = true;

  const _SessionBadge.outlined({required this.label}) : isFilled = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: isFilled ? BaseColors.accentLight : BaseColors.surface,
        borderRadius: BorderRadius.circular(10),
        border: isFilled
            ? Border.all(color: BaseColors.accent)
            : Border.all(color: BaseColors.border),
      ),
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: FontTheme.labelLarge.copyWith(
          color: isFilled ? BaseColors.accent : BaseColors.textSecondary,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }
}
