# Step 0: Generic PayButton Foundation

The base `PayButton` widget establishes a unified contract for all payment buttons in the package. Every specific payment button (PayPal, Klarna, Amazon Pay, etc.) extends `PayButton`.

---

## 1. Responsibilities of `PayButton`

1. **State & Interaction Management**:
   - Handles `onPressed` execution.
   - Disables taps when `enabled: false` or `isLoading: true`.
   - Renders Material ink ripple / highlight effects using provider-appropriate splash colors.
   - Shows an integrated loading spinner when `isLoading: true` while preserving button dimensions.

2. **Layout & Sizing Compliance**:
   - Guarantees minimum touch targets ($\ge 48\text{dp}$) according to WCAG 2.1 & Material / iOS guidelines.
   - Allows explicit `width` or full-width expansion (`double.infinity`).
   - Default `height` set to `48.0` with support for standard payment heights (`40.0` to `55.0`).
   - Customizable `margin` and `elevation`.

3. **Accessibility & Semantics**:
   - Wraps the button in a Flutter `Semantics` widget:
     - `button: true`
     - `enabled: isInteractive`
     - `label: semanticLabel` (e.g. "Pay with PayPal", "Checkout with Klarna")

---

## 2. Base Class Design

```dart
import 'package:flutter/material.dart';

/// Resolved color palette for a specific button theme.
class PayButtonColors {
  const PayButtonColors({
    required this.backgroundColor,
    required this.progressColor,
    this.disabledBackgroundColor = const Color(0xFFE2E2E2),
    this.borderColor,
    this.borderWidth = 1.0,
    this.splashColor,
    this.highlightColor,
  });

  final Color backgroundColor;
  final Color disabledBackgroundColor;
  final Color? borderColor;
  final double borderWidth;
  final Color progressColor;
  final Color? splashColor;
  final Color? highlightColor;
}

/// Abstract base class for all payment buttons.
abstract class PayButton extends StatelessWidget {
  const PayButton({
    super.key,
    required this.onPressed,
    this.isLoading = false,
    this.enabled = true,
    this.width,
    this.height = 48.0,
    this.borderRadius,
    this.margin,
    this.elevation = 0.0,
    this.semanticLabel,
  });

  final VoidCallback? onPressed;
  final bool isLoading;
  final bool enabled;
  final double? width;
  final double height;
  final double? borderRadius;
  final EdgeInsetsGeometry? margin;
  final double elevation;
  final String? semanticLabel;

  bool get isInteractive => enabled && !isLoading && onPressed != null;

  /// Default corner radius defined by the specific brand (e.g., pill for PayPal).
  @protected
  double get defaultBorderRadius => 4.0;

  /// Child widget containing the branded logo, monogram, and text.
  @protected
  Widget buildButtonContent(BuildContext context);

  /// Resolves the background, border, and spinner colors for current configuration.
  @protected
  PayButtonColors resolveColors(BuildContext context);

  @override
  Widget build(BuildContext context) {
    final colors = resolveColors(context);
    final effectiveRadius = BorderRadius.circular(borderRadius ?? defaultBorderRadius);

    Widget button = SizedBox(
      height: height,
      width: width,
      child: Material(
        color: isInteractive ? colors.backgroundColor : colors.disabledBackgroundColor,
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
                      valueColor: AlwaysStoppedAnimation<Color>(colors.progressColor),
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
```

---

## 3. Asset Rendering Engine

Payment buttons require crisp, high-resolution vector logos that scale cleanly to any device DPI.
- **Approach**: Pre-compiled vector paths or pure `CustomPainter` / lightweight vector rendering.
- **No external network calls**: All brand assets are bundled locally in the package.
- **Color adaptation**: SVGs / vector paths will accept tint parameters where brands require monochrome or contrast variations (e.g. white logo on black button).
