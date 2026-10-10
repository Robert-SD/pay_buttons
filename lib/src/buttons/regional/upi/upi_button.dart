import 'package:flutter/material.dart';

import '../../../base/pay_button.dart';
import '../../../base/pay_button_fonts.dart';
import 'upi_assets.dart';
import 'upi_color.dart';
import 'upi_shape.dart';

/// A UPI (India, Unified Payments Interface) payment button.
///
/// Rendered in pure Flutter using vector graphics with full accessibility semantics.
class UpiButton extends BrandPayButton<UpiColor> {
  const UpiButton({
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
    super.shape = UpiShape.rounded,
    super.color,
  });

  @override
  UpiColor get defaultLightColor => UpiColor.white;

  @override
  UpiColor get defaultDarkColor => UpiColor.navy;

  @override
  double get roundedBorderRadius => 6.0;

  @override
  List<String> get defaultFontFamilyFallback => PayButtonFonts.upi;

  @override
  String get defaultSemanticLabel => 'UPI';

  @override
  double get compactMarkHeight => (height * 0.52).clamp(20.0, 30.0);

  @override
  double get mediumLogoHeight => (height * 0.44).clamp(18.0, 26.0);

  @override
  Widget buildCompactContent(BuildContext context) {
    return UpiAssets.emblem(
      color: effectiveColor(context),
      height: compactMarkHeight,
    );
  }

  @override
  Widget buildMediumContent(BuildContext context) {
    return UpiAssets.logo(
      color: effectiveColor(context),
      height: mediumLogoHeight,
    );
  }
}
