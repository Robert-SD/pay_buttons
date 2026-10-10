import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pay_buttons/pay_buttons.dart';

class _TestPayButton extends PayButton {
  const _TestPayButton({
    required super.onPressed,
    super.text,
    super.textStyle,
    super.fontFamily,
    super.fontFamilyFallback,
    super.isLoading,
    super.enabled,
    super.semanticLabel,
  });

  @override
  Widget buildButtonContent(BuildContext context) {
    return const Text('Test Pay');
  }

  @override
  PayButtonColors resolveColors(BuildContext context) {
    return const PayButtonColors(
      backgroundColor: Colors.blue,
      progressColor: Colors.white,
    );
  }

  TextStyle testResolveTextStyle({
    required Color textColor,
    required double fontSize,
    required FontWeight fontWeight,
    double letterSpacing = -0.2,
    required List<String> defaultFontFamilyFallback,
  }) {
    return resolveTextStyle(
      textColor: textColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
      defaultFontFamilyFallback: defaultFontFamilyFallback,
    );
  }
}

class _TestFullPayButton extends PayButton {
  const _TestFullPayButton({
    required super.onPressed,
    super.text,
    super.variant = PayButtonVariant.responsive,
  });

  @override
  Widget buildMediumContent(BuildContext context) => const Icon(Icons.payment);

  @override
  PayButtonColors resolveColors(BuildContext context) {
    return const PayButtonColors(
      backgroundColor: Colors.blue,
      progressColor: Colors.white,
    );
  }
}

class _TestCustomDisabledPayButton extends PayButton {
  const _TestCustomDisabledPayButton({
    required super.onPressed,
    super.enabled,
  });

  @override
  Widget buildButtonContent(BuildContext context) => const Text('Custom');

  @override
  PayButtonColors resolveColors(BuildContext context) {
    return const PayButtonColors(
      backgroundColor: Colors.blue,
      disabledBackgroundColor: Color(0xFFE2E2E2),
    );
  }
}

