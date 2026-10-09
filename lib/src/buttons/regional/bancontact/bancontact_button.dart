import 'package:flutter/material.dart';

import '../../../base/pay_button.dart';
import '../../../base/pay_button_colors.dart';
import '../../../base/pay_button_fonts.dart';
import 'bancontact_assets.dart';
import 'bancontact_color.dart';
import 'bancontact_shape.dart';

/// A Bancontact (Belgium) payment button.
///
/// Rendered in pure Flutter using vector graphics with full accessibility semantics.
class BancontactButton extends PayButton {
  const BancontactButton({
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
    super.shape = BancontactShape.rounded,
    this.color = BancontactColor.white,
  });

  /// The brand color palette for the button. Defaults to [BancontactColor.white].
  final BancontactColor color;

  @override
  double get roundedBorderRadius => 6.0;

  @override
  List<String> get defaultFontFamilyFallback => PayButtonFonts.bancontact;

  @override
  String? get semanticLabel => super.semanticLabel ?? 'Bancontact';

  @override
  PayButtonColors resolveColors(BuildContext context) => color.palette;

  @override
  Widget buildCompactContent(BuildContext context) {
    final wingsHeight = (height * 0.46).clamp(18.0, 24.0);
    return BancontactAssets.wings(height: wingsHeight);
  }

  @override
  Widget buildMediumContent(BuildContext context) {
    final logoHeight = (height * 0.52).clamp(20.0, 28.0);
    return BancontactAssets.logo(color: color, height: logoHeight);
  }
}
