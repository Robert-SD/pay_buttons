/// Supported color themes for Apple Pay buttons adhering to official Human Interface Guidelines.
enum ApplePayColor {
  /// Black (`#000000`) background with white Apple Pay mark and text.
  ///
  /// Recommended on white or light backgrounds.
  black,

  /// White (`#FFFFFF`) background with black Apple Pay mark and text.
  ///
  /// Recommended on dark backgrounds that provide sufficient contrast.
  white,

  /// White (`#FFFFFF`) background with black Apple Pay mark, text, and 1px border outline (`#000000`).
  ///
  /// Recommended on white or light backgrounds when a white button is desired.
  whiteOutline,
}
