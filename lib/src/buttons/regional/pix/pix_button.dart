import 'package:flutter/material.dart';

import '../../../base/pay_button.dart';
import '../../../base/pay_button_colors.dart';
import '../../../base/pay_button_fonts.dart';
import 'pix_assets.dart';
import 'pix_color.dart';
import 'pix_shape.dart';

/// A brand-compliant Pix (Banco Central do Brasil) payment button.
///
/// Fully rendered in pure Flutter using vector graphics without native SDK bloat.
class PixButton extends PayButton {
  const PixButton({
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
    this.color = PixColor.teal,
    this.shape = PixShape.rounded,
  });

  /// The brand color palette for the button. Defaults to [PixColor.teal].
  final PixColor color;

  /// The contour shape of the button. Defaults to [PixShape.rounded] (6.0 dp).
  final PixShape shape;

  @override
  double get defaultBorderRadius =>
      shape == PixShape.pill ? (height / 2) : 6.0;

  @override
  String? get semanticLabel => super.semanticLabel ?? 'Pix';

  @override
  PayButtonColors resolveColors(BuildContext context) {
    switch (color) {
      case PixColor.teal:
        return const PayButtonColors(
          backgroundColor: Color(0xFF32BCAD),
          progressColor: Color(0xFFFFFFFF),
          splashColor: Color(0x1FFFFFFF),
          highlightColor: Color(0x0FFFFFFF),
        );
      case PixColor.white:
        return const PayButtonColors(
          backgroundColor: Color(0xFFFFFFFF),
          borderColor: Color(0xFFE0E0E0),
          borderWidth: 1.0,
          progressColor: Color(0xFF32BCAD),
          splashColor: Color(0x1F32BCAD),
          highlightColor: Color(0x0F32BCAD),
        );
      case PixColor.black:
        return const PayButtonColors(
          backgroundColor: Color(0xFF000000),
          progressColor: Color(0xFF32BCAD),
          splashColor: Color(0x1FFFFFFF),
          highlightColor: Color(0x0FFFFFFF),
        );
    }
  }

  Color _resolveTextColor() {
    switch (color) {
      case PixColor.teal:
      case PixColor.black:
        return Colors.white;
      case PixColor.white:
        return const Color(0xFF3C3C3B);
    }
  }

  @override
  Widget buildCompactContent(BuildContext context) {
    final markHeight = (height * 0.50).clamp(20.0, 28.0);
    return PixAssets.emblem(color: color, height: markHeight);
  }

  @override
  Widget buildMediumContent(BuildContext context) {
    final logoHeight = (height * 0.44).clamp(18.0, 24.0);
    return PixAssets.logo(color: color, height: logoHeight);
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
      defaultFontFamilyFallback: PayButtonFonts.pix,
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
