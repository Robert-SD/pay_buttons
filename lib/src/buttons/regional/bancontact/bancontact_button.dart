import 'package:flutter/material.dart';

import '../../../base/pay_button.dart';
import '../../../base/pay_button_colors.dart';
import '../../../base/pay_button_fonts.dart';
import 'bancontact_assets.dart';
import 'bancontact_color.dart';
import 'bancontact_shape.dart';

/// A Bancontact (Belgium) payment button.
///
/// Rendered in pure Flutter using vector graphics with full accessibility semantics.
class BancontactButton extends PayButton {
  const BancontactButton({
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
    super.shape = BancontactShape.rounded,
    this.color,
  });

  /// The brand color palette for the button.
  ///
  /// When null, resolves automatically based on [Theme.of(context).brightness]:
  /// [BancontactColor.white] in light mode, [BancontactColor.blue] in dark mode.
  final BancontactColor? color;

  /// Resolves the effective color scheme for the given [context].
  BancontactColor effectiveColor(BuildContext context) {
    if (color != null) return color!;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? BancontactColor.blue : BancontactColor.white;
  }

  @override
  double get roundedBorderRadius => 6.0;

  @override
  List<String> get defaultFontFamilyFallback => PayButtonFonts.bancontact;

  @override
  String? get semanticLabel => super.semanticLabel ?? 'Bancontact';

  @override
  PayButtonColors resolveColors(BuildContext context) =>
      effectiveColor(context).palette;

  @override
  double get compactMarkHeight => (height * 0.46).clamp(18.0, 24.0);

  @override
  double get mediumLogoHeight => (height * 0.52).clamp(20.0, 28.0);

  @override
  Widget buildCompactContent(BuildContext context) {
    return BancontactAssets.wings(height: compactMarkHeight);
  }

  @override
  Widget buildMediumContent(BuildContext context) {
    return BancontactAssets.logo(
      color: effectiveColor(context),
      height: mediumLogoHeight,
    );
  }
}
