# pay_buttons

[![pub package](https://img.shields.io/badge/pub-v0.1.0-blue.svg)](https://pub.dev)
[![license](https://img.shields.io/badge/license-Apache--2.0-blue.svg)](https://github.com/Robert-SD/pay_buttons/blob/main/LICENSE)
[![Live Web Demo](https://img.shields.io/badge/demo-live%20web-blue?logo=googlechrome&style=flat-square)](https://robert-sd.github.io/pay_buttons/)

A lightweight, cross-platform Flutter package providing beautiful, ready-to-use payment buttons for
modern e-commerce checkouts.

This library acts strictly as a UI presentation layer. It does **not** process payments or handle
transaction logic. Simply wire the button's `onPressed` callback to your preferred payment processor
or gateway SDK (Adyen, Stripe, Braintree, or your backend API).

Built with clean vector graphics, smooth 120 FPS rendering, accessibility semantics out of the box,
and adherence to standard merchant checkout specifications.

> 🌐 **Live Web Component Catalog**: Test and interact with the payment buttons directly in your
> browser at **[robert-sd.github.io/pay_buttons](https://robert-sd.github.io/pay_buttons/)**.

<p align="center">
  <a href="https://robert-sd.github.io/pay_buttons/">
    <img src="doc/assets/preview.png" alt="Pay Buttons Web Catalog Demo" width="680" />
  </a>
  <br />
  <sub>👉 <em>Click image above to open the live interactive demo in your browser</em></sub>
</p>

---

## Supported Buttons

* **PayPal & PayPal Pay Later**: Vector branding (`gold`, `blue`, `black`, `white`, `silver`).
* **Klarna**: Vector branding (`pink`, `black`, `white`).
* **Afterpay / Clearpay**: Auto-switching branding (Afterpay in US/AU/NZ/CA, Clearpay in UK/EU)
  (`mint`, `black`, `white`).
* **Wero**: European Payments Initiative payment standard (`yellow`, `black`, `white`).
* **iDEAL | Wero**: Dutch online banking standard migrating to Wero (`yellow`, `black`, `white`,
  `lightGray`).
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
* **UPI**: India national instant real-time payments standard by NPCI (`white`, `black`, `orange`,
  `navy`).

---

## UI Presentation vs. Payment Processing

`pay_buttons` is purely a **UI presentation library**. It provides:

* **Brand-compliant designs**: Official brand guidelines, typography fallbacks, vector assets, and
  contour shapes.
* **Responsive layouts**: Seamless collapse between full, medium, and compact button variants based
  on available container width.
* **Interactive UI states**: Built-in loading spinners (`isLoading`), disabled styling (`enabled`),
  and Material splash effects.
* **Accessibility**: Proper WCAG 2.1 touch target heights (48dp default) and screen-reader
  semantics.

---

## Quick Start

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

## Typography & Custom Fonts

All payment buttons support custom typography out of the box while remaining **fully compatible with the Apache-2.0 license**.

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

This package is an independent open-source library and is **not affiliated with, authorized, maintained, sponsored, or endorsed** by any payment provider.

### 2. Nominative Fair Use

All trademarks, logos, and service marks displayed in this package belong to their respective owners. They are used solely under the doctrine of **nominative fair use** to identify the payment services accepted by merchants and to assist developers in building recognizable checkout buttons.

### 3. Open Source Licensure

The vector paths used for PayPal and Afterpay/Clearpay are derived from open-source distributions including [`@paypal/sdk-logos`](https://github.com/paypal/paypal-sdk-logos) and [`afterpay/sdk-android`](https://github.com/afterpay/sdk-android), published under the **Apache License, Version 2.0** (see `LICENSES/Apache-2.0.txt`).

See [**`LICENSE`**](https://github.com/Robert-SD/pay_buttons/blob/main/LICENSE) and [**`TRADEMARKS.md`**](https://github.com/Robert-SD/pay_buttons/blob/main/TRADEMARKS.md) for full terms.
