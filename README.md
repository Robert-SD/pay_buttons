# pay_buttons

[![pub package](https://img.shields.io/badge/pub-v0.0.1-blue.svg)](https://pub.dev)
[![license](https://img.shields.io/badge/license-MIT-green.svg)](file:///Users/robert/Developer/AndroidStudioProjects/pay_buttons/LICENSE)
[![Live Web Demo](https://img.shields.io/badge/demo-live%20web-blue?logo=googlechrome&style=flat-square)](https://robert-sd.github.io/pay_buttons/)

A high-fidelity, brand-compliant, cross-platform Flutter package providing dedicated payment buttons for modern e-commerce checkouts.

Designed with **zero native SDK bloat**, instant 120 FPS rendering, full accessibility semantics, and strict adherence to provider brand guidelines.

> 🌐 **Live Web Component Catalog**: Test and interact with all 13 buttons directly in your browser at **[robert-sd.github.io/pay_buttons](https://robert-sd.github.io/pay_buttons/)**.

---

## Supported Buttons

* **Apple Pay**: Default logo-only or custom text prefix (`black`, `white`, `whiteOutline`), pill/rounded/rect shapes.
* **Google Pay**: Default logo-only or custom text prefix (`black`, `white`, `monochromeBlack`, `monochromeWhite`), pill/rounded/rect shapes.
* **PayPal & PayPal Pay Later**: Default logo-only or custom text (`gold`, `blue`, `black`, `white`, `silver`).
* **Amazon Pay**: Default logo-only or custom text (`gold`, `lightGray`, `darkGray`).
* **Klarna**: Default logo-only or custom text (`pink`, `black`, `white`).
* **Wero**: Europe 🇪🇺 / European Payments Initiative (`yellow`, `black`, `white`).
* **Shop Pay (Shopify)**: Default logo-only or custom text (`purple`, `black`, `white`).
* **Afterpay / Clearpay**: Default logo-only or custom text, Auto-brand switching (Afterpay in US/AU/NZ/CA, Clearpay in UK/EU), (`mint`, `black`, `white`).
* **TWINT**: Switzerland 🇨🇭 national mobile payment (`black`, `white`).
* **BLIK**: Poland 🇵🇱 mobile banking champion (`black`, `white`).
* **iDEAL**: Netherlands 🇳🇱 online banking standard (`white`, `black`).
* **Bancontact**: Belgium 🇧🇪 market leader (`white`, `blue`).
* **Bizum**: Spain 🇪🇸 instant account payment (`white`, `darkTeal`).

---

## Quick Start

### Apple Pay
```dart
ApplePayButton(
  onPressed: () => handleApplePay(),
  text: 'Buy with', // Optional custom text prefix, defaults to null (logo only)
  color: ApplePayColor.black,
  shape: ApplePayShape.pill,
)
```

### Google Pay
```dart
GooglePayButton(
  onPressed: () => handleGooglePay(),
  text: 'Buy with', // Optional custom text prefix, defaults to null (logo only)
  color: GooglePayColor.black,
  shape: GooglePayShape.pill,
)
```

### PayPal
```dart
PayPalButton(
  onPressed: () => handlePayPalCheckout(),
  text: 'Checkout', // Optional custom text, defaults to null (logo only)
  color: PayPalColor.gold,
  shape: PayPalShape.pill,
)
```

### Amazon Pay
```dart
AmazonPayButton(
  onPressed: () => handleAmazonPay(),
  text: 'Check out with',
  color: AmazonPayColor.gold,
  shape: AmazonPayShape.pill,
)
```

### Klarna
```dart
KlarnaButton(
  onPressed: () => handleKlarnaCheckout(),
  text: 'Pay with',
  color: KlarnaColor.pink,
  shape: KlarnaShape.rounded,
)
```

### Wero
```dart
WeroButton(
  onPressed: () => handleWero(),
  text: 'Pay with',
  color: WeroColor.yellow,
  shape: WeroShape.rounded,
)
```

### Shop Pay
```dart
ShopPayButton(
  onPressed: () => handleShopPay(),
  text: 'Buy with',
  color: ShopPayColor.purple,
  shape: ShopPayShape.rounded,
)
```

### Afterpay / Clearpay
```dart
AfterpayButton(
  onPressed: () => handleAfterpay(),
  text: 'Buy now with',
  brand: AfterpayBrand.afterpay, // or AfterpayBrand.clearpay
  color: AfterpayColor.mint,
  shape: AfterpayShape.rounded,
)
```

### Regional Champions

```dart
// Switzerland
TwintButton(
  text: 'Bezahlen mit',
  onPressed: () => handleTwint(),
)

// Poland
BlikButton(
  text: 'Zapłać z',
  onPressed: () => handleBlik(),
)

// Netherlands
IdealButton(
  text: 'Betaal met',
  onPressed: () => handleIdeal(),
)

// Belgium
BancontactButton(
  text: 'Betaal met',
  onPressed: () => handleBancontact(),
)

// Spain
BizumButton(
  text: 'Pagar con',
  onPressed: () => handleBizum(),
)
```

---

## Typography & Custom Fonts (MIT Compliant)

All payment buttons support custom typography out of the box while remaining **100% compliant with the MIT open-source license**.

### MIT License Compliance Strategy
Proprietary corporate typefaces (such as *PayPal Pro*, *Klarna Text*, or *Amazon Ember*) cannot legally be redistributed as binary font files (`.ttf`, `.otf`, `.woff`) inside an open-source MIT package. 

Instead, `pay_buttons` implements a clean, compliant typography strategy:
1. **Official Brand Fallback Chains (`PayButtonFonts`)**: Built-in nominative fallback chains representing each brand's official font family that fall back gracefully to clean system neo-grotesque typefaces (such as `-apple-system`, `BlinkMacSystemFont`, `Roboto`, `Segoe UI`, `Helvetica Neue`, and `Inter`).
2. **First-Party or Custom Fonts**: If your app bundles licensed brand font assets (declared in your app's `pubspec.yaml`), pass `fontFamily: 'Klarna Text'` to use it directly.
3. **Google Fonts Support**: Provide any open-source web font via the standard Flutter [`google_fonts`](https://pub.dev/packages/google_fonts) package using the `textStyle` parameter.

### Examples

#### 1. Custom `fontFamily` & Fallbacks
```dart
KlarnaButton(
  text: 'Pay in 4 with',
  fontFamily: 'MyCustomFont',
  fontFamilyFallback: PayButtonFonts.klarna,
  onPressed: () => handleCheckout(),
)
```

#### 2. Using `GoogleFonts` with `textStyle`
```dart
import 'package:google_fonts/google_fonts.dart';

PayPalButton(
  text: 'Checkout',
  textStyle: GoogleFonts.inter(
    fontWeight: FontWeight.w600,
    letterSpacing: -0.2,
  ),
  onPressed: () => handleCheckout(),
)
```

#### 3. Brand Font Stacks Reference
| Button | Primary Brand Stack (`PayButtonFonts.*`) |
| :--- | :--- |
| **Apple Pay** | `-apple-system`, `BlinkMacSystemFont`, `SF Pro Text`, `SF Pro Display`, system sans |
| **Google Pay** | `Google Sans`, `Product Sans`, `Roboto`, system sans |
| **PayPal** | `PayPal Pro`, `PayPal Open`, `PayPal Sans`, system neo-grotesque |
| **Amazon Pay** | `Amazon Ember`, system neo-grotesque |
| **Klarna** | `Klarna Text`, `Klarna Headline`, system neo-grotesque |
| **Wero** | `GT Walsheim`, `GT Walsheim Pro`, `Inter`, `Roboto`, system sans |
| **Shop Pay** | `Shopify Sans`, system neo-grotesque |
| **Afterpay** | `Youth`, `Cash Sans Mono`, `Italian Plate No. 2`, system sans |
| **TWINT** | `Neue Haas Grotesk`, `Helvetica Neue`, `Arial`, system sans |
| **BLIK** | `Lato`, `Montserrat`, `Roboto`, system sans |
| **iDEAL** | `Inter`, `Roboto`, `Helvetica Neue`, system sans |
| **Bancontact** | `Gotham`, `Montserrat`, `Inter`, system sans |
| **Bizum** | `Omnes`, `Nunito`, `Roboto`, system sans |

---

## Legal & Trademark Disclaimers

### 1. Non-Affiliation
This package is an independent open-source library and is **not affiliated with, authorized, maintained, sponsored, or endorsed by PayPal, Inc.**, Klarna Bank AB, Amazon.com, Inc., or any other payment provider.

### 2. Nominative Fair Use
All trademarks, logos, and service marks displayed in this package belong to their respective owners. They are used solely under the doctrine of **nominative fair use** to identify the payment services accepted by merchants and to assist developers in building brand-compliant checkout buttons.

### 3. Open Source Licensure
The vector paths used to render the PayPal logo are derived from PayPal's official open-source repository [`@paypal/sdk-logos`](https://github.com/paypal/paypal-sdk-logos), published by PayPal under the **Apache License, Version 2.0**. Braintree developer components are licensed under the **MIT License**.

See [**`LICENSE`**](file:///Users/robert/Developer/AndroidStudioProjects/pay_buttons/LICENSE) and [**`TRADEMARKS.md`**](file:///Users/robert/Developer/AndroidStudioProjects/pay_buttons/TRADEMARKS.md) for full terms.
