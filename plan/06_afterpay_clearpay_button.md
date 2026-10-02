# Step 6: Afterpay / Clearpay Button

This document specifies the design, options, and brand compliance for the **Afterpay / Clearpay** button widget.

---

## 1. Afterpay / Clearpay Guidelines Breakdown

Afterpay (branded as Clearpay in the UK and parts of Europe) is a major global Buy Now Pay Later service owned by Block/Square:
- [Afterpay Brand Guidelines](https://developers.afterpay.com/afterpay-online/docs/brand-guidelines)

### A. Supported Colors

| Color Variant | Background Hex | Logo / Text Color | Notes |
| :--- | :--- | :--- | :--- |
| **`mint`** *(Default)* | `#B2FCE4` (Bondi Mint) | `#000000` (Black) | Iconic primary color for Afterpay. |
| **`black`** | `#000000` | `#B2FCE4` or `#FFFFFF` | High-contrast variant. |
| **`white`** | `#FFFFFF` | `#000000` | Clean with border (`#D1D5DB`). |

### B. Supported Shapes
1. **`rounded`** *(Default)*: Subtle rounded rectangle (`borderRadius: 6.0`).
2. **`pill`**: Circular ends (`borderRadius: height / 2`).

### C. Branding Adaptation (Afterpay vs Clearpay)
- In the UK / EU, merchants frequently require the **Clearpay** wordmark and loop.
- The button will support an enum or auto-detection via `locale`:
  - `AfterpayVariant.afterpay`
  - `AfterpayVariant.clearpay`

---

## 2. API Contract

```dart
enum AfterpayColor {
  mint,
  black,
  white,
}

enum AfterpayShape {
  rounded,
  pill,
}

enum AfterpayBrand {
  afterpay,
  clearpay,
}

enum AfterpayButtonType {
  buyNow,
  payWith,
  logoOnly,
}

class AfterpayButton extends PayButton {
  const AfterpayButton({
    super.key,
    required super.onPressed,
    super.isLoading,
    super.enabled,
    super.width,
    super.height = 48.0,
    super.borderRadius,
    super.margin,
    super.elevation,
    this.color = AfterpayColor.mint,
    this.shape = AfterpayShape.rounded,
    this.brand = AfterpayBrand.afterpay,
    this.type = AfterpayButtonType.buyNow,
  }) : super(
         semanticLabel: brand == AfterpayBrand.clearpay
             ? 'Pay with Clearpay'
             : 'Pay with Afterpay',
       );

  final AfterpayColor color;
  final AfterpayShape shape;
  final AfterpayBrand brand;
  final AfterpayButtonType type;

  @override
  double get defaultBorderRadius => shape == AfterpayShape.pill ? (height / 2) : 6.0;

  @override
  PayButtonColors resolveColors(BuildContext context) { ... }

  @override
  Widget buildButtonContent(BuildContext context) { ... }
}
```
