/// Supported color themes for Dutch iDEAL / Wero transition buttons.
///
/// Follows the official Currence iDEAL / EPI migration guidelines:
/// https://ideal.nl/naar-wero
enum IdealColor {
  /// Signature Wero Yellow (`#FFF48D`) background with dark branding and typography.
  ///
  /// This is the primary transition palette recommended by Currence iDEAL / EPI.
  yellow,

  /// Dark / Wero Black (`#1D1C1C`) background with crisp white branding and typography.
  black,

  /// Clean White (`#FFFFFF`) background with dark branding and subtle border (`#D1D5DB`).
  white,

  /// Light Gray (`#F5F5F5`) for subtle contrast on white backgrounds.
  lightGray,
}
