import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pay_buttons/pay_buttons.dart';

void main() {
  group('AfterpayButton', () {
    testWidgets('renders mint rounded afterpay button by default', (tester) async {
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

    testWidgets('renders custom text when provided', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AfterpayButton(
              text: 'Buy now with',
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.text('Buy now with'), findsOneWidget);
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

    testWidgets('applies custom textStyle when provided', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AfterpayButton(
              text: 'Buy now with',
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
