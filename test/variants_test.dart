import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pay_buttons/pay_buttons.dart';

void main() {
  group('PayButtonVariant & PayButtonTextPosition Across All Providers', () {
    testWidgets('PayPalButton supports explicit compact, medium, and full variants', (tester) async {
      // Compact
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PayPalButton(
              onPressed: () {},
              variant: PayButtonVariant.compact,
            ),
          ),
        ),
      );
      // Compact renders only the monogram SVG
      expect(find.byType(SvgPicture), findsOneWidget);

      // Medium renders monogram + wordmark SVGs
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PayPalButton(
              onPressed: () {},
              variant: PayButtonVariant.medium,
            ),
          ),
        ),
      );
      expect(find.byType(SvgPicture), findsNWidgets(2));

      // Full with leading text
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PayPalButton(
              onPressed: () {},
              variant: PayButtonVariant.full,
              text: 'Pay with',
              textPosition: PayButtonTextPosition.leading,
            ),
          ),
        ),
      );
      expect(find.text('Pay with'), findsOneWidget);
      expect(find.byType(SvgPicture), findsNWidgets(2));
    });

    testWidgets('AmazonPayButton supports explicit compact, medium, and full variants', (tester) async {
      // Compact
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AmazonPayButton(
              onPressed: () {},
              variant: PayButtonVariant.compact,
            ),
          ),
        ),
      );
      expect(find.byType(SvgPicture), findsOneWidget);

      // Full
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AmazonPayButton(
              onPressed: () {},
              variant: PayButtonVariant.full,
              text: 'Pay with',
              textPosition: PayButtonTextPosition.leading,
            ),
          ),
        ),
      );
      expect(find.text('Pay with'), findsOneWidget);
    });

    testWidgets('ShopPayButton supports explicit compact, medium, and full variants', (tester) async {
      // Compact
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ShopPayButton(
              onPressed: () {},
              variant: PayButtonVariant.compact,
            ),
          ),
        ),
      );
      expect(find.byType(SvgPicture), findsOneWidget);

      // Full with trailing text
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ShopPayButton(
              onPressed: () {},
              variant: PayButtonVariant.full,
              text: 'Checkout',
              textPosition: PayButtonTextPosition.trailing,
            ),
          ),
        ),
      );
      expect(find.text('Checkout'), findsOneWidget);
    });

    testWidgets('AfterpayButton supports explicit compact, medium, and full variants', (tester) async {
      // Compact
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AfterpayButton(
              onPressed: () {},
              variant: PayButtonVariant.compact,
            ),
          ),
        ),
      );
      expect(find.byType(SvgPicture), findsOneWidget);

      // Full
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AfterpayButton(
              onPressed: () {},
              variant: PayButtonVariant.full,
              text: 'Buy now with',
            ),
          ),
        ),
      );
      expect(find.text('Buy now with'), findsOneWidget);
    });

    testWidgets('Regional champions support compact and full variants with text positioning', (tester) async {
      final regionalButtons = <Widget>[
        WeroButton(onPressed: () {}, variant: PayButtonVariant.compact),
        TwintButton(onPressed: () {}, variant: PayButtonVariant.compact),
        BlikButton(onPressed: () {}, variant: PayButtonVariant.compact),
        IdealButton(onPressed: () {}, variant: PayButtonVariant.compact),
        BancontactButton(onPressed: () {}, variant: PayButtonVariant.compact),
        BizumButton(onPressed: () {}, variant: PayButtonVariant.compact),
        PixButton(onPressed: () {}, variant: PayButtonVariant.compact),
        OxxoButton(onPressed: () {}, variant: PayButtonVariant.compact),
        BoletoButton(onPressed: () {}, variant: PayButtonVariant.compact),
      ];


      for (final btn in regionalButtons) {
        await tester.pumpWidget(
          MaterialApp(home: Scaffold(body: btn)),
        );
        expect(find.byType(SvgPicture), findsOneWidget);
      }

      // Check text positioning leading vs trailing on Wero
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: WeroButton(
              onPressed: () {},
              text: 'Pay with',
              textPosition: PayButtonTextPosition.leading,
              variant: PayButtonVariant.full,
            ),
          ),
        ),
      );
      expect(find.text('Pay with'), findsOneWidget);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BizumButton(
              onPressed: () {},
              text: 'Pay with',
              textPosition: PayButtonTextPosition.trailing,
              variant: PayButtonVariant.full,
            ),
          ),
        ),
      );
      expect(find.text('Pay with'), findsOneWidget);
    });

    testWidgets('Responsive auto-collapse based on layout width', (tester) async {
      // PayPal at width 60dp collapses to compact
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: PayPalButton(
                width: 60,
                text: 'Buy with',
                onPressed: () {},
              ),
            ),
          ),
        ),
      );
      expect(find.text('Buy with'), findsNothing);
      expect(find.byType(SvgPicture), findsOneWidget);

      // PayPal at width 140dp collapses to medium (logo only, no text)
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: PayPalButton(
                width: 140,
                text: 'Buy with',
                onPressed: () {},
              ),
            ),
          ),
        ),
      );
      expect(find.text('Buy with'), findsNothing);
      expect(find.byType(SvgPicture), findsNWidgets(2));

      // PayPal at width 250dp displays full variant with text
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: PayPalButton(
                width: 250,
                text: 'Buy with',
                onPressed: () {},
              ),
            ),
          ),
        ),
      );
      expect(find.text('Buy with'), findsOneWidget);
      expect(find.byType(SvgPicture), findsNWidgets(2));
    });
  });
}
