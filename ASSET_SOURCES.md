# Asset Sources & Provenance

This file tracks where each payment button's logo / vector asset comes from and how it is obtained. Its purpose is to keep the library offline-capable, reproducible, and license-compliant: every asset is either rendered via the provider's own platform SDK control or maintained as clean inlined vector paths verified against official brand portals and open-source SDKs.

See `TRADEMARKS.md` for the legal posture (non-affiliation, nominative fair use, provider guidelines).

## Button → source matrix

| Button | Approach | Source | License / terms | Local path | Status |
|---|---|---|---|---|---|
| PayPal / Pay Later | Inlined SVG | [@paypal/sdk-logos@2.3.7](https://github.com/paypal/paypal-sdk-logos/tree/v2.3.7) (`paylaterRebrand/mark.jsx`, `paypal/logo.jsx`) | Apache-2.0 | `lib/src/buttons/paypal/paypal_assets.dart` | Clean inlined SVG |
| Apple Pay | Native / SDK | [`PKPaymentButton` (iOS)](https://developer.apple.com/documentation/passkit/pkpaymentbutton), [`<apple-pay-button>` (web)](https://developer.apple.com/documentation/applepayontheweb/displaying-apple-pay-buttons-using-javascript) | Apple trademark — no reproduction permitted, no SVG distributed | `lib/src/buttons/apple_pay/` | Platform native SDK |
| Google Pay | Native / SDK | [Google Pay `createButton()` JS SDK (web)](https://developers.google.com/pay/api/web/guides/brand-guidelines), [`RawGooglePayButton` (Android)](https://developers.google.com/pay/api/android/guides/brand-guidelines) | Google Pay brand guidelines — no reproduction permitted | `lib/src/buttons/google_pay/` | Platform native SDK |
| Klarna | Inlined SVG | [brand.klarna.com](https://brand.klarna.com/) | Klarna brand guidelines (proprietary) | `lib/src/buttons/klarna/klarna_assets.dart` | Clean inlined SVG |
| Shop Pay | Inlined SVG | [shopify.com/brand-assets](https://www.shopify.com/brand-assets) | Shopify brand guidelines (proprietary) | `lib/src/buttons/shop_pay/shop_pay_assets.dart` | Clean inlined SVG |
| Afterpay / Clearpay | Inlined SVG | [afterpay/sdk-android](https://github.com/afterpay/sdk-android) (`afterpay_lockup.xml`, `clearpay_lockup.xml`) | Apache-2.0 | `lib/src/buttons/afterpay/afterpay_assets.dart` | Clean inlined SVG |
| Alipay | Inlined SVG | [global.alipay.com](https://global.alipay.com/) | Alipay/Ant brand (proprietary) | `lib/src/buttons/regional/alipay/alipay_assets.dart` | Clean inlined SVG |
| WeChat Pay | Inlined SVG | [pay.weixin.qq.com](https://pay.weixin.qq.com/static/material/brand.shtml) | Tencent brand (proprietary) | `lib/src/buttons/regional/wechat_pay/wechat_pay_assets.dart` | Clean inlined SVG |
| Pix | Inlined SVG | [bcb.gov.br Manual de Uso da Marca](https://www.bcb.gov.br/estabilidadefinanceira/pagamentosinstantaneos) | BCB mark (regulatory, proprietary) | `lib/src/buttons/regional/pix/pix_assets.dart` | Clean inlined SVG |
| Wero | Inlined SVG | [wero-wallet.eu/brand-guidelines/checkout](https://wero-wallet.eu/brand-guidelines/checkout) (`Checkout-Card-Radius.svg`) | EPI brand guidelines | `lib/src/buttons/regional/wero/wero_assets.dart` | Clean inlined SVG |
| iDEAL / Wero Migration | Inlined SVG | [ideal.nl/naar-wero](https://ideal.nl/naar-wero) & [CloudFront CDN](https://d1twnm33rljaon.cloudfront.net/Logos/iDEAL-Wero/iDEAL_Wero_Lockup_Yellow_Horizontal_RGB.svg) | Currence/EPI brand guidelines | `lib/src/buttons/regional/ideal/ideal_assets.dart` | Clean inlined SVG |
| BLIK | Inlined SVG | [blik.com/en/for-business/materials-to-download](https://blik.com/en/for-business/materials-to-download) | PSP brand (proprietary) | `lib/src/buttons/regional/blik/blik_assets.dart` | Clean inlined SVG |
| Bancontact | Inlined SVG | [bancontact.com](https://www.bancontact.com/en) | Bancontact Payconiq brand (proprietary) | `lib/src/buttons/regional/bancontact/bancontact_assets.dart` | Clean inlined SVG |
| Bizum | Inlined SVG | [bizum.com](https://bizum.com/es/) | Bizum brand (proprietary) | `lib/src/buttons/regional/bizum/bizum_assets.dart` | Clean inlined SVG |
| TWINT | Inlined SVG | [twint.ch/.../branding](https://www.twint.ch/en/business-customers/integration/branding/) | TWINT brand (proprietary) | `lib/src/buttons/regional/twint/twint_assets.dart` | Clean inlined SVG |
| PayNow | Inlined SVG | [Official checkout CDN (`paynow.svg`)](https://www.abs.org.sg/consumer-banking/pay-now) | Singapore ABS standard | `lib/src/buttons/regional/paynow/paynow_assets.dart` | Clean inlined SVG |
| PromptPay | Inlined SVG | [Bank of Thailand Thai QR standard (`Thai_QR_Logo.svg`)](https://www.bot.or.th/) | BOT regulatory standard | `lib/src/buttons/regional/promptpay/promptpay_assets.dart` | Clean inlined SVG |
| OXXO | Inlined SVG | [oxxo.com/oxxopay](https://www.oxxo.com/oxxopay) | FEMSA/OXXO brand (proprietary) | `lib/src/buttons/regional/oxxo/oxxo_assets.dart` | Clean inlined SVG |
| Boleto Bancário | Inlined SVG | [Official checkout vector standard (`boleto.svg`)](https://portal.febraban.org.br/) | FEBRABAN regulatory standard | `lib/src/buttons/regional/boleto/boleto_assets.dart` | Clean inlined SVG |

## How to add / update an asset

1. Obtain the official vector mark or specifications from the provider's official portal or open-source SDK repository (see matrix above).
2. Maintain or update the vector code in the corresponding button folder under `lib/src/buttons/<folder>/`.
3. Record the exact source URL, date, and license/terms in this file (update the matrix and add an entry under "Vendor log" below).
4. Run `flutter test` and `flutter analyze` to ensure all brand lockup tests pass.

## Vendor log

<!-- Add one entry per vendored asset: provider, filename, source URL, download date, license/terms. -->

* **Afterpay & Clearpay Official Lockups**: `afterpay_lockup.xml` and `clearpay_lockup.xml` from [afterpay/sdk-android](https://github.com/afterpay/sdk-android) repository, Apache-2.0 license, verified 2026-10-08. Inlined in `AfterpayAssets._afterpayLockupSvg` and `AfterpayAssets._clearpayLockupSvg`.
* **PayPal & PayPal Pay Later Mark**: [@paypal/sdk-logos@2.3.7](https://github.com/paypal/paypal-sdk-logos/tree/v2.3.7) (`src/logos/paylaterRebrand/mark.jsx`, `src/logos/paypal/logo.jsx`), Apache-2.0 license, verified 2026-10-08. Inlined in `PayPalAssets._payLaterMarkSvg` and `PayPalAssets._payPalWordmarkSvg`.
* **PromptPay Thai QR Standard Vector**: Official Bank of Thailand Thai QR standard vector paths (`Thai_QR_Logo.svg`), verified 2026-10-08. Inlined in `PromptPayAssets._promptPayEmblemSvg`.
* **PayNow Singapore Vector Logo**: Clean Bézier vector curves and gradient from live checkout CDN (`paynow.svg`), verified 2026-10-08. Inlined in `PayNowAssets._payNowLogoSvg` and `PayNowAssets._payNowEmblemSvg`.
* **Boleto Bancário Vector Logo**: Official vectorized barcode and typography path data (`boleto.svg`), verified 2026-10-08. Inlined in `BoletoAssets._boletoLogoSvg`.
* **Wero Wordmark & Checkout Card**: `https://wero-wallet.eu/storage/files/Checkout-Card-Radius.svg` and `https://wero-wallet.eu/storage/files/Wero_Logo_Badge_RGB.svg`, verified 2026-10-07, EPI Company SE checkout brand guidelines ([wero-wallet.eu/brand-guidelines/checkout](https://wero-wallet.eu/brand-guidelines/checkout)). Inlined in `WeroAssets._weroSvg` and `WeroAssets._weroMarkSvg`.
* **iDEAL | Wero Lockup (Yellow & Light)**: `https://d1twnm33rljaon.cloudfront.net/Logos/iDEAL-Wero/iDEAL_Wero_Lockup_Yellow_Horizontal_RGB.svg`, downloaded 2026-10-05, Currence iDEAL B.V. & EPI Company SE brand guidelines ([ideal.nl/naar-wero](https://ideal.nl/naar-wero)). Inlined in `IdealAssets._idealWeroLightSvg`.
* **iDEAL | Wero Lockup (Darkmode)**: `https://d1twnm33rljaon.cloudfront.net/Logos/iDEAL-Wero/iDEAL_Wero-Lockup-Darkmode-Horizontal.svg`, downloaded 2026-10-05, Currence iDEAL B.V. & EPI Company SE brand guidelines ([ideal.nl/naar-wero](https://ideal.nl/naar-wero)). Inlined in `IdealAssets._idealWeroDarkSvg`.
