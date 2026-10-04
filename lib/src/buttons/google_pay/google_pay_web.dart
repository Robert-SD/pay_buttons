import 'dart:js_interop';
import 'dart:ui_web' as ui_web;
import 'package:flutter/material.dart';
import 'package:web/web.dart' as web;

final Set<String> _registeredViewTypes = {};
bool _googlePayJsScriptInjected = false;

void _ensureGooglePayJsInjected() {
  if (_googlePayJsScriptInjected) return;
  _googlePayJsScriptInjected = true;

  final existingScript = web.document.querySelector('script[src*="pay.js"]');
  if (existingScript == null) {
    final script = web.document.createElement('script') as web.HTMLScriptElement;
    script.src = 'https://pay.google.com/gp/p/js/pay.js';
    script.async = true;
    web.document.head?.appendChild(script);
  }
}

/// Renders the official Google Pay JS SDK button container on Web.
Widget buildGooglePayJsButton({
  required VoidCallback? onPressed,
  required String theme,
  required String type,
  required double width,
  required double height,
  required Widget fallback,
}) {
  _ensureGooglePayJsInjected();

  final viewType = 'google-pay-js-button-$theme-$type';

  if (!_registeredViewTypes.contains(viewType)) {
    _registeredViewTypes.add(viewType);
    ui_web.platformViewRegistry.registerViewFactory(viewType, (int viewId) {
      final container = web.document.createElement('div') as web.HTMLDivElement;
      container.style.width = '100%';
      container.style.height = '100%';
      container.style.display = 'flex';
      container.style.alignItems = 'center';
      container.style.justifyContent = 'center';
      container.style.cursor = 'pointer';

      if (onPressed != null) {
        container.addEventListener('click', (web.Event e) {
          onPressed();
        }.toJS);
      }

      return container;
    });
  }

  return SizedBox(
    width: width,
    height: height,
    child: HtmlElementView(viewType: viewType),
  );
}
