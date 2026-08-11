part of '_widgets.dart';

/// Segmented pill toggle — one filled/selected option, the rest
/// outlined. Generic over [T] so it works for any small enum-driven
/// filter (date range, session filter, etc.).
class PillSelector<T> extends StatelessWidget {
  final List<T> options;
  final T selected;
  final String Function(T option) labelBuilder;
  final ValueChanged<T> onChanged;

  const PillSelector({
    super.key,
    required this.options,
    required this.selected,
    required this.labelBuilder,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (final option in options) ...[
            _Pill(
              label: labelBuilder(option),
              isSelected: option == selected,
              onTap: () => onChanged(option),
            ),
            if (option != options.last) const SizedBox(width: 8),
          ],
        ],
      ),
    );
  }
}

class _Pill extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _Pill({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isSelected ? BaseColors.primary : Colors.transparent,
      shape: StadiumBorder(
        side: BorderSide(color: BaseColors.primary, width: 2),
      ),
      child: InkWell(
        onTap: onTap,
        customBorder: const StadiumBorder(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Text(
            label,
            style: FontTheme.labelLarge.copyWith(
              color: isSelected ? Colors.white : BaseColors.primary,
            ),
          ),
        ),
      ),
    );
  }
}
