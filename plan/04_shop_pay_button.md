# Step 4: Shop Pay Button (Shopify)

This document specifies the design, options, and brand compliance for the **Shop Pay** button widget.

---

## 1. Shop Pay Guidelines Breakdown

Shop Pay is Shopify's accelerated checkout button, widely recognized by consumers:
- [Shop Pay Brand Assets & Guidelines](https://help.shopify.com/en/manual/payments/shop-pay/brand-assets)

### A. Supported Colors

| Color Variant | Background Hex | Logo / Text Color | Notes |
| :--- | :--- | :--- | :--- |
| **`purple`** *(Default)* | `#5A31F4` (Shop Purple) | `#FFFFFF` | Iconic primary color for Shop Pay. |
| **`black`** | `#000000` | `#FFFFFF` | For dark/minimalist merchants. |
| **`white`** | `#FFFFFF` | `#5A31F4` | Clean light theme with subtle border (`#D1D5DB`). |

### B. Supported Shapes
1. **`rounded`** *(Default)*: Subtle rounded rectangle (`borderRadius: 4.0` - `6.0`).
2. **`pill`**: Circular ends (`borderRadius: height / 2`).

### C. Button Types
1. **`standard`**: "shop" bold badge + "Pay" wordmark.
2. **`buyWith`**: "Buy with" + Shop Pay logo.

---

## 2. API Contract

```dart
enum ShopPayColor {
  purple,
  black,
  white,
}

enum ShopPayShape {
  rounded,
  pill,
}

enum ShopPayButtonType {
  standard,
  buyWith,
}

class ShopPayButton extends PayButton {
  const ShopPayButton({
    super.key,
    required super.onPressed,
    super.isLoading,
    super.enabled,
    super.width,
    super.height = 48.0,
    super.borderRadius,
    super.margin,
    super.elevation,
    this.color = ShopPayColor.purple,
    this.shape = ShopPayShape.rounded,
    this.type = ShopPayButtonType.standard,
  }) : super(
         semanticLabel: 'Pay with Shop Pay',
       );

  final ShopPayColor color;
  final ShopPayShape shape;
  final ShopPayButtonType type;

  @override
  double get defaultBorderRadius => shape == ShopPayShape.pill ? (height / 2) : 6.0;

  @override
  PayButtonColors resolveColors(BuildContext context) { ... }

  @override
  Widget buildButtonContent(BuildContext context) { ... }
}
```
