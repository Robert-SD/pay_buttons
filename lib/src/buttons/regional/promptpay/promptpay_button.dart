import 'package:flutter/material.dart';

import '../../../base/pay_button.dart';
import '../../../base/pay_button_colors.dart';
import '../../../base/pay_button_fonts.dart';
import 'promptpay_assets.dart';
import 'promptpay_color.dart';
import 'promptpay_shape.dart';

/// A PromptPay (Thailand) payment button.
///
/// Rendered in pure Flutter using vector graphics with full accessibility semantics.
class PromptPayButton extends PayButton {
  const PromptPayButton({
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
    this.color = PromptPayColor.blue,
    this.shape = PromptPayShape.rounded,
  });

  /// The brand color palette for the button. Defaults to [PromptPayColor.blue].
  final PromptPayColor color;

  /// The contour shape of the button. Defaults to [PromptPayShape.rounded] (6.0 dp).
  final PromptPayShape shape;

  @override
  double get defaultBorderRadius =>
      shape == PromptPayShape.pill ? (height / 2) : 6.0;

  @override
  String? get semanticLabel => super.semanticLabel ?? 'PromptPay';

  @override
  PayButtonColors resolveColors(BuildContext context) {
    switch (color) {
      case PromptPayColor.blue:
        return const PayButtonColors(
          backgroundColor: Color(0xFF003D6B),
          progressColor: Color(0xFFFFFFFF),
          splashColor: Color(0x1FFFFFFF),
          highlightColor: Color(0x0FFFFFFF),
        );
      case PromptPayColor.white:
        return const PayButtonColors(
          backgroundColor: Color(0xFFFFFFFF),
          borderColor: Color(0xFFE0E0E0),
          borderWidth: 1.0,
          progressColor: Color(0xFF003D6B),
          splashColor: Color(0x1F003D6B),
          highlightColor: Color(0x0F003D6B),
        );
      case PromptPayColor.black:
        return const PayButtonColors(
          backgroundColor: Color(0xFF000000),
          progressColor: Color(0xFF003D6B),
          splashColor: Color(0x1FFFFFFF),
          highlightColor: Color(0x0FFFFFFF),
        );
    }
  }

  Color _resolveTextColor() {
    switch (color) {
      case PromptPayColor.blue:
      case PromptPayColor.black:
        return Colors.white;
      case PromptPayColor.white:
        return const Color(0xFF1A1A1A);
    }
  }

  @override
  Widget buildCompactContent(BuildContext context) {
    final markHeight = (height * 0.52).clamp(20.0, 30.0);
    return PromptPayAssets.emblem(color: color, height: markHeight);
  }

  @override
  Widget buildMediumContent(BuildContext context) {
    final logoHeight = (height * 0.46).clamp(18.0, 26.0);
    return PromptPayAssets.logo(color: color, height: logoHeight);
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
      defaultFontFamilyFallback: PayButtonFonts.promptpay,
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
