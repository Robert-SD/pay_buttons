import 'package:flutter/material.dart';

import '../../../base/pay_button.dart';
import '../../../base/pay_button_colors.dart';
import '../../../base/pay_button_fonts.dart';
import 'twint_assets.dart';
import 'twint_color.dart';
import 'twint_shape.dart';

/// A brand-compliant TWINT (Switzerland) payment button.
///
/// Fully rendered in pure Flutter using vector graphics without native SDK bloat.
class TwintButton extends PayButton {
  const TwintButton({
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
    this.color = TwintColor.black,
    this.shape = TwintShape.rounded,
  });

  /// The brand color palette for the button. Defaults to [TwintColor.black].
  final TwintColor color;

  /// The contour shape of the button. Defaults to [TwintShape.rounded] (6.0 dp).
  final TwintShape shape;

  @override
  double get defaultBorderRadius =>
      shape == TwintShape.pill ? (height / 2) : 6.0;

  @override
  String? get semanticLabel => super.semanticLabel ?? 'TWINT';

  @override
  PayButtonColors resolveColors(BuildContext context) {
    switch (color) {
      case TwintColor.black:
        return const PayButtonColors(
          backgroundColor: Color(0xFF000000),
          progressColor: Colors.white,
          splashColor: Color(0x1FFFFFFF),
          highlightColor: Color(0x0FFFFFFF),
        );
      case TwintColor.white:
        return const PayButtonColors(
          backgroundColor: Color(0xFFFFFFFF),
          borderColor: Color(0xFFE0E0E0),
          borderWidth: 1.0,
          progressColor: Color(0xFF000000),
          splashColor: Color(0x1F000000),
          highlightColor: Color(0x0F000000),
        );
    }
  }

  Color _resolveTextColor() {
    switch (color) {
      case TwintColor.black:
        return Colors.white;
      case TwintColor.white:
        return const Color(0xFF000000);
    }
  }

  @override
  Widget buildButtonContent(BuildContext context) {
    final textColor = _resolveTextColor();

    final logoHeight = (height * 0.44).clamp(18.0, 24.0);
    final logoWidget = TwintAssets.logo(color: color, height: logoHeight);

    if (text == null || text!.isEmpty) {
      return logoWidget;
    }

    final effectiveTextStyle = resolveTextStyle(
      textColor: textColor,
      fontSize: (height * 0.31).clamp(13.0, 16.0),
      fontWeight: FontWeight.w600,
      letterSpacing: -0.1,
      defaultFontFamilyFallback: PayButtonFonts.twint,
    );

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(text!, style: effectiveTextStyle),
        const SizedBox(width: 8),
        logoWidget,
      ],
    );
  }
}
