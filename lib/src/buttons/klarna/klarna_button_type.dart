import 'package:flutter/material.dart';

/// Supported action/content layouts for Klarna buttons.
enum KlarnaButtonType {
  /// Displays the Klarna logo with an express checkout prompt.
  express,

  /// Instant direct checkout / Pay now ("Sofort bezahlen" / "Betala direkt").
  payNow,

  /// Buy now, pay in 30 days ("In 30 Tagen bezahlen" / "Få först. Betala sen.").
  payLater,

  /// Split in interest-free installments ("Pay in 3" / "In 3 Raten" / "Dela upp").
  sliceIt,

  /// Displays solely the centered Klarna badge logo.
  badgeOnly;

  /// Returns the localized action label for this button type.
  String getLocalizedLabel(Locale? locale) {
    final languageCode = locale?.languageCode.toLowerCase() ?? 'en';

    switch (this) {
      case KlarnaButtonType.express:
        switch (languageCode) {
          case 'de':
            return 'Direkt zu';
          case 'sv':
            return 'Köp med';
          case 'fr':
            return 'Payer avec';
          case 'es':
            return 'Pagar con';
          case 'it':
            return 'Paga con';
          default:
            return 'Pay with';
        }

      case KlarnaButtonType.payNow:
        switch (languageCode) {
          case 'de':
            return 'Sofort bezahlen';
          case 'sv':
            return 'Betala direkt';
          case 'fr':
            return 'Payer maintenant';
          case 'es':
            return 'Pagar ahora';
          case 'it':
            return 'Paga ora';
          default:
            return 'Pay now';
        }

      case KlarnaButtonType.payLater:
        switch (languageCode) {
          case 'de':
            return 'In 30 Tagen bezahlen';
          case 'sv':
            return 'Få först. Betala sen.';
          case 'fr':
            return 'Payer en 30 jours';
          case 'es':
            return 'Paga en 30 días';
          case 'it':
            return 'Paga in 30 giorni';
          default:
            return 'Pay in 30 days';
        }

      case KlarnaButtonType.sliceIt:
        switch (languageCode) {
          case 'de':
            return 'In 3 Raten';
          case 'sv':
            return 'Dela upp';
          case 'fr':
            return 'Payer en 3x';
          case 'es':
            return 'Paga en 3 plazos';
          case 'it':
            return 'Paga in 3 rate';
          default:
            return 'Pay in 3';
        }

      case KlarnaButtonType.badgeOnly:
        return '';
    }
  }
}
