import 'package:flutter/material.dart';
import '../../../base/pay_button.dart';
import '../../../base/pay_button_colors.dart';
import 'twint_assets.dart';
import 'twint_button_type.dart';
import 'twint_color.dart';
import 'twint_shape.dart';

/// A brand-compliant TWINT (Switzerland) payment button.
///
/// Fully rendered in pure Flutter using vector graphics without native SDK bloat.
class TwintButton extends PayButton {
  const TwintButton({
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
    this.color = TwintColor.black,
    this.shape = TwintShape.rounded,
    this.type = TwintButtonType.payWith,
    this.locale,
    this.textStyle,
  });

  /// The brand color palette for the button. Defaults to [TwintColor.black].
  final TwintColor color;

  /// The contour shape of the button. Defaults to [TwintShape.rounded] (6.0 dp).
  final TwintShape shape;

  /// The content/action layout of the button. Defaults to [TwintButtonType.payWith].
  final TwintButtonType type;

  /// Optional locale used to translate action verbs (de: "Bezahlen mit", fr: "Payer avec", it: "Paga con").
  /// If null, the ambient device locale or German fallback is used.
  final Locale? locale;

  /// Optional custom text style override for the label text.
  final TextStyle? textStyle;

  @override
  double get defaultBorderRadius =>
      shape == TwintShape.pill ? (height / 2) : 6.0;

  @override
  String? get semanticLabel =>
      super.semanticLabel ?? 'Bezahlen mit TWINT';

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
    final effectiveLocale = locale ?? Localizations.maybeLocaleOf(context);
    final label = type.getLocalizedLabel(effectiveLocale);
    final textColor = _resolveTextColor();

    final logoHeight = (height * 0.44).clamp(18.0, 24.0);
    final logoWidget = TwintAssets.logo(color: color, height: logoHeight);

    if (type == TwintButtonType.logoOnly || label.isEmpty) {
      return logoWidget;
    }

    final effectiveTextStyle = TextStyle(
      color: textColor,
      fontSize: (height * 0.31).clamp(13.0, 16.0),
      fontWeight: FontWeight.w600,
      letterSpacing: -0.1,
    ).merge(textStyle);

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
}
