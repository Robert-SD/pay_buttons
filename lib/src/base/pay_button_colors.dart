import 'package:flutter/material.dart';

/// Resolved color palette for a payment button.
class PayButtonColors {
  const PayButtonColors({
    required this.backgroundColor,
    Color? progressColor,
    Color? textColor,
    this.disabledBackgroundColor,
    this.disabledProgressColor,
    this.disabledTextColor,
    this.borderColor,
    this.borderWidth = 1.0,
    this.splashColor,
    this.highlightColor,
  })  : textColor = textColor ?? progressColor ?? const Color(0xFF000000),
        progressColor = progressColor ?? textColor ?? const Color(0xFF000000);

  /// The primary fill color of the button in its enabled state.
  final Color backgroundColor;

  /// The text color of the button label when text is rendered.
  final Color textColor;

  /// The text color of the button label when the button is disabled.
  ///
  /// When null, resolves dynamically based on brightness:
  /// `#8E8E93` in dark mode, `#757575` in light mode.
  final Color? disabledTextColor;

  /// The color of the loading spinner when the button is in a loading state.
  final Color progressColor;

  /// The fill color of the button when disabled.
  ///
  /// When null, resolves dynamically based on brightness:
  /// `#2C2C2E` in dark mode, `#E2E2E2` in light mode.
  final Color? disabledBackgroundColor;

  /// The color of the spinner when the button is disabled.
  ///
  /// When null, resolves dynamically based on brightness:
  /// `#636366` in dark mode, `#9E9E9E` in light mode.
  final Color? disabledProgressColor;

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

  /// Standard disabled background color for dark themes (`#2C2C2E`).
  static const Color darkDisabledBackgroundColor = Color(0xFF2C2C2E);

  /// Standard disabled text color for dark themes (`#8E8E93`).
  static const Color darkDisabledTextColor = Color(0xFF8E8E93);

  /// Standard disabled progress indicator color for dark themes (`#636366`).
  static const Color darkDisabledProgressColor = Color(0xFF636366);

  /// Standard disabled background color for light themes (`#E2E2E2`).
  static const Color lightDisabledBackgroundColor = Color(0xFFE2E2E2);

  /// Standard disabled text color for light themes (`#757575`).
  static const Color lightDisabledTextColor = Color(0xFF757575);

  /// Standard disabled progress indicator color for light themes (`#9E9E9E`).
  static const Color lightDisabledProgressColor = Color(0xFF9E9E9E);

  /// Resolves the effective disabled background color for the given [brightness].
  ///
  /// If [disabledBackgroundColor] is explicitly specified, it is returned.
  /// Otherwise, returns `#2C2C2E` for dark mode or `#E2E2E2` for light mode.
  Color effectiveDisabledBackgroundColor(Brightness brightness) =>
      disabledBackgroundColor ??
      (brightness == Brightness.dark
          ? darkDisabledBackgroundColor
          : lightDisabledBackgroundColor);

  /// Resolves the effective disabled text color for the given [brightness].
  ///
  /// If [disabledTextColor] is explicitly specified, it is returned.
  /// Otherwise, returns `#8E8E93` for dark mode or `#757575` for light mode.
  Color effectiveDisabledTextColor(Brightness brightness) =>
      disabledTextColor ??
      (brightness == Brightness.dark
          ? darkDisabledTextColor
          : lightDisabledTextColor);

  /// Resolves the effective disabled progress indicator color for the given [brightness].
  ///
  /// If [disabledProgressColor] is explicitly specified, it is returned.
  /// Otherwise, returns `#636366` for dark mode or `#9E9E9E` for light mode.
  Color effectiveDisabledProgressColor(Brightness brightness) =>
      disabledProgressColor ??
      (brightness == Brightness.dark
          ? darkDisabledProgressColor
          : lightDisabledProgressColor);

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
