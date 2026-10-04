import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pay_buttons/pay_buttons.dart';

void main() {
  group('ShopPayButton', () {
    testWidgets('renders purple rounded button by default', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ShopPayButton(
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.byType(ShopPayButton), findsOneWidget);
      expect(find.byType(SvgPicture), findsOneWidget);

      final material = tester.widget<Material>(
        find.descendant(
          of: find.byType(ShopPayButton),
          matching: find.byType(Material),
        ),
      );
      expect(material.color, const Color(0xFF5A31F4));
    });

    testWidgets('renders custom text when provided', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ShopPayButton(
              text: 'Buy with',
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.text('Buy with'), findsOneWidget);
    });

    testWidgets('renders all ShopPayColor themes without error', (tester) async {
      for (final color in ShopPayColor.values) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: ShopPayButton(
                color: color,
                onPressed: () {},
              ),
            ),
          ),
        );
        expect(find.byType(ShopPayButton), findsOneWidget);
      }
    });

    testWidgets('renders all ShopPayShape options', (tester) async {
      for (final shape in ShopPayShape.values) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: ShopPayButton(
                shape: shape,
                onPressed: () {},
              ),
            ),
          ),
        );
        expect(find.byType(ShopPayButton), findsOneWidget);
      }
    });

    testWidgets('applies custom textStyle when provided', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ShopPayButton(
              text: 'Buy with',
              onPressed: () {},
              textStyle: const TextStyle(fontWeight: FontWeight.w300),
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Buy with'));
      expect(textWidget.style?.fontWeight, FontWeight.w300);
    });
  });
}
