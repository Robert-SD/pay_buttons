import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pay_buttons/pay_buttons.dart';

void main() {
  group('European Regional Champions', () {
    group('TwintButton', () {
      testWidgets(
        'renders black rounded twint button without text by default',
        (tester) async {
          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(body: TwintButton(onPressed: () {})),
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
        },
      );

      testWidgets('renders custom text when provided', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: TwintButton(text: 'Bezahlen mit', onPressed: () {}),
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
              body: TwintButton(text: 'Bezahlen mit', onPressed: () {}),
            ),
          ),
        );

        final textWidget = tester.widget<Text>(find.text('Bezahlen mit'));
        expect(textWidget.style?.fontFamilyFallback, PayButtonFonts.twint);
      });

      testWidgets('renders all TwintColor and TwintShape options', (
        tester,
      ) async {
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
      testWidgets(
        'renders yellow rounded ideal button without text by default',
        (tester) async {
          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(body: IdealButton(onPressed: () {})),
            ),
          );

          expect(find.byType(IdealButton), findsOneWidget);
          expect(find.byType(SvgPicture), findsOneWidget);
          expect(find.byType(Text), findsNothing);

          final material = tester.widget<Material>(
            find.descendant(
              of: find.byType(IdealButton),
              matching: find.byType(Material),
            ),
          );
          expect(material.color, const Color(0xFFFFF48D));
        },
      );

      testWidgets('renders custom text when provided', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: IdealButton(text: 'Betaal met', onPressed: () {}),
            ),
          ),
        );

        expect(find.text('Betaal met'), findsOneWidget);
      });

      testWidgets('defaults to PayButtonFonts.ideal fallback', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: IdealButton(text: 'Betaal met', onPressed: () {}),
            ),
          ),
        );

        final textWidget = tester.widget<Text>(find.text('Betaal met'));
        expect(textWidget.style?.fontFamilyFallback, PayButtonFonts.ideal);
      });

      testWidgets('renders all IdealColor and IdealShape options', (
        tester,
      ) async {
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
      testWidgets('renders black rounded blik button without text by default', (
        tester,
      ) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(body: BlikButton(onPressed: () {})),
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
              body: BlikButton(text: 'Zapłać z', onPressed: () {}),
            ),
          ),
        );

        expect(find.text('Zapłać z'), findsOneWidget);
      });

      testWidgets('renders all BlikColor and BlikShape options', (
        tester,
      ) async {
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
      testWidgets(
        'renders white rounded bancontact button without text by default',
        (tester) async {
          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(body: BancontactButton(onPressed: () {})),
            ),
          );

          expect(find.byType(BancontactButton), findsOneWidget);
          expect(find.byType(SvgPicture), findsOneWidget);
          expect(find.byType(Text), findsNothing);
        },
      );

      testWidgets('renders custom text when provided', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: BancontactButton(text: 'Betaal met', onPressed: () {}),
            ),
          ),
        );

        expect(find.text('Betaal met'), findsOneWidget);
      });

      testWidgets('renders all BancontactColor and BancontactShape options', (
        tester,
      ) async {
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
      testWidgets(
        'renders white rounded bizum button without text by default',
        (tester) async {
          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(body: BizumButton(onPressed: () {})),
            ),
          );

          expect(find.byType(BizumButton), findsOneWidget);
          expect(find.byType(SvgPicture), findsOneWidget);
          expect(find.byType(Text), findsNothing);
        },
      );

      testWidgets('renders custom text when provided', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: BizumButton(text: 'Pagar con', onPressed: () {}),
            ),
          ),
        );

        expect(find.text('Pagar con'), findsOneWidget);
      });

      testWidgets('renders all BizumColor and BizumShape options', (
        tester,
      ) async {
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

    group('WeroButton', () {
      testWidgets(
        'renders yellow rounded wero button without text by default',
        (tester) async {
          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(body: WeroButton(onPressed: () {})),
            ),
          );

          expect(find.byType(WeroButton), findsOneWidget);
          expect(find.byType(SvgPicture), findsOneWidget);
          expect(find.byType(Text), findsNothing);
        },
      );

      testWidgets('renders custom text when provided', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: WeroButton(text: 'Pay with', onPressed: () {}),
            ),
          ),
        );

        expect(find.text('Pay with'), findsOneWidget);
      });

      testWidgets('renders all WeroColor and WeroShape options', (
        tester,
      ) async {
        for (final color in WeroColor.values) {
          for (final shape in WeroShape.values) {
            await tester.pumpWidget(
              MaterialApp(
                home: Scaffold(
                  body: WeroButton(
                    color: color,
                    shape: shape,
                    onPressed: () {},
                  ),
                ),
              ),
            );
            expect(find.byType(WeroButton), findsOneWidget);
          }
        }
      });

      testWidgets('defaults to PayButtonFonts.wero fallback', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: WeroButton(text: 'Payer avec', onPressed: () {}),
            ),
          ),
        );

        final textWidget = tester.widget<Text>(find.text('Payer avec'));
        expect(textWidget.style?.fontFamilyFallback, PayButtonFonts.wero);
      });

      testWidgets('applies custom textStyle when provided', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: WeroButton(
                text: 'Bezahlen mit',
                textStyle: const TextStyle(
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.0,
                ),
                onPressed: () {},
              ),
            ),
          ),
        );

        final textWidget = tester.widget<Text>(find.text('Bezahlen mit'));
        expect(textWidget.style?.fontWeight, FontWeight.w900);
        expect(textWidget.style?.letterSpacing, 1.0);
      });
    });
  });

  group('Latin American Champions', () {
    group('PixButton', () {
      testWidgets('renders teal rounded pix button without text by default', (
        tester,
      ) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(body: PixButton(onPressed: () {})),
          ),
        );

        expect(find.byType(PixButton), findsOneWidget);
        expect(find.byType(SvgPicture), findsOneWidget);
        expect(find.byType(Text), findsNothing);

        final material = tester.widget<Material>(
          find.descendant(
            of: find.byType(PixButton),
            matching: find.byType(Material),
          ),
        );
        expect(material.color, const Color(0xFF32BCAD));
      });

      testWidgets('renders custom text when provided', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: PixButton(text: 'Pagar com', onPressed: () {}),
            ),
          ),
        );

        expect(find.text('Pagar com'), findsOneWidget);
      });

      testWidgets('renders all PixColor and PixShape options', (tester) async {
        for (final color in PixColor.values) {
          for (final shape in PixShape.values) {
            await tester.pumpWidget(
              MaterialApp(
                home: Scaffold(
                  body: PixButton(color: color, shape: shape, onPressed: () {}),
                ),
              ),
            );
            expect(find.byType(PixButton), findsOneWidget);
          }
        }
      });

      testWidgets('defaults to PayButtonFonts.pix fallback', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: PixButton(text: 'Pagar com', onPressed: () {}),
            ),
          ),
        );

        final textWidget = tester.widget<Text>(find.text('Pagar com'));
        expect(textWidget.style?.fontFamilyFallback, PayButtonFonts.pix);
      });

      testWidgets('applies custom textStyle when provided', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: PixButton(
                text: 'Pagar com',
                textStyle: const TextStyle(
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5,
                ),
                onPressed: () {},
              ),
            ),
          ),
        );

        final textWidget = tester.widget<Text>(find.text('Pagar com'));
        expect(textWidget.style?.fontWeight, FontWeight.w700);
        expect(textWidget.style?.letterSpacing, 0.5);
      });
    });

    group('OxxoButton', () {
      testWidgets('renders red rounded oxxo button without text by default', (
        tester,
      ) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(body: OxxoButton(onPressed: () {})),
          ),
        );

        expect(find.byType(OxxoButton), findsOneWidget);
        expect(find.byType(SvgPicture), findsOneWidget);
        expect(find.byType(Text), findsNothing);

        final material = tester.widget<Material>(
          find.descendant(
            of: find.byType(OxxoButton),
            matching: find.byType(Material),
          ),
        );
        expect(material.color, const Color(0xFFE70020));
      });

      testWidgets('renders custom text when provided', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: OxxoButton(text: 'Pagar con', onPressed: () {}),
            ),
          ),
        );

        expect(find.text('Pagar con'), findsOneWidget);
      });

      testWidgets('renders all OxxoColor and OxxoShape options', (
        tester,
      ) async {
        for (final color in OxxoColor.values) {
          for (final shape in OxxoShape.values) {
            await tester.pumpWidget(
              MaterialApp(
                home: Scaffold(
                  body: OxxoButton(
                    color: color,
                    shape: shape,
                    onPressed: () {},
                  ),
                ),
              ),
            );
            expect(find.byType(OxxoButton), findsOneWidget);
          }
        }
      });

      testWidgets('defaults to PayButtonFonts.oxxo fallback', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: OxxoButton(text: 'Pagar con', onPressed: () {}),
            ),
          ),
        );

        final textWidget = tester.widget<Text>(find.text('Pagar con'));
        expect(textWidget.style?.fontFamilyFallback, PayButtonFonts.oxxo);
      });
    });

    group('BoletoButton', () {
      testWidgets(
        'renders white rounded boleto button with barcode and label by default',
        (tester) async {
          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(body: BoletoButton(onPressed: () {})),
            ),
          );

          expect(find.byType(BoletoButton), findsOneWidget);
          expect(find.byType(SvgPicture), findsOneWidget);
          expect(find.text('Boleto'), findsOneWidget);

          final material = tester.widget<Material>(
            find.descendant(
              of: find.byType(BoletoButton),
              matching: find.byType(Material),
            ),
          );
          expect(material.color, const Color(0xFFFFFFFF));
        },
      );

      testWidgets('renders custom text when provided', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: BoletoButton(text: 'Pagar via', onPressed: () {}),
            ),
          ),
        );

        expect(find.text('Pagar via'), findsOneWidget);
      });

      testWidgets('renders all BoletoColor and BoletoShape options', (
        tester,
      ) async {
        for (final color in BoletoColor.values) {
          for (final shape in BoletoShape.values) {
            await tester.pumpWidget(
              MaterialApp(
                home: Scaffold(
                  body: BoletoButton(
                    color: color,
                    shape: shape,
                    onPressed: () {},
                  ),
                ),
              ),
            );
            expect(find.byType(BoletoButton), findsOneWidget);
          }
        }
      });

      testWidgets('defaults to PayButtonFonts.boleto fallback', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: BoletoButton(text: 'Pagar via', onPressed: () {}),
            ),
          ),
        );

        final textWidget = tester.widget<Text>(find.text('Pagar via'));
        expect(textWidget.style?.fontFamilyFallback, PayButtonFonts.boleto);
      });
    });
  });

  group('Asian Regional Champions', () {
    group('AlipayButton', () {
      testWidgets(
        'renders blue rounded alipay button without text by default',
        (tester) async {
          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(body: AlipayButton(onPressed: () {})),
            ),
          );

          expect(find.byType(AlipayButton), findsOneWidget);
          expect(find.byType(SvgPicture), findsOneWidget);
          expect(find.byType(Text), findsNothing);

          final material = tester.widget<Material>(
            find.descendant(
              of: find.byType(AlipayButton),
              matching: find.byType(Material),
            ),
          );
          expect(material.color, const Color(0xFF1677FF));
        },
      );

      testWidgets('renders custom text when provided', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AlipayButton(text: 'Pay with', onPressed: () {}),
            ),
          ),
        );

        expect(find.text('Pay with'), findsOneWidget);
      });

      testWidgets('applies custom fontFamily when provided', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AlipayButton(
                text: 'Pay with',
                fontFamily: 'CustomFont',
                onPressed: () {},
              ),
            ),
          ),
        );

        final textWidget = tester.widget<Text>(find.text('Pay with'));
        expect(textWidget.style?.fontFamily, 'CustomFont');
      });

      testWidgets('defaults to PayButtonFonts.alipay fallback', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AlipayButton(text: 'Pay with', onPressed: () {}),
            ),
          ),
        );

        final textWidget = tester.widget<Text>(find.text('Pay with'));
        expect(textWidget.style?.fontFamilyFallback, PayButtonFonts.alipay);
      });

      testWidgets('renders all AlipayColor and AlipayShape options', (
        tester,
      ) async {
        for (final color in AlipayColor.values) {
          for (final shape in AlipayShape.values) {
            await tester.pumpWidget(
              MaterialApp(
                home: Scaffold(
                  body: AlipayButton(
                    color: color,
                    shape: shape,
                    onPressed: () {},
                  ),
                ),
              ),
            );
            expect(find.byType(AlipayButton), findsOneWidget);
          }
        }
      });
    });

    group('WeChatPayButton', () {
      testWidgets(
        'renders green rounded wechat pay button without text by default',
        (tester) async {
          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(body: WeChatPayButton(onPressed: () {})),
            ),
          );

          expect(find.byType(WeChatPayButton), findsOneWidget);
          expect(find.byType(SvgPicture), findsOneWidget);
          expect(find.byType(Text), findsNothing);

          final material = tester.widget<Material>(
            find.descendant(
              of: find.byType(WeChatPayButton),
              matching: find.byType(Material),
            ),
          );
          expect(material.color, const Color(0xFF07C160));
        },
      );

      testWidgets('renders custom text when provided', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: WeChatPayButton(text: 'Pay with', onPressed: () {}),
            ),
          ),
        );

        expect(find.text('Pay with'), findsOneWidget);
      });

      testWidgets('applies custom fontFamily when provided', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: WeChatPayButton(
                text: 'Pay with',
                fontFamily: 'CustomFont',
                onPressed: () {},
              ),
            ),
          ),
        );

        final textWidget = tester.widget<Text>(find.text('Pay with'));
        expect(textWidget.style?.fontFamily, 'CustomFont');
      });

      testWidgets('defaults to PayButtonFonts.wechatPay fallback', (
        tester,
      ) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: WeChatPayButton(text: 'Pay with', onPressed: () {}),
            ),
          ),
        );

        final textWidget = tester.widget<Text>(find.text('Pay with'));
        expect(textWidget.style?.fontFamilyFallback, PayButtonFonts.wechatPay);
      });

      testWidgets('renders all WeChatPayColor and WeChatPayShape options', (
        tester,
      ) async {
        for (final color in WeChatPayColor.values) {
          for (final shape in WeChatPayShape.values) {
            await tester.pumpWidget(
              MaterialApp(
                home: Scaffold(
                  body: WeChatPayButton(
                    color: color,
                    shape: shape,
                    onPressed: () {},
                  ),
                ),
              ),
            );
            expect(find.byType(WeChatPayButton), findsOneWidget);
          }
        }
      });
    });

    group('PayNowButton', () {
      testWidgets(
        'renders purple rounded paynow button without text by default',
        (tester) async {
          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(body: PayNowButton(onPressed: () {})),
            ),
          );

          expect(find.byType(PayNowButton), findsOneWidget);
          expect(find.byType(SvgPicture), findsOneWidget);
          expect(find.byType(Text), findsNothing);

          final material = tester.widget<Material>(
            find.descendant(
              of: find.byType(PayNowButton),
              matching: find.byType(Material),
            ),
          );
          expect(material.color, const Color(0xFF7D1978));
        },
      );

      testWidgets('renders custom text when provided', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: PayNowButton(text: 'Pay with', onPressed: () {}),
            ),
          ),
        );

        expect(find.text('Pay with'), findsOneWidget);
      });

      testWidgets('applies custom fontFamily when provided', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: PayNowButton(
                text: 'Pay with',
                fontFamily: 'CustomFont',
                onPressed: () {},
              ),
            ),
          ),
        );

        final textWidget = tester.widget<Text>(find.text('Pay with'));
        expect(textWidget.style?.fontFamily, 'CustomFont');
      });

      testWidgets('defaults to PayButtonFonts.paynow fallback', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: PayNowButton(text: 'Pay with', onPressed: () {}),
            ),
          ),
        );

        final textWidget = tester.widget<Text>(find.text('Pay with'));
        expect(textWidget.style?.fontFamilyFallback, PayButtonFonts.paynow);
      });

      testWidgets('renders all PayNowColor and PayNowShape options', (
        tester,
      ) async {
        for (final color in PayNowColor.values) {
          for (final shape in PayNowShape.values) {
            await tester.pumpWidget(
              MaterialApp(
                home: Scaffold(
                  body: PayNowButton(
                    color: color,
                    shape: shape,
                    onPressed: () {},
                  ),
                ),
              ),
            );
            expect(find.byType(PayNowButton), findsOneWidget);
          }
        }
      });
    });

    group('PromptPayButton', () {
      testWidgets(
        'renders blue rounded promptpay button without text by default',
        (tester) async {
          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(body: PromptPayButton(onPressed: () {})),
            ),
          );

          expect(find.byType(PromptPayButton), findsOneWidget);
          expect(find.byType(SvgPicture), findsOneWidget);
          expect(find.byType(Text), findsNothing);

          final material = tester.widget<Material>(
            find.descendant(
              of: find.byType(PromptPayButton),
              matching: find.byType(Material),
            ),
          );
          expect(material.color, const Color(0xFF003D6B));
        },
      );

      testWidgets('renders custom text when provided', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: PromptPayButton(text: 'Pay with', onPressed: () {}),
            ),
          ),
        );

        expect(find.text('Pay with'), findsOneWidget);
      });

      testWidgets('applies custom fontFamily when provided', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: PromptPayButton(
                text: 'Pay with',
                fontFamily: 'CustomFont',
                onPressed: () {},
              ),
            ),
          ),
        );

        final textWidget = tester.widget<Text>(find.text('Pay with'));
        expect(textWidget.style?.fontFamily, 'CustomFont');
      });

      testWidgets('defaults to PayButtonFonts.promptpay fallback', (
        tester,
      ) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: PromptPayButton(text: 'Pay with', onPressed: () {}),
            ),
          ),
        );

        final textWidget = tester.widget<Text>(find.text('Pay with'));
        expect(textWidget.style?.fontFamilyFallback, PayButtonFonts.promptpay);
      });

      testWidgets('renders all PromptPayColor and PromptPayShape options', (
        tester,
      ) async {
        for (final color in PromptPayColor.values) {
          for (final shape in PromptPayShape.values) {
            await tester.pumpWidget(
              MaterialApp(
                home: Scaffold(
                  body: PromptPayButton(
                    color: color,
                    shape: shape,
                    onPressed: () {},
                  ),
                ),
              ),
            );
            expect(find.byType(PromptPayButton), findsOneWidget);
          }
        }
      });
    });

    group('UpiButton', () {
      testWidgets('renders white rounded upi button without text by default', (
        tester,
      ) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(body: UpiButton(onPressed: () {})),
          ),
        );

        expect(find.byType(UpiButton), findsOneWidget);
        expect(find.byType(SvgPicture), findsOneWidget);
        expect(find.text('UPI'), findsNothing);

        final material = tester.widget<Material>(
          find.descendant(
            of: find.byType(UpiButton),
            matching: find.byType(Material),
          ),
        );
        expect(material.color, const Color(0xFFFFFFFF));
      });

      testWidgets('renders custom text when provided', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: UpiButton(text: 'Pay with', onPressed: () {}),
            ),
          ),
        );

        expect(find.text('Pay with'), findsOneWidget);
      });

      testWidgets(
        'defaults to PayButtonFonts.upi fallback for text typography',
        (tester) async {
          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: UpiButton(text: 'Pay with', onPressed: () {}),
              ),
            ),
          );

          final textWidget = tester.widget<Text>(find.text('Pay with'));
          expect(textWidget.style?.fontFamilyFallback, PayButtonFonts.upi);
        },
      );

      testWidgets('renders all UpiColor and UpiShape options', (tester) async {
        for (final color in UpiColor.values) {
          for (final shape in UpiShape.values) {
            await tester.pumpWidget(
              MaterialApp(
                home: Scaffold(
                  body: UpiButton(color: color, shape: shape, onPressed: () {}),
                ),
              ),
            );
            expect(find.byType(UpiButton), findsOneWidget);
          }
        }
      });
    });
  });
}
