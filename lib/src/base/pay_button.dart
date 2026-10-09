import 'package:flutter/material.dart';

import 'pay_button_colors.dart';
import 'pay_button_shape.dart';
import 'pay_button_variant.dart';

export 'pay_button_shape.dart';
export 'pay_button_variant.dart';

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
    this.shape = PayButtonShape.rounded,
    this.variant = PayButtonVariant.responsive,
    this.textPosition = PayButtonTextPosition.leading,
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
  /// If null and [fontFamily] is null, default fallbacks are used.
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
  /// If null, [defaultBorderRadius] derived from [shape] is used.
  final double? borderRadius;

  /// Optional outer margin around the button.
  final EdgeInsetsGeometry? margin;

  /// Elevation of the button. Defaults to `0.0` (flat) per modern payment design guidelines.
  final double elevation;

  /// Accessibility label read by screen readers.
  final String? semanticLabel;

  /// The contour shape of the button. Defaults to [PayButtonShape.rounded].
  final PayButtonShape shape;

  /// The visual layout variant of the button. Defaults to [PayButtonVariant.responsive].
  final PayButtonVariant variant;

  /// The placement of [text] relative to the brand mark. Defaults to [PayButtonTextPosition.leading].
  final PayButtonTextPosition textPosition;

  /// Breakpoint width below which a [PayButtonVariant.responsive] button collapses to [PayButtonVariant.compact].
  @protected
  double get compactBreakpoint => 84.0;

  /// Breakpoint width below which a [PayButtonVariant.responsive] button collapses to [PayButtonVariant.medium].
  @protected
  double get mediumBreakpoint => 200.0;

  /// Whether the button can currently be tapped.
  bool get isInteractive => enabled && !isLoading && onPressed != null;

  /// Corner radius applied when [shape] is [PayButtonShape.rounded].
  ///
  /// Subclasses can override this to reflect official brand guidelines
  /// (e.g. 5.0 dp for Klarna, 6.0 dp for PayPal).
  @protected
  double get roundedBorderRadius => 4.0;

  /// Default corner radius resolved from [shape] and [height].
  @protected
  @visibleForTesting
  double get defaultBorderRadius => switch (shape) {
    PayButtonShape.pill => height / 2,
    PayButtonShape.rounded => roundedBorderRadius,
    PayButtonShape.rect => 0.0,
  };

  /// Horizontal spacing between the brand emblem/logo and the text label.
  @protected
  double get textGap => 8.0;

  /// Default font weight for button label typography.
  @protected
  FontWeight get labelFontWeight => FontWeight.w600;

  /// Default letter spacing for button label typography.
  @protected
  double get labelLetterSpacing => -0.1;

  /// Standard font family fallback list for this brand.
  @protected
  List<String> get defaultFontFamilyFallback => const [];

  /// Standard responsive font size scaling for button labels.
  /// Scaled proportionally to button height (0.31x) and clamped to [13.0, 16.0]sp.
  @protected
  double get labelFontSize => (height * 0.31).clamp(13.0, 16.0);

  /// Standard responsive logo height for standard medium variant.
  /// Scaled to 0.44x button height and clamped to [18.0, 24.0]dp.
  @protected
  double get mediumLogoHeight => (height * 0.44).clamp(18.0, 24.0);

  /// Standard responsive mark height for compact variant.
  /// Scaled to 0.48x button height and clamped to [20.0, 26.0]dp.
  @protected
  double get compactMarkHeight => (height * 0.48).clamp(20.0, 26.0);

  /// Subclasses implement this method to render their branded content (logos, text, badges).
  @protected
  Widget buildButtonContent(BuildContext context) {
    switch (variant) {
      case PayButtonVariant.compact:
        return buildCompactContent(context);
      case PayButtonVariant.medium:
        return buildMediumContent(context);
      case PayButtonVariant.full:
        return buildFullContent(context);
      case PayButtonVariant.responsive:
        return LayoutBuilder(
          builder: (context, constraints) {
            final availableWidth = constraints.maxWidth;
            if (availableWidth < compactBreakpoint) {
              return buildCompactContent(context);
            }
            if (availableWidth <= mediumBreakpoint ||
                text == null ||
                text!.isEmpty) {
              return buildMediumContent(context);
            }
            return buildFullContent(context);
          },
        );
    }
  }

  /// Subclasses implement this to render the compact mark, icon, or monogram.
  @protected
  Widget buildCompactContent(BuildContext context) =>
      buildMediumContent(context);

  /// Subclasses implement this to render the standard brand logo or wordmark.
  @protected
  Widget buildMediumContent(BuildContext context) => const SizedBox.shrink();

  /// Subclasses implement this to render the full variant combining text and brand logo.
  @protected
  Widget buildFullContent(BuildContext context) {
    final medium = buildMediumContent(context);
    if (text == null || text!.isEmpty) {
      return medium;
    }

    final colors = resolveColors(context);
    final effectiveTextStyle = resolveTextStyle(
      textColor: colors.textColor,
      fontSize: labelFontSize,
      fontWeight: labelFontWeight,
      letterSpacing: labelLetterSpacing,
      defaultFontFamilyFallback: defaultFontFamilyFallback,
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
          ? [medium, SizedBox(width: textGap), textWidget]
          : [textWidget, SizedBox(width: textGap), medium],
    );
  }

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
    required double letterSpacing,
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
      fontFamilyFallback:
          fontFamilyFallback ??
          (fontFamily == null ? defaultFontFamilyFallback : null),
    );
    return textStyle != null ? baseStyle.merge(textStyle) : baseStyle;
  }

  @override
  Widget build(BuildContext context) {
    final colors = resolveColors(context);
    final effectiveRadius = BorderRadius.circular(
      borderRadius ?? defaultBorderRadius,
    );

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
              ? BorderSide(
                  color: colors.borderColor!,
                  width: colors.borderWidth,
                )
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
