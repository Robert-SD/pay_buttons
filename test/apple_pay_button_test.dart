import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pay_buttons/pay_buttons.dart';

void main() {
  group('ApplePayType', () {
    test('maps every intent to a hyphenated JS SDK value', () {
      expect(ApplePayType.plain.jsValue, 'plain');
      expect(ApplePayType.checkout.jsValue, 'check-out');
      expect(ApplePayType.setUp.jsValue, 'set-up');
      expect(ApplePayType.inStore.jsValue, 'in-store');
      expect(ApplePayType.addMoney.jsValue, 'add-money');
      expect(ApplePayType.topUp.jsValue, 'top-up');
    });

    test('every intent has a distinct JS SDK value', () {
      final values = ApplePayType.values.map((t) => t.jsValue).toSet();
      expect(values.length, ApplePayType.values.length);
    });

    test('infers an intent from a user-supplied label', () {
      expect(ApplePayType.tryParseLabel('Buy with'), ApplePayType.buy);
      expect(
        ApplePayType.tryParseLabel('check out with'),
        ApplePayType.checkout,
      );
      expect(ApplePayType.tryParseLabel('  Donate  '), ApplePayType.donate);
      expect(ApplePayType.tryParseLabel('Top up'), ApplePayType.topUp);
    });

    test('returns null for labels that name no intent', () {
      expect(ApplePayType.tryParseLabel('Pay now'), isNull);
      expect(ApplePayType.tryParseLabel(null), isNull);
      expect(ApplePayType.tryParseLabel(''), isNull);
    });
  });

  group('ApplePayButton', () {
    // The tests run on the Flutter test platform, where neither the iOS
    // PassKit control nor the web JS SDK element is available. Apple's
    // guidelines forbid substituting a drawn button, so the correct result is
    // an empty box.
    testWidgets('renders nothing where Apple Pay is unavailable', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: ApplePayButton(onPressed: () {})),
        ),
      );

      expect(find.byType(InkWell), findsNothing);
      expect(find.byType(SvgPicture), findsNothing);
    });

    testWidgets('renders nothing when userCanPay is false', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ApplePayButton(userCanPay: false, onPressed: () {}),
          ),
        ),
      );

      expect(find.byType(InkWell), findsNothing);
    });

    testWidgets('resolves type from the explicit type property', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ApplePayButton(type: ApplePayType.donate, onPressed: () {}),
          ),
        ),
      );

      final button = tester.widget<ApplePayButton>(find.byType(ApplePayButton));
      expect(button.effectiveType, ApplePayType.donate);
    });

    testWidgets('falls back to the text label when type is omitted', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ApplePayButton(text: 'Buy with', onPressed: () {}),
          ),
        ),
      );

      final button = tester.widget<ApplePayButton>(find.byType(ApplePayButton));
      expect(button.effectiveType, ApplePayType.buy);
    });

    testWidgets('explicit type wins over the text label', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ApplePayButton(
              text: 'Buy with',
              type: ApplePayType.checkout,
              onPressed: () {},
            ),
          ),
        ),
      );

      final button = tester.widget<ApplePayButton>(find.byType(ApplePayButton));
      expect(button.effectiveType, ApplePayType.checkout);
    });

    testWidgets('defaults to plain when neither type nor text is given', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: ApplePayButton(onPressed: () {})),
        ),
      );

      final button = tester.widget<ApplePayButton>(find.byType(ApplePayButton));
      expect(button.effectiveType, ApplePayType.plain);
    });

    testWidgets('never renders the caller-supplied text', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ApplePayButton(text: 'Buy with', onPressed: () {}),
          ),
        ),
      );

      // The wording comes from Apple's own control, never from Flutter.
      expect(find.text('Buy with'), findsNothing);
    });

    testWidgets('defaults the semantics label to the intent', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ApplePayButton(type: ApplePayType.checkout, onPressed: () {}),
          ),
        ),
      );

      final button = tester.widget<ApplePayButton>(find.byType(ApplePayButton));
      expect(button.semanticLabel, 'Check out with Apple Pay');
    });

    testWidgets('honours an explicit semantic label', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ApplePayButton(semanticLabel: 'Pay now', onPressed: () {}),
          ),
        ),
      );

      final button = tester.widget<ApplePayButton>(find.byType(ApplePayButton));
      expect(button.semanticLabel, 'Pay now');
    });

    testWidgets('accepts every intent without error', (tester) async {
      for (final type in ApplePayType.values) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: ApplePayButton(type: type, onPressed: () {}),
            ),
          ),
        );
        expect(find.byType(ApplePayButton), findsOneWidget);
      }
    });

    testWidgets('accepts every colour without error', (tester) async {
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

    testWidgets('rejects a Flutter colour palette', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: ApplePayButton(onPressed: () {})),
        ),
      );

      final button = tester.widget<ApplePayButton>(find.byType(ApplePayButton));
      expect(
        () => button.resolveColors(tester.element(find.byType(ApplePayButton))),
        throwsUnsupportedError,
      );
    });
  });
}
