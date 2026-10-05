/// Supported color themes for Pix payment buttons adhering to Banco Central do Brasil guidelines.
enum PixColor {
  /// Signature Pix Teal (`#32BCAD`) background with white typography and emblem.
  teal,

  /// Clean White (`#FFFFFF`) with border (`#E0E0E0`) and `#32BCAD` emblem.
  white,

  /// Deep Black (`#000000`) for high contrast or dark mode checkouts.
  black,
}
