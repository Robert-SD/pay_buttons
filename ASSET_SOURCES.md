# Asset Sources & Provenance

This file tracks where each payment button's logo / vector asset comes from and how it is obtained. Its purpose is to keep the library offline-capable, reproducible, and license-compliant: every asset is either rendered via the provider's own SDK control, fetched by a script from a stable license-backed source, or downloaded once from the provider's official portal and committed (vendored) into this repository.

See `TRADEMARKS.md` for the legal posture (non-affiliation, nominative fair use, provider guidelines).

## Button → source matrix

| Button | Approach | Source | License / terms | Local path | Status |
|---|---|---|---|---|---|
| PayPal / Pay Later | Inlined SVG | `@paypal/sdk-logos@2.3.7` (`paylaterRebrand/mark.jsx`, `paypal/logo.jsx`) | Apache-2.0 | `lib/src/buttons/paypal/paypal_assets.dart` | Clean inlined SVG |
| Apple Pay | Native / SDK | `PKPaymentButton` (iOS), `<apple-pay-button>` (web) | Apple trademark — no reproduction permitted, no SVG distributed | — | N/A |
| Google Pay | Native / SDK | Google Pay `createButton()` JS SDK (web), `RawGooglePayButton` (Android) | Google Pay brand guidelines — no reproduction permitted | — | N/A |
| Klarna | Manual vendor | `brand.klarna.com/resources` | Klarna brand guidelines (proprietary) | `assets/logos/klarna/` | Not yet vendored |
| Shop Pay | Manual vendor | `shopify.com/brand-assets` / `help.shopify.com/.../shop-pay/assets` | Shopify brand guidelines (proprietary) | `assets/logos/shop_pay/` | Not yet vendored |
| Afterpay / Clearpay | Inlined SVG | `afterpay/sdk-android` (`afterpay_lockup.xml`, `clearpay_lockup.xml`) | Apache-2.0 | `lib/src/buttons/afterpay/afterpay_assets.dart` | Clean inlined SVG |
| Alipay | Manual vendor | No official open CDN (Ant Design icon is not the official mark) | Alipay/Ant brand (proprietary) | `assets/logos/alipay/` | Not yet vendored |
| WeChat Pay | Manual vendor | `pay.weixin.qq.com/static/material/brand.shtml` (zip) | Tencent brand (proprietary) | `assets/logos/wechat_pay/` | Not yet vendored |
| Pix | Manual vendor | `bcb.gov.br` "Manual de Uso da Marca" + asset package | BCB mark (regulatory, proprietary) | `assets/logos/pix/` | Not yet vendored |
| Wero | Inlined SVG | `wero-wallet.eu/brand-guidelines/checkout` (`Checkout-Card-Radius.svg`) | EPI brand guidelines | `lib/src/buttons/regional/wero/wero_assets.dart` | Clean inlined SVG |
| iDEAL / Wero Migration | Inlined SVG | `ideal.nl/naar-wero` & `d1twnm33rljaon.cloudfront.net/Logos/iDEAL-Wero/` | Currence/EPI brand guidelines | `lib/src/buttons/regional/ideal/ideal_assets.dart` | Clean inlined SVG |
| BLIK | Manual vendor | `blik.com/en/for-business/materials-to-download` | PSP brand (proprietary) | `assets/logos/blik/` | Not yet vendored |
| Bancontact | Manual vendor | `bancontact.com/en/merchants` | Bancontact Payconiq brand (proprietary) | `assets/logos/bancontact/` | Not yet vendored |
| Bizum | Manual vendor | `bizum.es/en/brand/` | Bizum brand (proprietary) | `assets/logos/bizum/` | Not yet vendored |
| TWINT | Manual vendor | `twint.ch/en/business-customers/integration/branding/` | TWINT brand (proprietary) | `assets/logos/twint/` | Not yet vendored |
| PayNow | Inlined SVG | Official checkout CDN (`paynow.svg`) | Singapore ABS standard | `lib/src/buttons/regional/paynow/paynow_assets.dart` | Clean inlined SVG |
| PromptPay | Inlined SVG | Bank of Thailand Thai QR standard (`Thai_QR_Logo.svg`) | BOT regulatory standard | `lib/src/buttons/regional/promptpay/promptpay_assets.dart` | Clean inlined SVG |
| OXXO | Manual vendor | Verify OXXO brand portal | FEMSA/OXXO brand (proprietary) | `assets/logos/oxxo/` | Not yet vendored |
| Boleto Bancário | Inlined SVG | Official checkout vector standard (`boleto.svg`) | FEBRABAN regulatory standard | `lib/src/buttons/regional/boleto/boleto_assets.dart` | Clean inlined SVG |

