import 'package:flutter/material.dart';

import '../../../base/pay_button_colors.dart';

/// Supported color themes for WeChat Pay buttons adhering to brand guidelines.
enum WeChatPayColor {
  /// Signature WeChat Pay Green (`#07C160`) background with white typography and emblem.
  green(
    PayButtonColors(
      backgroundColor: Color(0xFF07C160),
      textColor: Colors.white,
    ),
  ),

  /// Clean White (`#FFFFFF`) background with border (`#E0E0E0`) and `#07C160` emblem.
  white(
    PayButtonColors(
      backgroundColor: Color(0xFFFFFFFF),
      borderColor: Color(0xFFE0E0E0),
      borderWidth: 1.0,
      textColor: Color(0xFF1A1A1A),
      progressColor: Color(0xFF07C160),
    ),
  ),

  /// Deep Black (`#000000`) for high-contrast or dark mode checkouts.
  ///
  /// Note: Official Tencent WeChat Pay brand guidelines specify green or white
  /// themes for checkout acceptance buttons.
  @Deprecated(
    'Brand guidelines authorize only primary green and white themes for checkout buttons.',
  )
  black(
    PayButtonColors(
      backgroundColor: Color(0xFF000000),
      textColor: Colors.white,
      progressColor: Color(0xFF07C160),
      disabledBackgroundColor: Color(0xFF2C2C2E),
      disabledTextColor: Color(0xFF8E8E93),
      disabledProgressColor: Color(0xFF636366),
    ),
  );

  const WeChatPayColor(this.palette);

  /// The resolved color palette for this WeChat Pay theme.
  final PayButtonColors palette;
}
