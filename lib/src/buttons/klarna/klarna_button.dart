import 'package:flutter/material.dart';

import '../../base/pay_button.dart';
import '../../base/pay_button_colors.dart';
import '../../base/pay_button_fonts.dart';
import 'klarna_assets.dart';
import 'klarna_color.dart';
import 'klarna_shape.dart';

/// A brand-compliant Klarna payment and sign-in button.
///
/// Complies with official [Klarna Design Guidelines](https://docs.klarna.com/merchant-journey/branding/design-guidelines/)
/// and [Sign in with Klarna Button Styling](https://docs.klarna.com/acquirer/klarna/sign-in-with-klarna/additional-resources/button-styling/).
///
/// Features dynamic responsive width breakpoints:
/// - **Width > 200px**: Displays full text label + Klarna logo (or text only if configured).
/// - **84px ≤ Width ≤ 200px**: Displays the full "Klarna." wordmark only.
/// - **Width < 84px**: Displays the compact "K." monogram with dot.
class KlarnaButton extends PayButton {
  const KlarnaButton({
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
    PayButtonTextPosition? textPosition,
    this.color = KlarnaColor.pink,
    this.shape = KlarnaShape.rounded,
    bool? logoFirst,
  }) : super(
         textPosition:
             textPosition ??
             (logoFirst == false
                 ? PayButtonTextPosition.leading
                 : PayButtonTextPosition.trailing),
       );

  /// The brand color palette for the button. Defaults to [KlarnaColor.pink].
  final KlarnaColor color;

  /// The contour shape of the button. Defaults to [KlarnaShape.rounded] (5.0 dp).
  final KlarnaShape shape;

  /// Whether the Klarna logo appears before [text]. Defaults to `true`.
  bool get logoFirst => textPosition == PayButtonTextPosition.trailing;

  @override
  double get defaultBorderRadius {
    switch (shape) {
      case KlarnaShape.pill:
        return height / 2;
      case KlarnaShape.rect:
        return 0.0;
      case KlarnaShape.rounded:
        return 5.0;
    }
  }

  @override
  String? get semanticLabel => super.semanticLabel ?? 'Klarna';

  @override
  PayButtonColors resolveColors(BuildContext context) {
    switch (color) {
      case KlarnaColor.pink:
        return const PayButtonColors(
          backgroundColor: Color(0xFFFFA8CD),
          progressColor: Color(0xFF0B051D),
          splashColor: Color(0x1F0B051D),
          highlightColor: Color(0x0F0B051D),
        );
      case KlarnaColor.white:
        return const PayButtonColors(
          backgroundColor: Color(0xFFFFFFFF),
          borderColor: Color(0xFFE5E5E5),
          borderWidth: 1.0,
          progressColor: Color(0xFF0B051D),
          splashColor: Color(0x1F0B051D),
          highlightColor: Color(0x0F0B051D),
        );
      case KlarnaColor.offWhite:
        return const PayButtonColors(
          backgroundColor: Color(0xFFF9F8F5),
          borderColor: Color(0xFFE5E5E5),
          borderWidth: 1.0,
          progressColor: Color(0xFF0B051D),
          splashColor: Color(0x1F0B051D),
          highlightColor: Color(0x0F0B051D),
        );
      case KlarnaColor.black:
        return const PayButtonColors(
          backgroundColor: Color(0xFF0B051D),
          progressColor: Color(0xFFFFA8CD),
          splashColor: Color(0x1FFFFFFF),
          highlightColor: Color(0x0FFFFFFF),
        );
    }
  }

  Color _resolveTextColor() {
    switch (color) {
      case KlarnaColor.pink:
      case KlarnaColor.white:
      case KlarnaColor.offWhite:
        return const Color(0xFF0B051D);
      case KlarnaColor.black:
        return Colors.white;
    }
  }

  @override
  Widget buildCompactContent(BuildContext context) {
    final monogramHeight = (height * 0.45).clamp(18.0, 24.0);
    return KlarnaAssets.monogram(color: color, height: monogramHeight);
  }

  @override
  Widget buildMediumContent(BuildContext context) {
    final logoHeight = (height * 0.40).clamp(16.0, 22.0);
    return KlarnaAssets.wordmark(color: color, height: logoHeight);
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
      letterSpacing: -0.2,
      defaultFontFamilyFallback: PayButtonFonts.klarna,
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
