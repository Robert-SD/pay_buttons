import 'package:flutter/material.dart';

import '../../../base/pay_button_colors.dart';

/// Supported color schemes for Bancontact buttons.
enum BancontactColor {
  /// Clean White (`#FFFFFF`) with border (`#E0E0E0`) - Signature Bancontact presentation.
  white(
    PayButtonColors(
      backgroundColor: Color(0xFFFFFFFF),
      borderColor: Color(0xFFD1D5DB),
      borderWidth: 1.0,
      textColor: Color(0xFF1E3764),
      progressColor: Color(0xFF005AB9),
    ),
  ),

  /// Deep Navy Blue (`#002D62`) for dark/contrast checkout.
  blue(
    PayButtonColors(
      backgroundColor: Color(0xFF002D62),
      textColor: Colors.white,
      progressColor: Color(0xFFFFD800),
    ),
  );

  const BancontactColor(this.palette);

  /// The resolved color palette for this Bancontact theme.
  final PayButtonColors palette;
}
