/// A cross-platform Flutter package providing beautiful, accessible payment
/// buttons for modern e-commerce checkouts.
library;

// Official Google Pay & Apple Pay from the Flutter pay package
export 'package:pay/pay.dart' hide PayButton, ApplePayButton, GooglePayButton;

// Base framework
export 'src/base/pay_button.dart';
export 'src/base/pay_button_colors.dart';
export 'src/base/pay_button_fonts.dart';
export 'src/base/pay_button_variant.dart';

// Apple Pay
export 'src/buttons/apple_pay/apple_pay_button.dart';
export 'src/buttons/apple_pay/apple_pay_color.dart';
export 'src/buttons/apple_pay/apple_pay_shape.dart';
export 'src/buttons/apple_pay/apple_pay_type.dart';

// Google Pay
export 'src/buttons/google_pay/google_pay_button.dart';
export 'src/buttons/google_pay/google_pay_color.dart';
export 'src/buttons/google_pay/google_pay_environment.dart';
export 'src/buttons/google_pay/google_pay_shape.dart';

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

// Wero (Europe / EPI)
export 'src/buttons/regional/wero/wero_button.dart';
export 'src/buttons/regional/wero/wero_color.dart';
export 'src/buttons/regional/wero/wero_shape.dart';
export 'src/buttons/regional/wero/wero_assets.dart';

// Afterpay / Clearpay
export 'src/buttons/afterpay/afterpay_button.dart';
export 'src/buttons/afterpay/afterpay_color.dart';
export 'src/buttons/afterpay/afterpay_shape.dart';
export 'src/buttons/afterpay/afterpay_brand.dart';
export 'src/buttons/afterpay/afterpay_assets.dart';

// TWINT (Switzerland)
export 'src/buttons/regional/twint/twint_button.dart';
export 'src/buttons/regional/twint/twint_color.dart';
export 'src/buttons/regional/twint/twint_shape.dart';
export 'src/buttons/regional/twint/twint_assets.dart';

// BLIK (Poland)
export 'src/buttons/regional/blik/blik_button.dart';
export 'src/buttons/regional/blik/blik_color.dart';
export 'src/buttons/regional/blik/blik_shape.dart';
export 'src/buttons/regional/blik/blik_assets.dart';

// iDEAL (Netherlands)
export 'src/buttons/regional/ideal/ideal_button.dart';
export 'src/buttons/regional/ideal/ideal_color.dart';
export 'src/buttons/regional/ideal/ideal_shape.dart';
export 'src/buttons/regional/ideal/ideal_assets.dart';

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

// Pix (Brazil)
export 'src/buttons/regional/pix/pix_button.dart';
export 'src/buttons/regional/pix/pix_color.dart';
export 'src/buttons/regional/pix/pix_shape.dart';
export 'src/buttons/regional/pix/pix_assets.dart';

// OXXO (Mexico)
export 'src/buttons/regional/oxxo/oxxo_button.dart';
export 'src/buttons/regional/oxxo/oxxo_color.dart';
export 'src/buttons/regional/oxxo/oxxo_shape.dart';
export 'src/buttons/regional/oxxo/oxxo_assets.dart';

// Boleto Bancário (Brazil)
export 'src/buttons/regional/boleto/boleto_button.dart';
export 'src/buttons/regional/boleto/boleto_color.dart';
export 'src/buttons/regional/boleto/boleto_shape.dart';
export 'src/buttons/regional/boleto/boleto_assets.dart';

// Alipay (China / Global)
export 'src/buttons/regional/alipay/alipay_button.dart';
export 'src/buttons/regional/alipay/alipay_color.dart';
export 'src/buttons/regional/alipay/alipay_shape.dart';
export 'src/buttons/regional/alipay/alipay_assets.dart';

// WeChat Pay (China / Global)
export 'src/buttons/regional/wechat_pay/wechat_pay_button.dart';
export 'src/buttons/regional/wechat_pay/wechat_pay_color.dart';
export 'src/buttons/regional/wechat_pay/wechat_pay_shape.dart';
export 'src/buttons/regional/wechat_pay/wechat_pay_assets.dart';

// PayNow (Singapore)
export 'src/buttons/regional/paynow/paynow_button.dart';
export 'src/buttons/regional/paynow/paynow_color.dart';
export 'src/buttons/regional/paynow/paynow_shape.dart';
export 'src/buttons/regional/paynow/paynow_assets.dart';

// PromptPay (Thailand)
export 'src/buttons/regional/promptpay/promptpay_button.dart';
export 'src/buttons/regional/promptpay/promptpay_color.dart';
export 'src/buttons/regional/promptpay/promptpay_shape.dart';
export 'src/buttons/regional/promptpay/promptpay_assets.dart';

// UPI (India)
export 'src/buttons/regional/upi/upi_button.dart';
export 'src/buttons/regional/upi/upi_color.dart';
export 'src/buttons/regional/upi/upi_shape.dart';
export 'src/buttons/regional/upi/upi_assets.dart';
