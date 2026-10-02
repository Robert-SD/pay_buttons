import 'package:flutter/material.dart';

/// Predefined content variations for BLIK buttons.
enum BlikButtonType {
  /// Displays "Zapłać z" / "Pay with" followed by the BLIK logo (default).
  payWith,

  /// Displays the BLIK logo alone.
  logoOnly;

  /// Returns the localized action label for this button type.
  String getLocalizedLabel(Locale? locale) {
    if (this == BlikButtonType.logoOnly) {
      return '';
    }

    final languageCode = locale?.languageCode.toLowerCase() ?? 'pl';
    switch (languageCode) {
      case 'en':
        return 'Pay with';
      case 'de':
        return 'Bezahlen mit';
      case 'pl':
      default:
        return 'Zapłać z';
    }
  }
}
