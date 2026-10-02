import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pay_buttons/pay_buttons.dart';

void main() {
  group('AfterpayButton', () {
    testWidgets('renders mint rounded buyNow afterpay button by default', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AfterpayButton(
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.byType(AfterpayButton), findsOneWidget);
      expect(find.byType(SvgPicture), findsOneWidget);
      expect(find.text('Buy now with'), findsOneWidget);
      expect(find.text('afterpay'), findsOneWidget);

      final material = tester.widget<Material>(
        find.descendant(
          of: find.byType(AfterpayButton),
          matching: find.byType(Material),
        ),
      );
      expect(material.color, const Color(0xFFB2FCE4));
    });

    testWidgets('renders clearpay brand correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AfterpayButton(
              brand: AfterpayBrand.clearpay,
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.text('clearpay'), findsOneWidget);
    });

    testWidgets('renders all AfterpayColor themes without error', (tester) async {
      for (final color in AfterpayColor.values) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AfterpayButton(
                color: color,
                onPressed: () {},
              ),
            ),
          ),
        );
        expect(find.byType(AfterpayButton), findsOneWidget);
      }
    });

    testWidgets('renders all AfterpayShape options', (tester) async {
      for (final shape in AfterpayShape.values) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AfterpayButton(
                shape: shape,
                onPressed: () {},
              ),
            ),
          ),
        );
        expect(find.byType(AfterpayButton), findsOneWidget);
      }
    });

    testWidgets('renders all AfterpayButtonType variants', (tester) async {
      for (final type in AfterpayButtonType.values) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AfterpayButton(
                type: type,
                onPressed: () {},
              ),
            ),
          ),
        );
        expect(find.byType(AfterpayButton), findsOneWidget);
      }
    });

    testWidgets('localizes buyNow label when locale is specified', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AfterpayButton(
              type: AfterpayButtonType.buyNow,
              locale: const Locale('de'),
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.text('Jetzt kaufen mit'), findsOneWidget);
    });

    testWidgets('localizes payWith label when locale is specified', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AfterpayButton(
              type: AfterpayButtonType.payWith,
              locale: const Locale('fr'),
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.text('Payer avec'), findsOneWidget);
    });

    testWidgets('applies custom textStyle when provided', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AfterpayButton(
              type: AfterpayButtonType.buyNow,
              onPressed: () {},
              textStyle: const TextStyle(fontWeight: FontWeight.w300),
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Buy now with'));
      expect(textWidget.style?.fontWeight, FontWeight.w300);
    });
  });
}
