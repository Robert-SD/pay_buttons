import 'package:flutter/material.dart';

import '../../../base/pay_button.dart';
import '../../../base/pay_button_colors.dart';
import '../../../base/pay_button_fonts.dart';
import 'promptpay_assets.dart';
import 'promptpay_color.dart';
import 'promptpay_shape.dart';

/// A PromptPay (Thailand) payment button.
///
/// Rendered in pure Flutter using vector graphics with full accessibility semantics.
class PromptPayButton extends PayButton {
  const PromptPayButton({
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
    super.shape = PromptPayShape.rounded,
    this.color,
  });

  /// The brand color palette for the button.
  ///
  /// When null, resolves automatically based on [Theme.of(context).brightness]:
  /// [PromptPayColor.blue] in light mode, [PromptPayColor.black] in dark mode.
  final PromptPayColor? color;

  /// Resolves the effective color scheme for the given [context].
  PromptPayColor effectiveColor(BuildContext context) {
    if (color != null) return color!;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? PromptPayColor.black : PromptPayColor.blue;
  }

  @override
  double get roundedBorderRadius => 6.0;

  @override
  List<String> get defaultFontFamilyFallback => PayButtonFonts.promptpay;

  @override
  String? get semanticLabel => super.semanticLabel ?? 'PromptPay';

  @override
  PayButtonColors resolveColors(BuildContext context) =>
      effectiveColor(context).palette;

  @override
  double get compactMarkHeight => (height * 0.52).clamp(20.0, 30.0);

  @override
  double get mediumLogoHeight => (height * 0.46).clamp(18.0, 26.0);

  @override
  Widget buildCompactContent(BuildContext context) {
    return PromptPayAssets.emblem(
      color: effectiveColor(context),
      height: compactMarkHeight,
    );
  }

  @override
  Widget buildMediumContent(BuildContext context) {
    return PromptPayAssets.logo(
      color: effectiveColor(context),
      height: mediumLogoHeight,
    );
  }
}
