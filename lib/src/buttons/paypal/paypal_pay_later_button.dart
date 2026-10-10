import 'package:flutter/material.dart';

import '../../base/pay_button.dart';
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
    super.semanticLabel,
    super.variant,
    super.textPosition,
    super.color,
    super.shape = PayPalShape.pill,
    super.textStyle,
    super.fontFamily,
    super.fontFamilyFallback,
  });

  @override
  PayPalColor get defaultLightColor => PayPalColor.white;

  @override
  PayPalColor get defaultDarkColor => PayPalColor.black;

  @override
  String get defaultSemanticLabel => 'PayPal Pay Later';

  @override
  Widget buildCompactContent(BuildContext context) {
    return PayPalAssets.payLaterMark(
      color: effectiveColor(context),
      height: compactMarkHeight,
    );
  }

  @override
  Widget buildMediumContent(BuildContext context) {
    return PayPalAssets.payLaterMark(
      color: effectiveColor(context),
      height: mediumLogoHeight,
    );
  }

  @override
  Widget buildFullContent(BuildContext context) {
    if (text == null || text!.isEmpty) {
      return buildMediumContent(context);
    }

    final logo = super.buildMediumContent(context);
    final colors = resolveColors(context);
    final brightness = Theme.of(context).brightness;
    final effectiveTextColor = isInteractive
        ? colors.textColor
        : colors.effectiveDisabledTextColor(brightness);
    final effectiveTextStyle = resolveTextStyle(
      textColor: effectiveTextColor,
      fontSize: labelFontSize,
      fontWeight: labelFontWeight,
      letterSpacing: labelLetterSpacing,
      defaultFontFamilyFallback: defaultFontFamilyFallback,
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        final textLabel = Text(
          text!,
          style: effectiveTextStyle,
          overflow: TextOverflow.ellipsis,
        );

        final Widget textWidget = constraints.hasBoundedWidth
            ? Flexible(child: textLabel)
            : textLabel;

        return Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: textPosition == PayButtonTextPosition.trailing
              ? [logo, SizedBox(width: textGap), textWidget]
              : [textWidget, SizedBox(width: textGap), logo],
        );
      },
    );
  }
}
