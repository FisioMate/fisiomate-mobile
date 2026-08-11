part of '_widgets.dart';

/// Reusable labeled text input. When [obscureText] is true, a show/hide
/// toggle is added automatically (e.g. for password fields) — the caller
/// doesn't need to manage that visibility state itself.
class MainTextField extends StatefulWidget {
  final String label;
  final String? hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;

  const MainTextField({
    super.key,
    required this.label,
    this.hintText,
    this.controller,
    this.obscureText = false,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.validator,
    this.onChanged,
  });

  @override
  State<MainTextField> createState() => _MainTextFieldState();
}

class _MainTextFieldState extends State<MainTextField> {
  late bool _obscured = widget.obscureText;

  @override
  void didUpdateWidget(covariant MainTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Guards against a widget at this slot being swapped for a different
    // logical field (e.g. a conditionally-inserted field shifting list
    // positions) without a Key — don't let a stale obscure state leak in.
    if (widget.obscureText != oldWidget.obscureText) {
      _obscured = widget.obscureText;
    }
  }

  OutlineInputBorder _border(Color color, {double width = 1}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: color, width: width),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: FontTheme.labelLarge.copyWith(color: BaseColors.textPrimary),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: widget.controller,
          obscureText: _obscured,
          keyboardType: widget.keyboardType,
          textCapitalization: widget.textCapitalization,
          validator: widget.validator,
          onChanged: widget.onChanged,
          style: FontTheme.bodyLarge,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: FontTheme.bodyLarge.copyWith(
              color: BaseColors.textDisabled,
            ),
            filled: true,
            fillColor: BaseColors.surface,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            border: _border(BaseColors.border),
            enabledBorder: _border(BaseColors.border),
            focusedBorder: _border(BaseColors.primary, width: 1.5),
            errorBorder: _border(BaseColors.error),
            focusedErrorBorder: _border(BaseColors.error, width: 1.5),
            errorStyle: FontTheme.bodySmall.copyWith(color: BaseColors.error),
            suffixIcon: widget.obscureText
                ? IconButton(
                    icon: Icon(
                      _obscured
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: BaseColors.textSecondary,
                    ),
                    onPressed: () => setState(() => _obscured = !_obscured),
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
