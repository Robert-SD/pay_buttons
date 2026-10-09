import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pay_buttons/pay_buttons.dart';
import 'package:pay_buttons_example/main.dart';

void main() {
  testWidgets('CatalogHomePage renders active buttons', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(800, 2400);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(const PayButtonsExampleApp());

    expect(find.text('Pay Buttons Component Catalog'), findsOneWidget);
    expect(find.text('PayPal & Pay Later'), findsOneWidget);
    expect(find.text('Klarna'), findsOneWidget);
    expect(find.text('Afterpay / Clearpay'), findsOneWidget);
    expect(find.text('Default Payment Buttons'), findsOneWidget);
    expect(find.text('Customize Payment Buttons'), findsOneWidget);
    expect(find.byType(PayPalButton), findsOneWidget);
    expect(find.byType(KlarnaButton), findsOneWidget);
    expect(find.byType(WeroButton), findsOneWidget);
  });
}
