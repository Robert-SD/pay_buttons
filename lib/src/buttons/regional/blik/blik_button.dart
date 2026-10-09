import 'package:flutter/material.dart';

import '../../../base/pay_button.dart';
import '../../../base/pay_button_colors.dart';
import '../../../base/pay_button_fonts.dart';
import 'blik_assets.dart';
import 'blik_color.dart';
import 'blik_shape.dart';

/// A BLIK (Poland) payment button.
///
/// Rendered in pure Flutter using vector graphics with full accessibility semantics.
class BlikButton extends PayButton {
  const BlikButton({
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
    super.shape = BlikShape.rounded,
    this.color = BlikColor.black,
  });

  /// The brand color palette for the button. Defaults to [BlikColor.black].
  final BlikColor color;

  @override
  double get roundedBorderRadius => 6.0;

  @override
  List<String> get defaultFontFamilyFallback => PayButtonFonts.blik;

  @override
  String? get semanticLabel => super.semanticLabel ?? 'BLIK';

  @override
  PayButtonColors resolveColors(BuildContext context) => color.palette;

  @override
  Widget buildCompactContent(BuildContext context) {
    final markHeight = (height * 0.48).clamp(20.0, 26.0);
    return BlikAssets.bMark(color: color, height: markHeight);
  }

  @override
  Widget buildMediumContent(BuildContext context) {
    final logoHeight = (height * 0.44).clamp(18.0, 24.0);
    return BlikAssets.logo(color: color, height: logoHeight);
  }
}
