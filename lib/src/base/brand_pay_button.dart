import 'package:flutter/material.dart';

import 'pay_button.dart';
import 'pay_button_colors.dart';

/// Base class for brand-specific payment buttons with typed color resolution.
///
/// Encapsulates the generic [color] palette property, default theme brightness
/// resolution ([defaultLightColor] and [defaultDarkColor]), and automatic
/// [resolveColors] delegation.
abstract class BrandPayButton<C extends BrandColor> extends PayButton {
  const BrandPayButton({
    super.key,
    required super.onPressed,
    super.text,
    super.textStyle,
    super.fontFamily,
    super.fontFamilyFallback,
    super.isLoading,
    super.enabled,
    super.width,
    super.height,
    super.borderRadius,
    super.margin,
    super.elevation,
    super.semanticLabel,
    super.shape,
    super.variant,
    super.textPosition,
    this.color,
  });

  /// The brand color palette for the button.
  ///
  /// When null, resolves automatically based on [Theme.of(context).brightness]:
  /// [defaultLightColor] in light mode, [defaultDarkColor] in dark mode.
  final C? color;

  /// Default color variant used in light mode when [color] is null.
  @protected
  C get defaultLightColor;

  /// Default color variant used in dark mode when [color] is null.
  @protected
  C get defaultDarkColor;

  /// Resolves the effective color scheme for the given [context].
  C effectiveColor(BuildContext context) {
    if (color != null) return color!;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? defaultDarkColor : defaultLightColor;
  }

  @override
  PayButtonColors resolveColors(BuildContext context) =>
      effectiveColor(context).palette;
}