## How to add / update an asset

### Scripted fetch (PayPal)

```sh
dart run tool/fetch_logos.dart
```

Writes to `assets/logos/paypal/`. Pin the package version in `tool/fetch_logos.dart` so builds are reproducible.

### Manual vendor (everything else)

1. Download the official asset from the provider's portal (see matrix).
2. Save it under `assets/logos/<provider>/`.
3. Record the exact source URL, download date, and license/terms in this file (update the matrix and add a line under "Vendor log" below).
4. Commit the file. The asset is then bundled via `pubspec.yaml` and requires no runtime network access.

### Verify-before-vendor

Providers marked "Verify" have not been individually confirmed against their portal. Confirm the official download URL and terms before committing their asset.

## Vendor log

<!-- Add one entry per vendored asset: provider, filename, source URL, download date, license/terms. -->

* **Afterpay & Clearpay Official Lockups**: `afterpay_lockup.xml` and `clearpay_lockup.xml` from `afterpay/sdk-android` repository, Apache-2.0 license, verified 2026-10-08. Inlined in `AfterpayAssets._afterpayLockupSvg` and `AfterpayAssets._clearpayLockupSvg`.
* **PayPal & PayPal Pay Later Mark**: `@paypal/sdk-logos@2.3.7` (`src/logos/paylaterRebrand/mark.jsx`, `src/logos/paypal/logo.jsx`), Apache-2.0 license, verified 2026-10-08. Inlined in `PayPalAssets._payLaterMarkSvg` and `PayPalAssets._payPalWordmarkSvg`.
* **PromptPay Thai QR Standard Vector**: Official Bank of Thailand Thai QR standard vector paths (`Thai_QR_Logo.svg`), verified 2026-10-08. Inlined in `PromptPayAssets._promptPayEmblemSvg`.
* **PayNow Singapore Vector Logo**: Clean Bézier vector curves and gradient from live checkout CDN (`paynow.svg`), verified 2026-10-08. Inlined in `PayNowAssets._payNowLogoSvg` and `PayNowAssets._payNowEmblemSvg`.
* **Boleto Bancário Vector Logo**: Official vectorized barcode and typography path data (`boleto.svg`), verified 2026-10-08. Inlined in `BoletoAssets._boletoLogoSvg`.
* **Wero Wordmark & Checkout Card**: `https://wero-wallet.eu/storage/files/Checkout-Card-Radius.svg` and `https://wero-wallet.eu/storage/files/Wero_Logo_Badge_RGB.svg`, verified 2026-10-07, EPI Company SE checkout brand guidelines (`https://wero-wallet.eu/brand-guidelines/checkout`). Inlined in `WeroAssets._weroSvg` and `WeroAssets._weroMarkSvg`.
* **iDEAL | Wero Lockup (Yellow & Light)**: `https://d1twnm33rljaon.cloudfront.net/Logos/iDEAL-Wero/iDEAL_Wero_Lockup_Yellow_Horizontal_RGB.svg`, downloaded 2026-10-05, Currence iDEAL B.V. & EPI Company SE brand guidelines (`https://ideal.nl/naar-wero`). Inlined in `IdealAssets._idealWeroLightSvg`.
* **iDEAL | Wero Lockup (Darkmode)**: `https://d1twnm33rljaon.cloudfront.net/Logos/iDEAL-Wero/iDEAL_Wero-Lockup-Darkmode-Horizontal.svg`, downloaded 2026-10-05, Currence iDEAL B.V. & EPI Company SE brand guidelines (`https://ideal.nl/naar-wero`). Inlined in `IdealAssets._idealWeroDarkSvg`.
