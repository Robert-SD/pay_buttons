import 'package:flutter/material.dart';

import '../../../base/pay_button_colors.dart';

/// Supported color themes for European Wero payment buttons.
enum WeroColor {
  /// Signature Wero Yellow (`#FFF48D`) background with dark typography and logo.
  ///
  /// This is Wero's primary high-recognition brand palette.
  yellow(
    PayButtonColors(
      backgroundColor: Color(0xFFFFF48D),
      textColor: Color(0xFF1D1C1C),
    ),
  ),

  /// Wero Black (`#1D1C1C`) background with crisp white typography and logo.
  black(
    PayButtonColors(
      backgroundColor: Color(0xFF1D1C1C),
      textColor: Colors.white,
    ),
  ),

  /// Pure White (`#FFFFFF`) background with subtle border and dark typography and logo.
  white(
    PayButtonColors(
      backgroundColor: Color(0xFFFFFFFF),
      borderColor: Color(0xFFD9D8DB),
      borderWidth: 1.0,
      textColor: Color(0xFF1D1C1C),
    ),
  );

  const WeroColor(this.palette);

  /// The resolved color palette for this Wero theme.
  final PayButtonColors palette;
}

