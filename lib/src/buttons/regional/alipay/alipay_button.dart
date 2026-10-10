import 'package:flutter/material.dart';

import '../../../base/pay_button.dart';
import '../../../base/pay_button_fonts.dart';
import 'alipay_assets.dart';
import 'alipay_color.dart';
import 'alipay_shape.dart';

/// An Alipay payment button.
///
/// Rendered in pure Flutter using vector graphics with full accessibility semantics.
class AlipayButton extends BrandPayButton<AlipayColor> {
  const AlipayButton({
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
    super.shape = AlipayShape.rounded,
    super.color,
  });

  @override
  AlipayColor get defaultLightColor => AlipayColor.blue;

  @override
  AlipayColor get defaultDarkColor => AlipayColor.white;

  @override
  double get roundedBorderRadius => 6.0;

  @override
  List<String> get defaultFontFamilyFallback => PayButtonFonts.alipay;

  @override
  String get defaultSemanticLabel => 'Alipay';

  @override
  double get compactMarkHeight => (height * 0.52).clamp(20.0, 30.0);

  @override
  double get mediumLogoHeight => (height * 0.46).clamp(18.0, 26.0);

  @override
  Widget buildCompactContent(BuildContext context) {
    return AlipayAssets.emblem(
      color: effectiveColor(context),
      height: compactMarkHeight,
    );
  }

  @override
  Widget buildMediumContent(BuildContext context) {
    return AlipayAssets.logo(
      color: effectiveColor(context),
      height: mediumLogoHeight,
    );
  }
}
