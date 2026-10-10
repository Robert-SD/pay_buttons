import 'package:flutter/material.dart';

import '../../base/brand_color.dart';
import '../../base/pay_button_colors.dart';

/// Supported color themes for the PayPal button adhering to official guidelines.
enum PayPalColor implements BrandColor {
  /// Gold (`#FFC439`) - The standard, most recognizable PayPal brand color.
  gold(
    PayButtonColors(
      backgroundColor: Color(0xFFFFC439),
      textColor: Color(0xFF003087),
    ),
  ),

  /// Blue (`#0070BA`) - An alternative primary color for light backgrounds.
  blue(
    PayButtonColors(
      backgroundColor: Color(0xFF0070BA),
      textColor: Colors.white,
    ),
  ),

  /// Black (`#000000`) - For dark mode or high-contrast checkouts.
  black(
    PayButtonColors(
      backgroundColor: Color(0xFF000000),
      textColor: Colors.white,
    ),
  ),

  /// White (`#FFFFFF`) - A clean variant with a subtle border outline.
  white(
    PayButtonColors(
      backgroundColor: Color(0xFFFFFFFF),
      borderColor: Color(0xFFD6D6D6),
      borderWidth: 1.0,
      textColor: Color(0xFF003087),
    ),
  ),

  /// Silver (`#EEEEEE`) - A muted light-gray variant.
  silver(
    PayButtonColors(
      backgroundColor: Color(0xFFEEEEEE),
      borderColor: Color(0xFFE0E0E0),
      borderWidth: 1.0,
      textColor: Color(0xFF003087),
    ),
  );

  const PayPalColor(this.palette);

  /// The resolved color palette for this PayPal theme.
  @override
  final PayButtonColors palette;
}
