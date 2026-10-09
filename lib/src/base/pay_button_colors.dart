import 'package:flutter/material.dart';

/// Resolved color palette for a payment button.
class PayButtonColors {
  const PayButtonColors({
    required this.backgroundColor,
    Color? progressColor,
    Color? textColor,
    this.disabledBackgroundColor = const Color(0xFFE2E2E2),
    this.disabledProgressColor = const Color(0xFF9E9E9E),
    this.borderColor,
    this.borderWidth = 1.0,
    Color? splashColor,
    Color? highlightColor,
  })  : textColor = textColor ?? progressColor ?? const Color(0xFF000000),
        progressColor = progressColor ?? textColor ?? const Color(0xFF000000),
        // ignore: prefer_initializing_formals
        _splashColor = splashColor,
        // ignore: prefer_initializing_formals
        _highlightColor = highlightColor;

  /// The primary fill color of the button in its enabled state.
  final Color backgroundColor;

  /// The text color of the button label when text is rendered.
  final Color textColor;

  /// The color of the loading spinner when the button is in a loading state.
  final Color progressColor;

  /// The fill color of the button when disabled.
  final Color disabledBackgroundColor;

  /// The color of the spinner when the button is disabled.
  final Color disabledProgressColor;

  /// Optional border outline color (e.g. for white/light button variants).
  final Color? borderColor;

  /// The width of the border outline if [borderColor] is set.
  final double borderWidth;

  final Color? _splashColor;
  final Color? _highlightColor;

  /// Ink ripple splash color on user tap.
  ///
  /// Automatically derived from [textColor] with 12% opacity (0x1F) if not explicitly set.
  Color get splashColor =>
      _splashColor ?? textColor.withValues(alpha: 0.12);

  /// Highlight color when the button is pressed down.
  ///
  /// Automatically derived from [textColor] with 6% opacity (0x0F) if not explicitly set.
  Color get highlightColor =>
      _highlightColor ?? textColor.withValues(alpha: 0.06);
}
