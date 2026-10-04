import 'package:flutter/material.dart';
import '../../base/pay_button.dart';
import '../../base/pay_button_colors.dart';
import '../../base/pay_button_fonts.dart';
import 'stripe_link_assets.dart';
import 'stripe_link_color.dart';
import 'stripe_link_shape.dart';

/// A brand-compliant Link by Stripe payment button.
///
/// Complies with official Stripe Link brand guidelines.
/// Fully rendered in pure Flutter using vector graphics without native SDK bloat.
class StripeLinkButton extends PayButton {
  const StripeLinkButton({
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
    this.color = StripeLinkColor.green,
    this.shape = StripeLinkShape.rounded,
  });

  /// The brand color palette for the button. Defaults to [StripeLinkColor.green].
  final StripeLinkColor color;

  /// The contour shape of the button. Defaults to [StripeLinkShape.rounded] (6.0 dp).
  final StripeLinkShape shape;

  @override
  double get defaultBorderRadius =>
      shape == StripeLinkShape.pill ? (height / 2) : 6.0;

  @override
  String? get semanticLabel =>
      super.semanticLabel ?? 'Pay with Link';

  @override
  PayButtonColors resolveColors(BuildContext context) {
    switch (color) {
      case StripeLinkColor.green:
        return const PayButtonColors(
          backgroundColor: Color(0xFF00D66F),
          progressColor: Color(0xFF0A2540),
          splashColor: Color(0x1F0A2540),
          highlightColor: Color(0x0F0A2540),
        );
      case StripeLinkColor.dark:
        return const PayButtonColors(
          backgroundColor: Color(0xFF0A2540),
          progressColor: Color(0xFF00D66F),
          splashColor: Color(0x1FFFFFFF),
          highlightColor: Color(0x0FFFFFFF),
        );
      case StripeLinkColor.white:
        return const PayButtonColors(
          backgroundColor: Color(0xFFFFFFFF),
          borderColor: Color(0xFFE3E8EE),
          borderWidth: 1.0,
          progressColor: Color(0xFF0A2540),
          splashColor: Color(0x1F0A2540),
          highlightColor: Color(0x0F0A2540),
        );
    }
  }

  Color _resolveTextColor() {
    switch (color) {
      case StripeLinkColor.green:
      case StripeLinkColor.white:
        return const Color(0xFF0A2540);
      case StripeLinkColor.dark:
        return Colors.white;
    }
  }

  @override
  Widget buildButtonContent(BuildContext context) {
    final textColor = _resolveTextColor();

    final logoHeight = (height * 0.46).clamp(18.0, 26.0);
    final logoWidget = StripeLinkAssets.logo(color: color, height: logoHeight);

    if (text == null || text!.isEmpty) {
      return logoWidget;
    }

    final effectiveTextStyle = resolveTextStyle(
      textColor: textColor,
      fontSize: (height * 0.31).clamp(13.0, 16.0),
      fontWeight: FontWeight.w600,
      letterSpacing: -0.1,
      defaultFontFamilyFallback: PayButtonFonts.stripeLink,
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
