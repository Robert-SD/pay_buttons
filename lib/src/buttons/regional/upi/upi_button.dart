import 'package:flutter/material.dart';

import '../../../base/pay_button.dart';
import '../../../base/pay_button_colors.dart';
import '../../../base/pay_button_fonts.dart';
import 'upi_assets.dart';
import 'upi_color.dart';
import 'upi_shape.dart';

/// A brand-compliant UPI (India, Unified Payments Interface) payment button.
///
/// Rendered in pure Flutter using vector graphics with full accessibility semantics.
class UpiButton extends PayButton {
  const UpiButton({
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
    this.color = UpiColor.white,
    this.shape = UpiShape.rounded,
  });

  /// The brand color palette for the button. Defaults to [UpiColor.white].
  final UpiColor color;

  /// The contour shape of the button. Defaults to [UpiShape.rounded] (6.0 dp).
  final UpiShape shape;

  @override
  double get defaultBorderRadius => shape == UpiShape.pill ? (height / 2) : 6.0;

  @override
  String? get semanticLabel => super.semanticLabel ?? 'UPI';

  @override
  PayButtonColors resolveColors(BuildContext context) {
    switch (color) {
      case UpiColor.white:
        return const PayButtonColors(
          backgroundColor: Color(0xFFFFFFFF),
          borderColor: Color(0xFFE0E0E0),
          borderWidth: 1.0,
          progressColor: Color(0xFFF47920),
          splashColor: Color(0x1F000000),
          highlightColor: Color(0x0A000000),
        );
      case UpiColor.black:
        return const PayButtonColors(
          backgroundColor: Color(0xFF000000),
          progressColor: Color(0xFFF47920),
          splashColor: Color(0x1FFFFFFF),
          highlightColor: Color(0x0FFFFFFF),
        );
      case UpiColor.orange:
        return const PayButtonColors(
          backgroundColor: Color(0xFFF47920),
          progressColor: Color(0xFFFFFFFF),
          splashColor: Color(0x1FFFFFFF),
          highlightColor: Color(0x0FFFFFFF),
        );
      case UpiColor.navy:
        return const PayButtonColors(
          backgroundColor: Color(0xFF0B2545),
          progressColor: Color(0xFFF47920),
          splashColor: Color(0x1FFFFFFF),
          highlightColor: Color(0x0FFFFFFF),
        );
    }
  }

  Color _resolveTextColor() {
    switch (color) {
      case UpiColor.white:
        return const Color(0xFF1A1A1A);
      case UpiColor.black:
      case UpiColor.orange:
      case UpiColor.navy:
        return Colors.white;
    }
  }

  @override
  Widget buildCompactContent(BuildContext context) {
    final markHeight = (height * 0.52).clamp(20.0, 30.0);
    return UpiAssets.emblem(color: color, height: markHeight);
  }

  @override
  Widget buildMediumContent(BuildContext context) {
    final logoHeight = (height * 0.44).clamp(18.0, 26.0);
    return UpiAssets.logo(color: color, height: logoHeight);
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
      defaultFontFamilyFallback: PayButtonFonts.upi,
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
