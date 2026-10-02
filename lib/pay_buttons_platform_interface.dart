import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'pay_buttons_method_channel.dart';

abstract class PayButtonsPlatform extends PlatformInterface {
  /// Constructs a PayButtonsPlatform.
  PayButtonsPlatform() : super(token: _token);

  static final Object _token = Object();

  static PayButtonsPlatform _instance = MethodChannelPayButtons();

  /// The default instance of [PayButtonsPlatform] to use.
  ///
  /// Defaults to [MethodChannelPayButtons].
  static PayButtonsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PayButtonsPlatform] when
  /// they register themselves.
  static set instance(PayButtonsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
