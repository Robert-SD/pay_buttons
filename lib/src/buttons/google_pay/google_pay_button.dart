import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pay/pay.dart' as pay;

import '../../base/pay_button.dart';
import '../../base/pay_button_colors.dart';
import '../../base/pay_button_fonts.dart';
import 'google_pay_assets.dart';
import 'google_pay_color.dart';
import 'google_pay_shape.dart';
import 'google_pay_web_stub.dart'
    if (dart.library.js_interop) 'google_pay_web.dart';

/// A brand-compliant Google Pay payment button.
///
/// Uses official Google Pay JS SDK on Web (`kIsWeb`), native Android Google Pay controls
/// via `package:pay` on Android when a [paymentConfiguration] is provided, and pure Flutter vector rendering
/// on iOS, desktop, and tests.
class GooglePayButton extends PayButton {
  const GooglePayButton({
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
    this.color = GooglePayColor.black,
    this.shape = GooglePayShape.pill,
    this.paymentConfiguration,
    bool? logoFirst,
  }) : super(
         textPosition: textPosition ??
             (logoFirst == true
                 ? PayButtonTextPosition.trailing
                 : PayButtonTextPosition.leading),
       );

  /// The brand color palette for the button. Defaults to [GooglePayColor.black].
  final GooglePayColor color;

  /// The contour shape of the button. Defaults to [GooglePayShape.pill].
  final GooglePayShape shape;

  /// Optional payment configuration for native `package:pay` integration on Android.
  final pay.PaymentConfiguration? paymentConfiguration;

  /// Whether the Google Pay mark appears before [text]. Defaults to `false`.
  bool get logoFirst => textPosition == PayButtonTextPosition.trailing;

  @override
  double get defaultBorderRadius {
    switch (shape) {
      case GooglePayShape.pill:
        return height / 2;
      case GooglePayShape.rounded:
        return 4.0;
      case GooglePayShape.rect:
        return 0.0;
    }
  }

  @override
  String? get semanticLabel =>
      super.semanticLabel ??
      (text != null && text!.isNotEmpty ? '$text Google Pay' : 'Google Pay');

  @override
  PayButtonColors resolveColors(BuildContext context) {
    switch (color) {
      case GooglePayColor.black:
      case GooglePayColor.monochromeBlack:
        return const PayButtonColors(
          backgroundColor: Color(0xFF000000),
          progressColor: Color(0xFFFFFFFF),
          splashColor: Color(0x1FFFFFFF),
          highlightColor: Color(0x0FFFFFFF),
        );
      case GooglePayColor.white:
      case GooglePayColor.monochromeWhite:
        return const PayButtonColors(
          backgroundColor: Color(0xFFFFFFFF),
          borderColor: Color(0xFF747775),
          borderWidth: 1.0,
          progressColor: Color(0xFF1F1F1F),
          splashColor: Color(0x1F000000),
          highlightColor: Color(0x0F000000),
        );
    }
  }

  Color _resolveTextColor() {
    switch (color) {
      case GooglePayColor.black:
      case GooglePayColor.monochromeBlack:
        return Colors.white;
      case GooglePayColor.white:
      case GooglePayColor.monochromeWhite:
        return const Color(0xFF1F1F1F);
    }
  }

  @override
  Widget buildCompactContent(BuildContext context) {
    final markHeight = (height * 0.46).clamp(18.0, 24.0);
    return GooglePayAssets.gMark(color: color, height: markHeight);
  }

  @override
  Widget buildMediumContent(BuildContext context) {
    final logoHeight = (height * 0.44).clamp(18.0, 24.0);
    return GooglePayAssets.logo(color: color, height: logoHeight);
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
      letterSpacing: 0.1,
      defaultFontFamilyFallback: PayButtonFonts.googlePay,
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
      final themeString = switch (color) {
        GooglePayColor.black || GooglePayColor.monochromeBlack => 'dark',
        GooglePayColor.white || GooglePayColor.monochromeWhite => 'light',
      };
      final typeString = switch (text?.toLowerCase().trim()) {
        'buy with' || 'buy' => 'buy',
        'check out with' || 'checkout' => 'checkout',
        'donate with' || 'donate' => 'donate',
        'subscribe with' || 'subscribe' => 'subscribe',
        'book with' || 'book' => 'book',
        'order with' || 'order' => 'order',
        'pay with' || 'pay' => 'pay',
        _ => 'buy',
      };

      return buildGooglePayJsButton(
        onPressed: isInteractive ? onPressed : null,
        theme: themeString,
        type: typeString,
        width: width ?? 200.0,
        height: height,
        borderRadius: borderRadius ?? defaultBorderRadius,
      );
    }

    if (!kIsWeb &&
        defaultTargetPlatform == TargetPlatform.android &&
        paymentConfiguration != null) {
      final theme = switch (color) {
        GooglePayColor.black ||
        GooglePayColor.monochromeBlack => pay.GooglePayButtonTheme.dark,
        GooglePayColor.white ||
        GooglePayColor.monochromeWhite => pay.GooglePayButtonTheme.light,
      };

      return SizedBox(
        width: width,
        height: height,
        child: pay.RawGooglePayButton(
          paymentConfiguration: paymentConfiguration!,
          onPressed: isInteractive ? onPressed : null,
          theme: theme,
          type: pay.GooglePayButtonType.pay,
        ),
      );
    }

    return super.build(context);
  }
}
