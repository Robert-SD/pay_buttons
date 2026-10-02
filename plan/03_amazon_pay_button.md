# Step 3: Amazon Pay Button

This document specifies the design, options, and brand compliance for the **Amazon Pay** button widget.

---

## 1. Amazon Pay Guidelines Breakdown

Amazon Pay provides clear button design and trademark rules:
- [Amazon Pay Button Integration Guidelines](https://developer.amazon.com/docs/amazon-pay-checkout/button-branding.html)

### A. Supported Colors

| Color Variant | Background Hex | Logo / Text Color | Notes |
| :--- | :--- | :--- | :--- |
| **`gold`** *(Default)* | `#FF9900` / `#FFC439` | `#111111` / Amazon Smile | Primary official Amazon Pay color. |
| **`lightGray`** | `#E7E9EC` | `#111111` | Subtle alternative. |
| **`darkGray`** | `#232F3E` (Squid Ink) | `#FFFFFF` | For dark/contrast themes. |

### B. Supported Shapes
1. **`pill`** *(Default)*: Signature Amazon checkout look (`borderRadius: height / 2`).
2. **`rounded`**: Standard button (`borderRadius: 4.0`).

### C. Button Content
1. Amazon Pay logo (Wordmark "amazon" with orange curved smile + "pay").
2. Optional action prefix: "Checkout with" or "Pay with".

---

## 2. API Contract

```dart
enum AmazonPayColor {
  gold,
  lightGray,
  darkGray,
}

enum AmazonPayShape {
  pill,
  rounded,
}

class AmazonPayButton extends PayButton {
  const AmazonPayButton({
    super.key,
    required super.onPressed,
    super.isLoading,
    super.enabled,
    super.width,
    super.height = 48.0,
    super.borderRadius,
    super.margin,
    super.elevation,
    this.color = AmazonPayColor.gold,
    this.shape = AmazonPayShape.pill,
  }) : super(
         semanticLabel: 'Check out with Amazon Pay',
       );

  final AmazonPayColor color;
  final AmazonPayShape shape;

  @override
  double get defaultBorderRadius => shape == AmazonPayShape.pill ? (height / 2) : 4.0;

  @override
  PayButtonColors resolveColors(BuildContext context) { ... }

  @override
  Widget buildButtonContent(BuildContext context) { ... }
}
```
