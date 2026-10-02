import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'pay_buttons_platform_interface.dart';

/// An implementation of [PayButtonsPlatform] that uses method channels.
class MethodChannelPayButtons extends PayButtonsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('pay_buttons');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>(
      'getPlatformVersion',
    );
    return version;
  }
}
