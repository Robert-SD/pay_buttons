import 'dart:js_interop';

import 'package:flutter/foundation.dart';
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

/// Default Apple Pay JS SDK CDN endpoint recommended by Apple.
const String defaultApplePayJsSdkUrl =
    'https://applepay.cdn-apple.com/jsapi/1.latest/apple-pay-sdk.js';

/// Injects the Apple Pay JS SDK once per document, if not already present.
void ensureApplePayJsInjected() {
  if (_applePayJsScriptInjected) return;

  final existingScript = web.document.querySelector(
    'script[src*="apple-pay-sdk.js"]',
  );
  if (existingScript != null) {
    _applePayJsScriptInjected = true;
    return;
  }

  final head = web.document.head;
  if (head == null) return;

  final script = web.document.createElement('script') as web.HTMLScriptElement;
  script.src = defaultApplePayJsSdkUrl;
  script.crossOrigin = 'anonymous';
  script.async = true;

  script.addEventListener(
    'error',
    ((web.Event _) {
      _applePayJsScriptInjected = false;
      script.remove();
      if (kDebugMode) {
        debugPrint(
          'ApplePayButton: Failed to load Apple Pay JS SDK from '
          '$defaultApplePayJsSdkUrl.',
        );
      }
    }).toJS,
  );

  head.appendChild(script);
  _applePayJsScriptInjected = true;
}

/// Renders the official Apple Pay JS SDK `<apple-pay-button>` custom element.
///
/// Returns `null` when the SDK is loaded and reports that the device cannot
/// make Apple Pay payments, so callers can render nothing. Before the SDK has
/// loaded the availability probe cannot answer, so the element is rendered
/// optimistically and defined by the SDK once it arrives.
Widget? buildApplePayJsButton({
  required VoidCallback? onPressed,
  required String style,
  required String type,
  required double width,
  required double height,
  required double borderRadius,
}) {
  ensureApplePayJsInjected();

  if (isApplePayJsAvailable() && !canMakeApplePayPayments()) {
    return null;
  }

  return SizedBox(
    width: width,
    height: height,
    child: _ApplePayJsButton(
      onPressed: onPressed,
      style: style,
      type: type,
      borderRadius: borderRadius,
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
    required this.borderRadius,
  });

  final VoidCallback? onPressed;
  final String style;
  final String type;
  final double borderRadius;

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

  /// The SDK `<script>` element that was present when the platform view was
  /// created, retained so its `load` listener can be detached in [dispose].
  ///
  /// The script element lives for the whole document, so a listener left on it
  /// would retain this [State] for the lifetime of the page.
  web.Element? _script;

  /// The `load` listener registered on [_script], kept so [dispose] can remove
  /// the exact callback that was added.
  web.EventListener? _scriptLoadListener;

  /// The `click` listener registered on [_element], retained so [dispose] can
  /// detach it from the DOM element when unmounting.
  web.EventListener? _clickListener;

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
    if (oldWidget.borderRadius != widget.borderRadius) {
      element.style.setProperty(
        '--apple-pay-button-border-radius',
        '${widget.borderRadius.toStringAsFixed(1)}px',
      );
    }
    element.style.cursor = _onPressed != null ? 'pointer' : 'default';
  }

  @override
  void dispose() {
    if (_element != null && _clickListener != null) {
      _element!.removeEventListener('click', _clickListener);
    }
    _clickListener = null;
    _script?.removeEventListener('load', _scriptLoadListener);
    _script = null;
    _scriptLoadListener = null;
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

        // Apple Pay custom element styling requires custom CSS properties
        button.style.setProperty('--apple-pay-button-width', '100%');
        button.style.setProperty('--apple-pay-button-height', '100%');
        button.style.setProperty(
          '--apple-pay-button-border-radius',
          '${widget.borderRadius.toStringAsFixed(1)}px',
        );

        _clickListener = ((web.Event _) => _onPressed?.call()).toJS;
        button.addEventListener('click', _clickListener);

        _element = button;

        // If the custom element has not been defined yet (e.g. script still loading),
        // listen for script load to trigger re-rendering
        final script = web.document.querySelector(
          'script[src*="apple-pay-sdk.js"]',
        );
        if (script != null && _scriptLoadListener == null) {
          _script = script;
          _scriptLoadListener = ((web.Event _) {
            if (mounted && _element != null) {
              _element!.setAttribute('buttonstyle', widget.style);
              _element!.setAttribute('type', widget.type);
              _element!.style.setProperty(
                '--apple-pay-button-border-radius',
                '${widget.borderRadius.toStringAsFixed(1)}px',
              );
            }
          }).toJS;
          script.addEventListener('load', _scriptLoadListener);
        }
      },
    );
  }
}
