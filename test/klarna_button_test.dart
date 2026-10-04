import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pay_buttons/pay_buttons.dart';

void main() {
  group('KlarnaButton', () {
    testWidgets('renders pink rounded logo-only button by default', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: KlarnaButton(onPressed: () {})),
        ),
      );

      expect(find.byType(KlarnaButton), findsOneWidget);
      expect(find.byType(SvgPicture), findsOneWidget);
      expect(find.byType(Text), findsNothing);

      final material = tester.widget<Material>(
        find.descendant(
          of: find.byType(KlarnaButton),
          matching: find.byType(Material),
        ),
      );
      expect(material.color, const Color(0xFFFFA8CD));
    });

    testWidgets('renders custom text when provided', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: KlarnaButton(text: 'Pay with', onPressed: () {}),
          ),
        ),
      );

      expect(find.text('Pay with'), findsOneWidget);
    });

    testWidgets('renders all KlarnaColor themes without error', (tester) async {
      for (final color in KlarnaColor.values) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: KlarnaButton(color: color, onPressed: () {}),
            ),
          ),
        );
        expect(find.byType(KlarnaButton), findsOneWidget);
      }
    });

    testWidgets('renders all KlarnaShape options', (tester) async {
      for (final shape in KlarnaShape.values) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: KlarnaButton(shape: shape, onPressed: () {}),
            ),
          ),
        );
        expect(find.byType(KlarnaButton), findsOneWidget);
      }
    });

    testWidgets('renders offWhite color with border and correct background', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: KlarnaButton(color: KlarnaColor.offWhite, onPressed: () {}),
          ),
        ),
      );

      final material = tester.widget<Material>(
        find.descendant(
          of: find.byType(KlarnaButton),
          matching: find.byType(Material),
        ),
      );
      expect(material.color, const Color(0xFFF9F8F5));
      final shape = material.shape as RoundedRectangleBorder;
      expect(shape.side.color, const Color(0xFFE5E5E5));
    });

    testWidgets('renders rect shape with 0 border radius', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: KlarnaButton(shape: KlarnaShape.rect, onPressed: () {}),
          ),
        ),
      );

      final material = tester.widget<Material>(
        find.descendant(
          of: find.byType(KlarnaButton),
          matching: find.byType(Material),
        ),
      );
      final shape = material.shape as RoundedRectangleBorder;
      expect(shape.borderRadius, BorderRadius.circular(0.0));
    });

    testWidgets('responsive: width < 84px renders compact K monogram only', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: KlarnaButton(
                width: 60,
                text: 'Continue with',
                onPressed: () {},
              ),
            ),
          ),
        ),
      );

      expect(find.byType(SvgPicture), findsOneWidget);
      expect(find.text('Continue with'), findsNothing);
    });

    testWidgets(
      'responsive: 84px <= width <= 200px renders wordmark only without text',
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Center(
                child: KlarnaButton(
                  width: 150,
                  text: 'Continue with',
                  onPressed: () {},
                ),
              ),
            ),
          ),
        );

        expect(find.byType(SvgPicture), findsOneWidget);
        expect(find.text('Continue with'), findsNothing);
      },
    );

    testWidgets('responsive: width > 200px renders text and logo', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: KlarnaButton(
                width: 250,
                text: 'Continue with',
                logoFirst: false,
                onPressed: () {},
              ),
            ),
          ),
        ),
      );

      expect(find.byType(SvgPicture), findsOneWidget);
      expect(find.text('Continue with'), findsOneWidget);
    });

    testWidgets('applies custom textStyle when provided', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: KlarnaButton(
              text: 'Pay with',
              onPressed: () {},
              textStyle: const TextStyle(fontWeight: FontWeight.w300),
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Pay with'));
      expect(textWidget.style?.fontWeight, FontWeight.w300);
    });
  });
}
