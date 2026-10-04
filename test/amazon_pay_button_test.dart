import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pay_buttons/pay_buttons.dart';

void main() {
  group('AmazonPayButton', () {
    testWidgets('renders gold pill logo-only button by default', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AmazonPayButton(
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.byType(AmazonPayButton), findsOneWidget);
      expect(find.byType(SvgPicture), findsOneWidget);
      expect(find.byType(Text), findsNothing);

      final material = tester.widget<Material>(
        find.descendant(
          of: find.byType(AmazonPayButton),
          matching: find.byType(Material),
        ),
      );
      expect(material.color, const Color(0xFFFFC439));
    });

    testWidgets('renders custom text when provided', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AmazonPayButton(
              text: 'Check out with',
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.text('Check out with'), findsOneWidget);
    });

    testWidgets('renders all AmazonPayColor themes without error', (tester) async {
      for (final color in AmazonPayColor.values) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AmazonPayButton(
                color: color,
                onPressed: () {},
              ),
            ),
          ),
        );
        expect(find.byType(AmazonPayButton), findsOneWidget);
      }
    });

    testWidgets('renders all AmazonPayShape options', (tester) async {
      for (final shape in AmazonPayShape.values) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AmazonPayButton(
                shape: shape,
                onPressed: () {},
              ),
            ),
          ),
        );
        expect(find.byType(AmazonPayButton), findsOneWidget);
      }
    });

    testWidgets('applies custom textStyle when provided', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AmazonPayButton(
              text: 'Check out with',
              onPressed: () {},
              textStyle: const TextStyle(fontWeight: FontWeight.w400),
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Check out with'));
      expect(textWidget.style?.fontWeight, FontWeight.w400);
    });
  });
}
