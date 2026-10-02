import 'package:flutter/material.dart';

/// Predefined content variations for iDEAL buttons.
enum IdealButtonType {
  /// Displays "Betaal met" / "Pay with" followed by the iDEAL logo (default).
  payWith,

  /// Displays the iDEAL logo badge alone.
  logoOnly;

  /// Returns the localized action label for this button type.
  String getLocalizedLabel(Locale? locale) {
    if (this == IdealButtonType.logoOnly) {
      return '';
    }

    final languageCode = locale?.languageCode.toLowerCase() ?? 'nl';
    switch (languageCode) {
      case 'en':
        return 'Pay with';
      case 'de':
        return 'Bezahlen mit';
      case 'fr':
        return 'Payer avec';
      case 'nl':
      default:
        return 'Betaal met';
    }
  }
}
