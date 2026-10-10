import 'package:flutter/material.dart';

import '../../../base/pay_button.dart';
import '../../../base/pay_button_fonts.dart';
import 'pix_assets.dart';
import 'pix_color.dart';
import 'pix_shape.dart';

/// A Pix (Banco Central do Brasil) payment button.
///
/// Rendered in pure Flutter using vector graphics with full accessibility semantics.
class PixButton extends BrandPayButton<PixColor> {
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
    super.color,
  });

  @override
  PixColor get defaultLightColor => PixColor.teal;

  @override
  PixColor get defaultDarkColor => PixColor.black;

  @override
  double get roundedBorderRadius => 6.0;

  @override
  List<String> get defaultFontFamilyFallback => PayButtonFonts.pix;

  @override
  String get defaultSemanticLabel => 'Pix';

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
