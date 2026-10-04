import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pay/pay.dart' as pay;

import '../../base/pay_button.dart';
import '../../base/pay_button_colors.dart';
import '../../base/pay_button_fonts.dart';
import 'apple_pay_assets.dart';
import 'apple_pay_color.dart';
import 'apple_pay_shape.dart';
import 'apple_pay_web_stub.dart'
    if (dart.library.js_interop) 'apple_pay_web.dart';

/// A brand-compliant Apple Pay payment button.
///
/// Uses official Apple Pay JS SDK `<apple-pay-button>` on Web (`kIsWeb`),
/// native iOS Apple Pay controls via `package:pay` on iOS, and pure Flutter vector rendering
/// on Android, desktop, and tests.
class ApplePayButton extends PayButton {
  const ApplePayButton({
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
    PayButtonTextPosition? textPosition,
    this.color = ApplePayColor.black,
    this.shape = ApplePayShape.pill,
    bool? logoFirst,
  }) : super(
         textPosition: textPosition ??
             (logoFirst == true
                 ? PayButtonTextPosition.trailing
                 : PayButtonTextPosition.leading),
       );

  /// The brand color palette for the button. Defaults to [ApplePayColor.black].
  final ApplePayColor color;

  /// The contour shape of the button. Defaults to [ApplePayShape.pill].
  final ApplePayShape shape;

  /// Whether the Apple Pay mark appears before [text]. Defaults to `false`.
  bool get logoFirst => textPosition == PayButtonTextPosition.trailing;

  @override
  double get defaultBorderRadius {
    switch (shape) {
      case ApplePayShape.rounded:
        return 4.0;
      case ApplePayShape.pill:
        return height / 2;
      case ApplePayShape.rect:
        return 0.0;
    }
  }

  @override
  String? get semanticLabel =>
      super.semanticLabel ??
      (text != null && text!.isNotEmpty ? '$text Apple Pay' : 'Apple Pay');

  @override
  PayButtonColors resolveColors(BuildContext context) {
    switch (color) {
      case ApplePayColor.black:
        return const PayButtonColors(
          backgroundColor: Color(0xFF000000),
          progressColor: Color(0xFFFFFFFF),
          splashColor: Color(0x1FFFFFFF),
          highlightColor: Color(0x0FFFFFFF),
        );
      case ApplePayColor.white:
        return const PayButtonColors(
          backgroundColor: Color(0xFFFFFFFF),
          progressColor: Color(0xFF000000),
          splashColor: Color(0x1F000000),
          highlightColor: Color(0x0F000000),
        );
      case ApplePayColor.whiteOutline:
        return const PayButtonColors(
          backgroundColor: Color(0xFFFFFFFF),
          borderColor: Color(0xFF000000),
          borderWidth: 1.0,
          progressColor: Color(0xFF000000),
          splashColor: Color(0x1F000000),
          highlightColor: Color(0x0F000000),
        );
    }
  }

  Color _resolveTextColor() {
    switch (color) {
      case ApplePayColor.black:
        return Colors.white;
      case ApplePayColor.white:
      case ApplePayColor.whiteOutline:
        return Colors.black;
    }
  }

  @override
  Widget buildCompactContent(BuildContext context) {
    final markHeight = (height * 0.48).clamp(20.0, 26.0);
    return ApplePayAssets.appleMark(color: color, height: markHeight);
  }

  @override
  Widget buildMediumContent(BuildContext context) {
    final logoHeight = (height * 0.44).clamp(18.0, 24.0);
    return ApplePayAssets.logo(color: color, height: logoHeight);
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
      fontSize: (height * 0.33).clamp(14.0, 17.0),
      fontWeight: FontWeight.w500,
      letterSpacing: -0.2,
      defaultFontFamilyFallback: PayButtonFonts.applePay,
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

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      final styleString = switch (color) {
        ApplePayColor.black => 'black',
        ApplePayColor.white => 'white',
        ApplePayColor.whiteOutline => 'white-outline',
      };
      final typeString = switch (text?.toLowerCase().trim()) {
        'buy with' || 'buy' => 'buy',
        'check out with' || 'checkout' => 'check-out',
        'donate with' || 'donate' => 'donate',
        'subscribe with' || 'subscribe' => 'subscribe',
        'reload with' || 'reload' => 'reload',
        'add money with' || 'add money' => 'add-money',
        'top up with' || 'top up' => 'top-up',
        _ => 'plain',
      };

      return buildApplePayJsButton(
        onPressed: isInteractive ? onPressed : null,
        style: styleString,
        type: typeString,
        width: width ?? 200.0,
        height: height,
        fallback: super.build(context),
      );
    }

    if (!kIsWeb && defaultTargetPlatform == TargetPlatform.iOS) {
      final style = switch (color) {
        ApplePayColor.black => pay.ApplePayButtonStyle.black,
        ApplePayColor.white => pay.ApplePayButtonStyle.white,
        ApplePayColor.whiteOutline => pay.ApplePayButtonStyle.whiteOutline,
      };

      return SizedBox(
        width: width,
        height: height,
        child: pay.RawApplePayButton(
          onPressed: isInteractive ? onPressed : null,
          style: style,
          type: pay.ApplePayButtonType.plain,
        ),
      );
    }

    return super.build(context);
  }
}
