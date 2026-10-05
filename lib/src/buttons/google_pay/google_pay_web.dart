import 'dart:js_interop';
import 'package:flutter/material.dart';
import 'package:web/web.dart' as web;

bool _googlePayJsScriptInjected = false;

@JS('google.payments.api.PaymentsClient')
extension type PaymentsClient._(JSObject _) implements JSObject {
  external factory PaymentsClient(JSObject paymentOptions);
  external web.HTMLElement createButton(JSObject options);
}

void _ensureGooglePayJsInjected() {
  if (_googlePayJsScriptInjected) return;
  _googlePayJsScriptInjected = true;

  final existingScript =
      web.document.querySelector('script[src*="pay.google.com/gp/p/js/pay.js"]');
  if (existingScript != null) return;

  final script = web.document.createElement('script') as web.HTMLScriptElement;
  script.src = 'https://pay.google.com/gp/p/js/pay.js';
  script.async = true;
  web.document.head?.appendChild(script);
}

/// Renders the official Google Pay JS SDK button container on Web.
Widget buildGooglePayJsButton({
  required VoidCallback? onPressed,
  required String theme,
  required String type,
  required double width,
  required double height,
  required double borderRadius,
}) {
  _ensureGooglePayJsInjected();

  return SizedBox(
    width: width,
    height: height,
    child: _GooglePayJsButton(
      onPressed: onPressed,
      theme: theme,
      type: type,
      borderRadius: borderRadius,
    ),
  );
}

class _GooglePayJsButton extends StatefulWidget {
  const _GooglePayJsButton({
    required this.onPressed,
    required this.theme,
    required this.type,
    required this.borderRadius,
  });

  final VoidCallback? onPressed;
  final String theme;
  final String type;
  final double borderRadius;

  @override
  State<_GooglePayJsButton> createState() => _GooglePayJsButtonState();
}

class _GooglePayJsButtonState extends State<_GooglePayJsButton> {
  web.HTMLDivElement? _container;
  VoidCallback? _onPressed;

  @override
  void initState() {
    super.initState();
    _onPressed = widget.onPressed;
  }

  @override
  void didUpdateWidget(covariant _GooglePayJsButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    _onPressed = widget.onPressed;

    if (oldWidget.theme != widget.theme ||
        oldWidget.type != widget.type ||
        oldWidget.borderRadius != widget.borderRadius) {
      _recreateButton();
    }
  }

  void _recreateButton() {
    final container = _container;
    if (container == null) return;

    // Clear existing children
    while (container.firstChild != null) {
      container.removeChild(container.firstChild!);
    }

    try {
      final paymentsClient = PaymentsClient(
        {'environment': 'TEST'}.jsify() as JSObject,
      );

      final buttonOptions = {
        'buttonColor': widget.theme == 'light' ? 'white' : 'black',
        'buttonType': widget.type,
        'buttonSizeMode': 'fill',
        'buttonRadius': widget.borderRadius.round(),
        'onClick': (() {
          _onPressed?.call();
        }).toJS,
      }.jsify() as JSObject;

      final button = paymentsClient.createButton(buttonOptions);
      button.style.width = '100%';
      button.style.height = '100%';
      container.appendChild(button);
    } catch (_) {
      // If JS SDK is still loading or unavailable, wait for it or retry on user interaction
    }
  }

  @override
  void dispose() {
    _container = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return HtmlElementView.fromTagName(
      tagName: 'div',
      onElementCreated: (Object element) {
        final container = element as web.HTMLDivElement;
        container.style.width = '100%';
        container.style.height = '100%';
        container.style.display = 'flex';
        container.style.alignItems = 'center';
        container.style.justifyContent = 'center';

        _container = container;
        _recreateButton();

        // If the script hasn't finished loading yet when onElementCreated fires,
        // retry rendering the button when the script loads.
        if (container.firstChild == null) {
          final script = web.document
              .querySelector('script[src*="pay.google.com/gp/p/js/pay.js"]');
          if (script != null) {
            script.addEventListener(
              'load',
              ((web.Event _) {
                if (mounted && _container?.firstChild == null) {
                  _recreateButton();
                }
              }).toJS,
            );
          }
        }
      },
    );
  }
}
