import 'package:flutter/material.dart';

import '../../../base/pay_button.dart';
import '../../../base/pay_button_colors.dart';
import '../../../base/pay_button_fonts.dart';
import 'paynow_assets.dart';
import 'paynow_color.dart';
import 'paynow_shape.dart';

/// A PayNow (Singapore) payment button.
///
/// Rendered in pure Flutter using vector graphics with full accessibility semantics.
class PayNowButton extends PayButton {
  const PayNowButton({
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
    super.shape = PayNowShape.rounded,
    this.color = PayNowColor.purple,
  });

  /// The brand color palette for the button. Defaults to [PayNowColor.purple].
  final PayNowColor color;

  @override
  double get roundedBorderRadius => 6.0;

  @override
  List<String> get defaultFontFamilyFallback => PayButtonFonts.paynow;

  @override
  String? get semanticLabel => super.semanticLabel ?? 'PayNow';

  @override
  PayButtonColors resolveColors(BuildContext context) => color.palette;

  @override
  Widget buildCompactContent(BuildContext context) {
    final markHeight = (height * 0.52).clamp(20.0, 30.0);
    return PayNowAssets.emblem(color: color, height: markHeight);
  }

  @override
  Widget buildMediumContent(BuildContext context) {
    final logoHeight = (height * 0.46).clamp(18.0, 26.0);
    return PayNowAssets.logo(color: color, height: logoHeight);
  }
}
