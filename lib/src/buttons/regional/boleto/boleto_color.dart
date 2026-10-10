import 'package:flutter/material.dart';

import '../../../base/pay_button_colors.dart';

/// Supported color themes for Boleto Bancário payment buttons.
enum BoletoColor {
  /// Clean White (`#FFFFFF`) with border (`#E0E0E0`) - standard e-commerce presentation.
  white(
    PayButtonColors(
      backgroundColor: Color(0xFFFFFFFF),
      borderColor: Color(0xFFE0E0E0),
      borderWidth: 1.0,
      textColor: Color(0xFF1A1A1A),
    ),
  ),

  /// Deep Charcoal Black (`#1A1A1A`) for high contrast or dark mode checkouts.
  black(
    PayButtonColors(
      backgroundColor: Color(0xFF1A1A1A),
      textColor: Colors.white,
    ),
  ),

  /// Subtle Banking Gray (`#F5F5F7`) with border (`#D2D2D7`).
  lightGray(
    PayButtonColors(
      backgroundColor: Color(0xFFF5F5F7),
      borderColor: Color(0xFFD2D2D7),
      borderWidth: 1.0,
      textColor: Color(0xFF1A1A1A),
    ),
  );

  const BoletoColor(this.palette);

  /// The resolved color palette for this Boleto theme.
  final PayButtonColors palette;
}
