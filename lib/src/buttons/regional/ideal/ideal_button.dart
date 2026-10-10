import 'package:flutter/material.dart';

import '../../../base/pay_button.dart';
import '../../../base/pay_button_colors.dart';
import '../../../base/pay_button_fonts.dart';
import 'ideal_assets.dart';
import 'ideal_color.dart';
import 'ideal_shape.dart';

/// An iDEAL / Wero transition payment button.
///
/// Implements the official co-branded iDEAL | Wero lockup during the migration
/// from iDEAL to European Wero:
/// https://ideal.nl/naar-wero
///
/// Rendered in pure Flutter using vector graphics with full accessibility semantics.
class IdealButton extends PayButton {
  const IdealButton({
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
    super.shape = IdealShape.rounded,
    this.color,
  });

  /// The brand color palette for the button.
  ///
  /// When null, resolves automatically based on [Theme.of(context).brightness]:
  /// [IdealColor.yellow] in light mode, [IdealColor.black] in dark mode.
  final IdealColor? color;

  /// Resolves the effective color scheme for the given [context].
  IdealColor effectiveColor(BuildContext context) {
    if (color != null) return color!;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? IdealColor.black : IdealColor.yellow;
  }

  @override
  double get roundedBorderRadius => 6.0;

  @override
  List<String> get defaultFontFamilyFallback => PayButtonFonts.ideal;

  @override
  String? get semanticLabel => super.semanticLabel ?? 'iDEAL | Wero';

  @override
  PayButtonColors resolveColors(BuildContext context) =>
      effectiveColor(context).palette;

  @override
  double get compactMarkHeight => (height * 0.52).clamp(20.0, 28.0);

  @override
  double get mediumLogoHeight => (height * 0.44).clamp(18.0, 26.0);

  @override
  Widget buildCompactContent(BuildContext context) {
    return IdealAssets.emblem(
      color: effectiveColor(context),
      height: compactMarkHeight,
    );
  }

  @override
  Widget buildMediumContent(BuildContext context) {
    return IdealAssets.logo(
      color: effectiveColor(context),
      height: mediumLogoHeight,
    );
  }
}
