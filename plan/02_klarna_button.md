# Step 2: Klarna Payment Buttons

This document specifies the design, options, and brand compliance for the **Klarna** payment button widget.

---

## 1. Klarna Brand Guidelines Breakdown

Klarna has an iconic visual brand language:
- [Klarna Design Guidelines](https://docs.klarna.com/merchant-journey/branding/design-guidelines/)

### A. Supported Colors

| Color Variant | Background Hex | Text & Logo Hex | Notes |
| :--- | :--- | :--- | :--- |
| **`pink`** *(Default)* | `#FFA8CD` (Klarna Pink) | `#0B051D` (Deep Charcoal) | Klarna's signature high-converting color. |
| **`black`** | `#0B051D` | `#FFA8CD` or `#FFFFFF` | Ideal for dark mode / minimalist checkouts. |
| **`white`** | `#FFFFFF` | `#0B051D` | Clean look; includes `#E5E5E5` 1px border. |

### B. Supported Shapes
1. **`rounded`** *(Default)*: Subtle rounded rectangle (`borderRadius: 5.0`).
2. **`pill`**: Circular ends (`borderRadius: height / 2`).

### C. Button Types
1. **`express`** *(Default)*: Klarna wordmark + "Express Checkout" or "Pay with Klarna".
2. **`payNow`**: Direct instant payment / Sofort.
3. **`payLater`**: "Pay in 30 days" / "Rechnungskauf".
4. **`sliceIt`**: "Pay in 3" / "Finanzierung".
5. **`badgeOnly`**: Centered Klarna wordmark badge.

---

## 2. API Contract

```dart
enum KlarnaColor {
  pink,
  black,
  white,
}

enum KlarnaShape {
  rounded,
  pill,
}

enum KlarnaButtonType {
  express,
  payNow,
  payLater,
  sliceIt,
  badgeOnly,
}

class KlarnaButton extends PayButton {
  const KlarnaButton({
    super.key,
    required super.onPressed,
    super.isLoading,
    super.enabled,
    super.width,
    super.height = 48.0,
    super.borderRadius,
    super.margin,
    super.elevation,
    this.color = KlarnaColor.pink,
    this.shape = KlarnaShape.rounded,
    this.type = KlarnaButtonType.express,
    this.locale,
  }) : super(
         semanticLabel: 'Pay with Klarna',
       );

  final KlarnaColor color;
  final KlarnaShape shape;
  final KlarnaButtonType type;
  final Locale? locale;

  @override
  double get defaultBorderRadius => shape == KlarnaShape.pill ? (height / 2) : 5.0;

  @override
  PayButtonColors resolveColors(BuildContext context) { ... }

  @override
  Widget buildButtonContent(BuildContext context) { ... }
}
```
