# Trademarks & Brand Directory

This document provides a centralized registry of trademark notices, nominative fair use principles,
brand guideline references, and open-source licenses for every payment button provided by
`pay_buttons`.

---

## 1. General Legal Framework

### A. Non-Affiliation Disclaimer

`pay_buttons` is an independent open-source Flutter library developed by independent contributors.

**This package is not affiliated with, endorsed by, sponsored by, or officially associated with any
of the payment providers listed below or their respective parents, subsidiaries, or affiliates.**

All product names, logos, brand vectors, trademarks, and registered trademarks cited in this
repository are the property of their respective trademark owners.

### B. Nominative Fair Use

Under established trademark jurisprudence (including the U.S. nominative fair use doctrine
articulated in *New Kids on the Block v. News America Publishing, Inc.*, 971 F.2d 302 (9th Cir.
1992) and *Toyota Motor Sales, U.S.A., Inc. v. Tabari*, 610 F.3d 1171 (9th Cir. 2010), as well as EU
Trade Mark Regulation (EU) 2017/1001, Article 14 (1)(c)), third-party trademarks and logos may be
referenced under nominative fair use:

1. **Identificatory Purpose**: The brand names and logos are used strictly to identify the specific
   payment service or checkout method accepted by an application or merchant.
2. **No Confusion**: The logos are not used in a manner that falsely implies endorsement,
   partnership, authorization, or sponsorship by the trademark owners.
3. **No Excessive Usage**: Only so much of the brand representation as is necessary to identify the
   payment method at checkout is used.

### C. Commercial Usage for Merchants

Payment providers intentionally publish and distribute merchant brand guidelines, SVGs, and button
specifications to facilitate consumer transactions through their payment networks. Merchants and app
developers integrating this package are responsible for complying with the respective provider's
terms of service and merchant operating regulations.

---

## 2. Provider Legal Directory & Guidelines

### 1. PayPal & PayPal Pay Later

* **Trademark Owner / Governing Body**: PayPal, Inc. / PayPal Holdings, Inc.
* **Registered Trademarks / Marks**: "PayPal", the PayPal Monogram (overlapping "PP" logo), "Pay in
  4", "PayPal Pay Later", "PayPal Checkout".
