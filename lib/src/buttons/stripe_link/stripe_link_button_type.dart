import 'package:flutter/material.dart';

/// Predefined content variations for Link by Stripe buttons.
enum StripeLinkButtonType {
  /// Displays "Pay with" followed by the Link logo (default).
  payWithLink,

  /// Displays the centered Link logo only.
  logoOnly;

  /// Returns the localized action label for this button type.
  String getLocalizedLabel(Locale? locale) {
    if (this == StripeLinkButtonType.logoOnly) {
      return '';
    }

    final languageCode = locale?.languageCode.toLowerCase() ?? 'en';
    switch (languageCode) {
      case 'de':
        return 'Bezahlen mit';
      case 'fr':
        return 'Payer avec';
      case 'es':
        return 'Pagar con';
      case 'it':
        return 'Paga con';
      case 'nl':
        return 'Betalen met';
      case 'pt':
        return 'Pagar com';
      default:
        return 'Pay with';
    }
  }
}
