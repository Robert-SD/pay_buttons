import 'package:flutter/material.dart';

import '../../base/pay_button.dart';
import '../../base/pay_button_colors.dart';
import '../../base/pay_button_fonts.dart';
import 'apple_pay_assets.dart';
import 'apple_pay_color.dart';
import 'apple_pay_shape.dart';

/// A brand-compliant Apple Pay payment button.
///
/// Complies with official [Apple Pay Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines/apple-pay).
/// Fully rendered in pure Flutter using official vector graphics without native SDK dependencies.
class ApplePayButton extends PayButton {
  const ApplePayButton({
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
    this.color = ApplePayColor.black,
    this.shape = ApplePayShape.pill,
    this.logoFirst = false,
  });

  /// The brand color palette for the button. Defaults to [ApplePayColor.black].
  final ApplePayColor color;

  /// The contour shape of the button. Defaults to [ApplePayShape.pill].
  final ApplePayShape shape;

  /// Whether the Apple Pay mark appears before [text]. Defaults to `false`.
  ///
  /// Set to `false` when text precedes the brand logo (e.g. "Buy with [Pay]").
  final bool logoFirst;

  @override
  double get defaultBorderRadius {
    switch (shape) {
      case ApplePayShape.rounded:
        return 4.0;
      case ApplePayShape.pill:
        return height / 2;
      case ApplePayShape.rect:
        return 0.0;
    }
  }

  @override
  String? get semanticLabel =>
      super.semanticLabel ??
      (text != null && text!.isNotEmpty ? '$text Apple Pay' : 'Apple Pay');

  @override
  PayButtonColors resolveColors(BuildContext context) {
    switch (color) {
      case ApplePayColor.black:
        return const PayButtonColors(
          backgroundColor: Color(0xFF000000),
          progressColor: Color(0xFFFFFFFF),
          splashColor: Color(0x1FFFFFFF),
          highlightColor: Color(0x0FFFFFFF),
        );
      case ApplePayColor.white:
        return const PayButtonColors(
          backgroundColor: Color(0xFFFFFFFF),
          progressColor: Color(0xFF000000),
          splashColor: Color(0x1F000000),
          highlightColor: Color(0x0F000000),
        );
      case ApplePayColor.whiteOutline:
        return const PayButtonColors(
          backgroundColor: Color(0xFFFFFFFF),
          borderColor: Color(0xFF000000),
          borderWidth: 1.0,
          progressColor: Color(0xFF000000),
          splashColor: Color(0x1F000000),
          highlightColor: Color(0x0F000000),
        );
    }
  }

  Color _resolveTextColor() {
    switch (color) {
      case ApplePayColor.black:
        return Colors.white;
      case ApplePayColor.white:
      case ApplePayColor.whiteOutline:
        return Colors.black;
    }
  }

  @override
  Widget buildButtonContent(BuildContext context) {
    final textColor = _resolveTextColor();
    final logoHeight = (height * 0.44).clamp(18.0, 24.0);
    final logoWidget = ApplePayAssets.logo(color: color, height: logoHeight);

    if (text == null || text!.isEmpty) {
      return logoWidget;
    }

    final effectiveTextStyle = resolveTextStyle(
      textColor: textColor,
      fontSize: (height * 0.33).clamp(14.0, 17.0),
      fontWeight: FontWeight.w500,
      letterSpacing: -0.2,
      defaultFontFamilyFallback: PayButtonFonts.applePay,
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
