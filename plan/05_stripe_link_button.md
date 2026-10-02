# Step 5: Link by Stripe Button

This document specifies the design, options, and brand compliance for the **Link by Stripe** button widget.

---

## 1. Link by Stripe Guidelines Breakdown

Link is Stripe's accelerated 1-click checkout payment method:
- [Stripe Link Brand Guidelines](https://docs.stripe.com/link)

### A. Supported Colors

| Color Variant | Background Hex | Logo / Text Color | Notes |
| :--- | :--- | :--- | :--- |
| **`green`** *(Default)* | `#00D66F` (Link Emerald) | `#0A2540` (Stripe Navy) | Link's high-visibility signature color. |
| **`dark`** | `#0A2540` | `#00D66F` or `#FFFFFF` | Matches Stripe's dark theme palette. |
| **`white`** | `#FFFFFF` | `#0A2540` | Clean with border (`#E3E8EE`). |

### B. Supported Shapes
1. **`rounded`** *(Default)*: Subtle rounded rectangle (`borderRadius: 6.0`).
2. **`pill`**: Circular ends (`borderRadius: height / 2`).

### C. Button Types
1. **`payWithLink`** *(Default)*: "Pay with" + Link logo (curved lightning / infinity loop + "link").
2. **`logoOnly`**: Centered Link wordmark and icon.

---

## 2. API Contract

```dart
enum StripeLinkColor {
  green,
  dark,
  white,
}

enum StripeLinkShape {
  rounded,
  pill,
}

enum StripeLinkButtonType {
  payWithLink,
  logoOnly,
}

class StripeLinkButton extends PayButton {
  const StripeLinkButton({
    super.key,
    required super.onPressed,
    super.isLoading,
    super.enabled,
    super.width,
    super.height = 48.0,
    super.borderRadius,
    super.margin,
    super.elevation,
    this.color = StripeLinkColor.green,
    this.shape = StripeLinkShape.rounded,
    this.type = StripeLinkButtonType.payWithLink,
  }) : super(
         semanticLabel: 'Pay with Link',
       );

  final StripeLinkColor color;
  final StripeLinkShape shape;
  final StripeLinkButtonType type;

  @override
  double get defaultBorderRadius => shape == StripeLinkShape.pill ? (height / 2) : 6.0;

  @override
  PayButtonColors resolveColors(BuildContext context) { ... }

  @override
  Widget buildButtonContent(BuildContext context) { ... }
}
```
