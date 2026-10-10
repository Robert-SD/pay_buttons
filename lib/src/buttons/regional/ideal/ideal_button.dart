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
    this.color = IdealColor.yellow,
  });

  /// The brand color palette for the button. Defaults to [IdealColor.yellow].
  final IdealColor color;

  @override
  double get roundedBorderRadius => 6.0;

  @override
  List<String> get defaultFontFamilyFallback => PayButtonFonts.ideal;

  @override
  String? get semanticLabel => super.semanticLabel ?? 'iDEAL | Wero';

  @override
  PayButtonColors resolveColors(BuildContext context) => color.palette;

  @override
  double get compactMarkHeight => (height * 0.52).clamp(20.0, 28.0);

  @override
  double get mediumLogoHeight => (height * 0.44).clamp(18.0, 26.0);

  @override
  Widget buildCompactContent(BuildContext context) {
    return IdealAssets.emblem(color: color, height: compactMarkHeight);
  }

  @override
  Widget buildMediumContent(BuildContext context) {
    return IdealAssets.logo(color: color, height: mediumLogoHeight);
  }
}
