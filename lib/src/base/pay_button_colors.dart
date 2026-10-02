import 'package:flutter/material.dart';

/// Resolved color palette for a payment button.
class PayButtonColors {
  const PayButtonColors({
    required this.backgroundColor,
    required this.progressColor,
    this.disabledBackgroundColor = const Color(0xFFE2E2E2),
    this.disabledProgressColor = const Color(0xFF9E9E9E),
    this.borderColor,
    this.borderWidth = 1.0,
    this.splashColor,
    this.highlightColor,
  });

  /// The primary fill color of the button in its enabled state.
  final Color backgroundColor;

  /// The fill color of the button when disabled.
  final Color disabledBackgroundColor;

  /// Optional border outline color (e.g. for white/light button variants).
  final Color? borderColor;

  /// The width of the border outline if [borderColor] is set.
  final double borderWidth;

  /// The color of the loading spinner when [isLoading] is true.
  final Color progressColor;

  /// The color of the spinner when the button is disabled.
  final Color disabledProgressColor;

  /// Ink ripple splash color on user tap.
  final Color? splashColor;

  /// Highlight color when the button is pressed down.
  final Color? highlightColor;
}
