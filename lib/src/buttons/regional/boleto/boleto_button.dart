import 'package:flutter/material.dart';

import '../../../base/pay_button.dart';
import '../../../base/pay_button_colors.dart';
import '../../../base/pay_button_fonts.dart';
import 'boleto_assets.dart';
import 'boleto_color.dart';
import 'boleto_shape.dart';

/// A Boleto Bancário (Brazil) payment button.
///
/// Rendered in pure Flutter using vector graphics with full accessibility semantics.
class BoletoButton extends PayButton {
  const BoletoButton({
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
    super.shape = BoletoShape.rounded,
    this.color = BoletoColor.white,
  });

  /// The brand color palette for the button. Defaults to [BoletoColor.white].
  final BoletoColor color;

  @override
  double get roundedBorderRadius => 6.0;

  @override
  List<String> get defaultFontFamilyFallback => PayButtonFonts.boleto;

  @override
  String? get semanticLabel => super.semanticLabel ?? 'Boleto Bancário';

  @override
  PayButtonColors resolveColors(BuildContext context) => color.palette;

  @override
  Widget buildCompactContent(BuildContext context) {
    final markHeight = (height * 0.44).clamp(18.0, 24.0);
    return BoletoAssets.barcode(color: color, height: markHeight);
  }

  @override
  Widget buildMediumContent(BuildContext context) {
    final logoHeight = (height * 0.44).clamp(18.0, 26.0);
    return BoletoAssets.logo(color: color, height: logoHeight);
  }
}
