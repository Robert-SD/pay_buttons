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
    this.color = TwintColor.black,
  });

  /// The brand color palette for the button. Defaults to [TwintColor.black].
  final TwintColor color;

  @override
  double get roundedBorderRadius => 6.0;

  @override
  List<String> get defaultFontFamilyFallback => PayButtonFonts.twint;

  @override
  String? get semanticLabel => super.semanticLabel ?? 'TWINT';

  @override
  PayButtonColors resolveColors(BuildContext context) => color.palette;

  @override
  Widget buildCompactContent(BuildContext context) {
    final beaconHeight = (height * 0.48).clamp(20.0, 26.0);
    return TwintAssets.beacon(height: beaconHeight);
  }

  @override
  Widget buildMediumContent(BuildContext context) {
    final logoHeight = (height * 0.44).clamp(18.0, 24.0);
    return TwintAssets.logo(color: color, height: logoHeight);
  }
}
