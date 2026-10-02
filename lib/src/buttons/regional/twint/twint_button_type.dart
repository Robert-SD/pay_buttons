import 'package:flutter/material.dart';

/// Predefined content variations for TWINT buttons.
enum TwintButtonType {
  /// Displays "Pay with" followed by the TWINT logo (default).
  payWith,

  /// Displays the TWINT logo lock-up alone.
  logoOnly;

  /// Returns the localized action label for this button type.
  String getLocalizedLabel(Locale? locale) {
    if (this == TwintButtonType.logoOnly) {
      return '';
    }

    final languageCode = locale?.languageCode.toLowerCase() ?? 'de';
    switch (languageCode) {
      case 'fr':
        return 'Payer avec';
      case 'it':
        return 'Paga con';
      case 'en':
        return 'Pay with';
      case 'de':
      default:
        return 'Bezahlen mit';
    }
  }
}
