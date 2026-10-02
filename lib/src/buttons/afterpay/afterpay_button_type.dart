import 'package:flutter/material.dart';

/// Predefined content variations for Afterpay / Clearpay buttons.
enum AfterpayButtonType {
  /// Displays "Buy now with" followed by the Afterpay/Clearpay logo (default).
  buyNow,

  /// Displays "Pay with" followed by the Afterpay/Clearpay logo.
  payWith,

  /// Displays the Afterpay/Clearpay logo lock-up alone.
  logoOnly;

  /// Returns the localized action label for this button type.
  String getLocalizedLabel(Locale? locale) {
    if (this == AfterpayButtonType.logoOnly) {
      return '';
    }

    final languageCode = locale?.languageCode.toLowerCase() ?? 'en';
    switch (this) {
      case AfterpayButtonType.buyNow:
        switch (languageCode) {
          case 'de':
            return 'Jetzt kaufen mit';
          case 'fr':
            return 'Acheter avec';
          case 'es':
            return 'Comprar con';
          case 'it':
            return 'Acquista con';
          case 'nl':
            return 'Nu kopen met';
          default:
            return 'Buy now with';
        }

      case AfterpayButtonType.payWith:
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
          default:
            return 'Pay with';
        }

      case AfterpayButtonType.logoOnly:
        return '';
    }
  }
}
