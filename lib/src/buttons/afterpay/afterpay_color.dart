import 'package:flutter/material.dart';

import '../../base/pay_button_colors.dart';

/// Supported color themes for Afterpay / Clearpay buttons.
enum AfterpayColor {
  /// Signature Bondi Mint (`#B2FCE4`) with black text/badge.
  mint(
    PayButtonColors(
      backgroundColor: Color(0xFFB2FCE4),
      textColor: Color(0xFF000000),
    ),
  ),

  /// High-contrast Black (`#000000`) with Bondi Mint badge.
  black(
    PayButtonColors(
      backgroundColor: Color(0xFF000000),
      textColor: Colors.white,
      progressColor: Color(0xFFB2FCE4),
      disabledBackgroundColor: Color(0xFF2C2C2E),
      disabledTextColor: Color(0xFF8E8E93),
      disabledProgressColor: Color(0xFF636366),
    ),
  ),

  /// Clean White (`#FFFFFF`) with subtle border (`#D1D5DB`).
  white(
    PayButtonColors(
      backgroundColor: Color(0xFFFFFFFF),
      borderColor: Color(0xFFD1D5DB),
      borderWidth: 1.0,
      textColor: Color(0xFF000000),
    ),
  );

  const AfterpayColor(this.palette);

  /// The resolved color palette for this Afterpay theme.
  final PayButtonColors palette;
}
