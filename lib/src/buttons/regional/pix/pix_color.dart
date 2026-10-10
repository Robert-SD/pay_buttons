import 'package:flutter/material.dart';

import '../../../base/brand_color.dart';
import '../../../base/pay_button_colors.dart';

/// Supported color themes for Pix payment buttons adhering to Banco Central do Brasil guidelines.
enum PixColor implements BrandColor {
  /// Signature Pix Teal (`#32BCAD`) background with white typography and emblem.
  teal(
    PayButtonColors(
      backgroundColor: Color(0xFF32BCAD),
      textColor: Colors.white,
    ),
  ),

  /// Clean White (`#FFFFFF`) with border (`#E0E0E0`) and `#32BCAD` emblem.
  white(
    PayButtonColors(
      backgroundColor: Color(0xFFFFFFFF),
      borderColor: Color(0xFFE0E0E0),
      borderWidth: 1.0,
      textColor: Color(0xFF3C3C3B),
      progressColor: Color(0xFF32BCAD),
    ),
  ),

  /// Deep Black (`#000000`) for high contrast or dark mode checkouts.
  black(
    PayButtonColors(
      backgroundColor: Color(0xFF000000),
      textColor: Colors.white,
      progressColor: Color(0xFF32BCAD),
    ),
  );

  const PixColor(this.palette);

  /// The resolved color palette for this Pix theme.
  @override
  final PayButtonColors palette;
}
