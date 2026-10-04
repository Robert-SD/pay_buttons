/// Contour shapes supported by Apple Pay button guidelines.
enum ApplePayShape {
  /// Rounded rectangle with 4.0 dp corner radius (official Apple Pay HIG default).
  rounded,

  /// Fully rounded pill shape (corner radius = height / 2).
  pill,

  /// Sharp rectangle with 0.0 dp corner radius.
  rect,
}
