import 'package:flutter/material.dart';

import '../../base/pay_button.dart';
import '../../base/pay_button_colors.dart';
import '../../base/pay_button_fonts.dart';
import 'afterpay_assets.dart';
import 'afterpay_brand.dart';
import 'afterpay_color.dart';
import 'afterpay_shape.dart';

/// A brand-compliant Afterpay / Clearpay payment button.
///
/// Complies with official Afterpay/Clearpay brand guidelines.
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
    this.color = AfterpayColor.mint,
    this.shape = AfterpayShape.rounded,
    this.brand = AfterpayBrand.afterpay,
  });

  /// The brand color palette for the button. Defaults to [AfterpayColor.mint].
  final AfterpayColor color;

  /// The contour shape of the button. Defaults to [AfterpayShape.rounded] (6.0 dp).
  final AfterpayShape shape;

  /// Regional branding variant (Afterpay vs Clearpay). Defaults to [AfterpayBrand.afterpay].
  final AfterpayBrand brand;

  @override
  double get defaultBorderRadius =>
      shape == AfterpayShape.pill ? (height / 2) : 6.0;

  @override
  String? get semanticLabel =>
      super.semanticLabel ??
      (brand == AfterpayBrand.clearpay
          ? 'Pay with Clearpay'
          : 'Pay with Afterpay');

  @override
  PayButtonColors resolveColors(BuildContext context) {
    switch (color) {
      case AfterpayColor.mint:
        return const PayButtonColors(
          backgroundColor: Color(0xFFB2FCE4),
          progressColor: Color(0xFF000000),
          splashColor: Color(0x1F000000),
          highlightColor: Color(0x0F000000),
        );
      case AfterpayColor.black:
        return const PayButtonColors(
          backgroundColor: Color(0xFF000000),
          progressColor: Color(0xFFB2FCE4),
          splashColor: Color(0x1FFFFFFF),
          highlightColor: Color(0x0FFFFFFF),
        );
      case AfterpayColor.white:
        return const PayButtonColors(
          backgroundColor: Color(0xFFFFFFFF),
          borderColor: Color(0xFFD1D5DB),
          borderWidth: 1.0,
          progressColor: Color(0xFF000000),
          splashColor: Color(0x1F000000),
          highlightColor: Color(0x0F000000),
        );
    }
  }

  Color _resolveTextColor() {
    switch (color) {
      case AfterpayColor.mint:
      case AfterpayColor.white:
        return const Color(0xFF000000);
      case AfterpayColor.black:
        return Colors.white;
    }
  }

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

  @override
  Widget buildFullContent(BuildContext context) {
    final brandLockup = buildMediumContent(context);

    if (text == null || text!.isEmpty) {
      return brandLockup;
    }

    final textColor = _resolveTextColor();
    final effectiveLabelStyle = resolveTextStyle(
      textColor: textColor,
      fontSize: (height * 0.31).clamp(13.0, 16.0),
      fontWeight: FontWeight.w600,
      letterSpacing: -0.1,
      defaultFontFamilyFallback: PayButtonFonts.afterpay,
    );

    final textWidget = Flexible(
      child: Text(
        text!,
        style: effectiveLabelStyle,
        overflow: TextOverflow.ellipsis,
      ),
    );

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: textPosition == PayButtonTextPosition.trailing
          ? [brandLockup, const SizedBox(width: 6), textWidget]
          : [textWidget, const SizedBox(width: 6), brandLockup],
    );
  }
}
