
import 'pay_buttons_platform_interface.dart';

class PayButtons {
  Future<String?> getPlatformVersion() {
    return PayButtonsPlatform.instance.getPlatformVersion();
  }
}
