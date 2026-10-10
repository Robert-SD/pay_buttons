import 'package:flutter/material.dart';

import '../../../base/pay_button.dart';
import '../../../base/pay_button_colors.dart';
import '../../../base/pay_button_fonts.dart';
import 'upi_assets.dart';
import 'upi_color.dart';
import 'upi_shape.dart';

/// A UPI (India, Unified Payments Interface) payment button.
///
/// Rendered in pure Flutter using vector graphics with full accessibility semantics.
class UpiButton extends PayButton {
  const UpiButton({
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
    super.shape = UpiShape.rounded,
    this.color = UpiColor.white,
  });

  /// The brand color palette for the button. Defaults to [UpiColor.white].
  final UpiColor color;

  @override
  double get roundedBorderRadius => 6.0;

  @override
  List<String> get defaultFontFamilyFallback => PayButtonFonts.upi;

  @override
  String? get semanticLabel => super.semanticLabel ?? 'UPI';

  @override
  PayButtonColors resolveColors(BuildContext context) => color.palette;

  @override
  double get compactMarkHeight => (height * 0.52).clamp(20.0, 30.0);

  @override
  double get mediumLogoHeight => (height * 0.44).clamp(18.0, 26.0);

  @override
  Widget buildCompactContent(BuildContext context) {
    return UpiAssets.emblem(color: color, height: compactMarkHeight);
  }

  @override
  Widget buildMediumContent(BuildContext context) {
    return UpiAssets.logo(color: color, height: mediumLogoHeight);
  }
}
