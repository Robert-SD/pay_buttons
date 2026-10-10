import 'package:flutter/material.dart';

import '../../../base/brand_color.dart';
import '../../../base/pay_button_colors.dart';

/// Supported color themes for PayNow payment buttons adhering to ABS guidelines.
enum PayNowColor implements BrandColor {
  /// Signature PayNow Deep Purple (`#7D1978`) background with white typography and emblem.
  purple(
    PayButtonColors(
      backgroundColor: Color(0xFF7D1978),
      textColor: Colors.white,
    ),
  ),

  /// Vibrant PayNow Magenta (`#ED0080`) background with white typography and emblem.
  magenta(
    PayButtonColors(
      backgroundColor: Color(0xFFED0080),
      textColor: Colors.white,
    ),
  ),

  /// Clean White (`#FFFFFF`) background with border (`#E0E0E0`) and `#7D1978` emblem.
  white(
    PayButtonColors(
      backgroundColor: Color(0xFFFFFFFF),
      borderColor: Color(0xFFE0E0E0),
      borderWidth: 1.0,
      textColor: Color(0xFF1A1A1A),
      progressColor: Color(0xFF7D1978),
    ),
  );

  const PayNowColor(this.palette);

  /// The resolved color palette for this PayNow theme.
  @override
  final PayButtonColors palette;
}
