import 'dart:js_interop';
import 'dart:ui_web' as ui_web;
import 'package:flutter/material.dart';
import 'package:web/web.dart' as web;

final Map<int, VoidCallback?> _clickCallbacks = {};
bool _applePayJsScriptInjected = false;
bool _viewFactoryRegistered = false;

@JS('window.ApplePaySession')
external JSObject? get applePaySession;

bool _isApplePayJsAvailable() {
  try {
    return applePaySession != null;
  } catch (_) {
    return false;
  }
}

void _ensureApplePayJsInjected() {
  if (_applePayJsScriptInjected) return;
  _applePayJsScriptInjected = true;

  final existingScript = web.document.querySelector('script[src*="apple-pay-sdk.js"]');
  if (existingScript == null) {
    final script = web.document.createElement('script') as web.HTMLScriptElement;
    script.src = 'https://applepay.cdn-apple.com/jssdk/1.1.0/apple-pay-sdk.js';
    script.async = true;
    web.document.head?.appendChild(script);
  }
}

/// Renders the official Apple Pay JS SDK `<apple-pay-button>` custom HTML element on Safari Web,
/// or falls back to pure Flutter vector rendering on non-Safari web browsers.
Widget buildApplePayJsButton({
  required VoidCallback? onPressed,
  required String style,
  required String type,
  required double width,
  required double height,
  required Widget fallback,
}) {
  _ensureApplePayJsInjected();

  // If ApplePaySession is not supported by the browser (Chrome, Firefox, Edge, Windows, Android),
  // gracefully fall back to our pure Flutter vector button.
  if (!_isApplePayJsAvailable()) {
    return fallback;
  }

  if (!_viewFactoryRegistered) {
    _viewFactoryRegistered = true;
    ui_web.platformViewRegistry.registerViewFactory('apple-pay-js-button', (int viewId) {
      final element = web.document.createElement('apple-pay-button') as web.HTMLElement;
      element.setAttribute('buttonstyle', style);
      element.setAttribute('type', type);
      element.style.width = '100%';
      element.style.height = '100%';
      element.style.cursor = 'pointer';
      element.style.display = 'block';

      element.addEventListener('click', (web.Event e) {
        _clickCallbacks[viewId]?.call();
      }.toJS);

      return element;
    });
  }

  return SizedBox(
    width: width,
    height: height,
    child: _ApplePayHtmlWidget(
      onPressed: onPressed,
      style: style,
      type: type,
    ),
  );
}

class _ApplePayHtmlWidget extends StatefulWidget {
  const _ApplePayHtmlWidget({
    required this.onPressed,
    required this.style,
    required this.type,
  });

  final VoidCallback? onPressed;
  final String style;
  final String type;

  @override
  State<_ApplePayHtmlWidget> createState() => _ApplePayHtmlWidgetState();
}

class _ApplePayHtmlWidgetState extends State<_ApplePayHtmlWidget> {
  static int _nextId = 0;
  late final int _id;

  @override
  void initState() {
    super.initState();
    _id = ++_nextId;
    _clickCallbacks[_id] = widget.onPressed;
  }

  @override
  void didUpdateWidget(covariant _ApplePayHtmlWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    _clickCallbacks[_id] = widget.onPressed;
  }

  @override
  void dispose() {
    _clickCallbacks.remove(_id);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const HtmlElementView(viewType: 'apple-pay-js-button');
  }
}
