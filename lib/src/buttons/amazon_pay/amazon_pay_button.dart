import 'package:flutter/material.dart';
import '../../base/pay_button.dart';
import '../../base/pay_button_colors.dart';
import '../../base/pay_button_fonts.dart';
import 'amazon_pay_assets.dart';
import 'amazon_pay_color.dart';
import 'amazon_pay_shape.dart';

/// A brand-compliant Amazon Pay payment button.
///
/// Complies with official Amazon Pay brand guidelines.
/// Fully rendered in pure Flutter using vector graphics without native SDK bloat.
class AmazonPayButton extends PayButton {
  const AmazonPayButton({
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
    this.color = AmazonPayColor.gold,
    this.shape = AmazonPayShape.pill,
  });

  /// The brand color palette for the button. Defaults to [AmazonPayColor.gold].
  final AmazonPayColor color;

  /// The contour shape of the button. Defaults to [AmazonPayShape.pill].
  final AmazonPayShape shape;

  @override
  double get defaultBorderRadius =>
      shape == AmazonPayShape.pill ? (height / 2) : 4.0;

  @override
  String? get semanticLabel =>
      super.semanticLabel ?? 'Amazon Pay';

  @override
  PayButtonColors resolveColors(BuildContext context) {
    switch (color) {
      case AmazonPayColor.gold:
        return const PayButtonColors(
          backgroundColor: Color(0xFFFFC439),
          progressColor: Color(0xFF111111),
          splashColor: Color(0x1F111111),
          highlightColor: Color(0x0F111111),
        );
      case AmazonPayColor.darkGray:
        return const PayButtonColors(
          backgroundColor: Color(0xFF232F3E),
          progressColor: Color(0xFFFF9900),
          splashColor: Color(0x1FFFFFFF),
          highlightColor: Color(0x0FFFFFFF),
        );
      case AmazonPayColor.lightGray:
        return const PayButtonColors(
          backgroundColor: Color(0xFFE7E9EC),
          borderColor: Color(0xFFD5D9D9),
          borderWidth: 1.0,
          progressColor: Color(0xFF111111),
          splashColor: Color(0x1F111111),
          highlightColor: Color(0x0F111111),
        );
    }
  }

  Color _resolveTextColor() {
    switch (color) {
      case AmazonPayColor.gold:
      case AmazonPayColor.lightGray:
        return const Color(0xFF111111);
      case AmazonPayColor.darkGray:
        return Colors.white;
    }
  }

  @override
  Widget buildButtonContent(BuildContext context) {
    final textColor = _resolveTextColor();

    final logoHeight = (height * 0.52).clamp(20.0, 32.0);
    final logoWidget = AmazonPayAssets.logo(color: color, height: logoHeight);

    if (text == null || text!.isEmpty) {
      return logoWidget;
    }

    final effectiveTextStyle = resolveTextStyle(
      textColor: textColor,
      fontSize: (height * 0.31).clamp(13.0, 16.0),
      fontWeight: FontWeight.w600,
      letterSpacing: -0.1,
      defaultFontFamilyFallback: PayButtonFonts.amazonPay,
    );

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(text!, style: effectiveTextStyle),
        const SizedBox(width: 6),
        logoWidget,
      ],
    );
  }
}
