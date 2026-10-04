import 'package:flutter/material.dart';
import 'package:pay_buttons/pay_buttons.dart';

class ApplePayShowcasePage extends StatefulWidget {
  const ApplePayShowcasePage({super.key});

  @override
  State<ApplePayShowcasePage> createState() => _ApplePayShowcasePageState();
}

class _ApplePayShowcasePageState extends State<ApplePayShowcasePage> {
  // Playground state
  ApplePayButtonStyle _style = ApplePayButtonStyle.black;
  ApplePayButtonType _type = ApplePayButtonType.plain;
  double _height = 48.0;
  double _width = 200.0;

  void _handlePayPress() {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Apple Pay button triggered (${_style.name}, ${_type.name})',
        ),
        backgroundColor: const Color(0xFF1E293B),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Apple Pay Showcase (pay library)')),
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
    final isWhiteTheme =
        _style == ApplePayButtonStyle.white || _style == ApplePayButtonStyle.whiteOutline;

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
                const Icon(Icons.tune, color: Colors.black87),
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
              'Official Apple Pay button from the Flutter pay package.',
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
                  child: RawApplePayButton(
                    onPressed: _handlePayPress,
                    style: _style,
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
                // Style Picker
                DropdownButton<ApplePayButtonStyle>(
                  value: _style,
                  items: ApplePayButtonStyle.values.map((s) {
                    return DropdownMenuItem(
                      value: s,
                      child: Text('Style: ${s.name}'),
                    );
                  }).toList(),
                  onChanged: (val) {
                    if (val != null) setState(() => _style = val);
                  },
                ),

                // Type Picker
                DropdownButton<ApplePayButtonType>(
                  value: _type,
                  items: ApplePayButtonType.values.map((t) {
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
          'Official Apple Pay Button Styles',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 8),
        Text(
          'Black, White, and White Outline button styles.',
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
                label: 'Black (Default)',
                button: SizedBox(
                  width: 200,
                  height: 48,
                  child: RawApplePayButton(
                    style: ApplePayButtonStyle.black,
                    type: ApplePayButtonType.plain,
                    onPressed: _handlePayPress,
                  ),
                ),
              ),
              _buildGalleryItem(
                label: 'White',
                button: SizedBox(
                  width: 200,
                  height: 48,
                  child: RawApplePayButton(
                    style: ApplePayButtonStyle.white,
                    type: ApplePayButtonType.plain,
                    onPressed: _handlePayPress,
                  ),
                ),
              ),
              _buildGalleryItem(
                label: 'White Outline',
                button: SizedBox(
                  width: 200,
                  height: 48,
                  child: RawApplePayButton(
                    style: ApplePayButtonStyle.whiteOutline,
                    type: ApplePayButtonType.plain,
                    onPressed: _handlePayPress,
                  ),
                ),
              ),
              _buildGalleryItem(
                label: 'Buy with Apple Pay',
                button: SizedBox(
                  width: 200,
                  height: 48,
                  child: RawApplePayButton(
                    style: ApplePayButtonStyle.black,
                    type: ApplePayButtonType.buy,
                    onPressed: _handlePayPress,
                  ),
                ),
              ),
              _buildGalleryItem(
                label: 'Check out with Apple Pay',
                button: SizedBox(
                  width: 200,
                  height: 48,
                  child: RawApplePayButton(
                    style: ApplePayButtonStyle.black,
                    type: ApplePayButtonType.checkout,
                    onPressed: _handlePayPress,
                  ),
                ),
              ),
              _buildGalleryItem(
                label: 'Donate with Apple Pay',
                button: SizedBox(
                  width: 200,
                  height: 48,
                  child: RawApplePayButton(
                    style: ApplePayButtonStyle.black,
                    type: ApplePayButtonType.donate,
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
