import 'package:flutter/material.dart';

import '../../../base/pay_button.dart';
import '../../../base/pay_button_colors.dart';
import '../../../base/pay_button_fonts.dart';
import 'bizum_assets.dart';
import 'bizum_color.dart';
import 'bizum_shape.dart';

/// A Bizum (Spain) payment button.
///
/// Rendered in pure Flutter using vector graphics with full accessibility semantics.
class BizumButton extends PayButton {
  const BizumButton({
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
    super.shape = BizumShape.rounded,
    this.color = BizumColor.white,
  });

  /// The brand color palette for the button. Defaults to [BizumColor.white].
  final BizumColor color;

  @override
  double get roundedBorderRadius => 6.0;

  @override
  List<String> get defaultFontFamilyFallback => PayButtonFonts.bizum;

  @override
  String? get semanticLabel => super.semanticLabel ?? 'Bizum';

  @override
  PayButtonColors resolveColors(BuildContext context) => color.palette;

  @override
  Widget buildCompactContent(BuildContext context) {
    final markHeight = (height * 0.48).clamp(20.0, 26.0);
    return BizumAssets.asterisk(color: color, height: markHeight);
  }

  @override
  Widget buildMediumContent(BuildContext context) {
    final logoHeight = (height * 0.44).clamp(18.0, 24.0);
    return BizumAssets.logo(color: color, height: logoHeight);
  }
}
