# pay_buttons

[![pub package](https://img.shields.io/badge/pub-v0.0.1-blue.svg)](https://pub.dev)
[![license](https://img.shields.io/badge/license-MIT-green.svg)](file:///Users/robert/Developer/AndroidStudioProjects/pay_buttons/LICENSE)

A high-fidelity, brand-compliant, cross-platform Flutter package providing dedicated payment buttons for modern e-commerce checkouts.

Designed with **zero native SDK bloat**, instant 120 FPS rendering, full accessibility semantics, and strict adherence to provider brand guidelines.

---

## Supported Buttons

* **PayPal & PayPal Pay Later**: Default logo-only or custom text (`gold`, `blue`, `black`, `white`, `silver`).
* **Klarna**: Default logo-only or custom text (`pink`, `black`, `white`).
* **Amazon Pay**: Default logo-only or custom text (`gold`, `lightGray`, `darkGray`).
* **Shop Pay (Shopify)**: Default logo-only or custom text (`purple`, `black`, `white`).
* **Link by Stripe**: Default logo-only or custom text (`green`, `navy`, `white`).
* **Afterpay / Clearpay**: Default logo-only or custom text, Auto-brand switching (Afterpay in US/AU/NZ/CA, Clearpay in UK/EU), (`mint`, `black`, `white`).
* **European Regional Champions**:
  * **TWINT** (Switzerland 🇨🇭) - `TwintButton` (`black`, `white`)
  * **iDEAL** (Netherlands 🇳🇱) - `IdealButton` (`white`, `black`)
  * **BLIK** (Poland 🇵🇱) - `BlikButton` (`black`, `white`)
  * **Bancontact** (Belgium 🇧🇪) - `BancontactButton` (`white`, `blue`)
  * **Bizum** (Spain 🇪🇸) - `BizumButton` (`white`, `darkTeal`)

---

## Quick Start

### PayPal
```dart
PayPalButton(
  onPressed: () => handlePayPalCheckout(),
  text: 'Checkout', // Optional custom text, defaults to null (logo only)
  color: PayPalColor.gold,
  shape: PayPalShape.pill,
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

### Amazon Pay
```dart
AmazonPayButton(
  onPressed: () => handleAmazonPay(),
  text: 'Check out with',
  color: AmazonPayColor.gold,
  shape: AmazonPayShape.pill,
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

### Link by Stripe
```dart
StripeLinkButton(
  onPressed: () => handleStripeLink(),
  text: 'Pay with',
  color: StripeLinkColor.green,
  shape: StripeLinkShape.rounded,
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

### European Regional Champions
```dart
// Switzerland
TwintButton(
  text: 'Bezahlen mit',
  onPressed: () => handleTwint(),
)

// Netherlands
IdealButton(
  text: 'Betaal met',
  onPressed: () => handleIdeal(),
)

// Poland
BlikButton(
  text: 'Zapłać z',
  onPressed: () => handleBlik(),
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

## Legal & Trademark Disclaimers

### 1. Non-Affiliation
This package is an independent open-source library and is **not affiliated with, authorized, maintained, sponsored, or endorsed by PayPal, Inc.**, Klarna Bank AB, Amazon.com, Inc., or any other payment provider.

### 2. Nominative Fair Use
All trademarks, logos, and service marks displayed in this package belong to their respective owners. They are used solely under the doctrine of **nominative fair use** to identify the payment services accepted by merchants and to assist developers in building brand-compliant checkout buttons.

### 3. Open Source Licensure
The vector paths used to render the PayPal logo are derived from PayPal's official open-source repository [`@paypal/sdk-logos`](https://github.com/paypal/paypal-sdk-logos), published by PayPal under the **Apache License, Version 2.0**. Braintree developer components are licensed under the **MIT License**.

See [**`LICENSE`**](file:///Users/robert/Developer/AndroidStudioProjects/pay_buttons/LICENSE) and [**`TRADEMARKS.md`**](file:///Users/robert/Developer/AndroidStudioProjects/pay_buttons/TRADEMARKS.md) for full terms.
