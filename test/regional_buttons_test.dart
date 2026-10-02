import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pay_buttons/pay_buttons.dart';

void main() {
  group('European Regional Champions', () {
    group('TwintButton', () {
      testWidgets('renders black rounded payWith twint button with regional locale', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: TwintButton(
                locale: const Locale('de'),
                onPressed: () {},
              ),
            ),
          ),
        );

        expect(find.byType(TwintButton), findsOneWidget);
        expect(find.byType(SvgPicture), findsOneWidget);
        expect(find.text('Bezahlen mit'), findsOneWidget);

        final material = tester.widget<Material>(
          find.descendant(
            of: find.byType(TwintButton),
            matching: find.byType(Material),
          ),
        );
        expect(material.color, const Color(0xFF000000));
      });

      testWidgets('renders all TwintColor and TwintShape options', (tester) async {
        for (final color in TwintColor.values) {
          for (final shape in TwintShape.values) {
            await tester.pumpWidget(
              MaterialApp(
                home: Scaffold(
                  body: TwintButton(
                    color: color,
                    shape: shape,
                    onPressed: () {},
                  ),
                ),
              ),
            );
            expect(find.byType(TwintButton), findsOneWidget);
          }
        }
      });

      testWidgets('localizes Twint label in French and Italian', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: TwintButton(
                locale: const Locale('fr'),
                onPressed: () {},
              ),
            ),
          ),
        );
        expect(find.text('Payer avec'), findsOneWidget);

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: TwintButton(
                locale: const Locale('it'),
                onPressed: () {},
              ),
            ),
          ),
        );
        expect(find.text('Paga con'), findsOneWidget);
      });
    });

    group('IdealButton', () {
      testWidgets('renders white rounded payWith ideal button with regional locale', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: IdealButton(
                locale: const Locale('nl'),
                onPressed: () {},
              ),
            ),
          ),
        );

        expect(find.byType(IdealButton), findsOneWidget);
        expect(find.byType(SvgPicture), findsOneWidget);
        expect(find.text('Betaal met'), findsOneWidget);
      });

      testWidgets('renders all IdealColor and IdealShape options', (tester) async {
        for (final color in IdealColor.values) {
          for (final shape in IdealShape.values) {
            await tester.pumpWidget(
              MaterialApp(
                home: Scaffold(
                  body: IdealButton(
                    color: color,
                    shape: shape,
                    onPressed: () {},
                  ),
                ),
              ),
            );
            expect(find.byType(IdealButton), findsOneWidget);
          }
        }
      });
    });

    group('BlikButton', () {
      testWidgets('renders black rounded payWith blik button with regional locale', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: BlikButton(
                locale: const Locale('pl'),
                onPressed: () {},
              ),
            ),
          ),
        );

        expect(find.byType(BlikButton), findsOneWidget);
        expect(find.byType(SvgPicture), findsOneWidget);
        expect(find.text('Zapłać z'), findsOneWidget);
      });

      testWidgets('renders all BlikColor and BlikShape options', (tester) async {
        for (final color in BlikColor.values) {
          for (final shape in BlikShape.values) {
            await tester.pumpWidget(
              MaterialApp(
                home: Scaffold(
                  body: BlikButton(
                    color: color,
                    shape: shape,
                    onPressed: () {},
                  ),
                ),
              ),
            );
            expect(find.byType(BlikButton), findsOneWidget);
          }
        }
      });
    });

    group('BancontactButton', () {
      testWidgets('renders white rounded payWith bancontact button with regional locale', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: BancontactButton(
                locale: const Locale('nl'),
                onPressed: () {},
              ),
            ),
          ),
        );

        expect(find.byType(BancontactButton), findsOneWidget);
        expect(find.byType(SvgPicture), findsOneWidget);
        expect(find.text('Betaal met'), findsOneWidget);
      });

      testWidgets('renders all BancontactColor and BancontactShape options', (tester) async {
        for (final color in BancontactColor.values) {
          for (final shape in BancontactShape.values) {
            await tester.pumpWidget(
              MaterialApp(
                home: Scaffold(
                  body: BancontactButton(
                    color: color,
                    shape: shape,
                    onPressed: () {},
                  ),
                ),
              ),
            );
            expect(find.byType(BancontactButton), findsOneWidget);
          }
        }
      });
    });

    group('BizumButton', () {
      testWidgets('renders white rounded payWith bizum button with regional locale', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: BizumButton(
                locale: const Locale('es'),
                onPressed: () {},
              ),
            ),
          ),
        );

        expect(find.byType(BizumButton), findsOneWidget);
        expect(find.byType(SvgPicture), findsOneWidget);
        expect(find.text('Pagar con'), findsOneWidget);
      });

      testWidgets('renders all BizumColor and BizumShape options', (tester) async {
        for (final color in BizumColor.values) {
          for (final shape in BizumShape.values) {
            await tester.pumpWidget(
              MaterialApp(
                home: Scaffold(
                  body: BizumButton(
                    color: color,
                    shape: shape,
                    onPressed: () {},
                  ),
                ),
              ),
            );
            expect(find.byType(BizumButton), findsOneWidget);
          }
        }
      });

      testWidgets('renders Bizum logoOnly button without text label', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: BizumButton(
                type: BizumButtonType.logoOnly,
                onPressed: () {},
              ),
            ),
          ),
        );

        expect(find.byType(BizumButton), findsOneWidget);
        expect(find.byType(SvgPicture), findsOneWidget);
        expect(find.text('Pagar con'), findsNothing);
      });

      testWidgets('renders Pay with Bizum for English locale', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: BizumButton(
                locale: const Locale('en'),
                onPressed: () {},
              ),
            ),
          ),
        );
        expect(find.text('Pay with'), findsOneWidget);
      });
    });
  });
}
