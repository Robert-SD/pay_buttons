import 'package:flutter/material.dart';

import '../../../base/pay_button.dart';
import '../../../base/pay_button_colors.dart';
import '../../../base/pay_button_fonts.dart';
import 'ideal_assets.dart';
import 'ideal_color.dart';
import 'ideal_shape.dart';

/// An iDEAL / Wero transition payment button.
///
/// Implements the official co-branded iDEAL | Wero lockup during the migration
/// from iDEAL to European Wero:
/// https://ideal.nl/naar-wero
///
/// Rendered in pure Flutter using vector graphics with full accessibility semantics.
class IdealButton extends PayButton {
  const IdealButton({
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
    this.color = IdealColor.yellow,
    this.shape = IdealShape.rounded,
  });

  /// The brand color palette for the button. Defaults to [IdealColor.yellow].
  final IdealColor color;

  /// The contour shape of the button. Defaults to [IdealShape.rounded] (6.0 dp).
  final IdealShape shape;

  @override
  double get defaultBorderRadius =>
      shape == IdealShape.pill ? (height / 2) : 6.0;

  @override
  String? get semanticLabel => super.semanticLabel ?? 'iDEAL | Wero';

  @override
  PayButtonColors resolveColors(BuildContext context) {
    switch (color) {
      case IdealColor.yellow:
        return const PayButtonColors(
          backgroundColor: Color(0xFFFFF48D),
          progressColor: Color(0xFF1D1C1C),
          splashColor: Color(0x1F1D1C1C),
          highlightColor: Color(0x0F1D1C1C),
        );
      case IdealColor.black:
        return const PayButtonColors(
          backgroundColor: Color(0xFF1D1C1C),
          progressColor: Color(0xFFFFF48D),
          splashColor: Color(0x1FFFFFFF),
          highlightColor: Color(0x0FFFFFFF),
        );
      case IdealColor.white:
        return const PayButtonColors(
          backgroundColor: Color(0xFFFFFFFF),
          borderColor: Color(0xFFD1D5DB),
          borderWidth: 1.0,
          progressColor: Color(0xFFCC0066),
          splashColor: Color(0x1F1D1C1C),
          highlightColor: Color(0x0F1D1C1C),
        );
      case IdealColor.lightGray:
        return const PayButtonColors(
          backgroundColor: Color(0xFFF5F5F5),
          borderColor: Color(0xFFE0E0E0),
          borderWidth: 1.0,
          progressColor: Color(0xFFCC0066),
          splashColor: Color(0x1F1D1C1C),
          highlightColor: Color(0x0F1D1C1C),
        );
    }
  }

  Color _resolveTextColor() {
    switch (color) {
      case IdealColor.black:
        return Colors.white;
      case IdealColor.yellow:
      case IdealColor.white:
      case IdealColor.lightGray:
        return const Color(0xFF1D1C1C);
    }
  }

  @override
  Widget buildCompactContent(BuildContext context) {
    final markHeight = (height * 0.52).clamp(20.0, 28.0);
    return IdealAssets.emblem(color: color, height: markHeight);
  }

  @override
  Widget buildMediumContent(BuildContext context) {
    final logoHeight = (height * 0.44).clamp(18.0, 26.0);
    return IdealAssets.logo(color: color, height: logoHeight);
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
      defaultFontFamilyFallback: PayButtonFonts.ideal,
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
