import 'package:flutter/material.dart';

import '../../../base/pay_button.dart';
import '../../../base/pay_button_colors.dart';
import '../../../base/pay_button_fonts.dart';
import 'oxxo_assets.dart';
import 'oxxo_color.dart';
import 'oxxo_shape.dart';

/// An OXXO (Mexico) payment button.
///
/// Rendered in pure Flutter using vector graphics with full accessibility semantics.
class OxxoButton extends PayButton {
  const OxxoButton({
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
    super.shape = OxxoShape.rounded,
    this.color = OxxoColor.red,
  });

  /// The brand color palette for the button. Defaults to [OxxoColor.red].
  final OxxoColor color;

  @override
  double get roundedBorderRadius => 6.0;

  @override
  FontWeight get labelFontWeight => FontWeight.w700;

  @override
  List<String> get defaultFontFamilyFallback => PayButtonFonts.oxxo;

  @override
  String? get semanticLabel => super.semanticLabel ?? 'OXXO';

  @override
  PayButtonColors resolveColors(BuildContext context) => color.palette;

  @override
  double get compactMarkHeight => (height * 0.44).clamp(18.0, 24.0);

  @override
  double get mediumLogoHeight => (height * 0.52).clamp(22.0, 30.0);

  @override
  Widget buildCompactContent(BuildContext context) {
    return OxxoAssets.oMark(color: color, height: compactMarkHeight);
  }

  @override
  Widget buildMediumContent(BuildContext context) {
    return OxxoAssets.logo(color: color, height: mediumLogoHeight);
  }
}
