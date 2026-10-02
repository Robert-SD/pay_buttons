import 'package:flutter/material.dart';

/// Predefined content variations for Bancontact buttons.
enum BancontactButtonType {
  /// Displays "Betaal met" / "Payer avec" followed by the Bancontact logo (default).
  payWith,

  /// Displays the Bancontact logo alone.
  logoOnly;

  /// Returns the localized action label for this button type.
  String getLocalizedLabel(Locale? locale) {
    if (this == BancontactButtonType.logoOnly) {
      return '';
    }

    final languageCode = locale?.languageCode.toLowerCase() ?? 'nl';
    switch (languageCode) {
      case 'fr':
        return 'Payer avec';
      case 'de':
        return 'Bezahlen mit';
      case 'en':
        return 'Pay with';
      case 'nl':
      default:
        return 'Betaal met';
    }
  }
}
