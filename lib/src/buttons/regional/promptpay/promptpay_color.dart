import 'package:flutter/material.dart';

import '../../../base/pay_button_colors.dart';

/// Supported color themes for PromptPay payment buttons adhering to Bank of Thailand guidelines.
enum PromptPayColor {
  /// Signature PromptPay Deep Blue (`#003D6B`) background with white typography and emblem.
  blue(
    PayButtonColors(
      backgroundColor: Color(0xFF003D6B),
      textColor: Colors.white,
    ),
  ),

  /// Clean White (`#FFFFFF`) background with border (`#E0E0E0`) and `#003D6B` emblem.
  white(
    PayButtonColors(
      backgroundColor: Color(0xFFFFFFFF),
      borderColor: Color(0xFFE0E0E0),
      borderWidth: 1.0,
      textColor: Color(0xFF1A1A1A),
      progressColor: Color(0xFF003D6B),
    ),
  ),

  /// Deep Black (`#000000`) for high-contrast or dark mode checkouts.
  black(
    PayButtonColors(
      backgroundColor: Color(0xFF000000),
      textColor: Colors.white,
      progressColor: Color(0xFF003D6B),
      disabledBackgroundColor: Color(0xFF2C2C2E),
      disabledTextColor: Color(0xFF8E8E93),
      disabledProgressColor: Color(0xFF636366),
    ),
  );

  const PromptPayColor(this.palette);

  /// The resolved color palette for this PromptPay theme.
  final PayButtonColors palette;
}
