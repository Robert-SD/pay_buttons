library;

import 'pay_buttons_platform_interface.dart';

// Base framework
export 'src/base/pay_button.dart';
export 'src/base/pay_button_colors.dart';

// PayPal
export 'src/buttons/paypal/paypal_button.dart';
export 'src/buttons/paypal/paypal_pay_later_button.dart';
export 'src/buttons/paypal/paypal_color.dart';
export 'src/buttons/paypal/paypal_shape.dart';
export 'src/buttons/paypal/paypal_button_type.dart';
export 'src/buttons/paypal/paypal_assets.dart';

// Klarna
export 'src/buttons/klarna/klarna_button.dart';
export 'src/buttons/klarna/klarna_color.dart';
export 'src/buttons/klarna/klarna_shape.dart';
export 'src/buttons/klarna/klarna_button_type.dart';
export 'src/buttons/klarna/klarna_assets.dart';

// Amazon Pay
export 'src/buttons/amazon_pay/amazon_pay_button.dart';
export 'src/buttons/amazon_pay/amazon_pay_color.dart';
export 'src/buttons/amazon_pay/amazon_pay_shape.dart';
export 'src/buttons/amazon_pay/amazon_pay_button_type.dart';
export 'src/buttons/amazon_pay/amazon_pay_assets.dart';

// Shop Pay
export 'src/buttons/shop_pay/shop_pay_button.dart';
export 'src/buttons/shop_pay/shop_pay_color.dart';
export 'src/buttons/shop_pay/shop_pay_shape.dart';
export 'src/buttons/shop_pay/shop_pay_button_type.dart';
export 'src/buttons/shop_pay/shop_pay_assets.dart';

// Stripe Link
export 'src/buttons/stripe_link/stripe_link_button.dart';
export 'src/buttons/stripe_link/stripe_link_color.dart';
export 'src/buttons/stripe_link/stripe_link_shape.dart';
export 'src/buttons/stripe_link/stripe_link_button_type.dart';
export 'src/buttons/stripe_link/stripe_link_assets.dart';

/// Legacy platform version helper from template.
class PayButtons {
  Future<String?> getPlatformVersion() {
    return PayButtonsPlatform.instance.getPlatformVersion();
  }
}
