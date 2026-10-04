import 'package:flutter/material.dart';
import '../../../base/pay_button.dart';
import '../../../base/pay_button_colors.dart';
import 'blik_assets.dart';
import 'blik_color.dart';
import 'blik_shape.dart';

/// A brand-compliant BLIK (Poland) payment button.
///
/// Fully rendered in pure Flutter using vector graphics without native SDK bloat.
class BlikButton extends PayButton {
  const BlikButton({
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
    this.color = BlikColor.black,
    this.shape = BlikShape.rounded,
    this.textStyle,
  });

  /// The brand color palette for the button. Defaults to [BlikColor.black].
  final BlikColor color;

  /// The contour shape of the button. Defaults to [BlikShape.rounded] (6.0 dp).
  final BlikShape shape;

  /// Optional custom text style override for the label text.
  final TextStyle? textStyle;

  @override
  double get defaultBorderRadius =>
      shape == BlikShape.pill ? (height / 2) : 6.0;

  @override
  String? get semanticLabel =>
      super.semanticLabel ?? 'BLIK';

  @override
  PayButtonColors resolveColors(BuildContext context) {
    switch (color) {
      case BlikColor.black:
        return const PayButtonColors(
          backgroundColor: Color(0xFF000000),
          progressColor: Color(0xFFE52F08),
          splashColor: Color(0x1FFFFFFF),
          highlightColor: Color(0x0FFFFFFF),
        );
      case BlikColor.white:
        return const PayButtonColors(
          backgroundColor: Color(0xFFFFFFFF),
          borderColor: Color(0xFFE0E0E0),
          borderWidth: 1.0,
          progressColor: Color(0xFFE52F08),
          splashColor: Color(0x1FE52F08),
          highlightColor: Color(0x0FE52F08),
        );
    }
  }

  Color _resolveTextColor() {
    switch (color) {
      case BlikColor.black:
        return Colors.white;
      case BlikColor.white:
        return const Color(0xFF000000);
    }
  }

  @override
  Widget buildButtonContent(BuildContext context) {
    final textColor = _resolveTextColor();

    final logoHeight = (height * 0.44).clamp(18.0, 24.0);
    final logoWidget = BlikAssets.logo(color: color, height: logoHeight);

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
