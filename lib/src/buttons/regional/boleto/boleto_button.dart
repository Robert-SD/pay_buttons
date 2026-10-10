import 'package:flutter/material.dart';

import '../../../base/pay_button.dart';
import '../../../base/pay_button_fonts.dart';
import 'boleto_assets.dart';
import 'boleto_color.dart';
import 'boleto_shape.dart';

/// A Boleto Bancário (Brazil) payment button.
///
/// Rendered in pure Flutter using vector graphics with full accessibility semantics.
class BoletoButton extends BrandPayButton<BoletoColor> {
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
    super.color,
  });

  @override
  BoletoColor get defaultLightColor => BoletoColor.white;

  @override
  BoletoColor get defaultDarkColor => BoletoColor.black;

  @override
  double get roundedBorderRadius => 6.0;

  @override
  List<String> get defaultFontFamilyFallback => PayButtonFonts.boleto;

  @override
  String get defaultSemanticLabel => 'Boleto Bancário';

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
