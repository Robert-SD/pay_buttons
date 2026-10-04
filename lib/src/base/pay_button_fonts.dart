/// Centralized typographic fallback chains for supported payment buttons.
///
/// In strict compliance with the **MIT License** and third-party copyright laws,
/// this package does not bundle proprietary font binary assets (`.ttf`/`.otf`).
///
/// Instead, these font fallback lists define the font family resolution order:
/// 1. If the hosting application bundles the official brand font or the operating
///    system includes it, Flutter's text layout engine will render it directly.
/// 2. If the proprietary brand font is not present on the host device, Flutter
///    gracefully falls back to high-quality system and open-source equivalents
///    (e.g. Inter, Roboto, Helvetica Neue, Arial).
abstract final class PayButtonFonts {
  /// Font fallback chain for PayPal buttons.
  ///
  /// References PayPal's brand typefaces (PayPal Pro, PayPal Open, PayPal Sans)
  /// with fallbacks to ubiquitous clean sans-serif typefaces.
  static const List<String> paypal = [
    'PayPal Pro',
    'PayPal Open',
    'PayPal Sans',
    'Futura',
    'Helvetica Neue',
    'Helvetica',
    'Arial',
    'sans-serif',
  ];

  /// Font fallback chain for Klarna buttons.
  ///
  /// References Klarna's brand typefaces (Klarna Text, Klarna Headline)
  /// with fallbacks to clean modern sans-serif typefaces.
  static const List<String> klarna = [
    'Klarna Text',
    'Klarna Headline',
    'Inter',
    'Helvetica Neue',
    'Helvetica',
    'Arial',
    'sans-serif',
  ];

  /// Font fallback chain for Amazon Pay buttons.
  ///
  /// References Amazon's brand typeface (Amazon Ember)
  /// with fallbacks to standard system sans-serifs.
  static const List<String> amazonPay = [
    'Amazon Ember',
    'Inter',
    'Helvetica Neue',
    'Helvetica',
    'Arial',
    'sans-serif',
  ];

  /// Font fallback chain for Shop Pay buttons.
  ///
  /// References Shopify's native UI system font stack.
  static const List<String> shopPay = [
    'Shopify Sans',
    '-apple-system',
    'BlinkMacSystemFont',
    'Segoe UI',
    'Roboto',
    'Inter',
    'Helvetica Neue',
    'Arial',
    'sans-serif',
  ];

  /// Font fallback chain for Afterpay / Clearpay buttons.
  ///
  /// References Afterpay's primary brand typefaces (Youth, Cash Sans Mono, Italian Plate No.2)
  /// with fallbacks to geometric sans-serifs.
  static const List<String> afterpay = [
    'Youth',
    'Cash Sans Mono',
    'Italian Plate No.2',
    'Sofia Pro',
    'Gilroy',
    'Inter',
    'Helvetica Neue',
    'Helvetica',
    'Arial',
    'sans-serif',
  ];

  /// Font fallback chain for TWINT (Switzerland) buttons.
  ///
  /// Adheres to Swiss modernist typography (Neue Haas Grotesk / Helvetica).
  static const List<String> twint = [
    'Helvetica Neue',
    'Neue Haas Grotesk',
    'Helvetica',
    'Arial',
    'sans-serif',
  ];

  /// Font fallback chain for iDEAL (Netherlands) buttons.
  ///
  /// Clean neo-grotesque typography.
  static const List<String> ideal = [
    'Inter',
    'Roboto',
    'Helvetica Neue',
    'Arial',
    'sans-serif',
  ];

  /// Font fallback chain for BLIK (Poland) buttons.
  ///
  /// References Lato (Polish-designed humanist sans-serif) and Montserrat.
  static const List<String> blik = [
    'Lato',
    'Montserrat',
    'Roboto',
    'Arial',
    'sans-serif',
  ];

  /// Font fallback chain for Bancontact (Belgium) buttons.
  ///
  /// Modern geometric sans-serif typography.
  static const List<String> bancontact = [
    'Gotham',
    'Montserrat',
    'Helvetica Neue',
    'Arial',
    'sans-serif',
  ];

  /// Font fallback chain for Bizum (Spain) buttons.
  ///
  /// Soft rounded sans-serif typography matching Bizum's identity.
  static const List<String> bizum = [
    'Omnes',
    'Nunito',
    'Comfortaa',
    'Arial',
    'sans-serif',
  ];

  /// Font fallback chain for Wero (European Payments Initiative) buttons.
  ///
  /// References Wero's primary brand typeface (GT Walsheim by Grilli Type)
  /// with fallbacks to Inter, Roboto, and clean system sans-serif typefaces.
  static const List<String> wero = [
    'GT Walsheim',
    'GT Walsheim Pro',
    'Inter',
    'Roboto',
    '-apple-system',
    'BlinkMacSystemFont',
    'Segoe UI',
    'Helvetica Neue',
    'Arial',
    'sans-serif',
  ];
}
