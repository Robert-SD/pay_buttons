import 'package:flutter/material.dart';

import '../../../base/brand_color.dart';
import '../../../base/pay_button_colors.dart';

/// Supported color schemes for BLIK buttons.
enum BlikColor implements BrandColor {
  /// Dark / Black (`#000000`) background - BLIK's high-contrast theme.
  black(
    PayButtonColors(
      backgroundColor: Color(0xFF000000),
      textColor: Colors.white,
      progressColor: Color(0xFFE52F08),
    ),
  ),

  /// Clean White (`#FFFFFF`) with border (`#E0E0E0`).
  white(
    PayButtonColors(
      backgroundColor: Color(0xFFFFFFFF),
      borderColor: Color(0xFFE0E0E0),
      borderWidth: 1.0,
      textColor: Color(0xFF000000),
      progressColor: Color(0xFFE52F08),
    ),
  );

  const BlikColor(this.palette);

  @override
  final PayButtonColors palette;
}
