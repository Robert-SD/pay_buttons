import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:web/web.dart' as web;

bool _applePayJsScriptInjected = false;

@JS('window.ApplePaySession')
external JSObject? get applePaySession;

/// `ApplePaySession.canMakePayments()`.
///
/// Resolved as a plain static call on the global, which throws a
/// `ReferenceError` when the SDK is absent. Callers must invoke this inside a
/// `try` block (see [canMakeApplePayPayments]).
@JS('ApplePaySession.canMakePayments')
external bool _applePayCanMakePayments();

/// Whether the Apple Pay JS SDK exposes a usable [ApplePaySession].
///
/// [ApplePaySession] is only defined in browsers that implement Apple Pay
/// (Safari on Apple platforms, and any browser where Apple Pay has been
/// enabled). Everywhere else this returns `false`.
bool isApplePayJsAvailable() {
  try {
    return applePaySession != null;
  } catch (_) {
    return false;
  }
}

/// Whether the current browser reports that the user can actually pay.
///
/// Returns `true` when the capability cannot be determined, so that a probe
/// failure never hides the button from a user who is able to use it.
bool canMakeApplePayPayments() {
  try {
    if (applePaySession == null) return false;
    return _applePayCanMakePayments();
  } catch (_) {
    // The SDK failed to answer the probe. Assume the payment can proceed
    // rather than hiding the button from an eligible user.
    return true;
  }
}

/// Injects the Apple Pay JS SDK once per document, if not already present.
void ensureApplePayJsInjected() {
  if (_applePayJsScriptInjected) return;
  _applePayJsScriptInjected = true;

  final existingScript =
      web.document.querySelector('script[src*="apple-pay-sdk.js"]');
  if (existingScript != null) return;

  final script = web.document.createElement('script') as web.HTMLScriptElement;
  script.src = 'https://applepay.cdn-apple.com/jssdk/1.1.0/apple-pay-sdk.js';
  script.async = true;
  web.document.head?.appendChild(script);
}

/// Renders the official Apple Pay JS SDK `<apple-pay-button>` custom element.
///
/// Returns `null` when Apple Pay is unavailable in this browser or the device
/// is not set up to pay, because Apple's guidelines do not permit
/// substituting a hand-drawn button. Callers should render nothing.
Widget? buildApplePayJsButton({
  required VoidCallback? onPressed,
  required String style,
  required String type,
  required double width,
  required double height,
}) {
  ensureApplePayJsInjected();

  // Apple Pay is unavailable in this browser (Chrome, Firefox, Edge, Android
  // browsers, ...) or the device is not set up to pay.
  if (!isApplePayJsAvailable() || !canMakeApplePayPayments()) {
    return null;
  }

  return SizedBox(
    width: width,
    height: height,
    child: _ApplePayJsButton(
      onPressed: onPressed,
      style: style,
      type: type,
    ),
  );
}

/// Embeds a single `<apple-pay-button>` element and bridges its DOM `click`
/// event back to a Dart callback.
class _ApplePayJsButton extends StatefulWidget {
  const _ApplePayJsButton({
    required this.onPressed,
    required this.style,
    required this.type,
  });

  final VoidCallback? onPressed;
  final String style;
  final String type;

  @override
  State<_ApplePayJsButton> createState() => _ApplePayJsButtonState();
}

class _ApplePayJsButtonState extends State<_ApplePayJsButton> {
  /// The live `<apple-pay-button>` element, once the platform view has created
  /// it. Retained so that attribute changes can be applied without rebuilding
  /// (and therefore re-creating) the platform view.
  web.HTMLElement? _element;

  /// The callback invoked by the DOM `click` listener.
  ///
  /// Held in a field so [didUpdateWidget] can swap it without touching the DOM
  /// listener, which is registered only once per element.
  VoidCallback? _onPressed;

  @override
  void initState() {
    super.initState();
    _onPressed = widget.onPressed;
  }

  @override
  void didUpdateWidget(covariant _ApplePayJsButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    _onPressed = widget.onPressed;

    final element = _element;
    if (element == null) return;
    if (oldWidget.style != widget.style) {
      element.setAttribute('buttonstyle', widget.style);
    }
    if (oldWidget.type != widget.type) {
      element.setAttribute('type', widget.type);
    }
    element.style.cursor = _onPressed != null ? 'pointer' : 'default';
  }

  @override
  void dispose() {
    _element = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return HtmlElementView.fromTagName(
      tagName: 'apple-pay-button',
      onElementCreated: (Object element) {
        final button = element as web.HTMLElement;
        button.setAttribute('buttonstyle', widget.style);
        button.setAttribute('type', widget.type);
        button.style.width = '100%';
        button.style.height = '100%';
        button.style.display = 'block';
        button.style.cursor = _onPressed != null ? 'pointer' : 'default';

        button.addEventListener(
          'click',
          ((web.Event _) => _onPressed?.call()).toJS,
        );

        _element = button;
      },
    );
  }
}