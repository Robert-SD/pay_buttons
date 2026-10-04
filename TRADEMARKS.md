# Trademarks & Legal Compliance Directory

This document provides a centralized registry of trademark notices, nominative fair use principles, brand guideline references, and open-source licenses for every payment button provided by `pay_buttons`.

---

## 1. General Legal Framework

### A. Non-Affiliation Disclaimer
`pay_buttons` is an independent open-source Flutter library developed by independent contributors. 

**This package is not affiliated with, endorsed by, sponsored by, or officially associated with any of the payment providers listed below or their respective parents, subsidiaries, or affiliates.**

All product names, logos, brand vectors, trademarks, and registered trademarks cited in this repository are the property of their respective trademark owners.

### B. Nominative Fair Use
Under international trademark law (including the US *Lanham Act § 33(b)(4)* and the *EU Trade Mark Regulation (EU) 2017/1001, Article 14*), third-party trademarks and logos may be referenced under the doctrine of **nominative fair use**:
1. **Identificatory Purpose**: The brand names and logos are used strictly to identify the specific payment service or checkout method accepted by an application or merchant.
2. **No Confusion**: The logos are not used in a manner that falsely implies endorsement, partnership, or sponsorship by the trademark owners.
3. **No Excessive Usage**: Only the official button representations necessary to facilitate checkout are used.

### C. Commercial Usage for Merchants
Payment providers intentionally publish and distribute merchant brand guidelines, SVGs, and button specifications to facilitate consumer transactions through their payment networks. Merchants and app developers integrating this package are responsible for complying with the respective provider's terms of service and merchant operating regulations.

---

## 2. Provider Legal Directory & Guidelines

### 1. PayPal & PayPal Pay Later
* **Trademark Owner**: PayPal, Inc. / PayPal Holdings, Inc.
* **Registered Trademarks**: "PayPal", the PayPal Monogram (overlapping "PP" logo), "Pay in 4", "PayPal Checkout".
* **Official Brand Guidelines**: [PayPal Button Style Guidelines](https://developer.paypal.com/docs/checkout/standard/customize/button-style/) & [PayPal Brand Central](https://brand.paypal.com/)
* **Open Source Origin of Assets**:
  * Vector geometry and paths derived from PayPal's official open-source distribution [`@paypal/sdk-logos`](https://github.com/paypal/paypal-sdk-logos), licensed under the **Apache License, Version 2.0**.
  * Mobile SDK reference patterns licensed by Braintree (a division of PayPal, Inc.) under the **MIT License**.
* **Permitted Customizations**:
  * Approved colors: Gold (`#FFC439`), Blue (`#0070BA`), Navy (`#003087`), Black (`#000000`), White (`#FFFFFF`), Silver (`#EEEEEE`).
  * Approved shapes: Pill (`borderRadius: height / 2`) and Rounded Rectangle (`borderRadius: 4.0 - 6.0`).
  * Aspect ratio of monogram and wordmark must remain undistorted.

---

### 2. Klarna
* **Trademark Owner**: Klarna Bank AB (publ)
* **Registered Trademarks**: "Klarna", the Klarna wordmark, the Klarna badge.
* **Official Brand Guidelines**: [Klarna Merchant Brand Guidelines](https://docs.klarna.com/merchant-journey/branding/design-guidelines/) & [Klarna Brand Portal](https://brand.klarna.com/)
* **Permitted Customizations**:
  * Approved colors: Klarna Pink (`#FFA8CD`), Deep Charcoal (`#0B051D`), White with border (`#FFFFFF`).
  * Approved shapes: Rounded Rectangle (`borderRadius: 5.0`) and Pill.
  * The Klarna wordmark and badge must always have appropriate clear-space protection.

---

### 3. Amazon Pay
* **Trademark Owner**: Amazon.com, Inc. or its affiliates
* **Registered Trademarks**: "Amazon", "Amazon Pay", the Amazon Smile logo.
* **Official Brand Guidelines**: [Amazon Pay Button Integration Guidelines](https://developer.amazon.com/docs/amazon-pay-checkout/button-branding.html)
* **Permitted Customizations**:
  * Approved colors: Amazon Gold/Orange (`#FF9900` / `#FFC439`), Light Gray (`#E7E9EC`), Dark Squid Ink (`#232F3E`).
  * Approved shapes: Pill and Rounded.
  * The curved Amazon smile vector must remain unaltered.

---

### 4. Shop Pay (Shopify)
* **Trademark Owner**: Shopify Inc.
* **Registered Trademarks**: "Shop", "Shop Pay", the Shop Pay logo.
* **Official Brand Guidelines**: [Shop Pay Brand Guidelines](https://help.shopify.com/en/manual/payments/shop-pay/brand-assets)
* **Permitted Customizations**:
  * Approved colors: Shop Purple (`#5A31F4`), Black (`#000000`), White (`#FFFFFF`).
  * Approved shapes: Rounded (`borderRadius: 4.0 - 6.0`) and Pill.

---

### 5. Afterpay / Clearpay
* **Trademark Owner**: Afterpay Pty Ltd / Block, Inc.
* **Registered Trademarks**: "Afterpay", "Clearpay", the continuous loop logo.
* **Official Brand Guidelines**: [Afterpay Brand Guidelines](https://developers.afterpay.com/afterpay-online/docs/brand-guidelines)
* **Permitted Customizations**:
  * Approved colors: Bondi Mint (`#B2FCE4`), Black (`#000000`), White (`#FFFFFF`).
  * Regional awareness: Must display "Afterpay" in US/Canada/Australia/NZ, and "Clearpay" in the UK and EU.

---

### 6. European Regional Champions
* **TWINT**:
  * **Trademark Owner**: TWINT AG (Switzerland)
  * **Guidelines**: [TWINT Brand Guidelines](https://www.twint.ch/en/business-customers/integration/branding/)
  * Approved colors: Black, White, TWINT Green (`#00A859`).
* **iDEAL / Wero**:
  * **Trademark Owner**: Currence iDEAL B.V. / European Payments Initiative (EPI)
  * **Guidelines**: [iDEAL Brand Specifications](https://www.ideal.nl/en/businesses/logos-and-banners/)
  * Approved colors: Magenta & Navy on white or light gray.
* **BLIK**:
  * **Trademark Owner**: Polski Standard Płatności Sp. z o.o. (PSP, Poland)
  * **Guidelines**: [BLIK Brand Standards](https://blik.com/en/for-business/materials-to-download)
  * Approved colors: Black, White with BLIK Red (`#E30613`).
* **Bancontact**:
  * **Trademark Owner**: Bancontact Payconiq Company (Belgium)
  * **Guidelines**: [Bancontact Brand Rules](https://www.bancontact.com/en/merchants)
  * Approved colors: Yellow (`#FFD200`) and Blue (`#00559F`) badge.
* **Bizum**:
  * **Trademark Owner**: Sociedad de Procedimientos de Pago S.L. (Spain)
  * **Guidelines**: [Bizum Brand Guidelines](https://bizum.es/en/brand/)
  * Approved colors: Teal (`#00B4B6`) and Dark Cyan (`#004455`).

---

## 3. Summary of Open Source Licenses Used

* **Package Code**: Distributed under the [MIT License](file:///Users/robert/Developer/AndroidStudioProjects/pay_buttons/LICENSE).
* **Vector Path Data**: Derived from official open-source repositories licensed under the **Apache License 2.0** (`@paypal/sdk-logos`) and **MIT License** (`braintree_android`).
