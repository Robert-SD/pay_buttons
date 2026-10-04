import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pay_buttons/pay_buttons.dart';

void main() {
  group('GooglePayButton', () {
    testWidgets('renders black pill logo-only button by default', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: GooglePayButton(onPressed: () {})),
        ),
      );

      expect(find.byType(GooglePayButton), findsOneWidget);
      expect(find.byType(SvgPicture), findsOneWidget);
      expect(find.byType(Text), findsNothing);

      final material = tester.widget<Material>(
        find.descendant(
          of: find.byType(GooglePayButton),
          matching: find.byType(Material),
        ),
      );
      expect(material.color, const Color(0xFF000000));
    });

    testWidgets('renders custom text when provided', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: GooglePayButton(text: 'Buy with', onPressed: () {}),
          ),
        ),
      );

      expect(find.byType(GooglePayButton), findsOneWidget);
      expect(find.text('Buy with'), findsOneWidget);
    });

    testWidgets('supports logoFirst property', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: GooglePayButton(
              text: 'Pay',
              logoFirst: true,
              onPressed: () {},
            ),
          ),
        ),
      );

      final row = tester.widget<Row>(
        find.descendant(
          of: find.byType(GooglePayButton),
          matching: find.byType(Row),
        ),
      );
      expect(row.children.first, isA<SvgPicture>());
    });

    testWidgets('renders all GooglePayColor themes without error', (
      tester,
    ) async {
      for (final color in GooglePayColor.values) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: GooglePayButton(color: color, onPressed: () {}),
            ),
          ),
        );
        expect(find.byType(GooglePayButton), findsOneWidget);
      }
    });

    testWidgets('white color theme applies standard border', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: GooglePayButton(
              color: GooglePayColor.white,
              onPressed: () {},
            ),
          ),
        ),
      );

      final material = tester.widget<Material>(
        find.descendant(
          of: find.byType(GooglePayButton),
          matching: find.byType(Material),
        ),
      );
      final shape = material.shape as RoundedRectangleBorder;
      expect(shape.side.color, const Color(0xFF747775));
    });

    testWidgets('renders all GooglePayShape contours correctly', (
      tester,
    ) async {
      for (final shape in GooglePayShape.values) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: GooglePayButton(shape: shape, onPressed: () {}),
            ),
          ),
        );
        expect(find.byType(GooglePayButton), findsOneWidget);
      }
    });

    testWidgets('applies custom textStyle when provided', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: GooglePayButton(
              text: 'Buy with',
              onPressed: () {},
              textStyle: const TextStyle(fontWeight: FontWeight.w800),
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Buy with'));
      expect(textWidget.style?.fontWeight, FontWeight.w800);
    });

    testWidgets('defaults to PayButtonFonts.googlePay fallback', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: GooglePayButton(text: 'Buy with', onPressed: () {}),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Buy with'));
      expect(textWidget.style?.fontFamilyFallback, PayButtonFonts.googlePay);
    });

    testWidgets('announces Google Pay semantics to screen readers', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: GooglePayButton(onPressed: () {})),
        ),
      );

      final semantics = tester.getSemantics(find.byType(GooglePayButton));
      expect(semantics.label, equals('Google Pay'));
      expect(semantics.flagsCollection.isButton, isTrue);
      expect(semantics.flagsCollection.isEnabled.value, 1);
    });

    testWidgets(
      'announces prefix text with Google Pay to screen readers when text is present',
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: GooglePayButton(text: 'Buy with', onPressed: () {}),
            ),
          ),
        );

        final semantics = tester.getSemantics(find.byType(GooglePayButton));
        expect(semantics.label, contains('Buy with Google Pay'));
      },
    );
  });
}
