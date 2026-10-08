import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pay_buttons/pay_buttons.dart';

void main() {
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

    testWidgets('applies custom text and semanticLabel', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: GooglePayButton(
              text: 'Buy with',
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
      expect(button.text, 'Buy with');
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
  });
}
