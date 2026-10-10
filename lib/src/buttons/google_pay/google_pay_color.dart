import 'package:flutter/material.dart';

import '../../base/pay_button_colors.dart';

/// Supported color themes for Google Pay buttons adhering to official guidelines.
enum GooglePayColor {
  /// Dark / Black (`#000000`) background with 4-color Google "G" and white "Pay" mark.
  ///
  /// Recommended on light backgrounds.
  black(
    PayButtonColors(
      backgroundColor: Color(0xFF000000),
      textColor: Color(0xFFFFFFFF),
      progressColor: Color(0xFFFFFFFF),
    ),
  ),

  /// Light / White (`#FFFFFF`) background with 4-color Google "G", black "Pay" mark,
  /// and subtle border outline (`#747775`).
  ///
  /// Recommended on dark or colorful backgrounds.
  white(
    PayButtonColors(
      backgroundColor: Color(0xFFFFFFFF),
      textColor: Color(0xFF3C4043),
      progressColor: Color(0xFF3C4043),
      borderColor: Color(0xFF747775),
      borderWidth: 1.0,
    ),
  );

  const GooglePayColor(this.palette);

  /// The resolved color palette for this Google Pay theme.
  final PayButtonColors palette;
}
