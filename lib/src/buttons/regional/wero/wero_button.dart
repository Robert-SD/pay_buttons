import 'package:flutter/material.dart';

import '../../../base/pay_button.dart';
import '../../../base/pay_button_colors.dart';
import '../../../base/pay_button_fonts.dart';
import 'wero_assets.dart';
import 'wero_color.dart';
import 'wero_shape.dart';

/// A Wero (European Payments Initiative) payment button.
///
/// Rendered in pure Flutter using vector graphics with full accessibility semantics.
class WeroButton extends PayButton {
  const WeroButton({
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
    this.color = WeroColor.yellow,
    this.shape = WeroShape.rounded,
  });

  /// The brand color palette for the button. Defaults to [WeroColor.yellow].
  final WeroColor color;

  /// The contour shape of the button. Defaults to [WeroShape.rounded] (6.0 dp).
  final WeroShape shape;

  @override
  double get defaultBorderRadius =>
      shape == WeroShape.pill ? (height / 2) : 6.0;

  @override
  String? get semanticLabel => super.semanticLabel ?? 'Wero';

  @override
  PayButtonColors resolveColors(BuildContext context) {
    switch (color) {
      case WeroColor.yellow:
        return const PayButtonColors(
          backgroundColor: Color(0xFFFFF48D),
          progressColor: Color(0xFF1D1C1C),
          splashColor: Color(0x1F1D1C1C),
          highlightColor: Color(0x0F1D1C1C),
        );
      case WeroColor.black:
        return const PayButtonColors(
          backgroundColor: Color(0xFF1D1C1C),
          progressColor: Color(0xFFFFFFFF),
          splashColor: Color(0x1FFFFFFF),
          highlightColor: Color(0x0FFFFFFF),
        );
      case WeroColor.white:
        return const PayButtonColors(
          backgroundColor: Color(0xFFFFFFFF),
          borderColor: Color(0xFFD9D8DB),
          borderWidth: 1.0,
          progressColor: Color(0xFF1D1C1C),
          splashColor: Color(0x1F1D1C1C),
          highlightColor: Color(0x0F1D1C1C),
        );
    }
  }

  @override
  Widget buildCompactContent(BuildContext context) {
    final markHeight = (height * 0.44).clamp(18.0, 24.0);
    return WeroAssets.wMark(color: color, height: markHeight);
  }

  @override
  Widget buildMediumContent(BuildContext context) {
    final logoHeight = (height * 0.44).clamp(18.0, 26.0);
    return WeroAssets.logo(color: color, height: logoHeight);
  }

  @override
  Widget buildFullContent(BuildContext context) {
    final logoWidget = buildMediumContent(context);

    if (text == null || text!.isEmpty) {
      return logoWidget;
    }

    final textColor = color == WeroColor.black
        ? const Color(0xFFFFFFFF)
        : const Color(0xFF1D1C1C);

    final effectiveTextStyle = resolveTextStyle(
      textColor: textColor,
      fontSize: (height * 0.31).clamp(13.0, 16.0),
      fontWeight: FontWeight.w600,
      letterSpacing: -0.1,
      defaultFontFamilyFallback: PayButtonFonts.wero,
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
