import 'package:flutter/material.dart';
import 'pay_button_colors.dart';

/// Abstract base class for all payment buttons in `pay_buttons`.
///
/// Specific payment buttons (such as [PayPalButton], [KlarnaButton], etc.)
/// inherit from this class to ensure consistent sizing, state handling,
/// accessibility semantics, and Material splash interactions.
abstract class PayButton extends StatelessWidget {
  const PayButton({
    super.key,
    required this.onPressed,
    this.text,
    this.textStyle,
    this.fontFamily,
    this.fontFamilyFallback,
    this.isLoading = false,
    this.enabled = true,
    this.width,
    this.height = 48.0,
    this.borderRadius,
    this.margin,
    this.elevation = 0.0,
    this.semanticLabel,
  });

  /// Callback executed when the button is tapped.
  ///
  /// If null, the button will be treated as non-interactive (disabled).
  final VoidCallback? onPressed;

  /// Optional custom text label displayed alongside the brand logo.
  ///
  /// Defaults to `null` which renders the brand logo alone (no text).
  final String? text;

  /// Optional custom text style override for the button label text.
  ///
  /// Merged on top of brand defaults and custom [fontFamily].
  final TextStyle? textStyle;

  /// Optional custom font family for the button label text.
  ///
  /// Overrides the brand default font family while retaining brand weight and sizing.
  final String? fontFamily;

  /// Optional custom font family fallback list.
  ///
  /// If null and [fontFamily] is null, brand-compliant default fallbacks are used.
  final List<String>? fontFamilyFallback;

  /// Whether to display a loading indicator in place of the button content.
  ///
  /// When true, user interactions are disabled.
  final bool isLoading;

  /// Whether the button is enabled for user interaction.
  ///
  /// When false, the button renders with disabled styling and ignores taps.
  final bool enabled;

  /// The horizontal width of the button.
  ///
  /// If null, the button takes intrinsic width or expands depending on its parent.
  /// Set to [double.infinity] for full-width buttons.
  final double? width;

  /// The height of the button. Defaults to `48.0`dp to ensure WCAG 2.1 touch target compliance.
  final double height;

  /// Optional override for the corner radius.
  ///
  /// If null, [defaultBorderRadius] defined by the brand implementation is used.
  final double? borderRadius;

  /// Optional outer margin around the button.
  final EdgeInsetsGeometry? margin;

  /// Elevation of the button. Defaults to `0.0` (flat) per modern payment design guidelines.
  final double elevation;

  /// Accessibility label read by screen readers.
  final String? semanticLabel;

  /// Whether the button can currently be tapped.
  bool get isInteractive => enabled && !isLoading && onPressed != null;

  /// Default corner radius defined by the specific brand implementation.
  @protected
  double get defaultBorderRadius => 4.0;

  /// Subclasses implement this method to render their branded content (logos, text, badges).
  @protected
  Widget buildButtonContent(BuildContext context);

  /// Subclasses implement this method to return the active color palette.
  @protected
  PayButtonColors resolveColors(BuildContext context);

  /// Resolves the effective [TextStyle] for button text labels.
  ///
  /// Combines brand-specified typographic metrics with user-configured
  /// [fontFamily], [fontFamilyFallback], and [textStyle] overrides.
  @protected
  TextStyle resolveTextStyle({
    required Color textColor,
    required double fontSize,
    required FontWeight fontWeight,
    double letterSpacing = -0.2,
    FontStyle fontStyle = FontStyle.normal,
    required List<String> defaultFontFamilyFallback,
  }) {
    final baseStyle = TextStyle(
      color: textColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      letterSpacing: letterSpacing,
      fontFamily: fontFamily,
      fontFamilyFallback: fontFamilyFallback ??
          (fontFamily == null ? defaultFontFamilyFallback : null),
    );
    return textStyle != null ? baseStyle.merge(textStyle) : baseStyle;
  }

  @override
  Widget build(BuildContext context) {
    final colors = resolveColors(context);
    final effectiveRadius = BorderRadius.circular(borderRadius ?? defaultBorderRadius);

    Widget button = SizedBox(
      height: height,
      width: width,
      child: Material(
        color: isInteractive
            ? colors.backgroundColor
            : colors.disabledBackgroundColor,
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: effectiveRadius,
          side: colors.borderColor != null
              ? BorderSide(color: colors.borderColor!, width: colors.borderWidth)
              : BorderSide.none,
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: isInteractive ? onPressed : null,
          splashColor: colors.splashColor,
          highlightColor: colors.highlightColor,
          child: Center(
            child: isLoading
                ? SizedBox(
                    width: 22,
                    height: 22,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.5,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        isInteractive
                            ? colors.progressColor
                            : colors.disabledProgressColor,
                      ),
                    ),
                  )
                : buildButtonContent(context),
          ),
        ),
      ),
    );

    if (margin != null) {
      button = Padding(padding: margin!, child: button);
    }

    return Semantics(
      button: true,
      enabled: isInteractive,
      label: semanticLabel,
      child: button,
    );
  }
}
