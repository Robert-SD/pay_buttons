/// Supported color themes for Google Pay buttons adhering to official guidelines.
enum GooglePayColor {
  /// Dark / Black (`#000000`) background with 4-color Google "G" and white "Pay" mark.
  ///
  /// Recommended on light backgrounds.
  black,

  /// Light / White (`#FFFFFF`) background with 4-color Google "G", black "Pay" mark,
  /// and subtle border outline (`#747775`).
  ///
  /// Recommended on dark or colorful backgrounds.
  white,

  /// Monochrome black background (`#000000`) with flat all-white logo and text.
  monochromeBlack,

  /// Monochrome white background (`#FFFFFF`) with flat all-black logo, text,
  /// and subtle border outline (`#747775`).
  monochromeWhite,
}