* **Brand Guidelines &
  Reference**: [PayPal Button Style Guidelines](https://developer.paypal.com/docs/checkout/standard/customize/button-style/) & [PayPal Brand Central](https://brand.paypal.com/)
* **Asset Implementation & Provenance**: Clean inlined SVG vector geometry derived from PayPal's
  official open-source
  distribution [@paypal/sdk-logos@2.3.7](https://github.com/paypal/paypal-sdk-logos/tree/v2.3.7)
  under Apache-2.0 License.
* **Permitted Customizations**:
    * *Approved colors*: Gold (`#FFC439`), Blue (`#0070BA`), Navy (`#003087`), Black (`#000000`),
      White (`#FFFFFF`), Silver (`#EEEEEE`).
    * *Approved shapes*: Pill (`borderRadius: height / 2`) and Rounded Rectangle
      (`borderRadius: 4.0 - 6.0`).
    * *Brand rules*: Monogram and wordmark aspect ratios must remain undistorted; clear-space
      margins preserved.

---

### 4. Klarna

* **Trademark Owner / Governing Body**: Klarna Bank AB (publ)
* **Registered Trademarks / Marks**: "Klarna", Klarna wordmark ("Klarna."), Klarna "K" monogram dot
  badge.
* **Brand Guidelines &
  Reference**: [Klarna Merchant Brand Guidelines](https://docs.klarna.com/merchant-journey/branding/design-guidelines/) & [Klarna Brand Portal](https://brand.klarna.com/)
* **Asset Implementation & Provenance**: Clean inlined SVG vector geometry based on Klarna brand
  specifications ([brand.klarna.com](https://brand.klarna.com/)).
* **Permitted Customizations**:
    * *Approved colors*: Klarna Pink (`#FFA8CD`), Deep Charcoal (`#0B051D`), White with border
      (`#FFFFFF`).
    * *Approved shapes*: Rounded Rectangle (`borderRadius: 5.0`) and Pill
      (`borderRadius: height / 2`).
    * *Brand rules*: The Klarna wordmark and monogram badge must always maintain minimum clear-space
      protection and undistorted aspect ratios.

---

### 5. Afterpay / Clearpay

* **Trademark Owner / Governing Body**: Afterpay Pty Ltd / Block, Inc.
* **Registered Trademarks / Marks**: "Afterpay", "Clearpay", continuous loop badge logo.
* **Brand Guidelines &
  Reference**: [Afterpay Brand Guidelines](https://developers.afterpay.com/afterpay-online/docs/brand-guidelines) & [Afterpay Developer Portal](https://developers.afterpay.com/)
* **Asset Implementation & Provenance**: Clean inlined SVG vector geometry extracted directly from
  Block's official open-source [afterpay/sdk-android](https://github.com/afterpay/sdk-android)
  repository under Apache-2.0 License.
* **Permitted Customizations**:
    * *Approved colors*: Bondi Mint (`#B2FCE4`), Black (`#000000`), White (`#FFFFFF`).
    * *Approved shapes*: Rounded Rectangle (`borderRadius: 4.0 - 6.0`) and Pill
      (`borderRadius: height / 2`).
    * *Brand rules*: Regional awareness: displays "Afterpay" in US/Canada/Australia/NZ, and
      "Clearpay" in the UK and EU.

---

### 6. Alipay

* **Trademark Owner / Governing Body**: Alipay.com Co., Ltd. / Ant Group Co., Ltd.
* **Registered Trademarks / Marks**: "Alipay", "支付宝", "支" emblem badge, Alipay horizontal
  wordmark.
* **Brand Guidelines &
  Reference**: [Alipay Brand Resources](https://global.alipay.com/) & [File:Alipay logo (2020).svg](https://en.wikipedia.org/wiki/File:Alipay_logo_(2020).svg)
* **Asset Implementation & Provenance**: Clean inlined SVG vector geometry based on official Ant
  Group specifications (`Alipay_logo_(2020).svg`).
* **Permitted Customizations**:
    * *Approved colors*: Alipay Blue (`#1677FF`), White (`#FFFFFF`), Black (`#000000`).
    * *Approved shapes*: Rounded Rectangle (`borderRadius: 6.0`) and Pill
      (`borderRadius: height / 2`).
    * *Brand rules*: Blue emblem background or blue fill must maintain exact official brand color;
      clear-space margins preserved.

---

### 7. WeChat Pay

* **Trademark Owner / Governing Body**: Tencent Holdings Limited / Tenpay Payment Technology Co.,
  Ltd.
* **Registered Trademarks / Marks**: "WeChat", "WeChat Pay", "微信支付", dual chat bubbles emblem.
* **Brand Guidelines &
  Reference**: [WeChat Pay Brand Resources](https://pay.weixin.qq.com/static/material/brand.shtml)
* **Asset Implementation & Provenance**: Clean inlined SVG vector geometry based on Tencent WeChat
  Pay brand specifications.
* **Permitted Customizations**:
    * *Approved colors*: WeChat Green (`#07C160`), White (`#FFFFFF`). (Black is deprecated in
      accordance with Tencent checkout guidelines).
    * *Approved shapes*: Rounded Rectangle (`borderRadius: 6.0`) and Pill
      (`borderRadius: height / 2`).
    * *Brand rules*: Chat bubbles emblem aspect ratio and green brand color strictly maintained;
      clear-space margins preserved.

---

### 8. Pix

* **Trademark Owner / Governing Body**: Banco Central do Brasil (BCB)
* **Registered Trademarks / Marks**: "Pix", geometric overlapping rhomboid emblem, "pix" lowercase
  wordmark.
* **Brand Guidelines &
  Reference**: [Manual de Uso da Marca Pix (BCB)](https://www.bcb.gov.br/estabilidadefinanceira/pagamentosinstantaneos)
* **Asset Implementation & Provenance**: Clean inlined SVG vector geometry based on Banco Central do
  Brasil Pix Brand Manual asset package.
* **Permitted Customizations**:
    * *Approved colors*: Signature Teal (`#32BCAD`), White (`#FFFFFF`), Black (`#000000`).
    * *Approved shapes*: Rounded Rectangle (`borderRadius: 4.0 - 6.0`) and Pill
      (`borderRadius: height / 2`).
    * *Brand rules*: Geometry of overlapping diamonds must remain mathematically accurate; minimum
      clear area maintained around the mark.

---

### 9. Wero

* **Trademark Owner / Governing Body**: EPI Company SE (European Payments Initiative)
* **Registered Trademarks / Marks**: "wero", stylized Wero badge, Wero wordmark.
* **Brand Guidelines &
  Reference**: [Wero Checkout Brand Guidelines](https://wero-wallet.eu/brand-guidelines/checkout) & [Wero Brand Portal](https://brand.epicompany.eu/)
* **Asset Implementation & Provenance**: Clean inlined SVG vector geometry based on EPI checkout
  asset distribution (`Checkout-Card-Radius.svg`, `Wero_Logo_Badge_RGB.svg`).
* **Permitted Customizations**:
    * *Approved colors*: Wero Yellow (`#FFF48D`), Wero Black (`#1D1C1C`), White (`#FFFFFF`).
    * *Approved shapes*: Rounded Card (`borderRadius: 6.0`, official EPI checkout radius) and Pill
      (`borderRadius: height / 2`).
    * *Brand rules*: Distinctive checkout card radius geometry preserved; high contrast maintained
      against light and dark backgrounds.

---

### 10. iDEAL / Wero Migration

* **Trademark Owner / Governing Body**: Currence iDEAL B.V. / EPI Company SE (European Payments
  Initiative)
* **Registered Trademarks / Marks**: "iDEAL", "wero", iDEAL emblem badge, unified "iDEAL | wero"
  lockup.
* **Brand Guidelines &
  Reference**: [iDEAL naar Wero Portal](https://ideal.nl/naar-wero) & [Official iDEAL-Wero CloudFront Distribution](https://d1twnm33rljaon.cloudfront.net/Logos/iDEAL-Wero/)
* **Asset Implementation & Provenance**: Clean inlined SVG vector geometry based on Currence / EPI
  migration assets (`iDEAL_Wero_Lockup_Yellow_Horizontal_RGB.svg`,
  `iDEAL_Wero-Lockup-Darkmode-Horizontal.svg`).
* **Permitted Customizations**:
    * *Approved colors*: Wero Yellow (`#FFF48D`), Darkmode / Black (`#1D1C1C`), White (`#FFFFFF`),
      Light Gray (`#F5F5F5`).
    * *Approved shapes*: Rounded Card (`borderRadius: 6.0`) and Pill (`borderRadius: height / 2`).
    * *Brand rules*: 2026–2027 mandatory migration lockup uniting the iDEAL badge and Wero brand
      mark; aspect ratio and clear spacing preserved.

---

### 11. BLIK

* **Trademark Owner / Governing Body**: Polski Standard Płatności Sp. z o.o. (PSP, Poland)
* **Registered Trademarks / Marks**: "BLIK", lowercase "b" mark with orange dot, "blik" wordmark.
* **Brand Guidelines &
  Reference**: [BLIK Brand Standards](https://blik.com/en/for-business/materials-to-download)
* **Asset Implementation & Provenance**: Clean inlined SVG vector geometry based on PSP BLIK
  merchant downloads.
* **Permitted Customizations**:
    * *Approved colors*: Black (`#000000`), White (`#FFFFFF`), with BLIK Red/Orange dot (`#E52F08` /
      `#E30613`).
    * *Approved shapes*: Rounded Rectangle (`borderRadius: 6.0`) and Pill
      (`borderRadius: height / 2`).
    * *Brand rules*: Red dot position and relative scale to the 'b' glyph must remain exact;
      clear-space protection maintained.

---

### 12. Bancontact

* **Trademark Owner / Governing Body**: Bancontact Payconiq Company (Belgium)
* **Registered Trademarks / Marks**: "Bancontact", dual-wing emblem, Bancontact wordmark.
* **Brand Guidelines & Reference**: [Bancontact Brand Rules](https://www.bancontact.com/en)
* **Asset Implementation & Provenance**: Clean inlined SVG vector geometry based on Bancontact
  Payconiq brand specifications.
* **Permitted Customizations**:
    * *Approved colors*: Blue (`#005AB9` to `#1E3764` gradient), Yellow (`#FBA900` to `#FFD800`
      gradient), White (`#FFFFFF`).
    * *Approved shapes*: Rounded Rectangle (`borderRadius: 6.0`) and Pill
      (`borderRadius: height / 2`).
    * *Brand rules*: The blue and yellow wing gradients and proportional spacing must remain intact;
      clear area around the logo enforced.

---

### 13. Bizum

* **Trademark Owner / Governing Body**: Sociedad de Procedimientos de Pago S.L. (Spain)
* **Registered Trademarks / Marks**: "Bizum", Bizum asterisk emblem, Bizum wordmark.
* **Brand Guidelines & Reference**: [Bizum Brand Guidelines](https://bizum.com/es/)
* **Asset Implementation & Provenance**: Clean inlined SVG vector geometry based on Bizum merchant
  brand resources.
* **Permitted Customizations**:
    * *Approved colors*: Teal (`#00B4B6`), White (`#FFFFFF`), Dark Cyan (`#004455`).
    * *Approved shapes*: Rounded Rectangle (`borderRadius: 6.0`) and Pill
      (`borderRadius: height / 2`).
    * *Brand rules*: Angular orientation of the asterisk spokes must remain exact; clear-space
      margins preserved.

---

### 14. TWINT

* **Trademark Owner / Governing Body**: TWINT AG (Switzerland)
* **Registered Trademarks / Marks**: "TWINT", dual-radial-gradient beacon emblem, TWINT wordmark.
* **Brand Guidelines &
  Reference**: [TWINT Brand Guidelines](https://www.twint.ch/en/business-customers/integration/branding/)
* **Asset Implementation & Provenance**: Clean inlined SVG vector geometry based on TWINT AG brand
  guidelines.
* **Permitted Customizations**:
    * *Approved colors*: Black (`#000000`), White (`#FFFFFF`), TWINT Green (`#00A859`), with dual
      radial gradient beacon (`#FFCC00` to `#FF0000` and `#00B4E6` to `#054696`).
    * *Approved shapes*: Rounded Rectangle (`borderRadius: 6.0`) and Pill
      (`borderRadius: height / 2`).
    * *Brand rules*: Dual radial gradient centers and focal points in the beacon mark must remain
      exact; clear-space protection maintained.

---

### 15. PayNow

* **Trademark Owner / Governing Body**: Association of Banks in Singapore (ABS) / Monetary Authority
  of Singapore (MAS)
* **Registered Trademarks / Marks**: "PayNow", bold stylized wordmark with stylized "P" monogram.
* **Brand Guidelines &
  Reference**: [PayNow Singapore Brand Guidelines](https://www.abs.org.sg/consumer-banking/pay-now)
* **Asset Implementation & Provenance**: Clean inlined SVG Bézier vector geometry based on Singapore
  ABS checkout CDN standard.
* **Permitted Customizations**:
    * *Approved colors*: Deep Purple (`#7D1978`), Vibrant Magenta (`#ED0080`), White (`#FFFFFF`).
    * *Approved shapes*: Rounded Rectangle (`borderRadius: 6.0`) and Pill
      (`borderRadius: height / 2`).
    * *Brand rules*: Precise gradient transition from purple to magenta across the brand lockup;
      clean Bézier curves without rasterization.

---

### 16. PromptPay

* **Trademark Owner / Governing Body**: Bank of Thailand (BOT) / National ITMX
* **Registered Trademarks / Marks**: "PromptPay", "พร้อมเพย์", Thai QR payment badge with chevron
  arrows.
* **Brand Guidelines & Reference**: [Bank of Thailand PromptPay Standard](https://www.bot.or.th/)
* **Asset Implementation & Provenance**: Clean inlined SVG vector paths based on Bank of Thailand
  Thai QR standard (`Thai_QR_Logo.svg`).
* **Permitted Customizations**:
    * *Approved colors*: Deep Navy Blue (`#003D6B`), White (`#FFFFFF`), Black (`#000000`).
    * *Approved shapes*: Rounded Rectangle (`borderRadius: 6.0`) and Pill
      (`borderRadius: height / 2`).
    * *Brand rules*: Chevron arrow angles and Thai QR boundary geometry adhere to Bank of Thailand
      specifications.

---

### 17. OXXO

* **Trademark Owner / Governing Body**: Cadena Comercial OXXO, S.A. de C.V. / FEMSA Comercio
  (Mexico)
* **Registered Trademarks / Marks**: "OXXO", "OXXO PAY", official red and yellow horizontal stripe
  badge.
* **Brand Guidelines & Reference**: [OXXO Pay Brand Portal](https://www.oxxo.com/oxxopay)
* **Asset Implementation & Provenance**: Clean inlined SVG vector paths based on OXXO merchant brand
  specifications.
* **Permitted Customizations**:
    * *Approved colors*: Red (`#E70020`), White (`#FFFFFF`), Yellow (`#FBB110`).
    * *Approved shapes*: Rounded Rectangle (`borderRadius: 6.0`) and Pill
      (`borderRadius: height / 2`).
    * *Brand rules*: Top and bottom yellow stripes and red typography geometry maintained;
      clear-space margins preserved.

---

### 18. Boleto Bancário

* **Trademark Owner / Governing Body**: Federação Brasileira de Bancos (FEBRABAN) / Banco Central do
  Brasil (BCB)
* **Registered Trademarks / Marks**: Boleto Bancário standardized banking payment order format.
* **Brand Guidelines & Reference**: [FEBRABAN Standards Portal](https://portal.febraban.org.br/)
* **Asset Implementation & Provenance**: Clean inlined SVG vector barcode emblem paired with native
  Flutter typography (`PayButtonFonts.boleto`). No proprietary vector font outlines are distributed.
* **Permitted Customizations**:
    * *Approved colors*: White (`#FFFFFF`), Black (`#1A1A1A`), Light Gray (`#F5F5F7`).
    * *Approved shapes*: Rounded Rectangle (`borderRadius: 4.0 - 6.0`) and Pill
      (`borderRadius: height / 2`).
    * *Brand rules*: Standardized barcode emblem and high contrast layout conforming to Brazilian
      checkout expectations.

---

### 19. UPI (Unified Payments Interface)

* **Trademark Owner / Governing Body**: National Payments Corporation of India (NPCI)
* **Registered Trademarks / Marks**: "UPI", "Unified Payments Interface", official dual directional
  arrows emblem.
* **Brand Guidelines &
  Reference**: [NPCI UPI Brand Guidelines & Media Kit](https://www.npci.org.in/)
* **Asset Implementation & Provenance**: Clean inlined SVG vector paths based on NPCI open
  specifications and Wikimedia Commons vector distribution.
* **Permitted Customizations**:
    * *Approved colors*: White (`#FFFFFF`), Black (`#000000`), Saffron Orange (`#F47920`), Corporate
      Navy (`#0B2545`).
    * *Approved shapes*: Rounded Rectangle (`borderRadius: 6.0`) and Pill
      (`borderRadius: height / 2`).
    * *Brand rules*: Saffron and green arrow directional angles and "UPI" italic letterforms
      strictly preserved; clear-space margins maintained.

---

## 3. Summary of Open Source Licenses Used

* **Package Code**: Distributed under the [Apache License 2.0](LICENSE). Per Apache-2.0 §6, this
  license grants no rights to any third-party trade names, trademarks, or brand marks (see section 1
  and `NOTICE`); it covers only the package code.
* **Vector Path Data**:
    * [@paypal/sdk-logos](https://github.com/paypal/paypal-sdk-logos): **Apache License 2.0**
      (PayPal, PayPal Pay Later, see `LICENSES/Apache-2.0.txt`)
    * [afterpay/sdk-android](https://github.com/afterpay/sdk-android): **Apache License 2.0**
      (Afterpay, Clearpay, see `LICENSES/Apache-2.0.txt`)

