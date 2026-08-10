import 'package:flutter/material.dart';

/// Placeholder brand palette — swap these values for the real design
/// tokens once the UI design palette is finalized.
///
/// Primary and secondary each carry a 10-step shade scale (50–900,
/// Material-style: 50 lightest, 900 darkest) so widgets can reach for a
/// specific tint/shade instead of only the base color.
abstract final class BaseColors {
  // Primary shades
  static const Color primary50 = Color(0xFFEAFCF7);
  static const Color primary100 = Color(0xFFCBF5EA);
  static const Color primary200 = Color(0xFF92EAD5);
  static const Color primary300 = Color(0xFF3DD9BD);
  static const Color primary400 = Color(0xFF00C2A2);
  static const Color primary500 = Color(0xFF00A68A);
  static const Color primary600 = Color(0xFF008372);
  static const Color primary700 = Color(0xFF006F5E);
  static const Color primary800 = Color(0xFF00594B);
  static const Color primary900 = Color(0xFF004037);
  static const Color primary = primary600;

  // Secondary shades
  static const Color secondary50 = Color(0xFFFFF0ED);
  static const Color secondary100 = Color(0xFFFFDCD0);
  static const Color secondary200 = Color(0xFFFFB79E);
  static const Color secondary300 = Color(0xFFFF8C67);
  static const Color secondary400 = Color(0xFFFF6637);
  static const Color secondary500 = Color(0xFFFF490B);
  static const Color secondary600 = Color(0xFFE22200);
  static const Color secondary700 = Color(0xFFCA2100);
  static const Color secondary800 = Color(0xFF9F1D00);
  static const Color secondary900 = Color(0xFF781701);
  static const Color secondary = secondary500;

  static const Color accent = Color(0xFF000000);

  // Neutrals
  static const Color background = Color(0xFFFDFDFD);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color border = Color(0xFFE0E0E0);

  // Text
  static const Color textPrimary = Color(0xFF000000);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textDisabled = Color(0xFFBDBDBD);

  // Semantic feedback
  static const Color success = Color(0xFF00A552);
  static const Color warning = Color(0xFFFD9A00);
  static const Color error = Color(0xFFF93446);
}
