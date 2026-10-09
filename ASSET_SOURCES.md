# Asset Sources & Provenance

This file tracks where each payment button's logo / vector asset comes from and how it is obtained. Its purpose is to keep the library offline-capable, reproducible, and license-compliant: every asset is either rendered via the provider's own platform SDK control or maintained as clean inlined vector paths verified against official brand portals and open-source SDKs.

See `TRADEMARKS.md` for the legal posture (non-affiliation, nominative fair use, provider guidelines).

## Button → source matrix

| Button | Approach | Source | License / terms | Local path |
|---|---|---|---|---|
| PayPal / Pay Later | Inlined SVG | [@paypal/sdk-logos@2.3.7](https://github.com/paypal/paypal-sdk-logos/tree/v2.3.7) (`paylaterRebrand/mark.jsx`, `paypal/logo.jsx`) | Apache-2.0 | `lib/src/buttons/paypal/paypal_assets.dart` |
| Apple Pay | Native / SDK | [`PKPaymentButton` (iOS)](https://developer.apple.com/documentation/passkit/pkpaymentbutton), [`<apple-pay-button>` (web)](https://developer.apple.com/documentation/applepayontheweb/displaying-apple-pay-buttons-using-javascript) | Apple trademark — no reproduction permitted, no SVG distributed | `lib/src/buttons/apple_pay/` |
| Google Pay | Native / SDK | [Google Pay `createButton()` JS SDK (web)](https://developers.google.com/pay/api/web/guides/brand-guidelines), [`RawGooglePayButton` (Android)](https://developers.google.com/pay/api/android/guides/brand-guidelines) | Google Pay brand guidelines — no reproduction permitted | `lib/src/buttons/google_pay/` |
| Klarna | Inlined SVG | [brand.klarna.com](https://brand.klarna.com/) | Klarna brand guidelines (proprietary) | `lib/src/buttons/klarna/klarna_assets.dart` |
| Afterpay / Clearpay | Inlined SVG | [afterpay/sdk-android](https://github.com/afterpay/sdk-android) (`afterpay_lockup.xml`, `clearpay_lockup.xml`) | Apache-2.0 | `lib/src/buttons/afterpay/afterpay_assets.dart` |
| Alipay | Inlined SVG | [File:Alipay logo (2020).svg (Wikipedia / Ant Group)](https://en.wikipedia.org/wiki/File:Alipay_logo_(2020).svg) | Ant Group trademark / nominative fair use | `lib/src/buttons/regional/alipay/alipay_assets.dart` |
| WeChat Pay | Inlined SVG | [pay.weixin.qq.com](https://pay.weixin.qq.com/static/material/brand.shtml) | Tencent brand (proprietary) | `lib/src/buttons/regional/wechat_pay/wechat_pay_assets.dart` |
| Pix | Inlined SVG | [bcb.gov.br Manual de Uso da Marca](https://www.bcb.gov.br/estabilidadefinanceira/pagamentosinstantaneos) | BCB mark (regulatory, proprietary) | `lib/src/buttons/regional/pix/pix_assets.dart` |
| Wero | Inlined SVG | [wero-wallet.eu/brand-guidelines/checkout](https://wero-wallet.eu/brand-guidelines/checkout) (`Checkout-Card-Radius.svg`) | EPI brand guidelines | `lib/src/buttons/regional/wero/wero_assets.dart` |
| iDEAL / Wero Migration | Inlined SVG | [ideal.nl/naar-wero](https://ideal.nl/naar-wero) & [CloudFront CDN](https://d1twnm33rljaon.cloudfront.net/Logos/iDEAL-Wero/iDEAL_Wero_Lockup_Yellow_Horizontal_RGB.svg) | Currence/EPI brand guidelines | `lib/src/buttons/regional/ideal/ideal_assets.dart` |
| BLIK | Inlined SVG | [blik.com/en/for-business/materials-to-download](https://blik.com/en/for-business/materials-to-download) | PSP brand (proprietary) | `lib/src/buttons/regional/blik/blik_assets.dart` |
| Bancontact | Inlined SVG | [bancontact.com](https://www.bancontact.com/en) | Bancontact Payconiq brand (proprietary) | `lib/src/buttons/regional/bancontact/bancontact_assets.dart` |
| Bizum | Inlined SVG | [bizum.com](https://bizum.com/es/) | Bizum brand (proprietary) | `lib/src/buttons/regional/bizum/bizum_assets.dart` |
| TWINT | Inlined SVG | [twint.ch/.../branding](https://www.twint.ch/en/business-customers/integration/branding/) | TWINT brand (proprietary) | `lib/src/buttons/regional/twint/twint_assets.dart` |
| PayNow | Inlined SVG | [Official checkout CDN (`paynow.svg`)](https://www.abs.org.sg/consumer-banking/pay-now) | Singapore ABS standard | `lib/src/buttons/regional/paynow/paynow_assets.dart` |
| PromptPay | Inlined SVG | [Bank of Thailand Thai QR standard (`Thai_QR_Logo.svg`)](https://www.bot.or.th/) | BOT regulatory standard | `lib/src/buttons/regional/promptpay/promptpay_assets.dart` |
| OXXO | Inlined SVG | [oxxo.com/oxxopay](https://www.oxxo.com/oxxopay) | FEMSA/OXXO brand (proprietary) | `lib/src/buttons/regional/oxxo/oxxo_assets.dart` |
| Boleto Bancário | Inlined SVG + Typography | Generic barcode vector geometry paired with Flutter typography (`PayButtonFonts.boleto`) | Open banking standard (FEBRABAN / BCB) | `lib/src/buttons/regional/boleto/boleto_assets.dart` |
| UPI | Inlined SVG | [Wikimedia Commons: UPI Logo](https://commons.wikimedia.org/wiki/File:UPI_logo.svg) | NPCI national standard | `lib/src/buttons/regional/upi/upi_assets.dart` |

## How to add / update an asset

1. Obtain the official vector mark or specifications from the provider's official portal or open-source SDK repository (see matrix above).
2. Maintain or update the vector code in the corresponding button folder under `lib/src/buttons/<folder>/`.
3. Record the exact source URL, date, and license/terms in this file (update the matrix and add an entry under "Vendor log" below).
4. Run `flutter test` and `flutter analyze` to ensure all brand lockup tests pass.

## Vendor log

<!-- Add one entry per vendored asset: provider, filename, source URL, download date, license/terms. -->

* **Afterpay & Clearpay Official Lockups**: `afterpay_lockup.xml` and `clearpay_lockup.xml` from [afterpay/sdk-android](https://github.com/afterpay/sdk-android) repository, Apache-2.0 license, verified 2026-10-08. Inlined in `AfterpayAssets._afterpayLockupSvg` and `AfterpayAssets._clearpayLockupSvg`.
* **PayPal & PayPal Pay Later Mark**: [@paypal/sdk-logos@2.3.7](https://github.com/paypal/paypal-sdk-logos/tree/v2.3.7) (`src/logos/paylaterRebrand/mark.jsx`, `src/logos/paypal/logo.jsx`), Apache-2.0 license, verified 2026-10-08. Inlined in `PayPalAssets._payLaterMarkSvg` and `PayPalAssets._payPalWordmarkSvg`.
* **Klarna Wordmark & Monogram**: Official Klarna wordmark and "K" monogram geometry from Klarna brand portal ([brand.klarna.com](https://brand.klarna.com/)), verified 2026-10-08. Inlined in `KlarnaAssets._klarnaWordmarkSvg` and `KlarnaAssets._klarnaMonogramSvg`.
* **Alipay Emblem & Logo**: Official Alipay "支" emblem and horizontal lockup geometry from Ant Group specifications ([File:Alipay logo (2020).svg](https://en.wikipedia.org/wiki/File:Alipay_logo_(2020).svg)), verified 2026-10-09. Inlined in `AlipayAssets._alipayEmblemSvg` and `AlipayAssets._alipayLogoSvg`.
* **WeChat Pay Emblem & Logo**: Official WeChat chat bubbles emblem and full wordmark lockup geometry from Tencent WeChat Pay portal ([pay.weixin.qq.com](https://pay.weixin.qq.com/static/material/brand.shtml)), verified 2026-10-08. Inlined in `WeChatPayAssets._weChatPayEmblemSvg` and `WeChatPayAssets._weChatPayLogoSvg`.
* **Pix Emblem & Full Logo**: Official Banco Central do Brasil Pix geometric rhomboid emblem and full logo paths from BCB Brand Manual ([bcb.gov.br](https://www.bcb.gov.br/estabilidadefinanceira/pagamentosinstantaneos)), verified 2026-10-08. Inlined in `PixAssets._pixEmblemSvg` and `PixAssets._pixFullSvg`.
* **BLIK 'b' Mark & Full Logo**: Official Polish BLIK red dot 'b' mark and full brand lockup geometry from BLIK business portal ([blik.com](https://blik.com/en/for-business/materials-to-download)), verified 2026-10-08. Inlined in `BlikAssets._blikMarkSvg` and `BlikAssets._blikSvg`.
* **Bancontact Wings & Full Logo**: Official Belgian Bancontact dual-wing mark and full gradient lockup paths from Bancontact Payconiq brand resources ([bancontact.com](https://www.bancontact.com/en)), verified 2026-10-08. Inlined in `BancontactAssets._bancontactWingsSvg` and `BancontactAssets._bancontactSvg`.
* **Bizum Asterisk & Full Logo**: Official Spanish Bizum asterisk emblem and full typography paths from Bizum brand resources ([bizum.com](https://bizum.com/es/)), verified 2026-10-08. Inlined in `BizumAssets._bizumAsteriskSvg` and `BizumAssets._bizumSvg`.
* **TWINT Beacon & Full Logo**: Official Swiss TWINT dual-radial-gradient beacon emblem and full logo lockup paths from TWINT brand portal ([twint.ch](https://www.twint.ch/en/business-customers/integration/branding/)), verified 2026-10-08. Inlined in `TwintAssets._twintBeaconSvg` and `TwintAssets._twintSvg`.
* **PayNow Singapore Vector Logo**: Clean Bézier vector curves and gradient from live checkout CDN (`paynow.svg`), Singapore ABS standard, verified 2026-10-08. Inlined in `PayNowAssets._payNowLogoSvg` and `PayNowAssets._payNowEmblemSvg`.
* **PromptPay Thai QR Standard Vector**: Official Bank of Thailand Thai QR standard vector paths (`Thai_QR_Logo.svg`), verified 2026-10-08. Inlined in `PromptPayAssets._promptPayEmblemSvg`.
* **OXXO Full Badge & 'O' Mark**: Official Mexican OXXO red/yellow pill badge and standalone 'O' mark vector paths from OXXO brand portal ([oxxo.com](https://www.oxxo.com/oxxopay)), verified 2026-10-08. Inlined in `OxxoAssets._oxxoFullBadgeSvg` and `OxxoAssets._oxxoOMarkSvg`.
* **Boleto Bancário Barcode & Typography**: Clean geometric vector barcode paths paired with native Flutter typography (`PayButtonFonts.boleto`). Boleto Bancário is an open, standardized payment order regulated by FEBRABAN and the Banco Central do Brasil. No proprietary vector font outlines are distributed. Inlined in `BoletoAssets._boletoBarcodeSvg`.
* **Wero Wordmark & Checkout Card**: `https://wero-wallet.eu/storage/files/Checkout-Card-Radius.svg` and `https://wero-wallet.eu/storage/files/Wero_Logo_Badge_RGB.svg`, verified 2026-10-07, EPI Company SE checkout brand guidelines ([wero-wallet.eu/brand-guidelines/checkout](https://wero-wallet.eu/brand-guidelines/checkout)). Inlined in `WeroAssets._weroSvg` and `WeroAssets._weroMarkSvg`.
* **iDEAL | Wero Lockup (Yellow & Light)**: `https://d1twnm33rljaon.cloudfront.net/Logos/iDEAL-Wero/iDEAL_Wero_Lockup_Yellow_Horizontal_RGB.svg`, downloaded 2026-10-05, Currence iDEAL B.V. & EPI Company SE brand guidelines ([ideal.nl/naar-wero](https://ideal.nl/naar-wero)). Inlined in `IdealAssets._idealWeroLightSvg`.
* **iDEAL | Wero Lockup (Darkmode)**: `https://d1twnm33rljaon.cloudfront.net/Logos/iDEAL-Wero/iDEAL_Wero-Lockup-Darkmode-Horizontal.svg`, downloaded 2026-10-05, Currence iDEAL B.V. & EPI Company SE brand guidelines ([ideal.nl/naar-wero](https://ideal.nl/naar-wero)). Inlined in `IdealAssets._idealWeroDarkSvg`.
* **UPI (Unified Payments Interface) Wordmark & Dual Arrows Emblem**: Official vector mark and directional arrows geometry from NPCI open specifications ([npci.org.in](https://www.npci.org.in/) & [Wikimedia Commons](https://commons.wikimedia.org/wiki/File:UPI_logo.svg)), verified 2026-10-08. Inlined in `UpiAssets._upiLogoSvg` and `UpiAssets._upiEmblemSvg`.
* **Apple Pay & Google Pay (Platform Native SDKs)**: Rendered dynamically via official operating system and web components ([`PKPaymentButton`](https://developer.apple.com/documentation/passkit/pkpaymentbutton), [`<apple-pay-button>`](https://developer.apple.com/documentation/applepayontheweb/displaying-apple-pay-buttons-using-javascript), and [Google Pay Web/Android SDK](https://developers.google.com/pay/api/web/guides/brand-guidelines)). No proprietary vector assets are copied, stored, or distributed.
