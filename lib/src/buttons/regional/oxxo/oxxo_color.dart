import 'package:flutter/material.dart';

import '../../../base/brand_color.dart';
import '../../../base/pay_button_colors.dart';

/// Supported color themes for OXXO payment buttons adhering to official FEMSA / OXXO guidelines.
enum OxxoColor implements BrandColor {
  /// Signature OXXO Red (`#E70020`) with white border / emblem.
  red(
    PayButtonColors(
      backgroundColor: Color(0xFFE70020),
      textColor: Colors.white,
    ),
  ),

  /// Clean White (`#FFFFFF`) with subtle border (`#E0E0E0`) and full brand logo.
  white(
    PayButtonColors(
      backgroundColor: Color(0xFFFFFFFF),
      borderColor: Color(0xFFE0E0E0),
      borderWidth: 1.0,
      textColor: Color(0xFFE70020),
      progressColor: Color(0xFFE70020),
    ),
  ),

  /// Signature OXXO Yellow (`#FBB110`) with red logo.
  yellow(
    PayButtonColors(
      backgroundColor: Color(0xFFFBB110),
      textColor: Color(0xFFE70020),
      progressColor: Color(0xFFE70020),
    ),
  );

  const OxxoColor(this.palette);

  /// The resolved color palette for this OXXO theme.
  @override
  final PayButtonColors palette;
}
