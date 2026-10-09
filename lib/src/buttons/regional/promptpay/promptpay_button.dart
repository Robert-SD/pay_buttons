import 'package:flutter/material.dart';

import '../../../base/pay_button.dart';
import '../../../base/pay_button_colors.dart';
import '../../../base/pay_button_fonts.dart';
import 'promptpay_assets.dart';
import 'promptpay_color.dart';
import 'promptpay_shape.dart';

/// A PromptPay (Thailand) payment button.
///
/// Rendered in pure Flutter using vector graphics with full accessibility semantics.
class PromptPayButton extends PayButton {
  const PromptPayButton({
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
    super.shape = PromptPayShape.rounded,
    this.color = PromptPayColor.blue,
  });

  /// The brand color palette for the button. Defaults to [PromptPayColor.blue].
  final PromptPayColor color;

  @override
  double get roundedBorderRadius => 6.0;

  @override
  List<String> get defaultFontFamilyFallback => PayButtonFonts.promptpay;

  @override
  String? get semanticLabel => super.semanticLabel ?? 'PromptPay';

  @override
  PayButtonColors resolveColors(BuildContext context) => color.palette;

  @override
  Widget buildCompactContent(BuildContext context) {
    final markHeight = (height * 0.52).clamp(20.0, 30.0);
    return PromptPayAssets.emblem(color: color, height: markHeight);
  }

  @override
  Widget buildMediumContent(BuildContext context) {
    final logoHeight = (height * 0.46).clamp(18.0, 26.0);
    return PromptPayAssets.logo(color: color, height: logoHeight);
  }
}
