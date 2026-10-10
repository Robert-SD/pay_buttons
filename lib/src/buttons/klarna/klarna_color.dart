import 'package:flutter/material.dart';

import '../../base/pay_button_colors.dart';

/// Supported color themes for Klarna buttons adhering to official guidelines.
enum KlarnaColor {
  /// Iconic Klarna Pink (`#FFA8CD`) with deep charcoal text/logo (`#0B051D`).
  pink(
    PayButtonColors(
      backgroundColor: Color(0xFFFFA8CD),
      textColor: Color(0xFF0B051D),
    ),
  ),

  /// Deep charcoal / black (`#0B051D`) with white or pink logo.
  black(
    PayButtonColors(
      backgroundColor: Color(0xFF0B051D),
      textColor: Colors.white,
      progressColor: Color(0xFFFFA8CD),
    ),
  ),

  /// Clean white (`#FFFFFF`) with subtle border outline (`#E5E5E5`).
  white(
    PayButtonColors(
      backgroundColor: Color(0xFFFFFFFF),
      borderColor: Color(0xFFE5E5E5),
      borderWidth: 1.0,
      textColor: Color(0xFF0B051D),
    ),
  ),

  /// Friendly Klarna Off-White (`#F9F8F5`) with subtle border outline (`#E5E5E5`).
  offWhite(
    PayButtonColors(
      backgroundColor: Color(0xFFF9F8F5),
      borderColor: Color(0xFFE5E5E5),
      borderWidth: 1.0,
      textColor: Color(0xFF0B051D),
    ),
  );

  const KlarnaColor(this.palette);

  /// The resolved color palette for this Klarna theme.
  final PayButtonColors palette;
}
