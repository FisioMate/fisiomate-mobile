import 'package:fisiomate/core/themes/base_colors.dart';
import 'package:fisiomate/core/themes/font_theme.dart';
import 'package:flutter/material.dart';

/// Assembles [BaseColors] and [FontTheme] into a [ThemeData] consumed by
/// [MaterialApp.router]. Add a `dark` getter here once a dark palette
/// exists — keep it a single source so features never build ThemeData
/// themselves.
abstract final class AppTheme {
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: BaseColors.background,
      colorScheme: ColorScheme.fromSeed(
        seedColor: BaseColors.primary,
        brightness: Brightness.light,
        primary: BaseColors.primary,
        secondary: BaseColors.secondary,
        error: BaseColors.error,
        surface: BaseColors.surface,
      ),
      textTheme: FontTheme.textTheme,
      appBarTheme: AppBarTheme(
        backgroundColor: BaseColors.surface,
        foregroundColor: BaseColors.textPrimary,
        elevation: 0,
        titleTextStyle: FontTheme.titleLarge.copyWith(
          color: BaseColors.textPrimary,
        ),
      ),
    );
  }
}
