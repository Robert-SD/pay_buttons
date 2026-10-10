import 'package:flutter/material.dart';

import '../../../base/pay_button.dart';
import '../../../base/pay_button_colors.dart';
import '../../../base/pay_button_fonts.dart';
import 'paynow_assets.dart';
import 'paynow_color.dart';
import 'paynow_shape.dart';

/// A PayNow (Singapore) payment button.
///
/// Rendered in pure Flutter using vector graphics with full accessibility semantics.
class PayNowButton extends PayButton {
  const PayNowButton({
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
    super.textPosition = PayButtonTextPosition.leading,
    super.shape = PayNowShape.rounded,
    this.color,
  });

  /// The brand color palette for the button.
  ///
  /// When null, resolves automatically based on [Theme.of(context).brightness]:
  /// [PayNowColor.purple] in light mode, [PayNowColor.white] in dark mode.
  final PayNowColor? color;

  /// Resolves the effective color scheme for the given [context].
  PayNowColor effectiveColor(BuildContext context) {
    if (color != null) return color!;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? PayNowColor.white : PayNowColor.purple;
  }

  @override
  double get roundedBorderRadius => 6.0;

  @override
  List<String> get defaultFontFamilyFallback => PayButtonFonts.paynow;

  @override
  String? get semanticLabel => super.semanticLabel ?? 'PayNow';

  @override
  PayButtonColors resolveColors(BuildContext context) =>
      effectiveColor(context).palette;

  @override
  double get compactMarkHeight => (height * 0.52).clamp(20.0, 30.0);

  @override
  double get mediumLogoHeight => (height * 0.46).clamp(18.0, 26.0);

  @override
  Widget buildCompactContent(BuildContext context) {
    return PayNowAssets.emblem(
      color: effectiveColor(context),
      height: compactMarkHeight,
    );
  }

  @override
  Widget buildMediumContent(BuildContext context) {
    return PayNowAssets.logo(
      color: effectiveColor(context),
      height: mediumLogoHeight,
    );
  }
}
