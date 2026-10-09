import 'package:flutter/foundation.dart';
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
      expect(button.type, ApplePayType.donate);
      expect(button.effectiveType, ApplePayType.donate);
    });

    testWidgets('defaults to plain when type is omitted', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: ApplePayButton(onPressed: () {})),
        ),
      );

      final button = tester.widget<ApplePayButton>(find.byType(ApplePayButton));
      expect(button.type, ApplePayType.plain);
      expect(button.effectiveType, ApplePayType.plain);
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

    testWidgets('renders Semantics widget in widget tree when active', (
      tester,
    ) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
      try {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: ApplePayButton(
                semanticLabel: 'Pay with Apple Pay',
                onPressed: () {},
              ),
            ),
          ),
        );

        final semanticsFinder = find.descendant(
          of: find.byType(ApplePayButton),
          matching: find.byType(Semantics),
        );
        expect(semanticsFinder, findsWidgets);

        final semanticsWidget = tester.widget<Semantics>(semanticsFinder.first);
        expect(semanticsWidget.properties.label, 'Pay with Apple Pay');
        expect(semanticsWidget.properties.button, isTrue);
        expect(semanticsWidget.properties.enabled, isTrue);
      } finally {
        debugDefaultTargetPlatformOverride = null;
      }
    });

    testWidgets('renders loading spinner and disables interaction when isLoading is true', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ApplePayButton(
              isLoading: true,
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('applies margin and elevation parameters', (
      tester,
    ) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
      try {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: ApplePayButton(
                margin: const EdgeInsets.all(12),
                elevation: 4.0,
                onPressed: () {},
              ),
            ),
          ),
        );

        final paddingFinder = find.descendant(
          of: find.byType(ApplePayButton),
          matching: find.byWidgetPredicate(
            (w) => w is Padding && w.padding == const EdgeInsets.all(12),
          ),
        );
        expect(paddingFinder, findsOneWidget);

        final materialFinder = find.descendant(
          of: find.byType(ApplePayButton),
          matching: find.byWidgetPredicate(
            (w) => w is Material && w.elevation == 4.0,
          ),
        );
        expect(materialFinder, findsOneWidget);
      } finally {
        debugDefaultTargetPlatformOverride = null;
      }
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

    testWidgets('resolveColors returns authentic palette matching ApplePayColor', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: ApplePayButton(onPressed: () {})),
        ),
      );

      final element = tester.element(find.byType(ApplePayButton));

      const blackButton = ApplePayButton(color: ApplePayColor.black, onPressed: null);
      final blackColors = blackButton.resolveColors(element);
      expect(blackColors.backgroundColor, const Color(0xFF000000));
      expect(blackColors.progressColor, const Color(0xFFFFFFFF));

      const whiteButton = ApplePayButton(color: ApplePayColor.white, onPressed: null);
      final whiteColors = whiteButton.resolveColors(element);
      expect(whiteColors.backgroundColor, const Color(0xFFFFFFFF));
      expect(whiteColors.progressColor, const Color(0xFF000000));

      const outlineButton = ApplePayButton(color: ApplePayColor.whiteOutline, onPressed: null);
      final outlineColors = outlineButton.resolveColors(element);
      expect(outlineColors.backgroundColor, const Color(0xFFFFFFFF));
      expect(outlineColors.progressColor, const Color(0xFF000000));
      expect(outlineColors.borderColor, const Color(0xFF000000));
    });
  });
}
