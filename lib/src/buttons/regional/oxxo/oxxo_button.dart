import 'package:flutter/material.dart';

import '../../../base/pay_button.dart';
import '../../../base/pay_button_fonts.dart';
import 'oxxo_assets.dart';
import 'oxxo_color.dart';
import 'oxxo_shape.dart';

/// An OXXO (Mexico) payment button.
///
/// Rendered in pure Flutter using vector graphics with full accessibility semantics.
class OxxoButton extends BrandPayButton<OxxoColor> {
  const OxxoButton({
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
    super.shape = OxxoShape.rounded,
    super.color,
  });

  @override
  OxxoColor get defaultLightColor => OxxoColor.red;

  @override
  OxxoColor get defaultDarkColor => OxxoColor.white;

  @override
  double get roundedBorderRadius => 6.0;

  @override
  FontWeight get labelFontWeight => FontWeight.w700;

  @override
  List<String> get defaultFontFamilyFallback => PayButtonFonts.oxxo;

  @override
  String get defaultSemanticLabel => 'OXXO';

  @override
  double get compactMarkHeight => (height * 0.44).clamp(18.0, 24.0);

  @override
  double get mediumLogoHeight => (height * 0.52).clamp(22.0, 30.0);

  @override
  Widget buildCompactContent(BuildContext context) {
    return OxxoAssets.oMark(
      color: effectiveColor(context),
      height: compactMarkHeight,
    );
  }

  @override
  Widget buildMediumContent(BuildContext context) {
    return OxxoAssets.logo(
      color: effectiveColor(context),
      height: mediumLogoHeight,
    );
  }
}
