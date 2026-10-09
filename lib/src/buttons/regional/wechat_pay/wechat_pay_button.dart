import 'package:flutter/material.dart';

import '../../../base/pay_button.dart';
import '../../../base/pay_button_colors.dart';
import '../../../base/pay_button_fonts.dart';
import 'wechat_pay_assets.dart';
import 'wechat_pay_color.dart';
import 'wechat_pay_shape.dart';

/// A WeChat Pay payment button.
///
/// Rendered in pure Flutter using vector graphics with full accessibility semantics.
class WeChatPayButton extends PayButton {
  const WeChatPayButton({
    super.key,
    required super.onPressed,
    super.text,
    super.textStyle,
    super.fontFamily,
    super.fontFamilyFallback,
    super.isLoading,
    super.enabled,
    super.width,
    super.height = 48.0,
    super.borderRadius,
    super.margin,
    super.elevation,
    super.semanticLabel,
    super.variant = PayButtonVariant.responsive,
    super.textPosition = PayButtonTextPosition.leading,
    super.shape = WeChatPayShape.rounded,
    this.color = WeChatPayColor.green,
  });

  /// The brand color palette for the button. Defaults to [WeChatPayColor.green].
  final WeChatPayColor color;

  @override
  double get roundedBorderRadius => 6.0;

  @override
  List<String> get defaultFontFamilyFallback => PayButtonFonts.wechatPay;

  @override
  String? get semanticLabel => super.semanticLabel ?? 'WeChat Pay';

  @override
  PayButtonColors resolveColors(BuildContext context) => color.palette;

  @override
  Widget buildCompactContent(BuildContext context) {
    final markHeight = (height * 0.52).clamp(20.0, 30.0);
    return WeChatPayAssets.emblem(color: color, height: markHeight);
  }

  @override
  Widget buildMediumContent(BuildContext context) {
    final logoHeight = (height * 0.44).clamp(18.0, 24.0);
    return WeChatPayAssets.logo(color: color, height: logoHeight);
  }
}
