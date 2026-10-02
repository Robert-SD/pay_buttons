import 'package:flutter/material.dart';

/// Predefined content variations for Amazon Pay buttons.
enum AmazonPayButtonType {
  /// Displays the Amazon Pay logo alone (default).
  pay,

  /// Displays "Checkout with" followed by the Amazon Pay logo.
  checkout,

  /// Displays "Buy Now" with the Amazon Pay logo.
  buyNow;

  /// Returns the localized action label for this button type.
  String getLocalizedLabel(Locale? locale) {
    final languageCode = locale?.languageCode.toLowerCase() ?? 'en';

    switch (this) {
      case AmazonPayButtonType.pay:
        return '';

      case AmazonPayButtonType.checkout:
        switch (languageCode) {
          case 'de':
            return 'Bezahlen mit';
          case 'fr':
            return 'Payer avec';
          case 'es':
            return 'Pagar con';
          case 'it':
            return 'Paga con';
          default:
            return 'Check out with';
        }

      case AmazonPayButtonType.buyNow:
        switch (languageCode) {
          case 'de':
            return 'Jetzt kaufen mit';
          case 'fr':
            return 'Acheter avec';
          case 'es':
            return 'Comprar con';
          case 'it':
            return 'Acquista con';
          default:
            return 'Buy Now with';
        }
    }
  }
}
