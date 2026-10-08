import 'package:flutter/material.dart';

import '../../base/pay_button.dart';
import '../../base/pay_button_colors.dart';
import '../../base/pay_button_fonts.dart';
import 'shop_pay_assets.dart';
import 'shop_pay_color.dart';
import 'shop_pay_shape.dart';

/// A brand-compliant Shop Pay (Shopify) payment button.
///
/// Complies with official Shopify brand guidelines.
/// Fully rendered in pure Flutter using vector graphics without native SDK bloat.
class ShopPayButton extends PayButton {
  const ShopPayButton({
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
    this.color = ShopPayColor.purple,
    this.shape = ShopPayShape.rounded,
  });

  /// The brand color palette for the button. Defaults to [ShopPayColor.purple].
  final ShopPayColor color;

  /// The contour shape of the button. Defaults to [ShopPayShape.rounded] (6.0 dp).
  final ShopPayShape shape;

  @override
  double get defaultBorderRadius =>
      shape == ShopPayShape.pill ? (height / 2) : 6.0;

  @override
  String? get semanticLabel => super.semanticLabel ?? 'Pay with Shop Pay';

  @override
  PayButtonColors resolveColors(BuildContext context) {
    switch (color) {
      case ShopPayColor.purple:
        return const PayButtonColors(
          backgroundColor: Color(0xFF5A31F4),
          progressColor: Colors.white,
          splashColor: Color(0x1FFFFFFF),
          highlightColor: Color(0x0FFFFFFF),
        );
      case ShopPayColor.black:
        return const PayButtonColors(
          backgroundColor: Color(0xFF000000),
          progressColor: Colors.white,
          splashColor: Color(0x1FFFFFFF),
          highlightColor: Color(0x0FFFFFFF),
        );
      case ShopPayColor.white:
        return const PayButtonColors(
          backgroundColor: Color(0xFFFFFFFF),
          borderColor: Color(0xFFD1D5DB),
          borderWidth: 1.0,
          progressColor: Color(0xFF5A31F4),
          splashColor: Color(0x1F5A31F4),
          highlightColor: Color(0x0F5A31F4),
        );
    }
  }

  Color _resolveTextColor() {
    switch (color) {
      case ShopPayColor.purple:
      case ShopPayColor.black:
        return Colors.white;
      case ShopPayColor.white:
        return const Color(0xFF5A31F4);
    }
  }

  @override
  Widget buildCompactContent(BuildContext context) {
    final logoHeight = (height * 0.44).clamp(18.0, 24.0);
    return ShopPayAssets.logo(color: color, height: logoHeight);
  }

  @override
  Widget buildMediumContent(BuildContext context) {
    final logoHeight = (height * 0.42).clamp(18.0, 24.0);
    return ShopPayAssets.logo(color: color, height: logoHeight);
  }

  @override
  Widget buildFullContent(BuildContext context) {
    final logoWidget = buildMediumContent(context);

    if (text == null || text!.isEmpty) {
      return logoWidget;
    }

    final textColor = _resolveTextColor();
    final effectiveTextStyle = resolveTextStyle(
      textColor: textColor,
      fontSize: (height * 0.31).clamp(13.0, 16.0),
      fontWeight: FontWeight.w600,
      letterSpacing: -0.1,
      defaultFontFamilyFallback: PayButtonFonts.shopPay,
    );

    final textWidget = Flexible(
      child: Text(
        text!,
        style: effectiveTextStyle,
        overflow: TextOverflow.ellipsis,
      ),
    );

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: textPosition == PayButtonTextPosition.trailing
          ? [logoWidget, const SizedBox(width: 8), textWidget]
          : [textWidget, const SizedBox(width: 8), logoWidget],
    );
  }
}
