import 'dart:js_interop';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:web/web.dart' as web;

bool _googlePayJsScriptInjected = false;

@JS('google.payments.api.PaymentsClient')
extension type PaymentsClient._(JSObject _) implements JSObject {
  external factory PaymentsClient(JSObject paymentOptions);
  external web.HTMLElement createButton(JSObject options);
}

/// Default Google Pay JS SDK endpoint.
const String defaultGooglePayJsSdkUrl =
    'https://pay.google.com/gp/p/js/pay.js';

void _ensureGooglePayJsInjected({String sdkUrl = defaultGooglePayJsSdkUrl}) {
  if (_googlePayJsScriptInjected) return;

  final existingScript = web.document.querySelector(
    'script[src*="pay.google.com/gp/p/js/pay.js"]',
  );
  if (existingScript != null) {
    _googlePayJsScriptInjected = true;
    return;
  }

  final head = web.document.head;
  if (head == null) return;

  final script = web.document.createElement('script') as web.HTMLScriptElement;
  script.src = sdkUrl;
  script.async = true;

  script.addEventListener(
    'error',
    ((web.Event _) {
      _googlePayJsScriptInjected = false;
      script.remove();
      if (kDebugMode) {
        debugPrint(
          'GooglePayButton: Failed to load Google Pay JS SDK script from $sdkUrl.',
        );
      }
    }).toJS,
  );

  head.appendChild(script);
  _googlePayJsScriptInjected = true;
}

/// Renders the official Google Pay JS SDK button container on Web.
Widget buildGooglePayJsButton({
  required VoidCallback? onPressed,
  required String theme,
  required String type,
  required String environment,
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
      environment: environment,
      borderRadius: borderRadius,
    ),
  );
}

class _GooglePayJsButton extends StatefulWidget {
  const _GooglePayJsButton({
    required this.onPressed,
    required this.theme,
    required this.type,
    required this.environment,
    required this.borderRadius,
  });

  final VoidCallback? onPressed;
  final String theme;
  final String type;
  final String environment;
  final double borderRadius;

  @override
  State<_GooglePayJsButton> createState() => _GooglePayJsButtonState();
}

class _GooglePayJsButtonState extends State<_GooglePayJsButton> {
  web.HTMLDivElement? _container;
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

  /// The `error` listener registered on [_script], kept so [dispose] can remove it.
  web.EventListener? _scriptErrorListener;

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
        oldWidget.environment != widget.environment ||
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
        {'environment': widget.environment}.jsify() as JSObject,
      );

      final buttonOptions =
          {
                'buttonColor': widget.theme == 'light' ? 'white' : 'black',
                'buttonType': widget.type,
                'buttonSizeMode': 'fill',
                'buttonRadius': widget.borderRadius.round(),
                'onClick': (() {
                  _onPressed?.call();
                }).toJS,
              }.jsify()
              as JSObject;

      final button = paymentsClient.createButton(buttonOptions);
      button.style.width = '100%';
      button.style.height = '100%';
      container.appendChild(button);
    } catch (e, stackTrace) {
      if (kDebugMode) {
        debugPrint(
          'GooglePayButton: Failed to initialize Google Pay JS client or create button: $e\n$stackTrace',
        );
      }
    }
  }

  @override
  void dispose() {
    _script?.removeEventListener('load', _scriptLoadListener);
    _script?.removeEventListener('error', _scriptErrorListener);
    _script = null;
    _scriptLoadListener = null;
    _scriptErrorListener = null;
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
          final script = web.document.querySelector(
            'script[src*="pay.google.com/gp/p/js/pay.js"]',
          );
          if (script != null && _scriptLoadListener == null) {
            _script = script;
            _scriptLoadListener = ((web.Event _) {
              if (mounted && _container?.firstChild == null) {
                _recreateButton();
              }
            }).toJS;
            _scriptErrorListener = ((web.Event _) {
              if (kDebugMode) {
                debugPrint(
                  'GooglePayButton: Failed to load Google Pay JS SDK script.',
                );
              }
            }).toJS;
            script.addEventListener('load', _scriptLoadListener);
            script.addEventListener('error', _scriptErrorListener);
          }
        }
      },
    );
  }
}
