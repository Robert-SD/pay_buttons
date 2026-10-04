library;

import 'pay_buttons_platform_interface.dart';

// Base framework
export 'src/base/pay_button.dart';
export 'src/base/pay_button_colors.dart';
export 'src/base/pay_button_fonts.dart';

// PayPal
export 'src/buttons/paypal/paypal_button.dart';
export 'src/buttons/paypal/paypal_pay_later_button.dart';
export 'src/buttons/paypal/paypal_color.dart';
export 'src/buttons/paypal/paypal_shape.dart';
export 'src/buttons/paypal/paypal_assets.dart';

// Klarna
export 'src/buttons/klarna/klarna_button.dart';
export 'src/buttons/klarna/klarna_color.dart';
export 'src/buttons/klarna/klarna_shape.dart';
export 'src/buttons/klarna/klarna_assets.dart';

// Amazon Pay
export 'src/buttons/amazon_pay/amazon_pay_button.dart';
export 'src/buttons/amazon_pay/amazon_pay_color.dart';
export 'src/buttons/amazon_pay/amazon_pay_shape.dart';
export 'src/buttons/amazon_pay/amazon_pay_assets.dart';

// Shop Pay
export 'src/buttons/shop_pay/shop_pay_button.dart';
export 'src/buttons/shop_pay/shop_pay_color.dart';
export 'src/buttons/shop_pay/shop_pay_shape.dart';
export 'src/buttons/shop_pay/shop_pay_assets.dart';

// Stripe Link
export 'src/buttons/stripe_link/stripe_link_button.dart';
export 'src/buttons/stripe_link/stripe_link_color.dart';
export 'src/buttons/stripe_link/stripe_link_shape.dart';
export 'src/buttons/stripe_link/stripe_link_assets.dart';

// Afterpay / Clearpay
export 'src/buttons/afterpay/afterpay_button.dart';
export 'src/buttons/afterpay/afterpay_color.dart';
export 'src/buttons/afterpay/afterpay_shape.dart';
export 'src/buttons/afterpay/afterpay_brand.dart';
export 'src/buttons/afterpay/afterpay_assets.dart';

// European Regional Champions
// TWINT (Switzerland)
export 'src/buttons/regional/twint/twint_button.dart';
export 'src/buttons/regional/twint/twint_color.dart';
export 'src/buttons/regional/twint/twint_shape.dart';
export 'src/buttons/regional/twint/twint_assets.dart';

// iDEAL (Netherlands)
export 'src/buttons/regional/ideal/ideal_button.dart';
export 'src/buttons/regional/ideal/ideal_color.dart';
export 'src/buttons/regional/ideal/ideal_shape.dart';
export 'src/buttons/regional/ideal/ideal_assets.dart';

// BLIK (Poland)
export 'src/buttons/regional/blik/blik_button.dart';
export 'src/buttons/regional/blik/blik_color.dart';
export 'src/buttons/regional/blik/blik_shape.dart';
export 'src/buttons/regional/blik/blik_assets.dart';

// Bancontact (Belgium)
export 'src/buttons/regional/bancontact/bancontact_button.dart';
export 'src/buttons/regional/bancontact/bancontact_color.dart';
export 'src/buttons/regional/bancontact/bancontact_shape.dart';
export 'src/buttons/regional/bancontact/bancontact_assets.dart';

// Bizum (Spain)
export 'src/buttons/regional/bizum/bizum_button.dart';
export 'src/buttons/regional/bizum/bizum_color.dart';
export 'src/buttons/regional/bizum/bizum_shape.dart';
export 'src/buttons/regional/bizum/bizum_assets.dart';

/// Legacy platform version helper from template.
class PayButtons {
  Future<String?> getPlatformVersion() {
    return PayButtonsPlatform.instance.getPlatformVersion();
  }
}
