import 'package:flutter/material.dart';

import '../../../base/pay_button.dart';
import '../../../base/pay_button_colors.dart';
import '../../../base/pay_button_fonts.dart';
import 'ideal_assets.dart';
import 'ideal_color.dart';
import 'ideal_shape.dart';

/// A brand-compliant iDEAL (Netherlands / EU) payment button.
///
/// Fully rendered in pure Flutter using vector graphics without native SDK bloat.
class IdealButton extends PayButton {
  const IdealButton({
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
    this.color = IdealColor.white,
    this.shape = IdealShape.rounded,
  });

  /// The brand color palette for the button. Defaults to [IdealColor.white].
  final IdealColor color;

  /// The contour shape of the button. Defaults to [IdealShape.rounded] (6.0 dp).
  final IdealShape shape;

  @override
  double get defaultBorderRadius =>
      shape == IdealShape.pill ? (height / 2) : 6.0;

  @override
  String? get semanticLabel => super.semanticLabel ?? 'iDEAL';

  @override
  PayButtonColors resolveColors(BuildContext context) {
    switch (color) {
      case IdealColor.white:
        return const PayButtonColors(
          backgroundColor: Color(0xFFFFFFFF),
          borderColor: Color(0xFFD1D5DB),
          borderWidth: 1.0,
          progressColor: Color(0xFFD50172),
          splashColor: Color(0x1FD50172),
          highlightColor: Color(0x0FD50172),
        );
      case IdealColor.lightGray:
        return const PayButtonColors(
          backgroundColor: Color(0xFFF5F5F5),
          borderColor: Color(0xFFE0E0E0),
          borderWidth: 1.0,
          progressColor: Color(0xFFD50172),
          splashColor: Color(0x1FD50172),
          highlightColor: Color(0x0FD50172),
        );
    }
  }

  @override
  Widget buildCompactContent(BuildContext context) {
    final logoHeight = (height * 0.55).clamp(22.0, 30.0);
    return IdealAssets.logo(height: logoHeight);
  }

  @override
  Widget buildMediumContent(BuildContext context) {
    final logoHeight = (height * 0.52).clamp(20.0, 28.0);
    return IdealAssets.logo(height: logoHeight);
  }

  @override
  Widget buildFullContent(BuildContext context) {
    final logoWidget = buildMediumContent(context);

    if (text == null || text!.isEmpty) {
      return logoWidget;
    }

    final effectiveTextStyle = resolveTextStyle(
      textColor: const Color(0xFF0A0B09),
      fontSize: (height * 0.31).clamp(13.0, 16.0),
      fontWeight: FontWeight.w600,
      letterSpacing: -0.1,
      defaultFontFamilyFallback: PayButtonFonts.ideal,
    );

    final textWidget = Flexible(
      child: Text(
        text!,
        style: effectiveTextStyle,
        overflow: TextOverflow.ellipsis,
      ),
    );

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: textPosition == PayButtonTextPosition.trailing
          ? [logoWidget, const SizedBox(width: 8), textWidget]
          : [textWidget, const SizedBox(width: 8), logoWidget],
    );
  }
}
