import 'package:flutter/material.dart';

import '../../../base/pay_button.dart';
import '../../../base/pay_button_colors.dart';
import '../../../base/pay_button_fonts.dart';
import 'twint_assets.dart';
import 'twint_color.dart';
import 'twint_shape.dart';

/// A TWINT (Switzerland) payment button.
///
/// Rendered in pure Flutter using vector graphics with full accessibility semantics.
class TwintButton extends PayButton {
  const TwintButton({
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
    super.shape = TwintShape.rounded,
    this.color,
  });

  /// The brand color palette for the button.
  ///
  /// When null, resolves automatically based on [Theme.of(context).brightness]:
  /// [TwintColor.black] in light mode, [TwintColor.white] in dark mode.
  final TwintColor? color;

  /// Resolves the effective color scheme for the given [context].
  TwintColor effectiveColor(BuildContext context) {
    if (color != null) return color!;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? TwintColor.white : TwintColor.black;
  }

  @override
  double get roundedBorderRadius => 6.0;

  @override
  List<String> get defaultFontFamilyFallback => PayButtonFonts.twint;

  @override
  String? get semanticLabel => super.semanticLabel ?? 'TWINT';

  @override
  PayButtonColors resolveColors(BuildContext context) =>
      effectiveColor(context).palette;

  @override
  Widget buildCompactContent(BuildContext context) {
    return TwintAssets.beacon(height: compactMarkHeight);
  }

  @override
  Widget buildMediumContent(BuildContext context) {
    return TwintAssets.logo(
      color: effectiveColor(context),
      height: mediumLogoHeight,
    );
  }
}
