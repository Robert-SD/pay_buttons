import 'package:flutter/material.dart';
import '../../../base/pay_button.dart';
import '../../../base/pay_button_colors.dart';
import 'bizum_assets.dart';
import 'bizum_color.dart';
import 'bizum_shape.dart';

/// A brand-compliant Bizum (Spain) payment button.
///
/// Fully rendered in pure Flutter using vector graphics without native SDK bloat.
class BizumButton extends PayButton {
  const BizumButton({
    super.key,
    required super.onPressed,
    super.text,
    super.isLoading,
    super.enabled,
    super.width,
    super.height = 48.0,
    super.borderRadius,
    super.margin,
    super.elevation,
    super.semanticLabel,
    this.color = BizumColor.white,
    this.shape = BizumShape.rounded,
    this.textStyle,
  });

  /// The brand color palette for the button. Defaults to [BizumColor.white].
  final BizumColor color;

  /// The contour shape of the button. Defaults to [BizumShape.rounded] (6.0 dp).
  final BizumShape shape;

  /// Optional custom text style override for the label text.
  final TextStyle? textStyle;

  @override
  double get defaultBorderRadius =>
      shape == BizumShape.pill ? (height / 2) : 6.0;

  @override
  String? get semanticLabel =>
      super.semanticLabel ?? 'Bizum';

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
  Widget buildButtonContent(BuildContext context) {
    final textColor = _resolveTextColor();

    final logoHeight = (height * 0.44).clamp(18.0, 24.0);
    final logoWidget = BizumAssets.logo(color: color, height: logoHeight);

    if (text == null || text!.isEmpty) {
      return logoWidget;
    }

    final effectiveTextStyle = TextStyle(
      color: textColor,
      fontSize: (height * 0.31).clamp(13.0, 16.0),
      fontWeight: FontWeight.w600,
      letterSpacing: -0.1,
    ).merge(textStyle);

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(text!, style: effectiveTextStyle),
        const SizedBox(width: 8),
        logoWidget,
      ],
    );
  }
}
