import 'package:flutter/material.dart';

import '../../../base/pay_button.dart';
import '../../../base/pay_button_colors.dart';
import '../../../base/pay_button_fonts.dart';
import 'alipay_assets.dart';
import 'alipay_color.dart';
import 'alipay_shape.dart';

/// An Alipay payment button.
///
/// Rendered in pure Flutter using vector graphics with full accessibility semantics.
class AlipayButton extends PayButton {
  const AlipayButton({
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
    super.shape = AlipayShape.rounded,
    this.color,
  });

  /// The brand color palette for the button.
  ///
  /// When null, resolves automatically based on [Theme.of(context).brightness]:
  /// [AlipayColor.blue] in light mode, [AlipayColor.white] in dark mode.
  final AlipayColor? color;

  /// Resolves the effective color scheme for the given [context].
  AlipayColor effectiveColor(BuildContext context) {
    if (color != null) return color!;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? AlipayColor.white : AlipayColor.blue;
  }

  @override
  double get roundedBorderRadius => 6.0;

  @override
  List<String> get defaultFontFamilyFallback => PayButtonFonts.alipay;

  @override
  String? get semanticLabel => super.semanticLabel ?? 'Alipay';

  @override
  PayButtonColors resolveColors(BuildContext context) =>
      effectiveColor(context).palette;

  @override
  double get compactMarkHeight => (height * 0.52).clamp(20.0, 30.0);

  @override
  double get mediumLogoHeight => (height * 0.46).clamp(18.0, 26.0);

  @override
  Widget buildCompactContent(BuildContext context) {
    return AlipayAssets.emblem(
      color: effectiveColor(context),
      height: compactMarkHeight,
    );
  }

  @override
  Widget buildMediumContent(BuildContext context) {
    return AlipayAssets.logo(
      color: effectiveColor(context),
      height: mediumLogoHeight,
    );
  }
}
