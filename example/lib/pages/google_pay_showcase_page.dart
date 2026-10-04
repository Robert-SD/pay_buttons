import 'package:flutter/material.dart';
import 'package:pay_buttons/pay_buttons.dart';

class GooglePayShowcasePage extends StatefulWidget {
  const GooglePayShowcasePage({super.key});

  @override
  State<GooglePayShowcasePage> createState() => _GooglePayShowcasePageState();
}

class _GooglePayShowcasePageState extends State<GooglePayShowcasePage> {
  static final _googlePayConfig = PaymentConfiguration.fromJsonString(
    '{"provider": "google_pay", "data": {}}',
  );

  // Playground state
  GooglePayButtonTheme _theme = GooglePayButtonTheme.dark;
  GooglePayButtonType _type = GooglePayButtonType.pay;
  double _height = 48.0;
  double _width = 200.0;

  void _handlePayPress() {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Google Pay button triggered (${_theme.name}, ${_type.name})',
        ),
        backgroundColor: const Color(0xFF1E293B),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Google Pay Showcase (pay library)')),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          _buildPlaygroundSection(),
          const SizedBox(height: 32),
          const Divider(),
          const SizedBox(height: 24),
          _buildGallerySection(),
        ],
      ),
    );
  }

  Widget _buildPlaygroundSection() {
    final isWhiteTheme = _theme == GooglePayButtonTheme.light;

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.tune, color: Color(0xFF4285F4)),
                const SizedBox(width: 8),
                Text(
                  'Interactive Playground',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Official Google Pay button from the Flutter pay package.',
              style: TextStyle(color: Colors.grey.shade600),
            ),
            const SizedBox(height: 24),

            // Live Preview Box
            Container(
              padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 16),
              decoration: BoxDecoration(
                color: isWhiteTheme
                    ? const Color(0xFF1E293B)
                    : const Color(0xFFF7F9FA),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Center(
                child: SizedBox(
                  width: _width,
                  height: _height,
                  child: RawGooglePayButton(
                    paymentConfiguration: _googlePayConfig,
                    onPressed: _handlePayPress,
                    theme: _theme,
                    type: _type,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Controls
            Wrap(
              spacing: 16,
              runSpacing: 12,
              children: [
                // Theme Picker
                DropdownButton<GooglePayButtonTheme>(
                  value: _theme,
                  items: GooglePayButtonTheme.values.map((t) {
                    return DropdownMenuItem(
                      value: t,
                      child: Text('Theme: ${t.name}'),
                    );
                  }).toList(),
                  onChanged: (val) {
                    if (val != null) setState(() => _theme = val);
                  },
                ),

                // Type Picker
                DropdownButton<GooglePayButtonType>(
                  value: _type,
                  items: GooglePayButtonType.values.map((t) {
                    return DropdownMenuItem(
                      value: t,
                      child: Text('Type: ${t.name}'),
                    );
                  }).toList(),
                  onChanged: (val) {
                    if (val != null) setState(() => _type = val);
                  },
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Width Slider
            Row(
              children: [
                SizedBox(
                  width: 90,
                  child: Text('Width: ${_width.toInt()} dp'),
                ),
                Expanded(
                  child: Slider(
                    value: _width,
                    min: 100.0,
                    max: 350.0,
                    divisions: 25,
                    label: '${_width.toInt()} dp',
                    onChanged: (val) => setState(() => _width = val),
                  ),
                ),
              ],
            ),

            // Height Slider
            Row(
              children: [
                SizedBox(
                  width: 90,
                  child: Text('Height: ${_height.toInt()} dp'),
                ),
                Expanded(
                  child: Slider(
                    value: _height,
                    min: 30.0,
                    max: 64.0,
                    divisions: 17,
                    label: '${_height.toInt()} dp',
                    onChanged: (val) => setState(() => _height = val),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGallerySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Official Google Pay Button Themes',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 8),
        Text(
          'Dark and Light Google Pay button themes.',
          style: TextStyle(color: Colors.grey.shade600),
        ),
        const SizedBox(height: 16),
        Center(
          child: Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: [
              _buildGalleryItem(
                label: 'Dark Theme (Default)',
                button: SizedBox(
                  width: 200,
                  height: 48,
                  child: RawGooglePayButton(
                    paymentConfiguration: _googlePayConfig,
                    theme: GooglePayButtonTheme.dark,
                    type: GooglePayButtonType.pay,
                    onPressed: _handlePayPress,
                  ),
                ),
              ),
              _buildGalleryItem(
                label: 'Light Theme',
                button: SizedBox(
                  width: 200,
                  height: 48,
                  child: RawGooglePayButton(
                    paymentConfiguration: _googlePayConfig,
                    theme: GooglePayButtonTheme.light,
                    type: GooglePayButtonType.pay,
                    onPressed: _handlePayPress,
                  ),
                ),
              ),
              _buildGalleryItem(
                label: 'Buy with Google Pay',
                button: SizedBox(
                  width: 200,
                  height: 48,
                  child: RawGooglePayButton(
                    paymentConfiguration: _googlePayConfig,
                    theme: GooglePayButtonTheme.dark,
                    type: GooglePayButtonType.buy,
                    onPressed: _handlePayPress,
                  ),
                ),
              ),
              _buildGalleryItem(
                label: 'Checkout with Google Pay',
                button: SizedBox(
                  width: 200,
                  height: 48,
                  child: RawGooglePayButton(
                    paymentConfiguration: _googlePayConfig,
                    theme: GooglePayButtonTheme.dark,
                    type: GooglePayButtonType.checkout,
                    onPressed: _handlePayPress,
                  ),
                ),
              ),
              _buildGalleryItem(
                label: 'Donate with Google Pay',
                button: SizedBox(
                  width: 200,
                  height: 48,
                  child: RawGooglePayButton(
                    paymentConfiguration: _googlePayConfig,
                    theme: GooglePayButtonTheme.dark,
                    type: GooglePayButtonType.donate,
                    onPressed: _handlePayPress,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildGalleryItem({
    required String label,
    required Widget button,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        button,
      ],
    );
  }
}