void main() {
  group('PayButton Base Contract', () {
    testWidgets('renders content and responds to tap when enabled', (
      tester,
    ) async {
      var tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: _TestPayButton(
              onPressed: () => tapped = true,
              semanticLabel: 'Test Pay Button',
            ),
          ),
        ),
      );

      expect(find.text('Test Pay'), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsNothing);

      await tester.tap(find.byType(_TestPayButton));
      await tester.pumpAndSettle();

      expect(tapped, isTrue);
    });

    testWidgets('does not respond to tap when enabled is false', (
      tester,
    ) async {
      var tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: _TestPayButton(
              onPressed: () => tapped = true,
              enabled: false,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(_TestPayButton));
      await tester.pumpAndSettle();

      expect(tapped, isFalse);
    });

    testWidgets(
      'shows CircularProgressIndicator and disables tap when isLoading is true',
      (tester) async {
        var tapped = false;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: _TestPayButton(
                onPressed: () => tapped = true,
                isLoading: true,
              ),
            ),
          ),
        );

        expect(find.byType(CircularProgressIndicator), findsOneWidget);
        expect(find.text('Test Pay'), findsNothing);

        await tester.tap(find.byType(_TestPayButton));
        await tester.pump();

        expect(tapped, isFalse);
      },
    );

    testWidgets('renders semantics with label', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: _TestPayButton(
              onPressed: () {},
              semanticLabel: 'Custom Semantic Label',
            ),
          ),
        ),
      );

      final semantics = tester.getSemantics(find.byType(_TestPayButton));
      expect(semantics.label, contains('Custom Semantic Label'));
      expect(semantics.flagsCollection.isButton, isTrue);
      expect(semantics.flagsCollection.isEnabled.value, 1);
    });

    test('resolveTextStyle merges custom textStyle and font properties', () {
      final button = _TestPayButton(
        onPressed: () {},
        text: 'Checkout',
        textStyle: const TextStyle(letterSpacing: 1.5, color: Colors.purple),
        fontFamily: 'MyBrandFont',
        fontFamilyFallback: const ['BackupFont1', 'BackupFont2'],
      );

      final resolved = button.testResolveTextStyle(
        textColor: Colors.black,
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
        defaultFontFamilyFallback: const ['DefaultFallback'],
      );

      expect(resolved.color, Colors.purple);
      expect(resolved.fontSize, 16.0);
      expect(resolved.fontWeight, FontWeight.bold);
      expect(resolved.letterSpacing, 1.5);
      expect(resolved.fontFamily, 'MyBrandFont');
      expect(resolved.fontFamilyFallback, ['BackupFont1', 'BackupFont2']);
    });

    test('PayButtonFonts defines valid fallback chains for all providers', () {
      expect(PayButtonFonts.paypal, contains('PayPal Pro'));
      expect(PayButtonFonts.klarna, contains('Klarna Text'));
      expect(PayButtonFonts.afterpay, contains('Youth'));
      expect(PayButtonFonts.twint, contains('Helvetica Neue'));
      expect(PayButtonFonts.ideal, contains('Inter'));
      expect(PayButtonFonts.blik, contains('Lato'));
      expect(PayButtonFonts.bancontact, contains('Gotham'));
      expect(PayButtonFonts.bizum, contains('Omnes'));
      expect(PayButtonFonts.wero, contains('GT Walsheim'));
    });

    testWidgets(
      'buildFullContent renders inside unbounded Row without RenderFlex crash',
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Row(
                children: [
                  _TestFullPayButton(text: 'Pay Now', onPressed: () {}),
                ],
              ),
            ),
          ),
        );

        expect(find.text('Pay Now'), findsOneWidget);
        expect(tester.takeException(), isNull);
      },
    );

    testWidgets(
      'buildFullContent with explicit variant full renders inside unbounded horizontal ListView',
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _TestFullPayButton(
                      text: 'Pay With Card',
                      variant: PayButtonVariant.full,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        );

        expect(find.text('Pay With Card'), findsOneWidget);
        expect(tester.takeException(), isNull);
      },
    );

    testWidgets(
        'Semantics specifies excludeSemantics: true to avoid double announcement',
        (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: _TestPayButton(
              onPressed: () {},
              semanticLabel: 'Pay with Test',
            ),
          ),
        ),
      );

      final semanticsFinder = find.descendant(
        of: find.byType(_TestPayButton),
        matching: find.byType(Semantics),
      );
      expect(semanticsFinder, findsWidgets);

      final outerSemantics = tester.widget<Semantics>(semanticsFinder.first);
      expect(outerSemantics.properties.label, 'Pay with Test');
      expect(outerSemantics.properties.button, isTrue);
      expect(outerSemantics.properties.enabled, isTrue);
      expect(outerSemantics.excludeSemantics, isTrue);
    });

    testWidgets(
        'disabled button wraps content in 0.38 opacity and uses disabled colors',
        (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: _TestPayButton(
              onPressed: () {},
              enabled: false,
            ),
          ),
        ),
      );

      // Verify Opacity widget with 0.38
      final opacityFinder = find.descendant(
        of: find.byType(_TestPayButton),
        matching: find.byType(Opacity),
      );
      expect(opacityFinder, findsOneWidget);
      final opacityWidget = tester.widget<Opacity>(opacityFinder);
      expect(opacityWidget.opacity, 0.38);

      // Verify Material disabled background color in light mode
      final material = tester.widget<Material>(
        find.descendant(
          of: find.byType(_TestPayButton),
          matching: find.byType(Material),
        ),
      );
      expect(material.color, const Color(0xFFE2E2E2));
    });

    testWidgets(
        'disabled button uses dark disabled background color in dark theme', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.dark(),
          home: Scaffold(
            body: _TestPayButton(
              onPressed: () {},
              enabled: false,
            ),
          ),
        ),
      );

      final material = tester.widget<Material>(
        find.descendant(
          of: find.byType(_TestPayButton),
          matching: find.byType(Material),
        ),
      );
      expect(material.color, const Color(0xFF2C2C2E));
    });

    testWidgets(
      'explicit disabledBackgroundColor is not overridden in dark mode',
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: ThemeData.dark(),
            home: Scaffold(
              body: _TestCustomDisabledPayButton(
                onPressed: () {},
                enabled: false,
              ),
            ),
          ),
        );

        final material = tester.widget<Material>(
          find.descendant(
            of: find.byType(_TestCustomDisabledPayButton),
            matching: find.byType(Material),
          ),
        );
        expect(material.color, const Color(0xFFE2E2E2));
      },
    );

    test('PayButtonFonts contains no CSS-only names', () {
      final allFallbacks = [
        ...PayButtonFonts.paypal,
        ...PayButtonFonts.klarna,
        ...PayButtonFonts.afterpay,
        ...PayButtonFonts.twint,
        ...PayButtonFonts.ideal,
        ...PayButtonFonts.blik,
        ...PayButtonFonts.bancontact,
        ...PayButtonFonts.bizum,
        ...PayButtonFonts.pix,
        ...PayButtonFonts.boleto,
        ...PayButtonFonts.oxxo,
        ...PayButtonFonts.alipay,
        ...PayButtonFonts.wechatPay,
        ...PayButtonFonts.paynow,
        ...PayButtonFonts.promptpay,
        ...PayButtonFonts.upi,
        ...PayButtonFonts.wero,
      ];

      expect(allFallbacks.contains('-apple-system'), isFalse);
      expect(allFallbacks.contains('BlinkMacSystemFont'), isFalse);
    });
  });

  group('PayButtonColors Brightness Resolution', () {
    test('derives dark and light mode defaults when fields are null', () {
      const colors = PayButtonColors(backgroundColor: Colors.blue);

      expect(colors.disabledBackgroundColor, isNull);
      expect(colors.disabledTextColor, isNull);
      expect(colors.disabledProgressColor, isNull);

      expect(
        colors.effectiveDisabledBackgroundColor(Brightness.light),
        const Color(0xFFE2E2E2),
      );
      expect(
        colors.effectiveDisabledBackgroundColor(Brightness.dark),
        const Color(0xFF2C2C2E),
      );

      expect(
        colors.effectiveDisabledTextColor(Brightness.light),
        const Color(0xFF757575),
      );
      expect(
        colors.effectiveDisabledTextColor(Brightness.dark),
        const Color(0xFF8E8E93),
      );

      expect(
        colors.effectiveDisabledProgressColor(Brightness.light),
        const Color(0xFF9E9E9E),
      );
      expect(
        colors.effectiveDisabledProgressColor(Brightness.dark),
        const Color(0xFF636366),
      );
    });

    test('preserves explicit disabled colors regardless of brightness', () {
      const colors = PayButtonColors(
        backgroundColor: Colors.blue,
        disabledBackgroundColor: Color(0xFFE2E2E2),
        disabledTextColor: Color(0xFF112233),
        disabledProgressColor: Color(0xFF445566),
      );

      expect(
        colors.effectiveDisabledBackgroundColor(Brightness.dark),
        const Color(0xFFE2E2E2),
      );
      expect(
        colors.effectiveDisabledBackgroundColor(Brightness.light),
        const Color(0xFFE2E2E2),
      );

      expect(
        colors.effectiveDisabledTextColor(Brightness.dark),
        const Color(0xFF112233),
      );
      expect(
        colors.effectiveDisabledProgressColor(Brightness.dark),
        const Color(0xFF445566),
      );
    });
  });
}
