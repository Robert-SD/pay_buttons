import 'package:flutter/material.dart';
import 'package:pay_buttons/pay_buttons.dart';

import 'pages/afterpay_showcase_page.dart';
import 'pages/amazon_pay_showcase_page.dart';
import 'pages/apple_pay_showcase_page.dart';
import 'pages/european_champions_showcase_page.dart';
import 'pages/google_pay_showcase_page.dart';
import 'pages/klarna_showcase_page.dart';
import 'pages/paypal_showcase_page.dart';
import 'pages/shop_pay_showcase_page.dart';

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
              constraints: const BoxConstraints(maxWidth: 580),
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
                  const SizedBox(height: 12),
                  Column(
                    children: [
                      Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 12,
                        runSpacing: 12,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          ApplePayButton(
                            onPressed: () =>
                                _handlePayPress(context, 'Apple Pay'),
                          ),
                          GooglePayButton(
                            onPressed: () =>
                                _handlePayPress(context, 'Google Pay'),
                          ),
                          PayPalButton(
                            onPressed: () =>
                                _handlePayPress(context, 'PayPal'),
                          ),
                          AmazonPayButton(
                            onPressed: () =>
                                _handlePayPress(context, 'Amazon Pay'),
                          ),
                          KlarnaButton(
                            onPressed: () =>
                                _handlePayPress(context, 'Klarna'),
                          ),
                          WeroButton(
                            onPressed: () => _handlePayPress(context, 'Wero'),
                          ),
                          ShopPayButton(
                            onPressed: () =>
                                _handlePayPress(context, 'Shop Pay'),
                          ),
                          AfterpayButton(
                            onPressed: () =>
                                _handlePayPress(context, 'Afterpay'),
                          ),
                          TwintButton(
                            onPressed: () =>
                                _handlePayPress(context, 'TWINT'),
                          ),
                          BlikButton(
                            onPressed: () => _handlePayPress(context, 'BLIK'),
                          ),
                          IdealButton(
                            onPressed: () =>
                                _handlePayPress(context, 'iDEAL'),
                          ),
                          BancontactButton(
                            onPressed: () =>
                                _handlePayPress(context, 'Bancontact'),
                          ),
                          BizumButton(
                            onPressed: () =>
                                _handlePayPress(context, 'Bizum'),
                          ),
                        ],
                      ),
                    ],
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

                  // 4. Amazon Pay Card
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
                            'a',
                            style: TextStyle(
                              color: Color(0xFF111111),
                              fontWeight: FontWeight.w900,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      title: const Text(
                        'Amazon Pay',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text(
                        'Pay, Checkout, Buy Now, Gold/Dark/Light themes',
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const AmazonPayShowcasePage(),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 12),

                  // 5. Klarna Card
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

                  // 6. Wero (Vero) Card
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

                  // 7. Shop Pay Card
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
                          color: const Color(0xFF5A31F4),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Text(
                            'shop',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                      title: const Text(
                        'Shop Pay',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text(
                        'Shopify 1-click checkout, Standard/Buy with, Purple/Black/White',
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const ShopPayShowcasePage(),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 12),

                  // 8. Afterpay / Clearpay Card
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

                  // 9. TWINT (Twins) Card
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

                  // 10. BLIK (Blick) Card
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

                  // 11. iDEAL Card
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
                          color: const Color(0xFFF1F5F9),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: const Center(
                          child: Text(
                            'i',
                            style: TextStyle(
                              color: Color(0xFFCC0066),
                              fontWeight: FontWeight.w900,
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ),
                      title: const Text(
                        'iDEAL',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text(
                        'Netherlands online banking standard, White/Black',
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

                  // 12. Bancontact (BankContact) Card
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

                  // 13. Bizum Card
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

                  const SizedBox(height: 28),
                  const Text(
                    'Upcoming Buttons (Planned)',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _buildUpcomingItem(
                    name: 'Asian Champions',
                    details: 'Alipay, WeChat Pay, PayNow, PromptPay',
                    badgeColor: const Color(0xFFFF5000),
                    textColor: Colors.white,
                  ),
                  _buildUpcomingItem(
                    name: 'Latin America',
                    details: 'Pix, Boleto Bancário, OXXO',
                    badgeColor: const Color(0xFF00A859),
                    textColor: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUpcomingItem({
    required String name,
    required String details,
    required Color badgeColor,
    required Color textColor,
  }) {
    return Card(
      elevation: 0,
      color: Colors.grey.shade100,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            color: badgeColor,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Center(
            child: Text(
              name.substring(0, 1),
              style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        title: Text(name, style: const TextStyle(color: Colors.black87)),
        subtitle: Text(
          details,
          style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
        ),
        trailing: const Chip(
          label: Text('Roadmap', style: TextStyle(fontSize: 10)),
          padding: EdgeInsets.zero,
          visualDensity: VisualDensity.compact,
        ),
      ),
    );
  }
}
