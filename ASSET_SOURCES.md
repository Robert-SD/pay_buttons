# Asset Sources & Provenance

This file tracks where each payment button's logo / vector asset comes from and how it is obtained. Its purpose is to keep the library offline-capable, reproducible, and license-compliant: every asset is either rendered via the provider's own SDK control, fetched by a script from a stable license-backed source, or downloaded once from the provider's official portal and committed (vendored) into this repository.

See `TRADEMARKS.md` for the legal posture (non-affiliation, nominative fair use, provider guidelines).

## Approach legend

| Approach | Meaning | Asset shipped in repo? |
|---|---|---|
| **Native / SDK** | Render the provider's own control (`PKPaymentButton`, `<apple-pay-button>`, Google Pay `createButton()`). No reproduction. | No |
| **Scripted fetch** | `dart run tool/fetch_logos.dart` downloads from a stable, license-backed CDN and writes to `assets/logos/`. | Yes (generated, committed) |
| **Manual vendor** | One-time download from the official portal, committed to `assets/logos/`. | Yes (committed) |
| **None** | Text-only button, no logo/trademark asset. | No |

## Button → source matrix

| Button | Approach | Source | License / terms | Local path | Status |
|---|---|---|---|---|---|
| PayPal / Pay Later | Scripted fetch | `@paypal/sdk-logos@2.3.7` via `cdn.jsdelivr.net/npm/@paypal/sdk-logos/` (also unpkg) | Apache-2.0 | `assets/logos/paypal/` | Not yet scripted |
| Apple Pay | Native / SDK | `PKPaymentButton` (iOS), `<apple-pay-button>` (web) | Apple trademark — no reproduction permitted, no SVG distributed | — | N/A |
| Google Pay | Native / SDK | Google Pay `createButton()` JS SDK (fallback: downloaded button asset) | Google Pay brand guidelines | `assets/logos/google_pay/` (only if vendored) | N/A |
| Klarna | Manual vendor | `brand.klarna.com/resources` | Klarna brand guidelines (proprietary) | `assets/logos/klarna/` | Not yet vendored |
| Amazon Pay | Manual vendor | `paymentservices.amazon.com/brand-kit` | Amazon brand guidelines (proprietary) | `assets/logos/amazon_pay/` | Not yet vendored |
| Shop Pay | Manual vendor | `shopify.com/brand-assets` / `help.shopify.com/.../shop-pay/assets` | Shopify brand guidelines (proprietary) | `assets/logos/shop_pay/` | Not yet vendored |
| Afterpay / Clearpay | Manual vendor | `developers.afterpay.com/.../brand-assets`, `clearpay.co.uk/.../logos` | Afterpay/Clearpay brand guidelines (proprietary) | `assets/logos/afterpay/` | Not yet vendored |
| Alipay | Manual vendor | No official open CDN (Ant Design icon is not the official mark) | Alipay/Ant brand (proprietary) | `assets/logos/alipay/` | Not yet vendored |
| WeChat Pay | Manual vendor | `pay.weixin.qq.com/static/material/brand.shtml` (zip) | Tencent brand (proprietary) | `assets/logos/wechat_pay/` | Not yet vendored |
| Pix | Manual vendor | `bcb.gov.br` "Manual de Uso da Marca" + asset package | BCB mark (regulatory, proprietary) | `assets/logos/pix/` | Not yet vendored |
| Wero | Manual vendor | `wero-wallet.eu/brand-center` | EPI brand guidelines (proprietary) | `assets/logos/wero/` | Not yet vendored |
| iDEAL / Wero Migration | Inlined SVG | `ideal.nl/naar-wero` & `d1twnm33rljaon.cloudfront.net/Logos/iDEAL-Wero/` | Currence/EPI brand guidelines | `lib/src/buttons/regional/ideal/ideal_assets.dart` | Clean inlined SVG |
| BLIK | Manual vendor | `blik.com/en/for-business/materials-to-download` | PSP brand (proprietary) | `assets/logos/blik/` | Not yet vendored |
| Bancontact | Manual vendor | `bancontact.com/en/merchants` | Bancontact Payconiq brand (proprietary) | `assets/logos/bancontact/` | Not yet vendored |
| Bizum | Manual vendor | `bizum.es/en/brand/` | Bizum brand (proprietary) | `assets/logos/bizum/` | Not yet vendored |
| TWINT | Manual vendor | `twint.ch/en/business-customers/integration/branding/` | TWINT brand (proprietary) | `assets/logos/twint/` | Not yet vendored |
| PayNow | Manual vendor | Verify official Singapore portal | Proprietary | `assets/logos/paynow/` | Not yet vendored |
| PromptPay | Manual vendor | Verify official Thai portal | Proprietary | `assets/logos/promptpay/` | Not yet vendored |
| OXXO | Manual vendor | Verify OXXO brand portal | FEMSA/OXXO brand (proprietary) | `assets/logos/oxxo/` | Not yet vendored |
| Boleto Bancário | None | FEBRABAN — text-only, no logo asset | No trademark asset | — | N/A |

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

* **iDEAL | Wero Lockup (Yellow & Light)**: `https://d1twnm33rljaon.cloudfront.net/Logos/iDEAL-Wero/iDEAL_Wero_Lockup_Yellow_Horizontal_RGB.svg`, downloaded 2026-10-05, Currence iDEAL B.V. & EPI Company SE brand guidelines (`https://ideal.nl/naar-wero`). Inlined in `IdealAssets._idealWeroLightSvg`.
* **iDEAL | Wero Lockup (Darkmode)**: `https://d1twnm33rljaon.cloudfront.net/Logos/iDEAL-Wero/iDEAL_Wero-Lockup-Darkmode-Horizontal.svg`, downloaded 2026-10-05, Currence iDEAL B.V. & EPI Company SE brand guidelines (`https://ideal.nl/naar-wero`). Inlined in `IdealAssets._idealWeroDarkSvg`.
