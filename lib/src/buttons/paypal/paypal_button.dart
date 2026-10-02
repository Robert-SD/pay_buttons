import 'package:flutter/material.dart';
import '../../base/pay_button.dart';
import '../../base/pay_button_colors.dart';
import 'paypal_assets.dart';
import 'paypal_button_type.dart';
import 'paypal_color.dart';
import 'paypal_shape.dart';

/// A brand-compliant PayPal payment button.
///
/// Complies with official [PayPal Brand Guidelines](https://developer.paypal.com/docs/checkout/standard/customize/button-style/).
/// Fully rendered in pure Flutter using official vector graphics without any native SDK dependencies.
class PayPalButton extends PayButton {
  const PayPalButton({
    super.key,
    required super.onPressed,
    super.isLoading,
    super.enabled,
    super.width,
    super.height = 48.0,
    super.borderRadius,
    super.margin,
    super.elevation,
    super.semanticLabel,
    this.color = PayPalColor.gold,
    this.shape = PayPalShape.pill,
    this.type = PayPalButtonType.checkout,
    this.locale,
    this.textStyle,
  });

  /// The brand color palette for the button. Defaults to [PayPalColor.gold].
  final PayPalColor color;

  /// The contour shape of the button. Defaults to [PayPalShape.pill].
  final PayPalShape shape;

  /// The content/action layout of the button. Defaults to [PayPalButtonType.checkout].
  final PayPalButtonType type;

  /// Optional locale used to translate action verbs (e.g. "Checkout", "Pay Later", "Später bezahlen").
  /// If null, the device's ambient locale or English fallback is used.
  final Locale? locale;

  /// Optional custom text style override for the button label text.
  /// If null, brand-compliant typography (using PayPal's font styling standards) is used.
  final TextStyle? textStyle;

  @override
  double get defaultBorderRadius =>
      shape == PayPalShape.pill ? (height / 2) : 6.0;

  @override
  String? get semanticLabel =>
      super.semanticLabel ??
      (type == PayPalButtonType.payLater
          ? 'Pay Later with PayPal'
          : 'Checkout with PayPal');

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
  Widget buildButtonContent(BuildContext context) {
    final effectiveLocale = locale ?? Localizations.maybeLocaleOf(context);
    final label = type.getLocalizedLabel(effectiveLocale);
    final textColor = _resolveTextColor();

    final logoHeight = (height * 0.46).clamp(18.0, 26.0);
    final wordmarkHeight = (height * 0.40).clamp(16.0, 22.0);

    final logoWidget = Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        PayPalAssets.monogram(color: color, height: logoHeight),
        const SizedBox(width: 5),
        PayPalAssets.wordmark(color: color, height: wordmarkHeight),
      ],
    );

    if (type == PayPalButtonType.logoOnly || label.isEmpty) {
      return logoWidget;
    }

    // Official PayPal typography standard:
    // - "Checkout": Italic bold sans-serif
    // - "Buy Now": Upright (normal) bold sans-serif
    // - "Pay with": Upright semi-bold sans-serif
    // - "Pay Later": Upright bold sans-serif
    final effectiveTextStyle = TextStyle(
      color: textColor,
      fontSize: (height * 0.31).clamp(13.0, 16.0),
      fontWeight: type == PayPalButtonType.pay ? FontWeight.w600 : FontWeight.w700,
      fontStyle: type == PayPalButtonType.checkout ? FontStyle.italic : FontStyle.normal,
      fontFamilyFallback: const [
        'PayPalOpen',
        'PayPal Sans',
        'Helvetica Neue',
        'Helvetica',
        'Arial',
        'sans-serif',
      ],
      letterSpacing: -0.2,
    ).merge(textStyle);

    if (type == PayPalButtonType.pay) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(label, style: effectiveTextStyle),
          const SizedBox(width: 6),
          logoWidget,
        ],
      );
    }

    if (type == PayPalButtonType.payLater) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          logoWidget,
          const SizedBox(width: 8),
          Container(
            width: 1.0,
            height: height * 0.42,
            color: textColor.withValues(alpha: 0.35),
          ),
          const SizedBox(width: 8),
          Text(label, style: effectiveTextStyle),
        ],
      );
    }

    // Default checkout & buyNow layout: Logo + Action Text
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        logoWidget,
        const SizedBox(width: 8),
        Text(label, style: effectiveTextStyle),
      ],
    );
  }
}
