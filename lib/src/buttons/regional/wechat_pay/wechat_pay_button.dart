import 'package:flutter/material.dart';

import '../../../base/pay_button.dart';
import '../../../base/pay_button_colors.dart';
import '../../../base/pay_button_fonts.dart';
import 'wechat_pay_assets.dart';
import 'wechat_pay_color.dart';
import 'wechat_pay_shape.dart';

/// A brand-compliant WeChat Pay payment button.
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
    this.color = WeChatPayColor.green,
    this.shape = WeChatPayShape.rounded,
  });

  /// The brand color palette for the button. Defaults to [WeChatPayColor.green].
  final WeChatPayColor color;

  /// The contour shape of the button. Defaults to [WeChatPayShape.rounded] (6.0 dp).
  final WeChatPayShape shape;

  @override
  double get defaultBorderRadius =>
      shape == WeChatPayShape.pill ? (height / 2) : 6.0;

  @override
  String? get semanticLabel => super.semanticLabel ?? 'WeChat Pay';

  @override
  PayButtonColors resolveColors(BuildContext context) {
    switch (color) {
      case WeChatPayColor.green:
        return const PayButtonColors(
          backgroundColor: Color(0xFF07C160),
          progressColor: Color(0xFFFFFFFF),
          splashColor: Color(0x1FFFFFFF),
          highlightColor: Color(0x0FFFFFFF),
        );
      case WeChatPayColor.white:
        return const PayButtonColors(
          backgroundColor: Color(0xFFFFFFFF),
          borderColor: Color(0xFFE0E0E0),
          borderWidth: 1.0,
          progressColor: Color(0xFF07C160),
          splashColor: Color(0x1F07C160),
          highlightColor: Color(0x0F07C160),
        );
      case WeChatPayColor.black:
        return const PayButtonColors(
          backgroundColor: Color(0xFF000000),
          progressColor: Color(0xFF07C160),
          splashColor: Color(0x1FFFFFFF),
          highlightColor: Color(0x0FFFFFFF),
        );
    }
  }

  Color _resolveTextColor() {
    switch (color) {
      case WeChatPayColor.green:
      case WeChatPayColor.black:
        return Colors.white;
      case WeChatPayColor.white:
        return const Color(0xFF1A1A1A);
    }
  }

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

  @override
  Widget buildFullContent(BuildContext context) {
    final logoWidget = buildMediumContent(context);

    if (text == null || text!.isEmpty) {
      return logoWidget;
    }

    final textColor = _resolveTextColor();
    final effectiveTextStyle = resolveTextStyle(
      textColor: textColor,
      fontSize: (height * 0.31).clamp(13.0, 16.0),
      fontWeight: FontWeight.w600,
      letterSpacing: -0.1,
      defaultFontFamilyFallback: PayButtonFonts.wechatPay,
    );

    final textWidget = Flexible(
      child: Text(
        text!,
        style: effectiveTextStyle,
        overflow: TextOverflow.ellipsis,
      ),
    );

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: textPosition == PayButtonTextPosition.trailing
          ? [logoWidget, const SizedBox(width: 8), textWidget]
          : [textWidget, const SizedBox(width: 8), logoWidget],
    );
  }
}
