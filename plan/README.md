# Pay Buttons Architecture & Roadmap

`pay_buttons` is a high-fidelity, brand-compliant, cross-platform Flutter package providing dedicated payment buttons for modern e-commerce and checkout experiences.

---

## 1. Core Philosophy

1. **Pure Flutter Rendering (Zero Native Bloat)**
   - No heavy native SDKs (e.g., PayPal SDK or Google Play Services Wallet) for 3rd-party payment methods.
   - Saves 30–50 MB of binary bloat and eliminates Gradle/CocoaPods native version conflicts.
   - Runs uniformly across Android, iOS, Web, macOS, Windows, and Linux.

2. **Decoupled Architecture**
   - The UI presentation is decoupled from the payment gateway backend.
   - Developers can trigger any backend flow on tap (Direct REST API, In-App WebView, Braintree, Stripe, or native SDK).

3. **Strict Brand Compliance & Accessibility**
   - Exact brand colors, official vector logos, standard corner radiuses, and clearance rules.
   - Full accessibility semantics (`Semantics(button: true)`), minimum 48dp touch targets, and localized labels.

---

## 2. Roadmap

| Step | Topic | Status | Document |
| :--- | :--- | :--- | :--- |
| **Step 0** | Generic `PayButton` Foundation & Asset Engine | ✅ Completed | [`00_generic_pay_button.md`](file:///Users/robert/Developer/AndroidStudioProjects/pay_buttons/plan/00_generic_pay_button.md) |
| **Step 1** | **PayPal** (Express Checkout & Pay Later) | ✅ Completed | [`01_paypal_button.md`](file:///Users/robert/Developer/AndroidStudioProjects/pay_buttons/plan/01_paypal_button.md) |
| **Step 2** | **Klarna** (Pay Now, Pay Later, Slice It) | ✅ Completed | [`02_klarna_button.md`](file:///Users/robert/Developer/AndroidStudioProjects/pay_buttons/plan/02_klarna_button.md) |
| **Step 3** | **Amazon Pay** | ✅ Completed | [`03_amazon_pay_button.md`](file:///Users/robert/Developer/AndroidStudioProjects/pay_buttons/plan/03_amazon_pay_button.md) |
| **Step 4** | **Shop Pay** (Shopify) | ✅ Completed | [`04_shop_pay_button.md`](file:///Users/robert/Developer/AndroidStudioProjects/pay_buttons/plan/04_shop_pay_button.md) |
| **Step 5** | **Afterpay / Clearpay** | ✅ Completed | [`06_afterpay_clearpay_button.md`](file:///Users/robert/Developer/AndroidStudioProjects/pay_buttons/plan/06_afterpay_clearpay_button.md) |
| **Step 6** | **European Champions** (TWINT, iDEAL, BLIK, Bancontact, Bizum) | ✅ Completed | [`07_european_regional_buttons.md`](file:///Users/robert/Developer/AndroidStudioProjects/pay_buttons/plan/07_european_regional_buttons.md) |
| **Showcase**| **Interactive Example App for Every Button** | ✅ Completed | [`08_example_app_showcase.md`](file:///Users/robert/Developer/AndroidStudioProjects/pay_buttons/plan/08_example_app_showcase.md) |

> [!IMPORTANT]
> **Example App Mandate for Every Button**:
> As part of the definition of done for each button step, the button must be integrated into `example/lib/main.dart` with:
> 1. An interactive live playground (toggling color, shape, loading, disabled, full-width).
> 2. A side-by-side gallery of all brand color variants and shapes.
> 3. An action feedback SnackBar showing tap interaction.
