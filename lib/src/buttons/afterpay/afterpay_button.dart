import 'package:flutter/material.dart';

import '../../base/pay_button.dart';
import '../../base/pay_button_colors.dart';
import '../../base/pay_button_fonts.dart';
import 'afterpay_assets.dart';
import 'afterpay_brand.dart';
import 'afterpay_color.dart';
import 'afterpay_shape.dart';

/// An Afterpay / Clearpay payment button.
///
/// Designed following Afterpay/Clearpay brand guidelines.
/// Rendered in pure Flutter using vector graphics with full accessibility semantics.
class AfterpayButton extends PayButton {
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
    this.color = AfterpayColor.mint,
    this.brand = AfterpayBrand.afterpay,
  });

  /// The brand color palette for the button. Defaults to [AfterpayColor.mint].
  final AfterpayColor color;

  /// Regional branding variant (Afterpay vs Clearpay). Defaults to [AfterpayBrand.afterpay].
  final AfterpayBrand brand;

  @override
  double get roundedBorderRadius => 6.0;

  @override
  double get textGap => 6.0;

  @override
  List<String> get defaultFontFamilyFallback => PayButtonFonts.afterpay;

  @override
  String? get semanticLabel =>
      super.semanticLabel ??
      (brand == AfterpayBrand.clearpay
          ? 'Pay with Clearpay'
          : 'Pay with Afterpay');

  @override
  PayButtonColors resolveColors(BuildContext context) => color.palette;

  @override
  Widget buildCompactContent(BuildContext context) {
    final badgeHeight = (height * 0.48).clamp(20.0, 26.0);
    return AfterpayAssets.loopBadge(color: color, height: badgeHeight);
  }

  @override
  Widget buildMediumContent(BuildContext context) {
    final lockupHeight = (height * 0.40).clamp(16.0, 22.0);
    return AfterpayAssets.lockup(
      brand: brand,
      color: color,
      height: lockupHeight,
    );
  }
}
