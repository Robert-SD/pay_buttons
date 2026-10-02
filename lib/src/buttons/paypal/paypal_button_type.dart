import 'package:flutter/material.dart';

/// Predefined content variations for PayPal buttons.
enum PayPalButtonType {
  /// Displays the PayPal logo followed by "Checkout".
  checkout,

  /// Displays "Pay with" followed by the PayPal logo, or "Pay" label.
  pay,

  /// Displays the PayPal logo followed by "Buy Now".
  buyNow,

  /// Displays the PayPal logo followed by "Pay Later" or regional installment message.
  payLater,

  /// Displays solely the centered PayPal logo (monogram or wordmark).
  logoOnly;

  /// Returns the localized action label for this button type.
  String getLocalizedLabel(Locale? locale) {
    final languageCode = locale?.languageCode.toLowerCase() ?? 'en';

    switch (this) {
      case PayPalButtonType.checkout:
        switch (languageCode) {
          case 'de':
            return 'Direkt zu';
          case 'fr':
            return 'Payer par';
          case 'es':
            return 'Pagar con';
          case 'it':
            return 'Paga con';
          default:
            return 'Checkout';
        }

      case PayPalButtonType.pay:
        switch (languageCode) {
          case 'de':
            return 'Zahlen mit';
          case 'fr':
            return 'Payer avec';
          case 'es':
            return 'Pagar con';
          case 'it':
            return 'Paga con';
          default:
            return 'Pay with';
        }

      case PayPalButtonType.buyNow:
        switch (languageCode) {
          case 'de':
            return 'Jetzt kaufen';
          case 'fr':
            return 'Acheter';
          case 'es':
            return 'Comprar ahora';
          case 'it':
            return 'Acquista ora';
          default:
            return 'Buy Now';
        }

      case PayPalButtonType.payLater:
        switch (languageCode) {
          case 'de':
            return 'Später bezahlen';
          case 'fr':
            return '4x sans frais';
          case 'es':
            return 'Paga en 3 plazos';
          case 'it':
            return 'Paga in 3 rate';
          default:
            return 'Pay Later';
        }

      case PayPalButtonType.logoOnly:
        return '';
    }
  }
}
