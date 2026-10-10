import 'package:flutter/material.dart';

import '../../base/pay_button.dart';
import '../../base/pay_button_colors.dart';
import '../../base/pay_button_fonts.dart';
import 'paypal_assets.dart';
import 'paypal_color.dart';
import 'paypal_shape.dart';

/// A PayPal payment button.
///
/// Designed following [PayPal Brand Guidelines](https://developer.paypal.com/docs/checkout/standard/customize/button-style/).
/// Fully rendered in pure Flutter using vector graphics without any native SDK dependencies.
class PayPalButton extends PayButton {
  const PayPalButton({
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
    super.textPosition = PayButtonTextPosition.trailing,
    super.shape = PayPalShape.pill,
    this.color = PayPalColor.gold,
  });

  /// The brand color palette for the button. Defaults to [PayPalColor.gold].
  final PayPalColor color;

  @override
  double get roundedBorderRadius => 6.0;

  @override
  FontWeight get labelFontWeight => FontWeight.w700;

  @override
  double get labelLetterSpacing => -0.2;

  @override
  List<String> get defaultFontFamilyFallback => PayButtonFonts.paypal;

  @override
  String? get semanticLabel => super.semanticLabel ?? 'PayPal';

  @override
  PayButtonColors resolveColors(BuildContext context) => color.palette;

  @override
  double get compactMarkHeight => (height * 0.52).clamp(20.0, 28.0);

  @override
  double get mediumLogoHeight => (height * 0.46).clamp(18.0, 26.0);

  /// Height of the "PayPal" wordmark paired with the monogram in the medium variant.
  double get _wordmarkHeight => (height * 0.40).clamp(16.0, 22.0);

  @override
  Widget buildCompactContent(BuildContext context) {
    return PayPalAssets.monogram(color: color, height: compactMarkHeight);
  }

  @override
  Widget buildMediumContent(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        PayPalAssets.monogram(color: color, height: mediumLogoHeight),
        const SizedBox(width: 5),
        PayPalAssets.wordmark(color: color, height: _wordmarkHeight),
      ],
    );
  }
}
