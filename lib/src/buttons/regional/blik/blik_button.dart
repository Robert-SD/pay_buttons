import 'package:flutter/material.dart';

import '../../../base/pay_button.dart';
import '../../../base/pay_button_colors.dart';
import '../../../base/pay_button_fonts.dart';
import 'blik_assets.dart';
import 'blik_color.dart';
import 'blik_shape.dart';

/// A BLIK (Poland) payment button.
///
/// Rendered in pure Flutter using vector graphics with full accessibility semantics.
class BlikButton extends PayButton {
  const BlikButton({
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
    super.shape = BlikShape.rounded,
    this.color,
  });

  /// The brand color palette for the button.
  ///
  /// When null, resolves automatically based on [Theme.of(context).brightness]:
  /// [BlikColor.black] in light mode, [BlikColor.white] in dark mode.
  final BlikColor? color;

  /// Resolves the effective color scheme for the given [context].
  BlikColor effectiveColor(BuildContext context) {
    if (color != null) return color!;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? BlikColor.white : BlikColor.black;
  }

  @override
  double get roundedBorderRadius => 6.0;

  @override
  List<String> get defaultFontFamilyFallback => PayButtonFonts.blik;

  @override
  String? get semanticLabel => super.semanticLabel ?? 'BLIK';

  @override
  PayButtonColors resolveColors(BuildContext context) =>
      effectiveColor(context).palette;

  @override
  Widget buildCompactContent(BuildContext context) {
    return BlikAssets.bMark(
      color: effectiveColor(context),
      height: compactMarkHeight,
    );
  }

  @override
  Widget buildMediumContent(BuildContext context) {
    return BlikAssets.logo(
      color: effectiveColor(context),
      height: mediumLogoHeight,
    );
  }
}
