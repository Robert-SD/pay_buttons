import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pay_buttons/pay_buttons.dart';

void main() {
  group('ApplePayButton', () {
    testWidgets('renders black pill logo-only button by default', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: ApplePayButton(onPressed: () {})),
        ),
      );

      expect(find.byType(ApplePayButton), findsOneWidget);
      expect(find.byType(SvgPicture), findsOneWidget);
      expect(find.text('Apple Pay'), findsNothing); // Logo SVG used, not Text

      final material = tester.widget<Material>(
        find.descendant(
          of: find.byType(ApplePayButton),
          matching: find.byType(Material),
        ),
      );
      expect(material.color, const Color(0xFF000000));
      final shape = material.shape as RoundedRectangleBorder;
      expect(shape.borderRadius, BorderRadius.circular(24.0));
    });

    testWidgets('renders custom text when provided', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ApplePayButton(text: 'Buy with', onPressed: () {}),
          ),
        ),
      );

      expect(find.byType(ApplePayButton), findsOneWidget);
      expect(find.text('Buy with'), findsOneWidget);
    });

    testWidgets('supports logoFirst property', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ApplePayButton(
              text: 'Pay',
              logoFirst: true,
              onPressed: () {},
            ),
          ),
        ),
      );

      final row = tester.widget<Row>(
        find.descendant(
          of: find.byType(ApplePayButton),
          matching: find.byType(Row),
        ),
      );
      expect(row.children.first, isA<SvgPicture>());
    });

    testWidgets('renders all ApplePayColor themes without error', (
      tester,
    ) async {
      for (final color in ApplePayColor.values) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: ApplePayButton(color: color, onPressed: () {}),
            ),
          ),
        );
        expect(find.byType(ApplePayButton), findsOneWidget);
      }
    });

    testWidgets('whiteOutline color theme applies 1px black border', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ApplePayButton(
              color: ApplePayColor.whiteOutline,
              onPressed: () {},
            ),
          ),
        ),
      );

      final material = tester.widget<Material>(
        find.descendant(
          of: find.byType(ApplePayButton),
          matching: find.byType(Material),
        ),
      );
      final shape = material.shape as RoundedRectangleBorder;
      expect(shape.side.color, const Color(0xFF000000));
      expect(shape.side.width, 1.0);
    });

    testWidgets('renders all ApplePayShape contours correctly', (
      tester,
    ) async {
      for (final shape in ApplePayShape.values) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: ApplePayButton(shape: shape, onPressed: () {}),
            ),
          ),
        );
        expect(find.byType(ApplePayButton), findsOneWidget);
      }
    });

    testWidgets('applies custom textStyle when provided', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ApplePayButton(
              text: 'Pay with',
              onPressed: () {},
              textStyle: const TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Pay with'));
      expect(textWidget.style?.fontWeight, FontWeight.w700);
    });

    testWidgets('defaults to PayButtonFonts.applePay fallback', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ApplePayButton(text: 'Buy with', onPressed: () {}),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Buy with'));
      expect(textWidget.style?.fontFamilyFallback, PayButtonFonts.applePay);
    });

    testWidgets('announces Apple Pay semantics to screen readers', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: ApplePayButton(onPressed: () {})),
        ),
      );

      final semantics = tester.getSemantics(find.byType(ApplePayButton));
      expect(semantics.label, equals('Apple Pay'));
      expect(semantics.flagsCollection.isButton, isTrue);
      expect(semantics.flagsCollection.isEnabled.value, 1);
    });

    testWidgets(
      'announces prefix text with Apple Pay to screen readers when text is present',
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: ApplePayButton(text: 'Donate with', onPressed: () {}),
            ),
          ),
        );

        final semantics = tester.getSemantics(find.byType(ApplePayButton));
        expect(semantics.label, contains('Donate with Apple Pay'));
      },
    );
  });
}
