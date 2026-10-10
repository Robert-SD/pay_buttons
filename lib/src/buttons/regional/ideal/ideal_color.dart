import 'package:flutter/material.dart';

import '../../../base/brand_color.dart';
import '../../../base/pay_button_colors.dart';

/// Supported color themes for Dutch iDEAL / Wero transition buttons.
///
/// Follows the official Currence iDEAL / EPI migration guidelines:
/// https://ideal.nl/naar-wero
enum IdealColor implements BrandColor {
  /// Signature Wero Yellow (`#FFF48D`) background with dark branding and typography.
  ///
  /// This is the primary transition palette recommended by Currence iDEAL / EPI.
  yellow(
    PayButtonColors(
      backgroundColor: Color(0xFFFFF48D),
      textColor: Color(0xFF1D1C1C),
    ),
  ),

  /// Dark / Wero Black (`#1D1C1C`) background with crisp white branding and typography.
  black(
    PayButtonColors(
      backgroundColor: Color(0xFF1D1C1C),
      textColor: Colors.white,
      progressColor: Color(0xFFFFF48D),
    ),
  ),

  /// Clean White (`#FFFFFF`) background with dark branding and subtle border (`#D1D5DB`).
  white(
    PayButtonColors(
      backgroundColor: Color(0xFFFFFFFF),
      borderColor: Color(0xFFD1D5DB),
      borderWidth: 1.0,
      textColor: Color(0xFF1D1C1C),
      progressColor: Color(0xFFCC0066),
    ),
  ),

  /// Light Gray (`#F5F5F5`) for subtle contrast on white backgrounds.
  lightGray(
    PayButtonColors(
      backgroundColor: Color(0xFFF5F5F5),
      borderColor: Color(0xFFE0E0E0),
      borderWidth: 1.0,
      textColor: Color(0xFF1D1C1C),
      progressColor: Color(0xFFCC0066),
    ),
  );

  const IdealColor(this.palette);

  /// The resolved color palette for this iDEAL theme.
  @override
  final PayButtonColors palette;
}
