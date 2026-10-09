import 'package:flutter/material.dart';

import '../../../base/pay_button.dart';
import '../../../base/pay_button_colors.dart';
import '../../../base/pay_button_fonts.dart';
import 'paynow_assets.dart';
import 'paynow_color.dart';
import 'paynow_shape.dart';

/// A PayNow (Singapore) payment button.
///
/// Rendered in pure Flutter using vector graphics with full accessibility semantics.
class PayNowButton extends PayButton {
  const PayNowButton({
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
    this.color = PayNowColor.purple,
    this.shape = PayNowShape.rounded,
  });

  /// The brand color palette for the button. Defaults to [PayNowColor.purple].
  final PayNowColor color;

  /// The contour shape of the button. Defaults to [PayNowShape.rounded] (6.0 dp).
  final PayNowShape shape;

  @override
  double get defaultBorderRadius =>
      shape == PayNowShape.pill ? (height / 2) : 6.0;

  @override
  String? get semanticLabel => super.semanticLabel ?? 'PayNow';

  @override
  PayButtonColors resolveColors(BuildContext context) {
    switch (color) {
      case PayNowColor.purple:
        return const PayButtonColors(
          backgroundColor: Color(0xFF7D1978),
          progressColor: Color(0xFFFFFFFF),
          splashColor: Color(0x1FFFFFFF),
          highlightColor: Color(0x0FFFFFFF),
        );
      case PayNowColor.magenta:
        return const PayButtonColors(
          backgroundColor: Color(0xFFED0080),
          progressColor: Color(0xFFFFFFFF),
          splashColor: Color(0x1FFFFFFF),
          highlightColor: Color(0x0FFFFFFF),
        );
      case PayNowColor.white:
        return const PayButtonColors(
          backgroundColor: Color(0xFFFFFFFF),
          borderColor: Color(0xFFE0E0E0),
          borderWidth: 1.0,
          progressColor: Color(0xFF7D1978),
          splashColor: Color(0x1F7D1978),
          highlightColor: Color(0x0F7D1978),
        );
    }
  }

  Color _resolveTextColor() {
    switch (color) {
      case PayNowColor.purple:
      case PayNowColor.magenta:
        return Colors.white;
      case PayNowColor.white:
        return const Color(0xFF1A1A1A);
    }
  }

  @override
  Widget buildCompactContent(BuildContext context) {
    final markHeight = (height * 0.52).clamp(20.0, 30.0);
    return PayNowAssets.emblem(color: color, height: markHeight);
  }

  @override
  Widget buildMediumContent(BuildContext context) {
    final logoHeight = (height * 0.46).clamp(18.0, 26.0);
    return PayNowAssets.logo(color: color, height: logoHeight);
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
      defaultFontFamilyFallback: PayButtonFonts.paynow,
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
