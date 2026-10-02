import 'package:flutter/material.dart';
import 'pages/amazon_pay_showcase_page.dart';
import 'pages/klarna_showcase_page.dart';
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
          const Text(
            'Active Payment Buttons',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: -0.2,
            ),
          ),
          const SizedBox(height: 12),

          // Step 1: PayPal Card
          Card(
            clipBehavior: Clip.antiAlias,
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
              subtitle: const Text('Express Checkout, Pay Later, Pill/Rounded shapes'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const PayPalShowcasePage()),
                );
              },
            ),
          ),

          const SizedBox(height: 12),

          // Step 2: Klarna Card
          Card(
            clipBehavior: Clip.antiAlias,
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
              subtitle: const Text('Pay Now, Pay in 30 days, Slice It, Rounded/Pill'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const KlarnaShowcasePage()),
                );
              },
            ),
          ),

          const SizedBox(height: 12),

          // Step 3: Amazon Pay Card
          Card(
            clipBehavior: Clip.antiAlias,
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
              subtitle: const Text('Pay, Checkout, Buy Now, Gold/Dark/Light themes'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const AmazonPayShowcasePage()),
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
            name: 'Shop Pay',
            details: 'Shopify accelerated checkout',
            badgeColor: const Color(0xFF5A31F4),
            textColor: Colors.white,
          ),
          _buildUpcomingItem(
            name: 'Stripe Link',
            details: '1-click checkout by Stripe',
            badgeColor: const Color(0xFF00D66F),
            textColor: Colors.black,
          ),
          _buildUpcomingItem(
            name: 'Afterpay / Clearpay',
            details: 'Mint BNPL button with regional adaptation',
            badgeColor: const Color(0xFFB2FCE4),
            textColor: Colors.black,
          ),
          _buildUpcomingItem(
            name: 'European Champions',
            details: 'TWINT, iDEAL/Wero, BLIK, Bancontact, Bizum',
            badgeColor: const Color(0xFF00A859),
            textColor: Colors.white,
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
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        title: Text(name, style: const TextStyle(color: Colors.black87)),
        subtitle: Text(details, style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
        trailing: const Chip(
          label: Text('Roadmap', style: TextStyle(fontSize: 10)),
          padding: EdgeInsets.zero,
          visualDensity: VisualDensity.compact,
        ),
      ),
    );
  }
}
