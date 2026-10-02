# pay_buttons

[![pub package](https://img.shields.io/badge/pub-v0.0.1-blue.svg)](https://pub.dev)
[![license](https://img.shields.io/badge/license-MIT-green.svg)](file:///Users/robert/Developer/AndroidStudioProjects/pay_buttons/LICENSE)

A high-fidelity, brand-compliant, cross-platform Flutter package providing dedicated payment buttons for modern e-commerce checkouts.

Designed with **zero native SDK bloat**, instant 120 FPS rendering, full accessibility semantics, and strict adherence to provider brand guidelines.

---

## Supported Buttons

* **PayPal Express**: Checkout, Pay with PayPal, Buy Now, Logo Only (`gold`, `blue`, `black`, `white`, `silver`).
* **PayPal Pay Later**: Dedicated installment button with localized statutory credit disclaimers.
* *Upcoming*: Klarna, Amazon Pay, Shop Pay, Link by Stripe, Afterpay / Clearpay, TWINT, iDEAL.

---

## Usage

### PayPal Express Button

```dart
import 'package:flutter/material.dart';
import 'package:pay_buttons/pay_buttons.dart';

PayPalButton(
  onPressed: () {
    // Initiate your PayPal checkout flow (REST API, Braintree, Webview, etc.)
  },
  color: PayPalColor.gold,
  shape: PayPalShape.pill,
  type: PayPalButtonType.checkout,
)
```

### PayPal Pay Later with Statutory Credit Notice

```dart
PayPalPayLaterButton(
  onPressed: () {
    // Initiate installment checkout
  },
  color: PayPalColor.white,
  locale: const Locale('de'),
  showCreditNotice: true, // Attaches statutory credit notice
  onCreditNoticeTapped: () => openTerms(),
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
