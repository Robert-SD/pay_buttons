import 'package:flutter/material.dart';
import '../../base/pay_button.dart';
import '../../base/pay_button_colors.dart';
import 'afterpay_assets.dart';
import 'afterpay_brand.dart';
import 'afterpay_button_type.dart';
import 'afterpay_color.dart';
import 'afterpay_shape.dart';

/// A brand-compliant Afterpay / Clearpay payment button.
///
/// Complies with official Afterpay/Clearpay brand guidelines.
/// Fully rendered in pure Flutter using vector graphics without native SDK bloat.
class AfterpayButton extends PayButton {
  const AfterpayButton({
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
    this.color = AfterpayColor.mint,
    this.shape = AfterpayShape.rounded,
    this.brand = AfterpayBrand.afterpay,
    this.type = AfterpayButtonType.buyNow,
    this.locale,
    this.textStyle,
  });

  /// The brand color palette for the button. Defaults to [AfterpayColor.mint].
  final AfterpayColor color;

  /// The contour shape of the button. Defaults to [AfterpayShape.rounded] (6.0 dp).
  final AfterpayShape shape;

  /// Regional branding variant (Afterpay vs Clearpay). Defaults to [AfterpayBrand.afterpay].
  final AfterpayBrand brand;

  /// The content/action layout of the button. Defaults to [AfterpayButtonType.buyNow].
  final AfterpayButtonType type;

  /// Optional locale used to translate action verbs (e.g. "Buy now with", "Jetzt kaufen mit").
  /// If null, the ambient device locale or English fallback is used.
  final Locale? locale;

  /// Optional custom text style override for the label text.
  final TextStyle? textStyle;

  @override
  double get defaultBorderRadius =>
      shape == AfterpayShape.pill ? (height / 2) : 6.0;

  @override
  String? get semanticLabel =>
      super.semanticLabel ??
      (brand == AfterpayBrand.clearpay
          ? 'Pay with Clearpay'
          : 'Pay with Afterpay');

  @override
  PayButtonColors resolveColors(BuildContext context) {
    switch (color) {
      case AfterpayColor.mint:
        return const PayButtonColors(
          backgroundColor: Color(0xFFB2FCE4),
          progressColor: Color(0xFF000000),
          splashColor: Color(0x1F000000),
          highlightColor: Color(0x0F000000),
        );
      case AfterpayColor.black:
        return const PayButtonColors(
          backgroundColor: Color(0xFF000000),
          progressColor: Color(0xFFB2FCE4),
          splashColor: Color(0x1FFFFFFF),
          highlightColor: Color(0x0FFFFFFF),
        );
      case AfterpayColor.white:
        return const PayButtonColors(
          backgroundColor: Color(0xFFFFFFFF),
          borderColor: Color(0xFFD1D5DB),
          borderWidth: 1.0,
          progressColor: Color(0xFF000000),
          splashColor: Color(0x1F000000),
          highlightColor: Color(0x0F000000),
        );
    }
  }

  Color _resolveTextColor() {
    switch (color) {
      case AfterpayColor.mint:
      case AfterpayColor.white:
        return const Color(0xFF000000);
      case AfterpayColor.black:
        return Colors.white;
    }
  }

  @override
  Widget buildButtonContent(BuildContext context) {
    final effectiveLocale = locale ?? Localizations.maybeLocaleOf(context);
    final label = type.getLocalizedLabel(effectiveLocale);
    final textColor = _resolveTextColor();

    final badgeHeight = (height * 0.44).clamp(18.0, 24.0);
    final badgeWidget = AfterpayAssets.loopBadge(color: color, height: badgeHeight);

    final brandTextStyle = TextStyle(
      color: textColor,
      fontSize: (height * 0.35).clamp(15.0, 18.0),
      fontWeight: FontWeight.w800,
      fontFamilyFallback: const [
        'Sofia Pro',
        'Gilroy',
        'Helvetica Neue',
        'Helvetica',
        'Arial',
        'sans-serif',
      ],
      letterSpacing: -0.4,
    );

    final brandLockup = Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(brand.displayName, style: brandTextStyle),
        const SizedBox(width: 4),
        badgeWidget,
      ],
    );

    if (type == AfterpayButtonType.logoOnly || label.isEmpty) {
      return brandLockup;
    }

    final effectiveLabelStyle = TextStyle(
      color: textColor,
      fontSize: (height * 0.31).clamp(13.0, 16.0),
      fontWeight: FontWeight.w600,
      fontFamilyFallback: const [
        'Sofia Pro',
        'Gilroy',
        'Helvetica Neue',
        'Helvetica',
        'Arial',
        'sans-serif',
      ],
      letterSpacing: -0.1,
    ).merge(textStyle);

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(label, style: effectiveLabelStyle),
        const SizedBox(width: 6),
        brandLockup,
      ],
    );
  }
}
