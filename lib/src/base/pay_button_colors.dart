import 'package:flutter/material.dart';

/// Resolved color palette for a payment button.
class PayButtonColors {
  const PayButtonColors({
    required this.backgroundColor,
    Color? progressColor,
    Color? textColor,
    this.disabledBackgroundColor = const Color(0xFFE2E2E2),
    this.disabledProgressColor = const Color(0xFF9E9E9E),
    Color? disabledTextColor,
    this.borderColor,
    this.borderWidth = 1.0,
    this.splashColor,
    this.highlightColor,
  })  : textColor = textColor ?? progressColor ?? const Color(0xFF000000),
        progressColor = progressColor ?? textColor ?? const Color(0xFF000000),
        disabledTextColor = disabledTextColor ?? const Color(0xFF757575);

  /// The primary fill color of the button in its enabled state.
  final Color backgroundColor;

  /// The text color of the button label when text is rendered.
  final Color textColor;

  /// The text color of the button label when the button is disabled.
  final Color disabledTextColor;

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

  /// Optional ink ripple splash override. Defaults to [textColor] at 12% opacity.
  final Color? splashColor;

  /// Optional press highlight override. Defaults to [textColor] at 6% opacity.
  final Color? highlightColor;

  /// The ink ripple splash color on user tap.
  ///
  /// Falls back to [textColor] at 12% opacity when no explicit override is set.
  Color get effectiveSplashColor =>
      splashColor ?? textColor.withValues(alpha: 0.12);

  /// The highlight color shown while the button is pressed down.
  ///
  /// Falls back to [textColor] at 6% opacity when no explicit override is set.
  Color get effectiveHighlightColor =>
      highlightColor ?? textColor.withValues(alpha: 0.06);

  /// Creates a copy of this palette with the given fields replaced.
  PayButtonColors copyWith({
    Color? backgroundColor,
    Color? textColor,
    Color? progressColor,
    Color? disabledBackgroundColor,
    Color? disabledTextColor,
    Color? disabledProgressColor,
    Color? borderColor,
    double? borderWidth,
    Color? splashColor,
    Color? highlightColor,
  }) {
    return PayButtonColors(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textColor: textColor ?? this.textColor,
      progressColor: progressColor ?? this.progressColor,
      disabledBackgroundColor:
          disabledBackgroundColor ?? this.disabledBackgroundColor,
      disabledTextColor: disabledTextColor ?? this.disabledTextColor,
      disabledProgressColor:
          disabledProgressColor ?? this.disabledProgressColor,
      borderColor: borderColor ?? this.borderColor,
      borderWidth: borderWidth ?? this.borderWidth,
      splashColor: splashColor ?? this.splashColor,
      highlightColor: highlightColor ?? this.highlightColor,
    );
  }
}
