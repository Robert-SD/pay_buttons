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
    this.color,
  });

  /// The brand color palette for the button.
  ///
  /// When null, resolves automatically based on [Theme.of(context).brightness]:
  /// [WeChatPayColor.green] in light mode, [WeChatPayColor.white] in dark mode.
  final WeChatPayColor? color;

  /// Resolves the effective color scheme for the given [context].
  WeChatPayColor effectiveColor(BuildContext context) {
    if (color != null) return color!;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? WeChatPayColor.white : WeChatPayColor.green;
  }

  @override
  double get roundedBorderRadius => 6.0;

  @override
  List<String> get defaultFontFamilyFallback => PayButtonFonts.wechatPay;

  @override
  String? get semanticLabel => super.semanticLabel ?? 'WeChat Pay';

  @override
  PayButtonColors resolveColors(BuildContext context) =>
      effectiveColor(context).palette;

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
