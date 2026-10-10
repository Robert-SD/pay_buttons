import 'package:flutter/material.dart';

import '../../../base/brand_color.dart';
import '../../../base/pay_button_colors.dart';

/// Supported color themes for UPI payment buttons adhering to NPCI brand guidelines.
enum UpiColor implements BrandColor {
  /// Clean White (`#FFFFFF`) card with subtle border, dark lettering, and official saffron/green arrows.
  white(
    PayButtonColors(
      backgroundColor: Color(0xFFFFFFFF),
      borderColor: Color(0xFFE0E0E0),
      borderWidth: 1.0,
      textColor: Color(0xFF1A1A1A),
      progressColor: Color(0xFFF47920),
    ),
  ),

  /// Deep Black (`#000000`) for high-contrast or dark mode checkouts.
  black(
    PayButtonColors(
      backgroundColor: Color(0xFF000000),
      textColor: Colors.white,
      progressColor: Color(0xFFF47920),
    ),
  ),

  /// Vibrant Saffron / Orange (`#F47920`) with white typography.
  orange(
    PayButtonColors(
      backgroundColor: Color(0xFFF47920),
      textColor: Colors.white,
    ),
  ),

  /// Corporate Navy Blue (`#0B2545`) with white typography.
  navy(
    PayButtonColors(
      backgroundColor: Color(0xFF0B2545),
      textColor: Colors.white,
      progressColor: Color(0xFFF47920),
    ),
  );

  const UpiColor(this.palette);

  /// The resolved color palette for this UPI theme.
  @override
  final PayButtonColors palette;
}
