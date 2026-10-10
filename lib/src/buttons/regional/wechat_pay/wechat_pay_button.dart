import 'package:flutter/material.dart';

import '../../../base/pay_button.dart';
import '../../../base/pay_button_fonts.dart';
import 'wechat_pay_assets.dart';
import 'wechat_pay_color.dart';
import 'wechat_pay_shape.dart';

/// A WeChat Pay payment button.
///
/// Rendered in pure Flutter using vector graphics with full accessibility semantics.
class WeChatPayButton extends BrandPayButton<WeChatPayColor> {
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
    super.color,
  });

  @override
  WeChatPayColor get defaultLightColor => WeChatPayColor.green;

  @override
  WeChatPayColor get defaultDarkColor => WeChatPayColor.white;

  @override
  double get roundedBorderRadius => 6.0;

  @override
  List<String> get defaultFontFamilyFallback => PayButtonFonts.wechatPay;

  @override
  String get defaultSemanticLabel => 'WeChat Pay';

  @override
  double get compactMarkHeight => (height * 0.52).clamp(20.0, 30.0);

  @override
  Widget buildCompactContent(BuildContext context) {
    return WeChatPayAssets.emblem(
      color: effectiveColor(context),
      height: compactMarkHeight,
    );
  }

  @override
  Widget buildMediumContent(BuildContext context) {
    return WeChatPayAssets.logo(
      color: effectiveColor(context),
      height: mediumLogoHeight,
    );
  }
}
