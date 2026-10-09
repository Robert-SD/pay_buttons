import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pay_buttons/pay_buttons.dart';

import 'pages/afterpay_showcase_page.dart';
import 'pages/apple_pay_showcase_page.dart';
import 'pages/asian_champions_showcase_page.dart';
import 'pages/european_champions_showcase_page.dart';
import 'pages/google_pay_showcase_page.dart';
import 'pages/klarna_showcase_page.dart';
import 'pages/latin_america_showcase_page.dart';
import 'pages/paypal_showcase_page.dart';

void main() {
  runApp(const PayButtonsExampleApp());
}

class PayButtonsExampleApp extends StatelessWidget {
  const PayButtonsExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pay Buttons Gallery',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF003087)),
        useMaterial3: true,
      ),
      home: const CatalogHomePage(),
    );
  }
}

class CatalogHomePage extends StatelessWidget {
  const CatalogHomePage({super.key});

  void _handlePayPress(BuildContext context, String provider) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$provider default button pressed!'),
        backgroundColor: const Color(0xFF1E293B),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pay Buttons Component Catalog'),
        elevation: 1,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 720),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Section 1: Default Payment Buttons (Zero Configuration)
                  const Text(
                    'Default Payment Buttons',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.2,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Out-of-the-box payment buttons with provider defaults and zero configuration.',
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                  ),
                  const SizedBox(height: 16),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final isTwoColumns = constraints.maxWidth >= 600;

                      final leftButtons = <Widget>[
                        ApplePayButton(
                          onPressed: () =>
                              _handlePayPress(context, 'Apple Pay'),
                        ),
                        PayPalButton(
                          onPressed: () => _handlePayPress(context, 'PayPal'),
                        ),
                        WeroButton(
                          onPressed: () => _handlePayPress(context, 'Wero'),
                        ),
                        IdealButton(
                          onPressed: () => _handlePayPress(context, 'iDEAL'),
                        ),
                        BlikButton(
                          onPressed: () => _handlePayPress(context, 'BLIK'),
                        ),
                        TwintButton(
                          onPressed: () => _handlePayPress(context, 'TWINT'),
                        ),
                        PixButton(
                          onPressed: () => _handlePayPress(context, 'Pix'),
                        ),
                        AlipayButton(
                          onPressed: () => _handlePayPress(context, 'Alipay'),
                        ),
                        WeChatPayButton(
                          onPressed: () =>
                              _handlePayPress(context, 'WeChat Pay'),
                        ),
                        PromptPayButton(
                          onPressed: () =>
                              _handlePayPress(context, 'PromptPay'),
                        ),
                      ];

                      final rightButtons = <Widget>[
                        GooglePayButton(
                          onPressed: () =>
                              _handlePayPress(context, 'Google Pay'),
                        ),
                        KlarnaButton(
                          shape: KlarnaShape.pill,
                          onPressed: () => _handlePayPress(context, 'Klarna'),
                        ),
                        AfterpayButton(
                          onPressed: () => _handlePayPress(context, 'Afterpay'),
                        ),
                        BancontactButton(
                          onPressed: () =>
                              _handlePayPress(context, 'Bancontact'),
                        ),
                        BizumButton(
                          onPressed: () => _handlePayPress(context, 'Bizum'),
                        ),
                        BoletoButton(
                          onPressed: () =>
                              _handlePayPress(context, 'Boleto Bancário'),
                        ),
                        OxxoButton(
                          onPressed: () => _handlePayPress(context, 'OXXO'),
                        ),
                        PayNowButton(
                          onPressed: () => _handlePayPress(context, 'PayNow'),
                        ),
                        UpiButton(
                          onPressed: () => _handlePayPress(context, 'UPI'),
                        ),
                      ];

                      Widget buildColumn(List<Widget> buttons) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            for (int i = 0; i < buttons.length; i++) ...[
                              if (i > 0) const SizedBox(height: 12),
                              buttons[i],
                            ],
                          ],
                        );
                      }

                      if (isTwoColumns) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: buildColumn(leftButtons)),
                            const SizedBox(width: 16),
                            Expanded(child: buildColumn(rightButtons)),
                          ],
                        );
                      }

                      // Mobile: single column with harmonious color grouping
                      final mobileButtons = <Widget>[
                        if (kIsWeb ||
                            defaultTargetPlatform == TargetPlatform.iOS)
                          ApplePayButton(
                            onPressed: () =>
                                _handlePayPress(context, 'Apple Pay'),
                          ),
                        if (kIsWeb ||
                            defaultTargetPlatform == TargetPlatform.android)
                          GooglePayButton(
                            onPressed: () =>
                                _handlePayPress(context, 'Google Pay'),
                          ),
                        PayPalButton(
                          onPressed: () => _handlePayPress(context, 'PayPal'),
                        ),
                        KlarnaButton(
                          shape: KlarnaShape.pill,
                          onPressed: () => _handlePayPress(context, 'Klarna'),
                        ),
                        AfterpayButton(
                          onPressed: () => _handlePayPress(context, 'Afterpay'),
                        ),
                        WeroButton(
                          onPressed: () => _handlePayPress(context, 'Wero'),
                        ),
                        IdealButton(
                          onPressed: () => _handlePayPress(context, 'iDEAL'),
                        ),
                        BlikButton(
                          onPressed: () => _handlePayPress(context, 'BLIK'),
                        ),
                        TwintButton(
                          onPressed: () => _handlePayPress(context, 'TWINT'),
                        ),
                        BancontactButton(
                          onPressed: () =>
                              _handlePayPress(context, 'Bancontact'),
                        ),
                        BizumButton(
                          onPressed: () => _handlePayPress(context, 'Bizum'),
                        ),
                        BoletoButton(
                          onPressed: () =>
                              _handlePayPress(context, 'Boleto Bancário'),
                        ),
                        PixButton(
                          onPressed: () => _handlePayPress(context, 'Pix'),
                        ),
                        OxxoButton(
                          onPressed: () => _handlePayPress(context, 'OXXO'),
                        ),
                        AlipayButton(
                          onPressed: () => _handlePayPress(context, 'Alipay'),
                        ),
                        WeChatPayButton(
                          onPressed: () =>
                              _handlePayPress(context, 'WeChat Pay'),
                        ),
                        PayNowButton(
                          onPressed: () => _handlePayPress(context, 'PayNow'),
                        ),
                        PromptPayButton(
                          onPressed: () =>
                              _handlePayPress(context, 'PromptPay'),
                        ),
                        UpiButton(
                          onPressed: () => _handlePayPress(context, 'UPI'),
                        ),
                      ];

                      return Center(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 320),
                          child: buildColumn(mobileButtons),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 28),

                  // Section 2: Customize Payment Buttons
                  const Text(
                    'Customize Payment Buttons',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.2,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Interactive playgrounds to customize colors, shapes, typography, and states.',
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                  ),
                  const SizedBox(height: 12),

                  // Apple Pay Card
                  Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      leading: Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: const Color(0xFF000000),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.apple,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                      ),
                      title: const Text(
                        'Apple Pay',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text(
                        'Black, White, Outline, HIG compliant buttons',
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const ApplePayShowcasePage(),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Google Pay Card
                  Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      leading: Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: const Color(0xFF000000),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Text(
                            'GPay',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                      title: const Text(
                        'Google Pay',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text(
                        'Black, White, Monochrome, Pill/Rounded shapes',
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const GooglePayShowcasePage(),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 12),

                  // 3. PayPal Card
                  Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      leading: Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFC439),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Text(
                            'PP',
                            style: TextStyle(
                              color: Color(0xFF003087),
                              fontWeight: FontWeight.w900,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ),
                      title: const Text(
                        'PayPal & Pay Later',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text(
                        'Express Checkout, Pay Later, Pill/Rounded shapes',
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const PayPalShowcasePage(),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 12),

                  // 4. Klarna Card
                  Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      leading: Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFA8CD),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Text(
                            'K.',
                            style: TextStyle(
                              color: Color(0xFF0B051D),
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                      title: const Text(
                        'Klarna',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text(
                        'Pay Now, Pay in 30 days, Slice It, Rounded/Pill',
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const KlarnaShowcasePage(),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 12),

                  // 5. Wero (Vero) Card
                  Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      leading: Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFF48D),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Text(
                            'W',
                            style: TextStyle(
                              color: Color(0xFF1D1C1C),
                              fontWeight: FontWeight.w900,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      title: const Text(
                        'Wero',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text(
                        'European Payments Initiative (EPI), Yellow/Black/White',
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const EuropeanChampionsShowcasePage(
                              initialChampion: RegionalChampion.wero,
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 12),

                  // 6. Afterpay / Clearpay Card
                  Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      leading: Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: const Color(0xFFB2FCE4),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Text(
                            'ap',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      title: const Text(
                        'Afterpay / Clearpay',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text(
                        'Buy now pay later, Afterpay/Clearpay brand, Mint/Black/White',
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const AfterpayShowcasePage(),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 12),

                  // 8. TWINT (Twins) Card
                  Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      leading: Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: const Color(0xFF000000),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Text(
                            'T',
                            style: TextStyle(
                              color: Color(0xFF00A859),
                              fontWeight: FontWeight.w900,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      title: const Text(
                        'TWINT',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text(
                        'Switzerland #1 mobile payment method, Black/White',
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const EuropeanChampionsShowcasePage(
                              initialChampion: RegionalChampion.twint,
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 12),

                  // 9. BLIK (Blick) Card
                  Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      leading: Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: const Color(0xFF000000),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Text(
                            'B',
                            style: TextStyle(
                              color: Color(0xFFE30613),
                              fontWeight: FontWeight.w900,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      title: const Text(
                        'BLIK',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text(
                        'Poland mobile banking & e-commerce champion, Black/White',
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const EuropeanChampionsShowcasePage(
                              initialChampion: RegionalChampion.blik,
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 12),

                  // 10. iDEAL Card
                  Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      leading: Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFF48D),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Text(
                            'i|w',
                            style: TextStyle(
                              color: Color(0xFF1D1C1C),
                              fontWeight: FontWeight.w900,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      title: const Text(
                        'iDEAL | Wero',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text(
                        'Netherlands online banking migrating to Wero, Yellow/Black/White',
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const EuropeanChampionsShowcasePage(
                              initialChampion: RegionalChampion.ideal,
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 12),

                  // 11. Bancontact (BankContact) Card
                  Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      leading: Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: const Color(0xFF00559F),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Text(
                            'BC',
                            style: TextStyle(
                              color: Color(0xFFFFD200),
                              fontWeight: FontWeight.w900,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      title: const Text(
                        'Bancontact',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text(
                        'Belgium market leader in card and digital payments',
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const EuropeanChampionsShowcasePage(
                              initialChampion: RegionalChampion.bancontact,
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 12),

                  // 12. Bizum Card
                  Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      leading: Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: const Color(0xFF00B4B6),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Text(
                            'Bz',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      title: const Text(
                        'Bizum',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text(
                        'Spain instant account-to-account mobile payment system',
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const EuropeanChampionsShowcasePage(
                              initialChampion: RegionalChampion.bizum,
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 12),

                  // 13. Latin America Card
                  Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      leading: Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: const Color(0xFF00A859),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Text(
                            'LAT',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      title: const Text(
                        'Latin America',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text(
                        'Pix (Brazil), OXXO (Mexico), Boleto Bancário (Brazil)',
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const LatinAmericaShowcasePage(),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 12),

                  // 14. Asian Champions Card
                  Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      leading: Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: const Color(0xFFC41230),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Text(
                            'ASIA',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      title: const Text(
                        'Asian Champions',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text(
                        'Alipay, WeChat Pay, PayNow (Singapore), PromptPay (Thailand)',
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const AsianChampionsShowcasePage(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
