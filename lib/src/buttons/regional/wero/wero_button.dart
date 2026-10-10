import 'package:flutter/material.dart';

import '../../../base/pay_button.dart';
import '../../../base/pay_button_colors.dart';
import '../../../base/pay_button_fonts.dart';
import 'wero_assets.dart';
import 'wero_color.dart';
import 'wero_shape.dart';

/// A Wero (European Payments Initiative) payment button.
///
/// Rendered in pure Flutter using vector graphics with full accessibility semantics.
class WeroButton extends PayButton {
  const WeroButton({
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
    super.shape = WeroShape.rounded,
    this.color = WeroColor.yellow,
  });

  /// The brand color palette for the button. Defaults to [WeroColor.yellow].
  final WeroColor color;

  @override
  double get roundedBorderRadius => 6.0;

  @override
  List<String> get defaultFontFamilyFallback => PayButtonFonts.wero;

  @override
  String? get semanticLabel => super.semanticLabel ?? 'Wero';

  @override
  PayButtonColors resolveColors(BuildContext context) => color.palette;

  @override
  double get compactMarkHeight => (height * 0.44).clamp(18.0, 24.0);

  @override
  double get mediumLogoHeight => (height * 0.44).clamp(18.0, 26.0);

  @override
  Widget buildCompactContent(BuildContext context) {
    return WeroAssets.wMark(color: color, height: compactMarkHeight);
  }

  @override
  Widget buildMediumContent(BuildContext context) {
    return WeroAssets.logo(color: color, height: mediumLogoHeight);
  }
}
