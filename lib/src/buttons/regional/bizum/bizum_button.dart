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
    this.color = BizumColor.white,
    this.shape = BizumShape.rounded,
  });

  /// The brand color palette for the button. Defaults to [BizumColor.white].
  final BizumColor color;

  /// The contour shape of the button. Defaults to [BizumShape.rounded] (6.0 dp).
  final BizumShape shape;

  @override
  double get defaultBorderRadius =>
      shape == BizumShape.pill ? (height / 2) : 6.0;

  @override
  String? get semanticLabel => super.semanticLabel ?? 'Bizum';

  @override
  PayButtonColors resolveColors(BuildContext context) {
    switch (color) {
      case BizumColor.white:
        return const PayButtonColors(
          backgroundColor: Color(0xFFFFFFFF),
          borderColor: Color(0xFFD1D5DB),
          borderWidth: 1.0,
          progressColor: Color(0xFF00B4B6),
          splashColor: Color(0x1F00B4B6),
          highlightColor: Color(0x0F00B4B6),
        );
      case BizumColor.teal:
        return const PayButtonColors(
          backgroundColor: Color(0xFF00B4B6),
          progressColor: Colors.white,
          splashColor: Color(0x1FFFFFFF),
          highlightColor: Color(0x0FFFFFFF),
        );
    }
  }

  Color _resolveTextColor() {
    switch (color) {
      case BizumColor.white:
        return const Color(0xFF004455);
      case BizumColor.teal:
        return Colors.white;
    }
  }

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

  @override
  Widget buildFullContent(BuildContext context) {
    final logoWidget = buildMediumContent(context);

    if (text == null || text!.isEmpty) {
      return logoWidget;
    }

    final textColor = _resolveTextColor();
    final effectiveTextStyle = resolveTextStyle(
      textColor: textColor,
      fontSize: (height * 0.31).clamp(13.0, 16.0),
      fontWeight: FontWeight.w600,
      letterSpacing: -0.1,
      defaultFontFamilyFallback: PayButtonFonts.bizum,
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
