import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pay_buttons/pay_buttons.dart';

void main() {
  group('European Regional Champions', () {
    group('TwintButton', () {
      testWidgets('renders black rounded twint button without text by default', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: TwintButton(
                onPressed: () {},
              ),
            ),
          ),
        );

        expect(find.byType(TwintButton), findsOneWidget);
        expect(find.byType(SvgPicture), findsOneWidget);
        expect(find.byType(Text), findsNothing);

        final material = tester.widget<Material>(
          find.descendant(
            of: find.byType(TwintButton),
            matching: find.byType(Material),
          ),
        );
        expect(material.color, const Color(0xFF000000));
      });

      testWidgets('renders custom text when provided', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: TwintButton(
                text: 'Bezahlen mit',
                onPressed: () {},
              ),
            ),
          ),
        );

        expect(find.text('Bezahlen mit'), findsOneWidget);
      });

      testWidgets('applies custom fontFamily when provided', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: TwintButton(
                text: 'Bezahlen mit',
                fontFamily: 'CustomSwissFont',
                onPressed: () {},
              ),
            ),
          ),
        );

        final textWidget = tester.widget<Text>(find.text('Bezahlen mit'));
        expect(textWidget.style?.fontFamily, 'CustomSwissFont');
      });

      testWidgets('defaults to PayButtonFonts.twint fallback', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: TwintButton(
                text: 'Bezahlen mit',
                onPressed: () {},
              ),
            ),
          ),
        );

        final textWidget = tester.widget<Text>(find.text('Bezahlen mit'));
        expect(textWidget.style?.fontFamilyFallback, PayButtonFonts.twint);
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
    });

    group('IdealButton', () {
      testWidgets('renders white rounded ideal button without text by default', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: IdealButton(
                onPressed: () {},
              ),
            ),
          ),
        );

        expect(find.byType(IdealButton), findsOneWidget);
        expect(find.byType(SvgPicture), findsOneWidget);
        expect(find.byType(Text), findsNothing);
      });

      testWidgets('renders custom text when provided', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: IdealButton(
                text: 'Betaal met',
                onPressed: () {},
              ),
            ),
          ),
        );

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
      testWidgets('renders black rounded blik button without text by default', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: BlikButton(
                onPressed: () {},
              ),
            ),
          ),
        );

        expect(find.byType(BlikButton), findsOneWidget);
        expect(find.byType(SvgPicture), findsOneWidget);
        expect(find.byType(Text), findsNothing);
      });

      testWidgets('renders custom text when provided', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: BlikButton(
                text: 'Zapłać z',
                onPressed: () {},
              ),
            ),
          ),
        );

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
      testWidgets('renders white rounded bancontact button without text by default', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: BancontactButton(
                onPressed: () {},
              ),
            ),
          ),
        );

        expect(find.byType(BancontactButton), findsOneWidget);
        expect(find.byType(SvgPicture), findsOneWidget);
        expect(find.byType(Text), findsNothing);
      });

      testWidgets('renders custom text when provided', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: BancontactButton(
                text: 'Betaal met',
                onPressed: () {},
              ),
            ),
          ),
        );

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
      testWidgets('renders white rounded bizum button without text by default', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: BizumButton(
                onPressed: () {},
              ),
            ),
          ),
        );

        expect(find.byType(BizumButton), findsOneWidget);
        expect(find.byType(SvgPicture), findsOneWidget);
        expect(find.byType(Text), findsNothing);
      });

      testWidgets('renders custom text when provided', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: BizumButton(
                text: 'Pagar con',
                onPressed: () {},
              ),
            ),
          ),
        );

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
    });
  });
}
