/// Defines the visual contour shape of a payment button.
enum PayButtonShape {
  /// Fully rounded semi-circular caps (`borderRadius = height / 2`).
  pill,

  /// Rounded rectangular contour using brand-specified corner radius (e.g. 4–6 dp).
  rounded,

  /// Sharp rectangular contour without rounded corners (`borderRadius = 0.0`).
  rect;
}
