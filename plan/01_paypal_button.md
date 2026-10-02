# Step 1: PayPal Express & Pay Later Buttons

This document specifies the design, options, and brand compliance for the **PayPal** payment buttons.

---

## 1. PayPal Brand Guidelines Breakdown

PayPal maintains strict public design guidelines for merchant buttons:
- [PayPal Merchant Button Style Guidelines](https://developer.paypal.com/docs/checkout/standard/customize/button-style/)
- [PayPal Brand Central](https://brand.paypal.com/)

### A. Supported Colors

| Color Variant | Hex Code | Usage / Context | Brand Rule |
| :--- | :--- | :--- | :--- |
| **`gold`** *(Default)* | `#FFC439` | Primary PayPal button color. Highest conversion. | Dark Blue Monogram + Dark Navy wordmark. |
| **`blue`** | `#0070BA` | Alternative primary for white/light layouts. | White monogram + White wordmark. |
| **`black`** | `#000000` | Dark theme / monochrome checkouts. | White monogram + White wordmark. |
| **`white`** | `#FFFFFF` | Minimalist checkouts. Requires 1px border (`#CCCCCC`). | Standard 2-tone blue monogram & wordmark. |
| **`silver`** | `#EEEEEE` | Muted neutral backgrounds. | Standard 2-tone blue monogram & wordmark. |

### B. Supported Shapes

1. **`pill`** *(Default)*: Fully rounded circular ends (`borderRadius: height / 2`). This is PayPal's signature design.
2. **`rounded`**: Subtle rounded rectangle (`borderRadius: 4.0` - `8.0`).

### C. Button Types & Content

```
[ Pill Shape - Gold ]
(   [PP] PayPal Checkout   )

[ Pill Shape - Logo Only ]
(          [PP] PayPal          )

[ Pay Later Variant ]
(   [PP] PayPal | Später bezahlen   )
```

1. **`checkout`** *(Default)*: PayPal Logo + "Checkout" text.
2. **`pay`**: PayPal Logo + "Pay with PayPal".
3. **`buyNow`**: PayPal Logo + "Buy Now".
4. **`payLater`**: PayPal Logo + "Pay Later" (or localized "Später bezahlen", "4x sans frais").
5. **`logoOnly`**: Centered PayPal monogram + wordmark without additional action verbs.

---

## 2. API Contract

```dart
enum PayPalColor {
  gold,
  blue,
  black,
  white,
  silver,
}

enum PayPalShape {
  pill,
  rounded,
}

enum PayPalButtonType {
  checkout,
  pay,
  buyNow,
  payLater,
  logoOnly,
}

class PayPalButton extends PayButton {
  const PayPalButton({
    super.key,
    required super.onPressed,
    super.isLoading,
    super.enabled,
    super.width,
    super.height = 48.0,
    super.borderRadius,
    super.margin,
    super.elevation,
    this.color = PayPalColor.gold,
    this.shape = PayPalShape.pill,
    this.type = PayPalButtonType.checkout,
    this.locale,
  }) : super(
         semanticLabel: type == PayPalButtonType.payLater
             ? 'Pay Later with PayPal'
             : 'Checkout with PayPal',
       );

  final PayPalColor color;
  final PayPalShape shape;
  final PayPalButtonType type;
  final Locale? locale;

  @override
  double get defaultBorderRadius => shape == PayPalShape.pill ? (height / 2) : 6.0;

  @override
  PayButtonColors resolveColors(BuildContext context) { ... }

  @override
  Widget buildButtonContent(BuildContext context) { ... }
}
```

---

## 3. Dedicated `PayPalPayLaterButton`

For convenience and direct API clarity, we will provide a specialized `PayPalPayLaterButton` that inherits from `PayPalButton` with preconfigured defaults:
- Preconfigured `type: PayPalButtonType.payLater`
- Default background: `PayPalColor.white` or `PayPalColor.gold`
- Localized messaging:
  - English: "Pay in 4" or "Pay Later"
  - German: "Später bezahlen"
  - French: "4x sans frais"
  - Italian: "Paga in 3 rate"
  - Spanish: "Paga en 3 plazos"

---

## 4. Vector Asset Specifications

1. **PayPal Monogram ("PP")**:
   - Two overlapping P's in official `#003087` (Dark Navy) and `#0070BA` (Bright Blue), with `#002366` blend.
   - Monochrome white version for `black` and `blue` buttons.
2. **PayPal Wordmark ("PayPal")**:
   - Official brand vector letterforms.
3. **Minimum Safe Zone**:
   - Logo height: $0.45 \times \text{button height}$ (e.g. 22dp on a 48dp button).
   - Clear horizontal spacing between logo and supplementary text: minimum 8dp.
