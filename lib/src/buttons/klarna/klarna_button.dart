import 'package:flutter/material.dart';

import '../../base/pay_button.dart';
import '../../base/pay_button_colors.dart';
import '../../base/pay_button_fonts.dart';
import 'klarna_assets.dart';
import 'klarna_color.dart';
import 'klarna_shape.dart';

/// A Klarna payment and sign-in button.
///
/// Designed following [Klarna Design Guidelines](https://docs.klarna.com/merchant-journey/branding/design-guidelines/)
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
    super.textPosition = PayButtonTextPosition.trailing,
    super.shape = KlarnaShape.rounded,
    this.color = KlarnaColor.pink,
  });

  /// The brand color palette for the button. Defaults to [KlarnaColor.pink].
  final KlarnaColor color;

  @override
  double get roundedBorderRadius => 5.0;

  @override
  FontWeight get labelFontWeight => FontWeight.w700;

  @override
  double get labelLetterSpacing => -0.2;

  @override
  List<String> get defaultFontFamilyFallback => PayButtonFonts.klarna;

  @override
  String? get semanticLabel => super.semanticLabel ?? 'Klarna';

  @override
  PayButtonColors resolveColors(BuildContext context) => color.palette;

  @override
  double get compactMarkHeight => (height * 0.45).clamp(18.0, 24.0);

  @override
  double get mediumLogoHeight => (height * 0.40).clamp(16.0, 22.0);

  @override
  Widget buildCompactContent(BuildContext context) {
    return KlarnaAssets.monogram(color: color, height: compactMarkHeight);
  }

  @override
  Widget buildMediumContent(BuildContext context) {
    return KlarnaAssets.wordmark(color: color, height: mediumLogoHeight);
  }
}
