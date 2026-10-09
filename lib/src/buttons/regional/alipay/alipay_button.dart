import 'package:flutter/material.dart';

import '../../../base/pay_button.dart';
import '../../../base/pay_button_colors.dart';
import '../../../base/pay_button_fonts.dart';
import 'alipay_assets.dart';
import 'alipay_color.dart';
import 'alipay_shape.dart';

/// An Alipay payment button.
///
/// Rendered in pure Flutter using vector graphics with full accessibility semantics.
class AlipayButton extends PayButton {
  const AlipayButton({
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
    this.color = AlipayColor.blue,
    this.shape = AlipayShape.rounded,
  });

  /// The brand color palette for the button. Defaults to [AlipayColor.blue].
  final AlipayColor color;

  /// The contour shape of the button. Defaults to [AlipayShape.rounded] (6.0 dp).
  final AlipayShape shape;

  @override
  double get defaultBorderRadius =>
      shape == AlipayShape.pill ? (height / 2) : 6.0;

  @override
  String? get semanticLabel => super.semanticLabel ?? 'Alipay';

  @override
  PayButtonColors resolveColors(BuildContext context) {
    switch (color) {
      case AlipayColor.blue:
        return const PayButtonColors(
          backgroundColor: Color(0xFF1677FF),
          progressColor: Color(0xFFFFFFFF),
          splashColor: Color(0x1FFFFFFF),
          highlightColor: Color(0x0FFFFFFF),
        );
      case AlipayColor.white:
        return const PayButtonColors(
          backgroundColor: Color(0xFFFFFFFF),
          borderColor: Color(0xFFE0E0E0),
          borderWidth: 1.0,
          progressColor: Color(0xFF1677FF),
          splashColor: Color(0x1F1677FF),
          highlightColor: Color(0x0F1677FF),
        );
      case AlipayColor.black:
        return const PayButtonColors(
          backgroundColor: Color(0xFF000000),
          progressColor: Color(0xFF1677FF),
          splashColor: Color(0x1FFFFFFF),
          highlightColor: Color(0x0FFFFFFF),
        );
    }
  }

  Color _resolveTextColor() {
    switch (color) {
      case AlipayColor.blue:
      case AlipayColor.black:
        return Colors.white;
      case AlipayColor.white:
        return const Color(0xFF1A1A1A);
    }
  }

  @override
  Widget buildCompactContent(BuildContext context) {
    final markHeight = (height * 0.52).clamp(20.0, 30.0);
    return AlipayAssets.emblem(color: color, height: markHeight);
  }

  @override
  Widget buildMediumContent(BuildContext context) {
    final logoHeight = (height * 0.46).clamp(18.0, 26.0);
    return AlipayAssets.logo(color: color, height: logoHeight);
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
      defaultFontFamilyFallback: PayButtonFonts.alipay,
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
