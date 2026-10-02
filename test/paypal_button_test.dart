import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pay_buttons/pay_buttons.dart';

void main() {
  group('PayPalButton', () {
    testWidgets('renders gold pill checkout button by default', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PayPalButton(
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.byType(PayPalButton), findsOneWidget);
      expect(find.byType(SvgPicture), findsNWidgets(2)); // Monogram + Wordmark
      expect(find.text('Checkout'), findsOneWidget);

      final material = tester.widget<Material>(
        find.descendant(
          of: find.byType(PayPalButton),
          matching: find.byType(Material),
        ),
      );
      expect(material.color, const Color(0xFFFFC439));
    });

    testWidgets('renders all PayPalColor themes without error', (tester) async {
      for (final color in PayPalColor.values) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: PayPalButton(
                color: color,
                onPressed: () {},
              ),
            ),
          ),
        );
        expect(find.byType(PayPalButton), findsOneWidget);
      }
    });

    testWidgets('renders all PayPalButtonType variants', (tester) async {
      for (final type in PayPalButtonType.values) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: PayPalButton(
                type: type,
                onPressed: () {},
              ),
            ),
          ),
        );
        expect(find.byType(PayPalButton), findsOneWidget);
      }
    });

    testWidgets('localizes label when locale is specified', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PayPalButton(
              type: PayPalButtonType.payLater,
              locale: const Locale('de'),
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.text('Später bezahlen'), findsOneWidget);
    });

    testWidgets('PayPalPayLaterButton defaults to payLater type', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PayPalPayLaterButton(
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.byType(PayPalPayLaterButton), findsOneWidget);
      expect(find.text('Pay Later'), findsOneWidget);
    });

    testWidgets('PayPalButton applies custom textStyle when provided', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PayPalButton(
              onPressed: () {},
              textStyle: const TextStyle(fontWeight: FontWeight.w900),
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Checkout'));
      expect(textWidget.style?.fontWeight, FontWeight.w900);
    });
  });
}
