import 'package:flutter/material.dart';

import '../../base/pay_button.dart';
import '../../base/pay_button_fonts.dart';
import 'afterpay_assets.dart';
import 'afterpay_brand.dart';
import 'afterpay_color.dart';
import 'afterpay_shape.dart';

/// An Afterpay / Clearpay payment button.
///
/// Designed following Afterpay/Clearpay brand guidelines.
/// Rendered in pure Flutter using vector graphics with full accessibility semantics.
class AfterpayButton extends BrandPayButton<AfterpayColor> {
  const AfterpayButton({
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
    super.shape = AfterpayShape.rounded,
    super.color,
    this.brand = AfterpayBrand.afterpay,
  });

  /// Regional branding variant (Afterpay vs Clearpay). Defaults to [AfterpayBrand.afterpay].
  final AfterpayBrand brand;

  @override
  AfterpayColor get defaultLightColor => AfterpayColor.mint;

  @override
  AfterpayColor get defaultDarkColor => AfterpayColor.black;

  @override
  double get roundedBorderRadius => 6.0;

  @override
  double get textGap => 6.0;

  @override
  List<String> get defaultFontFamilyFallback => PayButtonFonts.afterpay;

  @override
  String get defaultSemanticLabel => brand == AfterpayBrand.clearpay
      ? 'Pay with Clearpay'
      : 'Pay with Afterpay';

  @override
  double get mediumLogoHeight => (height * 0.40).clamp(16.0, 22.0);

  @override
  Widget buildCompactContent(BuildContext context) {
    return AfterpayAssets.loopBadge(
      color: effectiveColor(context),
      height: compactMarkHeight,
    );
  }

  @override
  Widget buildMediumContent(BuildContext context) {
    return AfterpayAssets.lockup(
      brand: brand,
      color: effectiveColor(context),
      height: mediumLogoHeight,
    );
  }
}
