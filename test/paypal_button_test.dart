import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pay_buttons/pay_buttons.dart';

void main() {
  group('PayPalButton', () {
    testWidgets('renders gold pill logo-only button by default', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: PayPalButton(onPressed: () {})),
        ),
      );

      expect(find.byType(PayPalButton), findsOneWidget);
      expect(find.byType(SvgPicture), findsNWidgets(2)); // Monogram + Wordmark
      expect(find.byType(Text), findsNothing); // Default is null so no text

      final material = tester.widget<Material>(
        find.descendant(
          of: find.byType(PayPalButton),
          matching: find.byType(Material),
        ),
      );
      expect(material.color, const Color(0xFFFFC439));
    });

    testWidgets('renders custom text when provided', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PayPalButton(text: 'Checkout', onPressed: () {}),
          ),
        ),
      );

      expect(find.byType(PayPalButton), findsOneWidget);
      expect(find.text('Checkout'), findsOneWidget);
    });

    testWidgets('renders all PayPalColor themes without error', (tester) async {
      for (final color in PayPalColor.values) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: PayPalButton(color: color, onPressed: () {}),
            ),
          ),
        );
        expect(find.byType(PayPalButton), findsOneWidget);
      }
    });

    testWidgets('PayPalPayLaterButton defaults to Pay Later text', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: PayPalPayLaterButton(onPressed: () {})),
        ),
      );

      expect(find.byType(PayPalPayLaterButton), findsOneWidget);
      expect(find.text('Pay Later'), findsOneWidget);
    });

    testWidgets('PayPalButton applies custom textStyle when provided', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PayPalButton(
              text: 'Checkout',
              onPressed: () {},
              textStyle: const TextStyle(fontWeight: FontWeight.w900),
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Checkout'));
      expect(textWidget.style?.fontWeight, FontWeight.w900);
    });

    testWidgets('PayPalButton applies custom fontFamily when provided', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PayPalButton(
              text: 'Checkout',
              onPressed: () {},
              fontFamily: 'CustomPayPalFont',
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Checkout'));
      expect(textWidget.style?.fontFamily, 'CustomPayPalFont');
    });

    testWidgets('PayPalButton defaults to PayButtonFonts.paypal fallback', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PayPalButton(text: 'Checkout', onPressed: () {}),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Checkout'));
      expect(textWidget.style?.fontFamilyFallback, PayButtonFonts.paypal);
    });

    testWidgets(
      'PayPalPayLaterButton announces PayPal Pay Later to screen readers',
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(body: PayPalPayLaterButton(onPressed: () {})),
          ),
        );

        final semantics = tester.getSemantics(
          find.byType(PayPalPayLaterButton),
        );
        expect(semantics.label, contains('PayPal Pay Later'));
        expect(semantics.flagsCollection.isButton, isTrue);
        expect(semantics.flagsCollection.isEnabled.value, 1);
      },
    );

    testWidgets('PayPalPayLaterButton renders vector mark in compact variant', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PayPalPayLaterButton(
              variant: PayButtonVariant.compact,
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.byType(PayPalPayLaterButton), findsOneWidget);
      expect(find.byType(SvgPicture), findsOneWidget); // payLaterMark
    });

    testWidgets(
      'PayPalPayLaterButton renders vector mark in medium variant without text',
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: PayPalPayLaterButton(
                text: null,
                variant: PayButtonVariant.medium,
                onPressed: () {},
              ),
            ),
          ),
        );

        expect(find.byType(PayPalPayLaterButton), findsOneWidget);
        expect(find.byType(SvgPicture), findsOneWidget); // payLaterMark
      },
    );
  });
}
