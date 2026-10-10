import 'package:flutter/material.dart';

import '../../../base/pay_button.dart';
import '../../../base/pay_button_colors.dart';
import '../../../base/pay_button_fonts.dart';
import 'boleto_assets.dart';
import 'boleto_color.dart';
import 'boleto_shape.dart';

/// A Boleto Bancário (Brazil) payment button.
///
/// Rendered in pure Flutter using vector graphics with full accessibility semantics.
class BoletoButton extends PayButton {
  const BoletoButton({
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
    super.shape = BoletoShape.rounded,
    this.color,
  });

  /// The brand color palette for the button.
  ///
  /// When null, resolves automatically based on [Theme.of(context).brightness]:
  /// [BoletoColor.white] in light mode, [BoletoColor.black] in dark mode.
  final BoletoColor? color;

  /// Resolves the effective color scheme for the given [context].
  BoletoColor effectiveColor(BuildContext context) {
    if (color != null) return color!;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? BoletoColor.black : BoletoColor.white;
  }

  @override
  double get roundedBorderRadius => 6.0;

  @override
  List<String> get defaultFontFamilyFallback => PayButtonFonts.boleto;

  @override
  String? get semanticLabel => super.semanticLabel ?? 'Boleto Bancário';

  @override
  PayButtonColors resolveColors(BuildContext context) =>
      effectiveColor(context).palette;

  @override
  double get compactMarkHeight => (height * 0.44).clamp(18.0, 24.0);

  @override
  double get mediumLogoHeight => (height * 0.44).clamp(18.0, 26.0);

  @override
  Widget buildCompactContent(BuildContext context) {
    return BoletoAssets.barcode(
      color: effectiveColor(context),
      height: compactMarkHeight,
    );
  }

  @override
  Widget buildMediumContent(BuildContext context) {
    return BoletoAssets.logo(
      color: effectiveColor(context),
      height: mediumLogoHeight,
    );
  }
}
