import 'package:flutter/material.dart';

import '../../base/pay_button.dart';
import '../../base/pay_button_colors.dart';
import '../../base/pay_button_fonts.dart';
import 'paypal_assets.dart';
import 'paypal_color.dart';
import 'paypal_shape.dart';

/// A PayPal payment button.
///
/// Designed following [PayPal Brand Guidelines](https://developer.paypal.com/docs/checkout/standard/customize/button-style/).
/// Fully rendered in pure Flutter using vector graphics without any native SDK dependencies.
class PayPalButton extends PayButton {
  const PayPalButton({
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
    super.textPosition = PayButtonTextPosition.trailing,
    this.color = PayPalColor.gold,
    this.shape = PayPalShape.pill,
  });

  /// The brand color palette for the button. Defaults to [PayPalColor.gold].
  final PayPalColor color;

  /// The contour shape of the button. Defaults to [PayPalShape.pill].
  final PayPalShape shape;

  @override
  double get defaultBorderRadius =>
      shape == PayPalShape.pill ? (height / 2) : 6.0;

  @override
  String? get semanticLabel => super.semanticLabel ?? 'PayPal';

  @override
  PayButtonColors resolveColors(BuildContext context) {
    switch (color) {
      case PayPalColor.gold:
        return const PayButtonColors(
          backgroundColor: Color(0xFFFFC439),
          progressColor: Color(0xFF003087),
          splashColor: Color(0x1F003087),
          highlightColor: Color(0x0F003087),
        );
      case PayPalColor.blue:
        return const PayButtonColors(
          backgroundColor: Color(0xFF0070BA),
          progressColor: Colors.white,
          splashColor: Color(0x1FFFFFFF),
          highlightColor: Color(0x0FFFFFFF),
        );
      case PayPalColor.black:
        return const PayButtonColors(
          backgroundColor: Color(0xFF000000),
          progressColor: Colors.white,
          splashColor: Color(0x1FFFFFFF),
          highlightColor: Color(0x0FFFFFFF),
        );
      case PayPalColor.white:
        return const PayButtonColors(
          backgroundColor: Color(0xFFFFFFFF),
          borderColor: Color(0xFFD6D6D6),
          borderWidth: 1.0,
          progressColor: Color(0xFF003087),
          splashColor: Color(0x1F003087),
          highlightColor: Color(0x0F003087),
        );
      case PayPalColor.silver:
        return const PayButtonColors(
          backgroundColor: Color(0xFFEEEEEE),
          borderColor: Color(0xFFE0E0E0),
          borderWidth: 1.0,
          progressColor: Color(0xFF003087),
          splashColor: Color(0x1F003087),
          highlightColor: Color(0x0F003087),
        );
    }
  }

  Color _resolveTextColor() {
    switch (color) {
      case PayPalColor.blue:
      case PayPalColor.black:
        return Colors.white;
      case PayPalColor.gold:
      case PayPalColor.white:
      case PayPalColor.silver:
        return const Color(0xFF003087);
    }
  }

  @override
  Widget buildCompactContent(BuildContext context) {
    final monogramHeight = (height * 0.52).clamp(20.0, 28.0);
    return PayPalAssets.monogram(color: color, height: monogramHeight);
  }

  @override
  Widget buildMediumContent(BuildContext context) {
    final logoHeight = (height * 0.46).clamp(18.0, 26.0);
    final wordmarkHeight = (height * 0.40).clamp(16.0, 22.0);

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        PayPalAssets.monogram(color: color, height: logoHeight),
        const SizedBox(width: 5),
        PayPalAssets.wordmark(color: color, height: wordmarkHeight),
      ],
    );
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
      fontWeight: FontWeight.w700,
      letterSpacing: -0.2,
      defaultFontFamilyFallback: PayButtonFonts.paypal,
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
      children: textPosition == PayButtonTextPosition.leading
          ? [textWidget, const SizedBox(width: 8), logoWidget]
          : [logoWidget, const SizedBox(width: 8), textWidget],
    );
  }
}
