import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pay_buttons/pay_buttons.dart';

void main() {
  group('StripeLinkButton', () {
    testWidgets('renders green rounded button by default', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StripeLinkButton(
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.byType(StripeLinkButton), findsOneWidget);
      expect(find.byType(SvgPicture), findsOneWidget);

      final material = tester.widget<Material>(
        find.descendant(
          of: find.byType(StripeLinkButton),
          matching: find.byType(Material),
        ),
      );
      expect(material.color, const Color(0xFF00D66F));
    });

    testWidgets('renders custom text when provided', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StripeLinkButton(
              text: 'Pay with',
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.text('Pay with'), findsOneWidget);
    });

    testWidgets('renders all StripeLinkColor themes without error', (tester) async {
      for (final color in StripeLinkColor.values) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: StripeLinkButton(
                color: color,
                onPressed: () {},
              ),
            ),
          ),
        );
        expect(find.byType(StripeLinkButton), findsOneWidget);
      }
    });

    testWidgets('renders all StripeLinkShape options', (tester) async {
      for (final shape in StripeLinkShape.values) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: StripeLinkButton(
                shape: shape,
                onPressed: () {},
              ),
            ),
          ),
        );
        expect(find.byType(StripeLinkButton), findsOneWidget);
      }
    });

    testWidgets('applies custom textStyle when provided', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StripeLinkButton(
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
