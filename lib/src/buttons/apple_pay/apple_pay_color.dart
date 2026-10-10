import 'package:flutter/material.dart';

import '../../base/pay_button_colors.dart';

/// Supported color themes for Apple Pay buttons adhering to official Human Interface Guidelines.
enum ApplePayColor {
  /// Black (`#000000`) background with white Apple Pay mark and text.
  ///
  /// Recommended on white or light backgrounds.
  black(
    PayButtonColors(
      backgroundColor: Color(0xFF000000),
      textColor: Color(0xFFFFFFFF),
      progressColor: Color(0xFFFFFFFF),
    ),
  ),

  /// White (`#FFFFFF`) background with black Apple Pay mark and text.
  ///
  /// Recommended on dark backgrounds that provide sufficient contrast.
  white(
    PayButtonColors(
      backgroundColor: Color(0xFFFFFFFF),
      textColor: Color(0xFF000000),
      progressColor: Color(0xFF000000),
    ),
  ),

  /// White (`#FFFFFF`) background with black Apple Pay mark, text, and 1px border outline (`#000000`).
  ///
  /// Recommended on white or light backgrounds when a white button is desired.
  whiteOutline(
    PayButtonColors(
      backgroundColor: Color(0xFFFFFFFF),
      textColor: Color(0xFF000000),
      progressColor: Color(0xFF000000),
      borderColor: Color(0xFF000000),
      borderWidth: 1.0,
    ),
  );

  const ApplePayColor(this.palette);

  /// The resolved color palette for this Apple Pay theme.
  final PayButtonColors palette;
}
