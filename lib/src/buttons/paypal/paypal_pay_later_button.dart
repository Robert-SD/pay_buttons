import 'package:flutter/material.dart';

import 'paypal_assets.dart';
import 'paypal_button.dart';
import 'paypal_color.dart';
import 'paypal_shape.dart';

/// A specialized PayPal button preconfigured for Pay Later funding.
class PayPalPayLaterButton extends PayPalButton {
  const PayPalPayLaterButton({
    super.key,
    required super.onPressed,
    super.text = 'Pay Later',
    super.isLoading,
    super.enabled,
    super.width,
    super.height = 48.0,
    super.borderRadius,
    super.margin,
    super.elevation,
    String? semanticLabel,
    super.variant,
    super.textPosition,
    super.color = PayPalColor.white,
    super.shape = PayPalShape.pill,
    super.textStyle,
    super.fontFamily,
    super.fontFamilyFallback,
  }) : super(
         semanticLabel: semanticLabel ?? 'PayPal Pay Later',
       );

  @override
  Widget buildCompactContent(BuildContext context) {
    final markHeight = (height * 0.52).clamp(20.0, 28.0);
    return PayPalAssets.payLaterMark(color: color, height: markHeight);
  }

  @override
  Widget buildMediumContent(BuildContext context) {
    if (text == null || text!.isEmpty) {
      final markHeight = (height * 0.50).clamp(20.0, 28.0);
      return PayPalAssets.payLaterMark(color: color, height: markHeight);
    }
    return super.buildMediumContent(context);
  }
}
