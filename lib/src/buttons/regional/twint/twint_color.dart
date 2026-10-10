import 'package:flutter/material.dart';

import '../../../base/pay_button_colors.dart';

/// Supported color schemes for TWINT buttons.
enum TwintColor {
  /// Sleek Black (`#000000`) background with TWINT logo.
  black(
    PayButtonColors(
      backgroundColor: Color(0xFF000000),
      textColor: Colors.white,
      disabledBackgroundColor: Color(0xFF2C2C2E),
      disabledTextColor: Color(0xFF8E8E93),
      disabledProgressColor: Color(0xFF636366),
    ),
  ),

  /// Clean White (`#FFFFFF`) with border (`#E0E0E0`).
  white(
    PayButtonColors(
      backgroundColor: Color(0xFFFFFFFF),
      borderColor: Color(0xFFE0E0E0),
      borderWidth: 1.0,
      textColor: Color(0xFF000000),
    ),
  );

  const TwintColor(this.palette);

  /// The resolved color palette for this TWINT theme.
  final PayButtonColors palette;
}
