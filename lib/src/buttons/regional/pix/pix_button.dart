import 'package:flutter/material.dart';

import '../../../base/pay_button.dart';
import '../../../base/pay_button_colors.dart';
import '../../../base/pay_button_fonts.dart';
import 'pix_assets.dart';
import 'pix_color.dart';
import 'pix_shape.dart';

/// A Pix (Banco Central do Brasil) payment button.
///
/// Rendered in pure Flutter using vector graphics with full accessibility semantics.
class PixButton extends PayButton {
  const PixButton({
    super.key,
    required super.onPressed,
    super.text,
    super.textStyle,
    super.fontFamily,
    super.fontFamilyFallback,
    super.isLoading,
    super.enabled,
    super.width,
    super.height = 48.0,
    super.borderRadius,
    super.margin,
    super.elevation,
    super.semanticLabel,
    super.variant = PayButtonVariant.responsive,
    super.textPosition = PayButtonTextPosition.leading,
    super.shape = PixShape.rounded,
    this.color,
  });

  /// The brand color palette for the button.
  ///
  /// When null, resolves automatically based on [Theme.of(context).brightness]:
  /// [PixColor.teal] in light mode, [PixColor.black] in dark mode.
  final PixColor? color;

  /// Resolves the effective color scheme for the given [context].
  PixColor effectiveColor(BuildContext context) {
    if (color != null) return color!;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? PixColor.black : PixColor.teal;
  }

  @override
  double get roundedBorderRadius => 6.0;

  @override
  List<String> get defaultFontFamilyFallback => PayButtonFonts.pix;

  @override
  String? get semanticLabel => super.semanticLabel ?? 'Pix';

  @override
  PayButtonColors resolveColors(BuildContext context) =>
      effectiveColor(context).palette;

  @override
  double get compactMarkHeight => (height * 0.50).clamp(20.0, 28.0);

  @override
  Widget buildCompactContent(BuildContext context) {
    return PixAssets.emblem(
      color: effectiveColor(context),
      height: compactMarkHeight,
    );
  }

  @override
  Widget buildMediumContent(BuildContext context) {
    return PixAssets.logo(
      color: effectiveColor(context),
      height: mediumLogoHeight,
    );
  }
}
