import 'package:flutter/material.dart';

import '../../../base/pay_button.dart';
import '../../../base/pay_button_colors.dart';
import '../../../base/pay_button_fonts.dart';
import 'oxxo_assets.dart';
import 'oxxo_color.dart';
import 'oxxo_shape.dart';

/// An OXXO (Mexico) payment button.
///
/// Rendered in pure Flutter using vector graphics with full accessibility semantics.
class OxxoButton extends PayButton {
  const OxxoButton({
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
    this.color = OxxoColor.red,
    this.shape = OxxoShape.rounded,
  });

  /// The brand color palette for the button. Defaults to [OxxoColor.red].
  final OxxoColor color;

  /// The contour shape of the button. Defaults to [OxxoShape.rounded] (6.0 dp).
  final OxxoShape shape;

  @override
  double get defaultBorderRadius =>
      shape == OxxoShape.pill ? (height / 2) : 6.0;

  @override
  String? get semanticLabel => super.semanticLabel ?? 'OXXO';

  @override
  PayButtonColors resolveColors(BuildContext context) {
    switch (color) {
      case OxxoColor.red:
        return const PayButtonColors(
          backgroundColor: Color(0xFFE70020),
          progressColor: Color(0xFFFFFFFF),
          splashColor: Color(0x1FFFFFFF),
          highlightColor: Color(0x0FFFFFFF),
        );
      case OxxoColor.white:
        return const PayButtonColors(
          backgroundColor: Color(0xFFFFFFFF),
          borderColor: Color(0xFFE0E0E0),
          borderWidth: 1.0,
          progressColor: Color(0xFFE70020),
          splashColor: Color(0x1FE70020),
          highlightColor: Color(0x0FE70020),
        );
      case OxxoColor.yellow:
        return const PayButtonColors(
          backgroundColor: Color(0xFFFBB110),
          progressColor: Color(0xFFE70020),
          splashColor: Color(0x1FE70020),
          highlightColor: Color(0x0FE70020),
        );
    }
  }

  Color _resolveTextColor() {
    switch (color) {
      case OxxoColor.red:
        return Colors.white;
      case OxxoColor.white:
        return const Color(0xFFE70020);
      case OxxoColor.yellow:
        return const Color(0xFFE70020);
    }
  }

  @override
  Widget buildCompactContent(BuildContext context) {
    final markHeight = (height * 0.44).clamp(18.0, 24.0);
    return OxxoAssets.oMark(color: color, height: markHeight);
  }

  @override
  Widget buildMediumContent(BuildContext context) {
    final logoHeight = (height * 0.52).clamp(22.0, 30.0);
    return OxxoAssets.logo(color: color, height: logoHeight);
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
      fontWeight: FontWeight.w700,
      letterSpacing: -0.1,
      defaultFontFamilyFallback: PayButtonFonts.oxxo,
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
