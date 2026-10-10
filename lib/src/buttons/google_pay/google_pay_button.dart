import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pay/pay.dart' as pay;

import '../../base/pay_button.dart';
import '../../base/pay_button_colors.dart';
import 'google_pay_color.dart';
import 'google_pay_environment.dart';
import 'google_pay_shape.dart';
import 'google_pay_type.dart';
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
    this.type = GooglePayType.pay,
    this.color = GooglePayColor.black,
    super.shape = GooglePayShape.pill,
    this.paymentConfiguration,
    this.environment,
    super.width,
    super.height = 48.0,
    super.borderRadius,
    super.margin,
    super.elevation,
    super.isLoading,
    super.enabled,
    super.semanticLabel,
  }) : super(
         text: null,
         textStyle: null,
         fontFamily: null,
         fontFamilyFallback: null,
         variant: PayButtonVariant.responsive,
         textPosition: PayButtonTextPosition.leading,
       );

  /// The transaction intent and wording of the button. Defaults to [GooglePayType.pay].
  final GooglePayType type;

  /// The brand color palette for the button. Defaults to [GooglePayColor.black].
  final GooglePayColor color;

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

  @override
  String get semanticLabel => super.semanticLabel ?? _semanticLabelFor(type);

  static String _semanticLabelFor(GooglePayType type) => switch (type) {
    GooglePayType.plain => 'Google Pay',
    GooglePayType.pay => 'Pay with Google Pay',
    GooglePayType.buy => 'Buy with Google Pay',
    GooglePayType.checkout => 'Check out with Google Pay',
    GooglePayType.donate => 'Donate with Google Pay',
    GooglePayType.order => 'Order with Google Pay',
    GooglePayType.book => 'Book with Google Pay',
    GooglePayType.subscribe => 'Subscribe with Google Pay',
  };

  @override
  Widget build(BuildContext context) {
    final effectiveRadius = borderRadius ?? defaultBorderRadius;
    final colors = resolveColors(context);

    if (isLoading) {
      Widget loadingBox = SizedBox(
        width: width ?? (kIsWeb ? PayButton.defaultNativeWidth : null),
        height: height,
        child: Material(
          color: colors.backgroundColor,
          elevation: elevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(effectiveRadius),
            side: colors.borderColor != null
                ? BorderSide(
                    color: colors.borderColor!,
                    width: colors.borderWidth,
                  )
                : BorderSide.none,
          ),
          child: Center(
            child: SizedBox(
              width: 22,
              height: 22,
              child: CircularProgressIndicator(
                strokeWidth: 2.5,
                valueColor: AlwaysStoppedAnimation<Color>(colors.progressColor),
              ),
            ),
          ),
        ),
      );

      if (margin != null) {
        loadingBox = Padding(padding: margin!, child: loadingBox);
      }

      return Semantics(
        button: true,
        enabled: false,
        label: semanticLabel,
        child: loadingBox,
      );
    }

    Widget? buttonWidget;

    if (kIsWeb) {
      final themeString = switch (color) {
        GooglePayColor.black => 'dark',
        GooglePayColor.white => 'light',
      };

      buttonWidget = buildGooglePayJsButton(
        onPressed: isInteractive ? onPressed : null,
        theme: themeString,
        type: type.jsValue,
        environment: effectiveEnvironment.value,
        width: width ?? PayButton.defaultNativeWidth,
        height: height,
        borderRadius: effectiveRadius,
      );
    } else if (defaultTargetPlatform == TargetPlatform.android &&
        paymentConfiguration != null) {
      final theme = switch (color) {
        GooglePayColor.black => pay.GooglePayButtonTheme.dark,
        GooglePayColor.white => pay.GooglePayButtonTheme.light,
      };

      final buttonType = switch (type) {
        GooglePayType.pay => pay.GooglePayButtonType.pay,
        GooglePayType.buy => pay.GooglePayButtonType.buy,
        GooglePayType.checkout => pay.GooglePayButtonType.checkout,
        GooglePayType.donate => pay.GooglePayButtonType.donate,
        GooglePayType.order => pay.GooglePayButtonType.order,
        GooglePayType.book => pay.GooglePayButtonType.book,
        GooglePayType.subscribe => pay.GooglePayButtonType.subscribe,
        GooglePayType.plain => pay.GooglePayButtonType.plain,
      };

      buttonWidget = SizedBox(
        width: width,
        height: height,
        child: pay.RawGooglePayButton(
          paymentConfiguration: paymentConfiguration!,
          onPressed: isInteractive ? onPressed : null,
          theme: theme,
          type: buttonType,
        ),
      );
    }

    if (buttonWidget == null) {
      return const SizedBox.shrink();
    }

    if (elevation > 0) {
      buttonWidget = Material(
        color: Colors.transparent,
        elevation: elevation,
        borderRadius: BorderRadius.circular(effectiveRadius),
        child: buttonWidget,
      );
    }

    Widget result = Semantics(
      button: true,
      enabled: isInteractive,
      label: semanticLabel,
      child: buttonWidget,
    );

    if (margin != null) {
      result = Padding(padding: margin!, child: result);
    }

    return result;
  }

  /// Returns the color palette corresponding to [color] according to official
  /// Google Pay guidelines (e.g. dark `#000000` background for [GooglePayColor.black]).
  ///
  /// Note: Google Pay buttons are rendered directly by platform controls
  /// (package:pay / Google Pay JS SDK) and do not use a custom Flutter canvas.
  @override
  PayButtonColors resolveColors(BuildContext context) => color.palette;
}
