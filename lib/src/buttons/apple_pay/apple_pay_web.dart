import 'dart:js_interop';
import 'dart:ui_web' as ui_web;
import 'package:flutter/material.dart';
import 'package:web/web.dart' as web;

final Set<String> _registeredViewTypes = {};
bool _applePayJsScriptInjected = false;

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
/// or falls back to pure Flutter vector rendering on non-Safari web browsers (Chrome, Firefox, Edge, etc.).
Widget buildApplePayJsButton({
  required VoidCallback? onPressed,
  required String style,
  required String type,
  required double width,
  required double height,
  required Widget fallback,
}) {
  _ensureApplePayJsInjected();

  // If the browser does not support ApplePaySession (Chrome, Firefox, Edge, Windows, Android),
  // gracefully fall back to our pure Flutter vector button representation.
  if (!_isApplePayJsAvailable()) {
    return fallback;
  }

  final viewType = 'apple-pay-js-button-$style-$type';

  if (!_registeredViewTypes.contains(viewType)) {
    _registeredViewTypes.add(viewType);
    ui_web.platformViewRegistry.registerViewFactory(viewType, (int viewId) {
      final element = web.document.createElement('apple-pay-button') as web.HTMLElement;
      element.setAttribute('buttonstyle', style);
      element.setAttribute('type', type);
      element.style.width = '100%';
      element.style.height = '100%';
      element.style.cursor = 'pointer';
      element.style.display = 'block';

      if (onPressed != null) {
        element.addEventListener('click', (web.Event e) {
          onPressed();
        }.toJS);
      }

      return element;
    });
  }

  return SizedBox(
    width: width,
    height: height,
    child: HtmlElementView(viewType: viewType),
  );
}
