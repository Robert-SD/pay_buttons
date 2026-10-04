import 'package:flutter/material.dart';

import '../../base/pay_button.dart';
import '../../base/pay_button_colors.dart';
import '../../base/pay_button_fonts.dart';
import 'google_pay_assets.dart';
import 'google_pay_color.dart';
import 'google_pay_shape.dart';

/// A brand-compliant Google Pay payment button.
///
/// Complies with official [Google Pay Brand Guidelines](https://developers.google.com/pay/api/web/guides/brand-guidelines).
/// Fully rendered in pure Flutter using official vector graphics without native SDK bloat.
class GooglePayButton extends PayButton {
  const GooglePayButton({
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
    this.color = GooglePayColor.black,
    this.shape = GooglePayShape.pill,
    this.logoFirst = false,
  });

  /// The brand color palette for the button. Defaults to [GooglePayColor.black].
  final GooglePayColor color;

  /// The contour shape of the button. Defaults to [GooglePayShape.pill].
  final GooglePayShape shape;

  /// Whether the Google Pay mark appears before [text]. Defaults to `false`.
  ///
  /// Set to `false` when text precedes the brand logo (e.g. "Buy with GPay").
  final bool logoFirst;

  @override
  double get defaultBorderRadius {
    switch (shape) {
      case GooglePayShape.pill:
        return height / 2;
      case GooglePayShape.rounded:
        return 4.0;
      case GooglePayShape.rect:
        return 0.0;
    }
  }

  @override
  String? get semanticLabel =>
      super.semanticLabel ?? (text != null && text!.isNotEmpty ? '$text Google Pay' : 'Google Pay');

  @override
  PayButtonColors resolveColors(BuildContext context) {
    switch (color) {
      case GooglePayColor.black:
      case GooglePayColor.monochromeBlack:
        return const PayButtonColors(
          backgroundColor: Color(0xFF000000),
          progressColor: Color(0xFFFFFFFF),
          splashColor: Color(0x1FFFFFFF),
          highlightColor: Color(0x0FFFFFFF),
        );
      case GooglePayColor.white:
      case GooglePayColor.monochromeWhite:
        return const PayButtonColors(
          backgroundColor: Color(0xFFFFFFFF),
          borderColor: Color(0xFF747775),
          borderWidth: 1.0,
          progressColor: Color(0xFF1F1F1F),
          splashColor: Color(0x1F000000),
          highlightColor: Color(0x0F000000),
        );
    }
  }

  Color _resolveTextColor() {
    switch (color) {
      case GooglePayColor.black:
      case GooglePayColor.monochromeBlack:
        return Colors.white;
      case GooglePayColor.white:
      case GooglePayColor.monochromeWhite:
        return const Color(0xFF1F1F1F);
    }
  }

  @override
  Widget buildButtonContent(BuildContext context) {
    final textColor = _resolveTextColor();
    final logoHeight = (height * 0.44).clamp(18.0, 24.0);
    final logoWidget = GooglePayAssets.logo(color: color, height: logoHeight);

    if (text == null || text!.isEmpty) {
      return logoWidget;
    }

    final effectiveTextStyle = resolveTextStyle(
      textColor: textColor,
      fontSize: (height * 0.33).clamp(14.0, 17.0),
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
      defaultFontFamilyFallback: PayButtonFonts.googlePay,
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
      children: logoFirst
          ? [logoWidget, const SizedBox(width: 8), textWidget]
          : [textWidget, const SizedBox(width: 8), logoWidget],
    );
  }
}
