import 'package:flutter/material.dart';

/// Predefined content variations for Bizum buttons.
enum BizumButtonType {
  /// Displays "Pagar con" / "Pay with" followed by the Bizum logo (default).
  payWith,

  /// Displays the Bizum logo alone.
  logoOnly;

  /// Returns the localized action label for this button type.
  String getLocalizedLabel(Locale? locale) {
    if (this == BizumButtonType.logoOnly) {
      return '';
    }

    final languageCode = locale?.languageCode.toLowerCase() ?? 'es';
    switch (languageCode) {
      case 'en':
        return 'Pay with';
      case 'fr':
        return 'Payer avec';
      case 'de':
        return 'Bezahlen mit';
      case 'es':
      default:
        return 'Pagar con';
    }
  }
}
