import 'package:flutter/material.dart';
import '../../base/pay_button.dart';
import '../../base/pay_button_colors.dart';
import 'klarna_assets.dart';
import 'klarna_button_type.dart';
import 'klarna_color.dart';
import 'klarna_shape.dart';

/// A brand-compliant Klarna payment button.
///
/// Complies with official [Klarna Design Guidelines](https://docs.klarna.com/merchant-journey/branding/design-guidelines/).
/// Fully rendered in pure Flutter using official vector graphics without native SDK bloat.
class KlarnaButton extends PayButton {
  const KlarnaButton({
    super.key,
    required super.onPressed,
    super.isLoading,
    super.enabled,
    super.width,
    super.height = 48.0,
    super.borderRadius,
    super.margin,
    super.elevation,
    super.semanticLabel,
    this.color = KlarnaColor.pink,
    this.shape = KlarnaShape.rounded,
    this.type = KlarnaButtonType.express,
    this.locale,
    this.textStyle,
  });

  /// The brand color palette for the button. Defaults to [KlarnaColor.pink].
  final KlarnaColor color;

  /// The contour shape of the button. Defaults to [KlarnaShape.rounded] (5.0 dp).
  final KlarnaShape shape;

  /// The content/action layout of the button. Defaults to [KlarnaButtonType.express].
  final KlarnaButtonType type;

  /// Optional locale used to translate action verbs (e.g. "Pay with", "Sofort bezahlen", "In 30 Tagen").
  /// If null, the ambient device locale or English fallback is used.
  final Locale? locale;

  /// Optional custom text style override for the label text.
  final TextStyle? textStyle;

  @override
  double get defaultBorderRadius =>
      shape == KlarnaShape.pill ? (height / 2) : 5.0;

  @override
  String? get semanticLabel =>
      super.semanticLabel ?? 'Pay with Klarna';

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
        return const Color(0xFF0B051D);
      case KlarnaColor.black:
        return Colors.white;
    }
  }

  @override
  Widget buildButtonContent(BuildContext context) {
    final effectiveLocale = locale ?? Localizations.maybeLocaleOf(context);
    final label = type.getLocalizedLabel(effectiveLocale);
    final textColor = _resolveTextColor();

    final logoHeight = (height * 0.40).clamp(16.0, 22.0);
    final logoWidget = KlarnaAssets.wordmark(color: color, height: logoHeight);

    if (type == KlarnaButtonType.badgeOnly || label.isEmpty) {
      return logoWidget;
    }

    final effectiveTextStyle = TextStyle(
      color: textColor,
      fontSize: (height * 0.31).clamp(13.0, 16.0),
      fontWeight: FontWeight.w700,
      fontFamilyFallback: const [
        'Klarna Text',
        'Klarna Headline',
        'Helvetica Neue',
        'Helvetica',
        'Arial',
        'sans-serif',
      ],
      letterSpacing: -0.2,
    ).merge(textStyle);

    // For express & payNow: Text comes first ("Pay with [Klarna.]" or "Pay now with [Klarna.]")
    if (type == KlarnaButtonType.express || type == KlarnaButtonType.payNow) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(label, style: effectiveTextStyle),
          const SizedBox(width: 8),
          logoWidget,
        ],
      );
    }

    // For payLater & sliceIt: Logo comes first ("[Klarna.] Pay in 30 days" or "[Klarna.] Pay in 3")
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        logoWidget,
        const SizedBox(width: 8),
        Text(label, style: effectiveTextStyle),
      ],
    );
  }
}
