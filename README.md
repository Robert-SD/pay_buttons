# pay_buttons

[![pub package](https://img.shields.io/badge/pub-v0.0.1-blue.svg)](https://pub.dev)
[![license](https://img.shields.io/badge/license-MIT-green.svg)](https://github.com/Robert-SD/pay_buttons/blob/main/LICENSE)
[![Live Web Demo](https://img.shields.io/badge/demo-live%20web-blue?logo=googlechrome&style=flat-square)](https://robert-sd.github.io/pay_buttons/)

A lightweight, brand-compliant, cross-platform Flutter package providing beautiful, ready-to-use payment buttons for modern e-commerce checkouts.

Built with clean vector graphics, smooth 120 FPS rendering, accessibility semantics out of the box, and careful adherence to official provider brand guidelines.

> 🌐 **Live Web Component Catalog**: Test and interact with the payment buttons directly in your browser at **[robert-sd.github.io/pay_buttons](https://robert-sd.github.io/pay_buttons/)**.

<p align="center">
  <a href="https://robert-sd.github.io/pay_buttons/">
    <img src="doc/assets/preview.png" alt="Pay Buttons Web Catalog Demo" width="680" />
  </a>
  <br />
  <sub>👉 <em>Click image above to open the live interactive demo in your browser</em></sub>
</p>

---

## Supported Buttons

* **Apple Pay**: Native `PKPaymentButton` on iOS via `package:pay`, and official Apple Pay JS SDK on web.
* **Google Pay**: Native Google Pay on Android via `package:pay`, and official Google Pay JS SDK on web.
* **PayPal & PayPal Pay Later**: Official vector branding (`gold`, `blue`, `black`, `white`, `silver`).
* **Klarna**: Official vector branding (`pink`, `black`, `white`).
* **Shop Pay**: Official Shopify checkout branding (`purple`, `black`, `white`).
* **Afterpay / Clearpay**: Auto-switching branding (Afterpay in US/AU/NZ/CA, Clearpay in UK/EU) (`mint`, `black`, `white`).
* **Wero**: European Payments Initiative payment standard (`yellow`, `black`, `white`).
* **iDEAL | Wero**: Dutch online banking standard migrating to Wero (`yellow`, `black`, `white`, `lightGray`).
* **BLIK**: Polish mobile payment standard (`black`, `white`).
* **TWINT**: Swiss mobile payment standard (`black`, `white`).
* **Bancontact**: Belgian electronic payment standard (`white`, `blue`).
* **Bizum**: Spanish instant account payment standard (`white`, `darkTeal`).
* **Pix**: Brazilian instant payment system by Banco Central do Brasil (`teal`, `white`, `black`).
* **Boleto Bancário**: Brazilian barcode bank slip checkout (`white`, `black`, `lightGray`).
* **OXXO**: Mexican voucher & digital payment standard (`red`, `white`, `yellow`).
* **Alipay**: Digital payment wallet standard (`blue`, `white`).
* **WeChat Pay**: Mobile payment ecosystem standard (`green`, `white`).
* **PayNow**: Singapore instant funds transfer standard (`purple`, `magenta`, `white`).
* **PromptPay**: Thailand national instant payment standard (`blue`, `white`, `black`).
* **UPI**: India national instant real-time payments standard by NPCI (`white`, `black`, `orange`, `navy`).

---

## Quick Start

### Apple Pay (via `pay` package & Web JS SDK)

Renders native `PKPaymentButton` on iOS via `package:pay`, or the official Apple Pay JS SDK `<apple-pay-button>` in supporting web browsers.

```dart
ApplePayButton(
  onPressed: () => handleApplePay(),
  color: ApplePayColor.black,
  type: ApplePayType.buy, // "Buy with Apple Pay"
)

// Optionally gate visibility when Apple Pay is unavailable
ApplePayButton(
  userCanPay: isApplePayAvailable,
  onPressed: () => handleApplePay(),
)
```

> [!NOTE]
> Apple's Human Interface Guidelines require using Apple's official controls (`PKPaymentButton` on iOS and the Web JS SDK).
> On unsupported platforms (such as Android or desktop), `ApplePayButton` renders an empty box to comply with Apple guidelines.

### Google Pay (via `pay` package & Web JS SDK)

Renders native Google Pay controls on Android via `package:pay` (when `paymentConfiguration` is provided), or the official Google Pay JS SDK button element on web.

```dart
GooglePayButton(
  onPressed: () => handleGooglePay(),
  color: GooglePayColor.black,
  shape: GooglePayShape.pill,
  text: 'Buy with', // maps to buy, checkout, donate, pay, order, etc.
  paymentConfiguration: paymentConfig, // For native Android package:pay
)
```

> [!NOTE]
> Google's Brand Guidelines require using Google's official controls.
> On unsupported platforms (such as iOS or desktop without web), `GooglePayButton` renders an empty box to comply with Google guidelines.

### PayPal & PayPal Pay Later

```dart
PayPalButton(
  onPressed: () => handlePayPalCheckout(),
  text: 'Checkout', // Optional custom text, defaults to null (logo only)
  color: PayPalColor.gold,
  shape: PayPalShape.pill,
)

PayPalPayLaterButton(
  onPressed: () => handlePayPalPayLater(),
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

### Wero

```dart
WeroButton(
  onPressed: () => handleWero(),
  text: 'Pay with',
  color: WeroColor.yellow,
  shape: WeroShape.rounded,
)
```

### iDEAL | Wero

```dart
IdealButton(
  onPressed: () => handleIdeal(),
  text: 'Betaal met',
  color: IdealColor.yellow,
  shape: IdealShape.rounded,
)
```

### BLIK

```dart
BlikButton(
  onPressed: () => handleBlik(),
  text: 'Zapłać z',
  color: BlikColor.black,
  shape: BlikShape.rounded,
)
```

### TWINT

```dart
TwintButton(
  onPressed: () => handleTwint(),
  text: 'Bezahlen mit',
  color: TwintColor.black,
  shape: TwintShape.rounded,
)
```

### Bancontact

```dart
BancontactButton(
  onPressed: () => handleBancontact(),
  text: 'Betaal met',
  color: BancontactColor.white,
  shape: BancontactShape.rounded,
)
```

### Bizum

```dart
BizumButton(
  onPressed: () => handleBizum(),
  text: 'Pagar con',
  color: BizumColor.white,
  shape: BizumShape.rounded,
)
```

### Pix

```dart
PixButton(
  onPressed: () => handlePix(),
  text: 'Pagar com',
  color: PixColor.teal,
  shape: PixShape.rounded,
)
```

### Boleto Bancário

```dart
BoletoButton(
  onPressed: () => handleBoleto(),
  text: 'Pagar via',
  color: BoletoColor.white,
  shape: BoletoShape.rounded,
)
```

### OXXO

```dart
OxxoButton(
  onPressed: () => handleOxxo(),
  text: 'Pagar con',
  color: OxxoColor.red,
  shape: OxxoShape.rounded,
)
```

### Alipay

```dart
AlipayButton(
  onPressed: () => handleAlipay(),
  text: 'Pay with',
  color: AlipayColor.blue,
  shape: AlipayShape.rounded,
)
```

### WeChat Pay

```dart
WeChatPayButton(
  onPressed: () => handleWeChatPay(),
  text: 'Pay with',
  color: WeChatPayColor.green,
  shape: WeChatPayShape.rounded,
)
```

### PayNow

```dart
PayNowButton(
  onPressed: () => handlePayNow(),
  text: 'Pay with',
  color: PayNowColor.purple,
  shape: PayNowShape.rounded,
)
```

### PromptPay

```dart
PromptPayButton(
  onPressed: () => handlePromptPay(),
  text: 'Pay with',
  color: PromptPayColor.blue,
  shape: PromptPayShape.rounded,
)
```

### UPI

```dart
UpiButton(
  onPressed: () => handleUpi(),
  text: 'Pay with', // Supports English or Hindi (e.g. 'भुगतान करें')
  color: UpiColor.white,
  shape: UpiShape.rounded,
)
```

---

## Typography & Custom Fonts (MIT Compliant)

All payment buttons support custom typography out of the box while remaining **100% compliant with the MIT open-source license**.

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

---

## Legal & Trademark Disclaimers

### 1. Non-Affiliation
This package is an independent open-source library and is **not affiliated with, authorized, maintained, sponsored, or endorsed by PayPal, Inc.**, Klarna Bank AB, Apple Inc., Google LLC, or any other payment provider.

### 2. Nominative Fair Use
All trademarks, logos, and service marks displayed in this package belong to their respective owners. They are used solely under the doctrine of **nominative fair use** to identify the payment services accepted by merchants and to assist developers in building brand-compliant checkout buttons.

### 3. Open Source Licensure
The vector paths used to render logos are derived from official open-source distributions including [`@paypal/sdk-logos`](https://github.com/paypal/paypal-sdk-logos) and [`afterpay/sdk-android`](https://github.com/afterpay/sdk-android), published under the **Apache License, Version 2.0**. Braintree developer integration patterns are licensed under the **MIT License**.

See [**`LICENSE`**](https://github.com/Robert-SD/pay_buttons/blob/main/LICENSE) and [**`TRADEMARKS.md`**](https://github.com/Robert-SD/pay_buttons/blob/main/TRADEMARKS.md) for full terms.
