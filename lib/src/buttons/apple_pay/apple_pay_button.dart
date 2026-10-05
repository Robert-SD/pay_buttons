import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pay/pay.dart' as pay;

import '../../base/pay_button.dart';
import '../../base/pay_button_colors.dart';
import 'apple_pay_color.dart';
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
    super.text,
    super.semanticLabel,
    super.isLoading,
    super.enabled,
    super.width,
    super.height = 48.0,
    super.margin,
    this.color = ApplePayColor.black,
    this.type,
    this.userCanPay = true,
  }) : super(
         // `text` is never rendered: Apple's own controls own the button
         // wording. It is still accepted so that callers which previously used
         // it keep compiling, and it feeds [effectiveType] and the
         // accessibility label.
         textPosition: PayButtonTextPosition.leading,
       );

  /// The brand color palette of the button. Defaults to [ApplePayColor.black].
  final ApplePayColor color;

  /// The transaction intent, which determines the wording on the button.
  ///
  /// When `null`, falls back to [ApplePayType.plain], which renders the mark
  /// alone. Set this to control the wording Apple applies, for example
  /// [ApplePayType.buy] for "Buy with Apple Pay".
  final ApplePayType? type;

  /// Whether Apple Pay is expected to be usable in the current context.
  ///
  /// When `false`, the button renders nothing. This lets a caller that has
  /// already probed Apple Pay skip the button without waiting for the widget
  /// tree to settle.
  final bool userCanPay;

  /// The transaction intent applied to the button.
  ///
  /// When [type] is `null`, falls back to inferring the intent from [text] for
  /// backward compatibility (`text: 'Buy with'` yields [ApplePayType.buy]),
  /// and finally to [ApplePayType.plain].
  ApplePayType get effectiveType =>
      type ?? ApplePayType.tryParseLabel(text) ?? ApplePayType.plain;

  @override
  String get semanticLabel =>
      super.semanticLabel ?? _semanticLabelFor(effectiveType);

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

    if (kIsWeb) {
      final jsButton = buildApplePayJsButton(
        onPressed: isInteractive ? onPressed : null,
        style: switch (color) {
          ApplePayColor.black => 'black',
          ApplePayColor.white => 'white',
          ApplePayColor.whiteOutline => 'white-outline',
        },
        type: effectiveType.jsValue,
        width: width ?? _defaultWidth,
        height: height,
      );

      // Apple Pay is unsupported in this browser, or the device is not set up
      // to pay. Apple's guidelines do not permit substituting a drawn button.
      if (jsButton == null) return const SizedBox.shrink();

      return Semantics(
        button: true,
        enabled: isInteractive,
        label: semanticLabel,
        child: jsButton,
      );
    }

    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return Semantics(
        button: true,
        enabled: isInteractive,
        label: semanticLabel,
        child: SizedBox(
          width: width ?? _defaultWidth,
          height: height,
          child: pay.RawApplePayButton(
            onPressed: isInteractive ? onPressed : null,
            style: switch (color) {
              ApplePayColor.black => pay.ApplePayButtonStyle.black,
              ApplePayColor.white => pay.ApplePayButtonStyle.white,
              ApplePayColor.whiteOutline =>
                pay.ApplePayButtonStyle.whiteOutline,
            },
            type: switch (effectiveType) {
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
        ),
      );
    }

    // Android, desktop, and any other target: no official Apple Pay control
    // exists, and Apple's guidelines forbid drawing one.
    return const SizedBox.shrink();
  }

  /// Width used when the caller does not specify one.
  static const double _defaultWidth = 200.0;

  /// Unused: the button has no Flutter-rendered surface, so a Flutter color
  /// palette does not apply.
  @override
  PayButtonColors resolveColors(BuildContext context) => throw UnsupportedError(
    'ApplePayButton renders only native Apple Pay controls, which are styled '
    'by Apple and cannot use a Flutter color palette.',
  );

  @override
  double get defaultBorderRadius => 0.0;
}