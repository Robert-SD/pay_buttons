import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pay/pay.dart' as pay;

import '../../base/pay_button.dart';
import '../../base/pay_button_colors.dart';
import 'apple_pay_color.dart';
import 'apple_pay_shape.dart';
import 'apple_pay_type.dart';
import 'apple_pay_web_stub.dart'
    if (dart.library.js_interop) 'apple_pay_web.dart';

/// An Apple Pay payment button that renders only Apple's own controls.
///
/// Apple's Human Interface Guidelines forbid reproducing the Apple Pay mark or
/// composing a button from it, so this widget renders nothing on platforms that
/// have no official Apple Pay control:
///
/// * **iOS** — the native `PKPaymentButton` via `package:pay`.
/// * **Web** — the official Apple Pay JS SDK `<apple-pay-button>` element, in
///   browsers where Apple Pay is supported.
///
/// On Android, desktop, and in browsers without Apple Pay, [build] returns an
/// empty box. Gate your checkout UI on Apple Pay availability if you need to
/// offer another payment method there.
///
/// Prefer `ApplePayButton(userCanPay: ...)` over inferring availability from
/// the rendered output.
class ApplePayButton extends PayButton {
  const ApplePayButton({
    super.key,
    required super.onPressed,
    this.type = ApplePayType.plain,
    this.color = ApplePayColor.black,
    this.shape = ApplePayShape.pill,
    this.userCanPay = true,
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

  /// The transaction intent, which determines the wording on the button.
  /// Defaults to [ApplePayType.plain] (Apple Pay mark only).
  final ApplePayType type;

  /// The brand color palette of the button. Defaults to [ApplePayColor.black].
  final ApplePayColor color;

  /// The contour shape of the button. Defaults to [ApplePayShape.pill].
  final ApplePayShape shape;

  /// Whether Apple Pay is expected to be usable in the current context.
  ///
  /// When `false`, the button renders nothing. This lets a caller that has
  /// already probed Apple Pay skip the button without waiting for the widget
  /// tree to settle.
  final bool userCanPay;

  /// The effective transaction intent applied to the button.
  ApplePayType get effectiveType => type;

  @override
  double get defaultBorderRadius {
    switch (shape) {
      case ApplePayShape.pill:
        return height / 2;
      case ApplePayShape.rounded:
        return 4.0;
      case ApplePayShape.rect:
        return 0.0;
    }
  }

  @override
  String get semanticLabel =>
      super.semanticLabel ?? _semanticLabelFor(type);

  static String _semanticLabelFor(ApplePayType type) => switch (type) {
    ApplePayType.plain => 'Apple Pay',
    ApplePayType.buy => 'Buy with Apple Pay',
    ApplePayType.checkout => 'Check out with Apple Pay',
    ApplePayType.donate => 'Donate with Apple Pay',
    ApplePayType.setUp => 'Set up Apple Pay',
    ApplePayType.inStore => 'Apple Pay in-store',
    ApplePayType.subscribe => 'Subscribe with Apple Pay',
    ApplePayType.reload => 'Reload with Apple Pay',
    ApplePayType.addMoney => 'Add money with Apple Pay',
    ApplePayType.topUp => 'Top up with Apple Pay',
    ApplePayType.order => 'Order with Apple Pay',
    ApplePayType.rent => 'Rent with Apple Pay',
    ApplePayType.book => 'Book with Apple Pay',
    ApplePayType.support => 'Support with Apple Pay',
    ApplePayType.contribute => 'Contribute with Apple Pay',
    ApplePayType.tip => 'Tip with Apple Pay',
  };

  @override
  Widget build(BuildContext context) {
    if (!userCanPay) return const SizedBox.shrink();

    final effectiveRadius = borderRadius ?? defaultBorderRadius;
    final colors = resolveColors(context);

    if (isLoading) {
      Widget loadingBox = SizedBox(
        width: width ?? _defaultWidth,
        height: height,
        child: Material(
          color: colors.backgroundColor,
          elevation: elevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(effectiveRadius),
            side: colors.borderColor != null
                ? BorderSide(color: colors.borderColor!, width: colors.borderWidth)
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
      final jsButton = buildApplePayJsButton(
        onPressed: isInteractive ? onPressed : null,
        style: switch (color) {
          ApplePayColor.black => 'black',
          ApplePayColor.white => 'white',
          ApplePayColor.whiteOutline => 'white-outline',
        },
        type: type.jsValue,
        width: width ?? _defaultWidth,
        height: height,
        borderRadius: effectiveRadius,
      );

      // Apple Pay is unsupported in this browser, or the device is not set up
      // to pay. Apple's guidelines do not permit substituting a drawn button.
      if (jsButton == null) return const SizedBox.shrink();

      buttonWidget = jsButton;
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      buttonWidget = SizedBox(
        width: width ?? _defaultWidth,
        height: height,
        child: pay.RawApplePayButton(
          onPressed: isInteractive ? onPressed : null,
          cornerRadius: effectiveRadius,
          style: switch (color) {
            ApplePayColor.black => pay.ApplePayButtonStyle.black,
            ApplePayColor.white => pay.ApplePayButtonStyle.white,
            ApplePayColor.whiteOutline =>
              pay.ApplePayButtonStyle.whiteOutline,
          },
          type: switch (type) {
            ApplePayType.plain => pay.ApplePayButtonType.plain,
            ApplePayType.buy => pay.ApplePayButtonType.buy,
            ApplePayType.setUp => pay.ApplePayButtonType.setUp,
            ApplePayType.inStore => pay.ApplePayButtonType.inStore,
            ApplePayType.donate => pay.ApplePayButtonType.donate,
            ApplePayType.checkout => pay.ApplePayButtonType.checkout,
            ApplePayType.book => pay.ApplePayButtonType.book,
            ApplePayType.subscribe => pay.ApplePayButtonType.subscribe,
            ApplePayType.reload => pay.ApplePayButtonType.reload,
            ApplePayType.addMoney => pay.ApplePayButtonType.addMoney,
            ApplePayType.topUp => pay.ApplePayButtonType.topUp,
            ApplePayType.order => pay.ApplePayButtonType.order,
            ApplePayType.rent => pay.ApplePayButtonType.rent,
            ApplePayType.support => pay.ApplePayButtonType.support,
            ApplePayType.contribute => pay.ApplePayButtonType.contribute,
            ApplePayType.tip => pay.ApplePayButtonType.tip,
          },
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

  /// Width used when the caller does not specify one.
  static const double _defaultWidth = 200.0;

  /// Returns the color palette corresponding to [color] according to official
  /// Apple Pay guidelines (e.g. solid black background with white mark for [ApplePayColor.black]).
  ///
  /// Note: Apple Pay buttons are rendered directly by platform controls
  /// (PKPaymentButton / Apple Pay JS SDK) and do not use a custom Flutter canvas.
  @override
  PayButtonColors resolveColors(BuildContext context) => switch (color) {
    ApplePayColor.black => const PayButtonColors(
      backgroundColor: Color(0xFF000000),
      progressColor: Color(0xFFFFFFFF),
    ),
    ApplePayColor.white => const PayButtonColors(
      backgroundColor: Color(0xFFFFFFFF),
      progressColor: Color(0xFF000000),
    ),
    ApplePayColor.whiteOutline => const PayButtonColors(
      backgroundColor: Color(0xFFFFFFFF),
      progressColor: Color(0xFF000000),
      borderColor: Color(0xFF000000),
      borderWidth: 1.0,
    ),
  };
}
