import 'package:flutter/material.dart';

import '../../../base/pay_button_colors.dart';

/// Supported color schemes for Bizum buttons.
enum BizumColor {
  /// Clean White (`#FFFFFF`) with border (`#D1D5DB`) and teal logo.
  white(
    PayButtonColors(
      backgroundColor: Color(0xFFFFFFFF),
      borderColor: Color(0xFFD1D5DB),
      borderWidth: 1.0,
      textColor: Color(0xFF004455),
      progressColor: Color(0xFF00B4B6),
    ),
  ),

  /// Bizum Teal (`#00B4B6`) with white text.
  teal(
    PayButtonColors(
      backgroundColor: Color(0xFF00B4B6),
      textColor: Colors.white,
    ),
  );

  const BizumColor(this.palette);

  /// The resolved color palette for this Bizum theme.
  final PayButtonColors palette;
}
