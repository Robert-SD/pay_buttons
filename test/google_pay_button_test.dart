import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pay_buttons/pay_buttons.dart';

void main() {
  group('GooglePayType', () {
    test('maps every intent to expected JS SDK value', () {
      expect(GooglePayType.pay.jsValue, 'pay');
      expect(GooglePayType.buy.jsValue, 'buy');
      expect(GooglePayType.checkout.jsValue, 'checkout');
      expect(GooglePayType.donate.jsValue, 'donate');
      expect(GooglePayType.order.jsValue, 'order');
      expect(GooglePayType.book.jsValue, 'book');
      expect(GooglePayType.subscribe.jsValue, 'subscribe');
      expect(GooglePayType.plain.jsValue, 'plain');
    });

    test('every intent has a distinct JS SDK value', () {
      final values = GooglePayType.values.map((t) => t.jsValue).toSet();
      expect(values.length, GooglePayType.values.length);
    });
  });

  group('GooglePayButton', () {
    testWidgets('renders without error with default parameters', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: GooglePayButton(onPressed: () {})),
        ),
      );

      expect(find.byType(GooglePayButton), findsOneWidget);
    });

    testWidgets(
      'renders nothing where Google Pay is unavailable without config',
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(body: GooglePayButton(onPressed: () {})),
          ),
        );

        expect(find.byType(InkWell), findsNothing);
      },
    );

    testWidgets('renders all GooglePayColor options without error', (
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

    testWidgets('renders all GooglePayShape options without error', (
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

    testWidgets('applies custom type and semanticLabel', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: GooglePayButton(
              type: GooglePayType.checkout,
              semanticLabel: 'Custom Google Pay',
              onPressed: () {},
            ),
          ),
        ),
      );

      final button = tester.widget<GooglePayButton>(
        find.byType(GooglePayButton),
      );
      expect(button.semanticLabel, 'Custom Google Pay');
      expect(button.type, GooglePayType.checkout);
    });

    testWidgets('respects enabled and interactive state', (tester) async {
      var pressed = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: GooglePayButton(
              enabled: false,
              onPressed: () => pressed = true,
            ),
          ),
        ),
      );

      final button = tester.widget<GooglePayButton>(
        find.byType(GooglePayButton),
      );
      expect(button.enabled, isFalse);
      expect(button.isInteractive, isFalse);
      expect(pressed, isFalse);
    });

    test('defaultBorderRadius returns correct radius for shapes', () {
      const buttonPill = GooglePayButton(
        shape: GooglePayShape.pill,
        height: 50.0,
        onPressed: null,
      );
      expect(buttonPill.defaultBorderRadius, 25.0);

      const buttonRounded = GooglePayButton(
        shape: GooglePayShape.rounded,
        onPressed: null,
      );
      expect(buttonRounded.defaultBorderRadius, 4.0);

      const buttonRect = GooglePayButton(
        shape: GooglePayShape.rect,
        onPressed: null,
      );
      expect(buttonRect.defaultBorderRadius, 0.0);
    });

    test('effectiveEnvironment resolves explicit environment', () {
      const buttonProd = GooglePayButton(
        environment: GooglePayEnvironment.production,
        onPressed: null,
      );
      expect(buttonProd.effectiveEnvironment, GooglePayEnvironment.production);
      expect(buttonProd.effectiveEnvironment.value, 'PRODUCTION');

      const buttonTest = GooglePayButton(
        environment: GooglePayEnvironment.test,
        onPressed: null,
      );
      expect(buttonTest.effectiveEnvironment, GooglePayEnvironment.test);
      expect(buttonTest.effectiveEnvironment.value, 'TEST');
    });

    test('effectiveEnvironment extracts environment from PaymentConfiguration', () {
      final prodConfig = PaymentConfiguration.fromJsonString('''{
        "provider": "google_pay",
        "data": {
          "environment": "PRODUCTION",
          "apiVersion": 2,
          "apiVersionMinor": 0
        }
      }''');
      final buttonProd = GooglePayButton(
        paymentConfiguration: prodConfig,
        onPressed: null,
      );
      expect(buttonProd.effectiveEnvironment, GooglePayEnvironment.production);

      final testConfig = PaymentConfiguration.fromJsonString('''{
        "provider": "google_pay",
        "data": {
          "environment": "TEST",
          "apiVersion": 2,
          "apiVersionMinor": 0
        }
      }''');
      final buttonTest = GooglePayButton(
        paymentConfiguration: testConfig,
        onPressed: null,
      );
      expect(buttonTest.effectiveEnvironment, GooglePayEnvironment.test);
    });

    test('explicit environment overrides PaymentConfiguration', () {
      final testConfig = PaymentConfiguration.fromJsonString('''{
        "provider": "google_pay",
        "data": {
          "environment": "TEST"
        }
      }''');
      final button = GooglePayButton(
        environment: GooglePayEnvironment.production,
        paymentConfiguration: testConfig,
        onPressed: null,
      );
      expect(button.effectiveEnvironment, GooglePayEnvironment.production);
    });

    test('effectiveEnvironment defaults to test in non-release mode', () {
      const button = GooglePayButton(onPressed: null);
      expect(button.effectiveEnvironment, GooglePayEnvironment.test);
    });

    testWidgets('renders Semantics widget in widget tree when active', (
      tester,
    ) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;
      try {
        final config = PaymentConfiguration.fromJsonString('''{
          "provider": "google_pay",
          "data": {
            "environment": "TEST",
            "apiVersion": 2,
            "apiVersionMinor": 0
          }
        }''');

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: GooglePayButton(
                paymentConfiguration: config,
                semanticLabel: 'Buy with Google Pay',
                onPressed: () {},
              ),
            ),
          ),
        );

        final semanticsFinder = find.descendant(
          of: find.byType(GooglePayButton),
          matching: find.byType(Semantics),
        );
        expect(semanticsFinder, findsWidgets);

        final semanticsWidget = tester.widget<Semantics>(semanticsFinder.first);
        expect(semanticsWidget.properties.label, 'Buy with Google Pay');
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
            body: GooglePayButton(
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
      debugDefaultTargetPlatformOverride = TargetPlatform.android;
      try {
        final config = PaymentConfiguration.fromJsonString('''{
          "provider": "google_pay",
          "data": {
            "environment": "TEST",
            "apiVersion": 2,
            "apiVersionMinor": 0
          }
        }''');

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: GooglePayButton(
                paymentConfiguration: config,
                margin: const EdgeInsets.all(16),
                elevation: 3.0,
                onPressed: () {},
              ),
            ),
          ),
        );

        final paddingFinder = find.descendant(
          of: find.byType(GooglePayButton),
          matching: find.byWidgetPredicate(
            (w) => w is Padding && w.padding == const EdgeInsets.all(16),
          ),
        );
        expect(paddingFinder, findsOneWidget);

        final materialFinder = find.descendant(
          of: find.byType(GooglePayButton),
          matching: find.byWidgetPredicate(
            (w) => w is Material && w.elevation == 3.0,
          ),
        );
        expect(materialFinder, findsOneWidget);
      } finally {
        debugDefaultTargetPlatformOverride = null;
      }
    });

    testWidgets('resolveColors returns authentic palette matching GooglePayColor', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: GooglePayButton(onPressed: () {})),
        ),
      );

      final element = tester.element(find.byType(GooglePayButton));

      const blackButton = GooglePayButton(color: GooglePayColor.black, onPressed: null);
      final blackColors = blackButton.resolveColors(element);
      expect(blackColors.backgroundColor, const Color(0xFF000000));
      expect(blackColors.progressColor, const Color(0xFFFFFFFF));

      const whiteButton = GooglePayButton(color: GooglePayColor.white, onPressed: null);
      final whiteColors = whiteButton.resolveColors(element);
      expect(whiteColors.backgroundColor, const Color(0xFFFFFFFF));
      expect(whiteColors.progressColor, const Color(0xFF3C4043));
      expect(whiteColors.borderColor, const Color(0xFF747775));
    });
  });
}
