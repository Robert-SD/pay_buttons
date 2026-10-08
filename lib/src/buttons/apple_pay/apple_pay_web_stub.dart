import 'package:flutter/material.dart';

/// Non-web fallback stub for the Apple Pay JS button.
///
/// Reports Apple Pay as unavailable so callers render nothing.
bool isApplePayJsAvailable() => false;

/// Non-web fallback stub for the Apple Pay JS button.
bool canMakeApplePayPayments() => false;

/// Non-web fallback stub for the Apple Pay JS button.
void ensureApplePayJsInjected() {}

/// Non-web fallback stub for the Apple Pay JS button.
///
/// Always returns `null`, because Apple's guidelines do not permit
/// substituting a hand-drawn button on platforms without a native one.
Widget? buildApplePayJsButton({
  required VoidCallback? onPressed,
  required String style,
  required String type,
  required double width,
  required double height,
  required double borderRadius,
}) {
  return null;
}
