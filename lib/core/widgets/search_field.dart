part of '_widgets.dart';

class SearchField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  const SearchField({
    super.key,
    required this.hintText,
    this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      style: FontTheme.bodyMedium,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: FontTheme.bodyMedium.copyWith(
          color: BaseColors.textSecondary,
        ),
        prefixIcon: Icon(Icons.search, color: BaseColors.textSecondary),
        filled: true,
        fillColor: BaseColors.border.withValues(alpha: 0.3),
        contentPadding: const EdgeInsets.symmetric(vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
