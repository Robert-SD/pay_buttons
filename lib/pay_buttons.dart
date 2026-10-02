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

/// Legacy platform version helper from template.
class PayButtons {
  Future<String?> getPlatformVersion() {
    return PayButtonsPlatform.instance.getPlatformVersion();
  }
}
