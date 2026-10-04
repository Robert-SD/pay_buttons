import 'package:flutter/material.dart';
import '../../../base/pay_button.dart';
import '../../../base/pay_button_colors.dart';
import '../../../base/pay_button_fonts.dart';
import 'bancontact_assets.dart';
import 'bancontact_color.dart';
import 'bancontact_shape.dart';

/// A brand-compliant Bancontact (Belgium) payment button.
///
/// Fully rendered in pure Flutter using vector graphics without native SDK bloat.
class BancontactButton extends PayButton {
  const BancontactButton({
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
    this.color = BancontactColor.white,
    this.shape = BancontactShape.rounded,
  });

  /// The brand color palette for the button. Defaults to [BancontactColor.white].
  final BancontactColor color;

  /// The contour shape of the button. Defaults to [BancontactShape.rounded] (6.0 dp).
  final BancontactShape shape;

  @override
  double get defaultBorderRadius =>
      shape == BancontactShape.pill ? (height / 2) : 6.0;

  @override
  String? get semanticLabel =>
      super.semanticLabel ?? 'Bancontact';

  @override
  PayButtonColors resolveColors(BuildContext context) {
    switch (color) {
      case BancontactColor.white:
        return const PayButtonColors(
          backgroundColor: Color(0xFFFFFFFF),
          borderColor: Color(0xFFD1D5DB),
          borderWidth: 1.0,
          progressColor: Color(0xFF005AB9),
          splashColor: Color(0x1F005AB9),
          highlightColor: Color(0x0F005AB9),
        );
      case BancontactColor.blue:
        return const PayButtonColors(
          backgroundColor: Color(0xFF002D62),
          progressColor: Color(0xFFFFD800),
          splashColor: Color(0x1FFFFFFF),
          highlightColor: Color(0x0FFFFFFF),
        );
    }
  }

  Color _resolveTextColor() {
    switch (color) {
      case BancontactColor.white:
        return const Color(0xFF1E3764);
      case BancontactColor.blue:
        return Colors.white;
    }
  }

  @override
  Widget buildButtonContent(BuildContext context) {
    final textColor = _resolveTextColor();

    final logoHeight = (height * 0.52).clamp(20.0, 28.0);
    final logoWidget = BancontactAssets.logo(color: color, height: logoHeight);

    if (text == null || text!.isEmpty) {
      return logoWidget;
    }

    final effectiveTextStyle = resolveTextStyle(
      textColor: textColor,
      fontSize: (height * 0.31).clamp(13.0, 16.0),
      fontWeight: FontWeight.w600,
      letterSpacing: -0.1,
      defaultFontFamilyFallback: PayButtonFonts.bancontact,
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
