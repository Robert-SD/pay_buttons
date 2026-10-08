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

### 3. Shop Pay (Shopify)
* **Trademark Owner**: Shopify Inc.
* **Registered Trademarks**: "Shop", "Shop Pay", the Shop Pay logo.
* **Official Brand Guidelines**: [Shop Pay Brand Guidelines](https://help.shopify.com/en/manual/payments/shop-pay/brand-assets)
* **Brand Integrity**:
  * Unified lockup: The "shop" wordmark and "Pay" pill badge are rendered together as a unified vector lockup across all button variants (including compact mode), honoring Shopify's requirement that the mark never be separated.
* **Permitted Customizations**:
  * Approved colors: Shop Purple (`#5A31F4`), Black (`#000000`), White (`#FFFFFF`).
  * Approved shapes: Rounded (`borderRadius: 4.0 - 6.0`) and Pill.

---

### 4. Afterpay / Clearpay
* **Trademark Owner**: Afterpay Pty Ltd / Block, Inc.
* **Registered Trademarks**: "Afterpay", "Clearpay", the continuous loop logo.
* **Official Brand Guidelines**: [Afterpay Brand Guidelines](https://developers.afterpay.com/afterpay-online/docs/brand-guidelines)
* **Open Source Origin of Assets**:
  * Official vector lockups (`afterpay_lockup.xml` and `clearpay_lockup.xml`) derived directly from Block's official [`afterpay/sdk-android`](https://github.com/afterpay/sdk-android) repository under the Apache-2.0 License, eliminating font substitution risks.
* **Permitted Customizations**:
  * Approved colors: Bondi Mint (`#B2FCE4`), Black (`#000000`), White (`#FFFFFF`).
  * Regional awareness: Must display "Afterpay" in US/Canada/Australia/NZ, and "Clearpay" in the UK and EU.

---

### 5. European Regional Champions
* **Wero**:
  * **Trademark Owner**: EPI Company SE (European Payments Initiative)
  * **Guidelines**: [Wero Checkout Brand Guidelines](https://wero-wallet.eu/brand-guidelines/checkout) & [Wero Brand Portal](https://brand.epicompany.eu/)
  * Approved colors: Wero Yellow (`#FFF48D`), Wero Black (`#1D1C1C`), White (`#FFFFFF`).
  * Approved shapes: Rounded Card (`borderRadius: 6.0`, official checkout card radius) and Pill.
* **TWINT**:
  * **Trademark Owner**: TWINT AG (Switzerland)
  * **Guidelines**: [TWINT Brand Guidelines](https://www.twint.ch/en/business-customers/integration/branding/)
  * Approved colors: Black, White, TWINT Green (`#00A859`).
* **iDEAL / Wero Migration**:
  * **Trademark Owner**: Currence iDEAL B.V. / EPI Company SE (European Payments Initiative)
  * **Guidelines & Migration Specifications**: [iDEAL naar Wero Portal](https://ideal.nl/naar-wero) & [Official iDEAL-Wero Cloudfront Asset Distribution](https://d1twnm33rljaon.cloudfront.net/Logos/iDEAL-Wero/)
  * **Co-Branding Transition (2026–2027)**: Mandated co-branded horizontal lockup combining the iDEAL emblem badge with the Wero wordmark.
  * Approved colors: Wero Yellow (`#FFF48D`), Darkmode / Black (`#1D1C1C`), White (`#FFFFFF`), Light Gray (`#F5F5F5`).
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

### 6. Latin American Champions
* **Pix**:
  * **Trademark Owner**: Banco Central do Brasil (BCB)
  * **Guidelines**: [Manual de Uso da Marca Pix](https://www.bcb.gov.br/estabilidadefinanceira/pagamentosinstantaneos)
  * Approved colors: Signature Teal (`#32BCAD`), White (`#FFFFFF`), Black (`#000000`).
* **OXXO**:
  * **Trademark Owner**: Cadena Comercial OXXO, S.A. de C.V. / FEMSA Comercio (Mexico)
  * **Guidelines**: OXXO Brand Identity Guidelines
  * Approved colors: Red (`#E70020`), White (`#FFFFFF`), Yellow (`#FBB110`).
* **Boleto Bancário**:
  * **Regulatory Body**: Federação Brasileira de Bancos (FEBRABAN)
  * Approved colors: White (`#FFFFFF`), Black (`#1A1A1A`), Light Gray (`#F5F5F7`).

---

### 7. Asian Champions
* **Alipay**:
  * **Trademark Owner**: Alipay.com Co., Ltd. / Ant Group Co., Ltd.
  * **Registered Trademarks**: "Alipay", the "支" emblem, the Alipay wordmark.
  * **Guidelines**: [Alipay Brand Guidelines](https://global.alipay.com/)
  * Approved colors: Alipay Blue (`#1677FF`), White (`#FFFFFF`). (Black is deprecated for strict compliance with Ant Group checkout guidelines).
  * Approved shapes: Rounded Rectangle (`borderRadius: 6.0`) and Pill.
* **WeChat Pay**:
  * **Trademark Owner**: Tencent Holdings Limited / Tenpay Payment Technology Co., Ltd.
  * **Registered Trademarks**: "WeChat", "WeChat Pay", the WeChat speech bubbles monogram.
  * **Guidelines**: [WeChat Pay Brand Resources](https://pay.weixin.qq.com/)
  * Approved colors: WeChat Green (`#07C160`), White (`#FFFFFF`). (Black is deprecated for strict compliance with Tencent checkout guidelines).
  * Approved shapes: Rounded Rectangle (`borderRadius: 6.0`) and Pill.
* **PayNow**:
  * **Trademark Owner / Governing Body**: Association of Banks in Singapore (ABS) / Monetary Authority of Singapore (MAS)
  * **Registered Trademarks**: "PayNow", stylized bold "PayNow" wordmark with "P" monogram.
  * **Guidelines**: [PayNow Singapore Brand Guidelines](https://www.abs.org.sg/consumer-banking/pay-now)
  * Approved colors: Deep Purple (`#7D1978`), Vibrant Magenta (`#ED0080`), White (`#FFFFFF`).
  * Approved shapes: Rounded Rectangle (`borderRadius: 6.0`) and Pill.
* **PromptPay**:
  * **Trademark Owner / Governing Body**: Bank of Thailand (BOT) / National ITMX
  * **Registered Trademarks**: "PromptPay", Thai QR payment badge with chevron arrows.
  * **Guidelines**: [Bank of Thailand PromptPay Standard](https://www.bot.or.th/)
  * Approved colors: Deep Navy Blue (`#003D6B`), White (`#FFFFFF`), Black (`#000000`).
  * Approved shapes: Rounded Rectangle (`borderRadius: 6.0`) and Pill.

---

### 8. Google Pay

* **Trademark Owner**: Google LLC / Alphabet Inc.
* **Registered Trademarks**: "Google", "Google Pay", "GPay", the multi-color Google "G" logo.
* **Official Brand Guidelines**: [Google Pay Brand Guidelines](https://developers.google.com/pay/api/web/guides/brand-guidelines)
* **Permitted Customizations**:
  * Approved colors: Black (`#000000`), White (`#FFFFFF`), Monochrome Black, Monochrome White.
  * Approved shapes: Pill (`borderRadius: height / 2`, Google standard), Rounded Rectangle (`borderRadius: 4.0`), Rectangle (`borderRadius: 0.0`).
  * White background buttons must maintain the `#747775` border for contrast.

> [!CAUTION]
> **No manual reproduction is permitted.** `GooglePayButton` renders only official controls: the native `RawGooglePayButton` on Android (via `package:pay`) and the official Google Pay JS SDK element in web browsers. On targets without official Google Pay controls, the widget renders an empty box.

---

### 9. Apple Pay
* **Trademark Owner**: Apple Inc.
* **Registered Trademarks**: "Apple", "Apple Pay", the Apple logo with "Pay" wordmark.
* **Official Brand Guidelines**: [Apple Pay Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines/apple-pay)
* **Permitted Customizations**:
  * Approved colors: Black (`#000000`), White (`#FFFFFF`), White with Outline (`#FFFFFF` with `#000000` 1.0 dp border).
  * Approved shapes: Rounded Rectangle (`borderRadius: 4.0`, Apple HIG default), Pill (`borderRadius: height / 2`), Rectangle (`borderRadius: 0.0`).
  * The Apple logo and wordmark must retain their standard proportional relationship and clear-space margins.

> [!CAUTION]
> **No manual reproduction is permitted.** Apple does not distribute button assets, and its guidelines forbid reproducing the Apple Pay mark or composing a button from it. `ApplePayButton` therefore renders only Apple's own controls: the native `PKPaymentButton` on iOS (via `package:pay`) and the official Apple Pay JS SDK `<apple-pay-button>` element in supporting browsers.
>
> On every other target — Android, desktop, and browsers without Apple Pay — the widget renders an empty box rather than a drawn approximation. All vector asset helpers for Apple Pay have been eliminated from the package.

---

## 3. Summary of Open Source Licenses Used

* **Package Code**: Distributed under the [MIT License](file:///Users/robert/Developer/AndroidStudioProjects/pay_buttons/LICENSE).
* **Vector Path Data**: Derived from official open-source repositories licensed under the **Apache License 2.0** (`@paypal/sdk-logos`) and **MIT License** (`braintree_android`).

