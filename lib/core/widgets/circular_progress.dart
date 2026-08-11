part of '_widgets.dart';

/// Ring-shaped progress indicator with rounded ends and an optional
/// center label — reusable for percentages (progress accuracy, compliance
/// rate) as well as countdown timers (pass a shrinking/growing [value]
/// each tick). [value] changes animate smoothly on their own.
class CircularProgress extends StatelessWidget {
  final double value;
  final double size;
  final double strokeWidth;
  final Color? progressColor;
  final Color? backgroundColor;
  final Widget? child;
  final Duration animationDuration;

  const CircularProgress({
    super.key,
    required this.value,
    this.size = 120,
    this.strokeWidth = 12,
    this.progressColor,
    this.backgroundColor,
    this.child,
    this.animationDuration = const Duration(milliseconds: 300),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: value.clamp(0.0, 1.0)),
            duration: animationDuration,
            curve: Curves.easeOutCubic,
            builder: (context, animatedValue, _) {
              // CircularProgressIndicator ignores its parent's size and
              // falls back to Flutter's ~36px default unless it's given
              // tight constraints directly — the outer SizedBox alone
              // only sizes the Stack, not the indicator itself.
              return SizedBox(
                width: size,
                height: size,
                child: CircularProgressIndicator(
                  value: animatedValue,
                  strokeWidth: strokeWidth,
                  strokeCap: StrokeCap.round,
                  backgroundColor: backgroundColor ?? BaseColors.secondary50,
                  valueColor: AlwaysStoppedAnimation(
                    progressColor ?? BaseColors.secondary,
                  ),
                ),
              );
            },
          ),
          ?child,
        ],
      ),
    );
  }
}
