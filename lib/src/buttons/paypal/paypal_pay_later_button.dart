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
    String? semanticLabel,
    super.variant,
    super.textPosition,
    super.color,
    super.shape = PayPalShape.pill,
    super.textStyle,
    super.fontFamily,
    super.fontFamilyFallback,
  }) : super(semanticLabel: semanticLabel ?? 'PayPal Pay Later');

  @override
  PayPalColor effectiveColor(BuildContext context) {
    if (color != null) return color!;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? PayPalColor.black : PayPalColor.white;
  }

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
    final effectiveTextColor =
        isInteractive ? colors.textColor : colors.disabledTextColor;
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
