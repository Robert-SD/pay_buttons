import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pay_buttons/pay_buttons.dart';

void main() {
  group('StripeLinkButton', () {
    testWidgets('renders green rounded payWithLink button by default', (tester) async {
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
      expect(find.text('Pay with'), findsOneWidget);

      final material = tester.widget<Material>(
        find.descendant(
          of: find.byType(StripeLinkButton),
          matching: find.byType(Material),
        ),
      );
      expect(material.color, const Color(0xFF00D66F));
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

    testWidgets('renders all StripeLinkButtonType variants', (tester) async {
      for (final type in StripeLinkButtonType.values) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: StripeLinkButton(
                type: type,
                onPressed: () {},
              ),
            ),
          ),
        );
        expect(find.byType(StripeLinkButton), findsOneWidget);
      }
    });

    testWidgets('localizes payWithLink label when locale is specified', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StripeLinkButton(
              type: StripeLinkButtonType.payWithLink,
              locale: const Locale('de'),
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.text('Bezahlen mit'), findsOneWidget);
    });

    testWidgets('applies custom textStyle when provided', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StripeLinkButton(
              type: StripeLinkButtonType.payWithLink,
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
