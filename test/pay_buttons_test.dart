import 'package:flutter_test/flutter_test.dart';
import 'package:pay_buttons/pay_buttons.dart';
import 'package:pay_buttons/pay_buttons_platform_interface.dart';
import 'package:pay_buttons/pay_buttons_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockPayButtonsPlatform
    with MockPlatformInterfaceMixin
    implements PayButtonsPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final PayButtonsPlatform initialPlatform = PayButtonsPlatform.instance;

  test('$MethodChannelPayButtons is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelPayButtons>());
  });

  test('getPlatformVersion', () async {
    PayButtons payButtonsPlugin = PayButtons();
    MockPayButtonsPlatform fakePlatform = MockPayButtonsPlatform();
    PayButtonsPlatform.instance = fakePlatform;

    expect(await payButtonsPlugin.getPlatformVersion(), '42');
  });
}
