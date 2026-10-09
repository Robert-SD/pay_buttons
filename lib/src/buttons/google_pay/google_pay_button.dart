import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pay/pay.dart' as pay;

import '../../base/pay_button.dart';
import '../../base/pay_button_colors.dart';
import 'google_pay_color.dart';
import 'google_pay_environment.dart';
import 'google_pay_shape.dart';
import 'google_pay_web_stub.dart'
    if (dart.library.js_interop) 'google_pay_web.dart';

/// A Google Pay payment button that renders platform controls.
///
/// Uses the Google Pay JS SDK on Web (`kIsWeb`) and native Android Google Pay controls
/// via `package:pay` on Android when a [paymentConfiguration] is provided.
/// Renders an empty box on unsupported platforms.
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
    this.environment,
    bool? logoFirst,
  }) : super(
         textPosition:
             textPosition ??
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

  /// The target Google Pay environment (`test` or `production`).
  ///
  /// When `null`, automatically resolves from [paymentConfiguration] if available,
  /// or defaults to [GooglePayEnvironment.production] in release mode (`kReleaseMode`)
  /// and [GooglePayEnvironment.test] in debug / profile mode.
  final GooglePayEnvironment? environment;

  /// Resolves the effective Google Pay environment.
  GooglePayEnvironment get effectiveEnvironment {
    if (environment != null) {
      return environment!;
    }
    if (paymentConfiguration != null) {
      try {
        final raw = jsonDecode(paymentConfiguration!.rawConfigurationData());
        if (raw is Map) {
          final env =
              (raw['environment'] ?? (raw['data'] as Map?)?['environment'])
                  as String?;
          if (env != null) {
            if (env.toUpperCase() == 'PRODUCTION') {
              return GooglePayEnvironment.production;
            } else if (env.toUpperCase() == 'TEST') {
              return GooglePayEnvironment.test;
            }
          }
        }
      } catch (_) {}
    }
    return kReleaseMode
        ? GooglePayEnvironment.production
        : GooglePayEnvironment.test;
  }

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
        environment: effectiveEnvironment.value,
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

    // Android without config, iOS, desktop, test, and any unsupported target:
    // render an empty box, matching ApplePayButton.
    return const SizedBox.shrink();
  }

  /// Returns the color palette corresponding to [color] according to official
  /// Google Pay guidelines (e.g. dark `#000000` background for [GooglePayColor.black]).
  ///
  /// Note: Google Pay buttons are rendered directly by platform controls
  /// (package:pay / Google Pay JS SDK) and do not use a custom Flutter canvas.
  @override
  PayButtonColors resolveColors(BuildContext context) => switch (color) {
    GooglePayColor.black || GooglePayColor.monochromeBlack =>
      const PayButtonColors(
        backgroundColor: Color(0xFF000000),
        progressColor: Color(0xFFFFFFFF),
      ),
    GooglePayColor.white || GooglePayColor.monochromeWhite =>
      const PayButtonColors(
        backgroundColor: Color(0xFFFFFFFF),
        progressColor: Color(0xFF3C4043),
        borderColor: Color(0xFF747775),
        borderWidth: 1.0,
      ),
  };
}
