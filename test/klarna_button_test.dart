import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pay_buttons/pay_buttons.dart';

void main() {
  group('KlarnaButton', () {
    testWidgets('renders pink rounded express button by default', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: KlarnaButton(
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.byType(KlarnaButton), findsOneWidget);
      expect(find.byType(SvgPicture), findsOneWidget);
      expect(find.text('Pay with'), findsOneWidget);

      final material = tester.widget<Material>(
        find.descendant(
          of: find.byType(KlarnaButton),
          matching: find.byType(Material),
        ),
      );
      expect(material.color, const Color(0xFFFFA8CD));
    });

    testWidgets('renders all KlarnaColor themes without error', (tester) async {
      for (final color in KlarnaColor.values) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: KlarnaButton(
                color: color,
                onPressed: () {},
              ),
            ),
          ),
        );
        expect(find.byType(KlarnaButton), findsOneWidget);
      }
    });

    testWidgets('renders all KlarnaShape options', (tester) async {
      for (final shape in KlarnaShape.values) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: KlarnaButton(
                shape: shape,
                onPressed: () {},
              ),
            ),
          ),
        );
        expect(find.byType(KlarnaButton), findsOneWidget);
      }
    });

    testWidgets('renders all KlarnaButtonType variants', (tester) async {
      for (final type in KlarnaButtonType.values) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: KlarnaButton(
                type: type,
                onPressed: () {},
              ),
            ),
          ),
        );
        expect(find.byType(KlarnaButton), findsOneWidget);
      }
    });

    testWidgets('localizes label when locale is specified', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: KlarnaButton(
              type: KlarnaButtonType.payNow,
              locale: const Locale('de'),
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.text('Sofort bezahlen'), findsOneWidget);
    });

    testWidgets('localizes label in Swedish', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: KlarnaButton(
              type: KlarnaButtonType.payLater,
              locale: const Locale('sv'),
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.text('Få först. Betala sen.'), findsOneWidget);
    });

    testWidgets('applies custom textStyle when provided', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: KlarnaButton(
              onPressed: () {},
              textStyle: const TextStyle(fontWeight: FontWeight.w300),
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Pay with'));
      expect(textWidget.style?.fontWeight, FontWeight.w300);
    });
  });
}
