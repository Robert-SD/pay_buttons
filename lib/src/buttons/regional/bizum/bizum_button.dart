import 'package:flutter/material.dart';

import '../../../base/pay_button.dart';
import '../../../base/pay_button_colors.dart';
import '../../../base/pay_button_fonts.dart';
import 'bizum_assets.dart';
import 'bizum_color.dart';
import 'bizum_shape.dart';

/// A Bizum (Spain) payment button.
///
/// Rendered in pure Flutter using vector graphics with full accessibility semantics.
class BizumButton extends PayButton {
  const BizumButton({
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
    super.shape = BizumShape.rounded,
    this.color,
  });

  /// The brand color palette for the button.
  ///
  /// When null, resolves automatically based on [Theme.of(context).brightness]:
  /// [BizumColor.white] in light mode, [BizumColor.teal] in dark mode.
  final BizumColor? color;

  /// Resolves the effective color scheme for the given [context].
  BizumColor effectiveColor(BuildContext context) {
    if (color != null) return color!;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? BizumColor.teal : BizumColor.white;
  }

  @override
  double get roundedBorderRadius => 6.0;

  @override
  List<String> get defaultFontFamilyFallback => PayButtonFonts.bizum;

  @override
  String? get semanticLabel => super.semanticLabel ?? 'Bizum';

  @override
  PayButtonColors resolveColors(BuildContext context) =>
      effectiveColor(context).palette;

  @override
  Widget buildCompactContent(BuildContext context) {
    return BizumAssets.asterisk(
      color: effectiveColor(context),
      height: compactMarkHeight,
    );
  }

  @override
  Widget buildMediumContent(BuildContext context) {
    return BizumAssets.logo(
      color: effectiveColor(context),
      height: mediumLogoHeight,
    );
  }
}
