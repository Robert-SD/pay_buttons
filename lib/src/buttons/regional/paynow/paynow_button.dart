import 'package:flutter/material.dart';

import '../../../base/pay_button.dart';
import '../../../base/pay_button_fonts.dart';
import 'paynow_assets.dart';
import 'paynow_color.dart';
import 'paynow_shape.dart';

/// A PayNow (Singapore) payment button.
///
/// Rendered in pure Flutter using vector graphics with full accessibility semantics.
class PayNowButton extends BrandPayButton<PayNowColor> {
  const PayNowButton({
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
    super.shape = PayNowShape.rounded,
    super.color,
  });

  @override
  PayNowColor get defaultLightColor => PayNowColor.purple;

  @override
  PayNowColor get defaultDarkColor => PayNowColor.white;

  @override
  double get roundedBorderRadius => 6.0;

  @override
  List<String> get defaultFontFamilyFallback => PayButtonFonts.paynow;

  @override
  String get defaultSemanticLabel => 'PayNow';

  @override
  double get compactMarkHeight => (height * 0.52).clamp(20.0, 30.0);

  @override
  double get mediumLogoHeight => (height * 0.46).clamp(18.0, 26.0);

  @override
  Widget buildCompactContent(BuildContext context) {
    return PayNowAssets.emblem(
      color: effectiveColor(context),
      height: compactMarkHeight,
    );
  }

  @override
  Widget buildMediumContent(BuildContext context) {
    return PayNowAssets.logo(
      color: effectiveColor(context),
      height: mediumLogoHeight,
    );
  }
}
