part of '_widgets.dart';

enum ButtonVariant { primary, secondary, error, surface }

enum ButtonStyleType { filled, outlined }

class MainButton extends StatelessWidget {
  final String label;
  final Widget? leftIcon;
  final Widget? rightIcon;
  final VoidCallback? onPressed;
  final ButtonVariant variant;
  final ButtonStyleType styleType;

  const MainButton({
    super.key,
    required this.label,
    this.onPressed,
    this.leftIcon,
    this.rightIcon,
    this.variant = ButtonVariant.primary,
    this.styleType = ButtonStyleType.filled,
  });

  Color get _color => switch (variant) {
    ButtonVariant.primary => BaseColors.primary,
    ButtonVariant.secondary => BaseColors.secondary,
    ButtonVariant.error => BaseColors.error,
    ButtonVariant.surface => BaseColors.surface,
  };

  // Text/icon color when filled — white on brand/semantic colors, but
  // dark on the white `surface` variant (used for CTAs sitting on top of
  // an already-colored card, where white-on-white would be invisible).
  Color get _onColor => switch (variant) {
    ButtonVariant.surface => BaseColors.textPrimary,
    _ => Colors.white,
  };

  @override
  Widget build(BuildContext context) {
    final bool isDisabled = onPressed == null;

    final content = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (leftIcon != null) ...[leftIcon!, const SizedBox(width: 8)],
        Text(label),
        if (rightIcon != null) ...[const SizedBox(width: 8), rightIcon!],
      ],
    );

    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(6),
    );
    const padding = EdgeInsets.symmetric(horizontal: 24, vertical: 20);

    return switch (styleType) {
      ButtonStyleType.filled => ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: _color,
          foregroundColor: _onColor,
          disabledBackgroundColor: BaseColors.border,
          disabledForegroundColor: BaseColors.textDisabled,
          elevation: 0,
          padding: padding,
          shape: shape,
          textStyle: FontTheme.titleMedium,
        ),
        child: content,
      ),
      ButtonStyleType.outlined => OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: _color,
          disabledForegroundColor: BaseColors.textDisabled,
          side: BorderSide(
            color: isDisabled ? BaseColors.border : _color,
            width: 1.5,
          ),
          padding: padding,
          shape: shape,
          textStyle: FontTheme.titleMedium,
        ),
        child: content,
      ),
    };
  }
}
