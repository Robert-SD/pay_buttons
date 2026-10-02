# Step 8: Example App Showcase Specification

The example app (`example/lib/main.dart`) is not just a demo—it serves as the **living component catalog, visual verification suite, and interactive playground** for every payment button in `pay_buttons`.

---

## 1. Requirements for Every Button in the Example App

Whenever a button is implemented, it **must** be added to the example app with:

1. **Interactive Control Playground**:
   - **Color Theme Switcher**: Select between all supported brand colors (e.g. PayPal Gold, Blue, Black, White, Silver).
   - **Shape Switcher**: Toggle between `pill` and `rounded` shapes.
   - **Type / Action Switcher**: Toggle between action verbs (e.g. `checkout`, `pay`, `buyNow`, `payLater`, `logoOnly`).
   - **State Toggles**:
     - `isLoading`: Toggle spinner state on/off.
     - `enabled`: Toggle interactive vs disabled state.
     - `fullWidth`: Toggle fixed width vs `double.infinity`.
     - `elevation`: Adjust drop shadow slider.
   - **Action Callback**: Tapping the button shows a SnackBar with action feedback (e.g., `"PayPal checkout initiated"`).

2. **All-Variants Gallery Grid**:
   - A dedicated gallery section displaying **all color and shape variants simultaneously** on both light and dark backgrounds.
   - Ensures visual regression testing can be done with a single glance.

3. **Code Snippet Generator**:
   - Displays the exact Flutter code needed to copy-paste the currently configured button into a real app.

---

## 2. Example App Navigation & UI Architecture

```
[ Pay Buttons Example App ]
├── Home / Catalog Screen
│   ├── Overview: Quick checkout demo with multiple buttons side-by-side
│   └── Brand Sections:
│       ├── 1. PayPal & PayPal Pay Later
│       ├── 2. Klarna (Pay Now, Pay Later, Slice It)
│       ├── 3. Amazon Pay
│       ├── 4. Shop Pay
│       ├── 5. Stripe Link
│       ├── 6. Afterpay / Clearpay
│       └── 7. European Regional (TWINT, iDEAL, BLIK, Bancontact, Bizum)
└── Detail / Playground View (Per Button)
    ├── Live Interactive Preview (with real-time state manipulation)
    ├── Side-by-side Variant Grid (Light vs Dark mode)
    └── Copyable Code snippet
```

---

## 3. Checklist for Each Button Step

When building any button step (e.g., Step 1: PayPal):
- [ ] Implement base widget in `lib/src/buttons/`.
- [ ] Export widget in `lib/pay_buttons.dart`.
- [ ] Create dedicated showcase page in `example/lib/pages/<button>_page.dart`.
- [ ] Add entry to `example/lib/main.dart` catalog navigation.
- [ ] Verify both Light and Dark themes in the example app.
