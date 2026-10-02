import 'package:flutter/material.dart';

/// Predefined content variations for Shop Pay buttons.
enum ShopPayButtonType {
  /// Displays the official Shop Pay logo alone (default).
  standard,

  /// Displays "Buy with" followed by the Shop Pay logo.
  buyWith;

  /// Returns the localized action label for this button type.
  String getLocalizedLabel(Locale? locale) {
    if (this == ShopPayButtonType.standard) {
      return '';
    }

    final languageCode = locale?.languageCode.toLowerCase() ?? 'en';
    switch (languageCode) {
      case 'de':
        return 'Kaufen mit';
      case 'fr':
        return 'Acheter avec';
      case 'es':
        return 'Comprar con';
      case 'it':
        return 'Acquista con';
      case 'nl':
        return 'Kopen met';
      case 'pt':
        return 'Comprar com';
      default:
        return 'Buy with';
    }
  }
}
