import 'package:flutter/material.dart';

import '../../../base/brand_color.dart';
import '../../../base/pay_button_colors.dart';

/// Supported color themes for Alipay payment buttons adhering to brand guidelines.
enum AlipayColor implements BrandColor {
  /// Signature Alipay Blue (`#1677FF`) background with white typography and emblem.
  blue(
    PayButtonColors(
      backgroundColor: Color(0xFF1677FF),
      textColor: Colors.white,
    ),
  ),

  /// Clean White (`#FFFFFF`) background with border (`#E0E0E0`) and `#1677FF` emblem.
  white(
    PayButtonColors(
      backgroundColor: Color(0xFFFFFFFF),
      borderColor: Color(0xFFE0E0E0),
      borderWidth: 1.0,
      textColor: Color(0xFF1A1A1A),
      progressColor: Color(0xFF1677FF),
    ),
  ),

  /// Deep Black (`#000000`) for high-contrast or dark mode checkouts.
  ///
  /// Note: Official Ant Group Alipay brand guidelines specify blue or white
  /// themes for checkout acceptance buttons.
  @Deprecated(
    'Brand guidelines authorize only primary blue and white themes for checkout buttons.',
  )
  black(
    PayButtonColors(
      backgroundColor: Color(0xFF000000),
      textColor: Colors.white,
      progressColor: Color(0xFF1677FF),
    ),
  );

  const AlipayColor(this.palette);

  /// The resolved color palette for this Alipay theme.
  @override
  final PayButtonColors palette;
}
