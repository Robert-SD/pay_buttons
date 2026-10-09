import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pay_buttons/pay_buttons.dart';

/// Demonstrates [GooglePayButton], which renders official Google Pay controls:
/// the official Google Pay JS SDK on Web and native Android Google Pay controls on Android.
class GooglePayShowcasePage extends StatefulWidget {
  const GooglePayShowcasePage({super.key});

  @override
  State<GooglePayShowcasePage> createState() => _GooglePayShowcasePageState();
}

class _GooglePayShowcasePageState extends State<GooglePayShowcasePage> {
  // Playground state
  GooglePayColor _color = GooglePayColor.black;
  GooglePayShape _shape = GooglePayShape.pill;
  GooglePayType _type = GooglePayType.buy;
  double _height = 48.0;
  double _width = 200.0;

  void _handlePayPress() {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Google Pay button triggered (${_color.name}, ${_shape.name})',
        ),
        backgroundColor: const Color(0xFF1E293B),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  bool get _isGooglePayCapablePlatform =>
      kIsWeb || defaultTargetPlatform == TargetPlatform.android;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Google Pay Showcase')),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          _buildNotice(),
          const SizedBox(height: 24),
          _buildPlaygroundSection(),
          const SizedBox(height: 32),
          const Divider(),
          const SizedBox(height: 24),
          _buildGallerySection(),
        ],
      ),
    );
  }

  Widget _buildNotice() {
    final capable = _isGooglePayCapablePlatform;

    return Card(
      color: capable ? const Color(0xFFEFF6FF) : const Color(0xFFFEF3C7),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              capable ? Icons.info_outline : Icons.warning_amber_rounded,
              size: 20,
              color: capable
                  ? const Color(0xFF1D4ED8)
                  : const Color(0xFF92400E),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                capable
                    ? 'Google Pay renders only official Google Pay controls: the '
                          'Google Pay JS SDK element on Web, and native controls '
                          'on Android.'
                    : 'Google Pay is not available on this platform ($defaultTargetPlatform). '
                          'Google\'s guidelines require official controls, '
                          'so the button renders on Web (Chrome, Edge, Safari, etc.) and Android. '
                          'Open this page on Web or Android to see it.',
                style: TextStyle(
                  fontSize: 13,
                  height: 1.4,
                  color: capable
                      ? const Color(0xFF1E3A8A)
                      : const Color(0xFF78350F),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlaygroundSection() {
    final isWhiteTheme = _color == GooglePayColor.white;

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
                  style: Theme.of(context).textTheme.titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
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
                  child: GooglePayButton(
                    onPressed: _handlePayPress,
                    color: _color,
                    shape: _shape,
                    type: _type,
                    width: _width,
                    height: _height,
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
                // Color Picker
                DropdownButton<GooglePayColor>(
                  value: _color,
                  items: GooglePayColor.values.map((c) {
                    return DropdownMenuItem(
                      value: c,
                      child: Text('Color: ${c.name}'),
                    );
                  }).toList(),
                  onChanged: (val) {
                    if (val != null) setState(() => _color = val);
                  },
                ),

                // Shape Picker
                DropdownButton<GooglePayShape>(
                  value: _shape,
                  items: GooglePayShape.values.map((s) {
                    return DropdownMenuItem(
                      value: s,
                      child: Text('Shape: ${s.name}'),
                    );
                  }).toList(),
                  onChanged: (val) {
                    if (val != null) setState(() => _shape = val);
                  },
                ),

                // Type Picker
                DropdownButton<GooglePayType>(
                  value: _type,
                  items: GooglePayType.values.map((t) {
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
                SizedBox(width: 90, child: Text('Width: ${_width.toInt()} dp')),
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
          'Google Pay Button Themes',
          style: Theme.of(context).textTheme.titleLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          'Google Pay button themes and intents.',
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
                button: _galleryButton(
                  color: GooglePayColor.black,
                  type: GooglePayType.buy,
                ),
              ),
              _buildGalleryItem(
                label: 'White',
                button: _galleryButton(
                  color: GooglePayColor.white,
                  type: GooglePayType.buy,
                  onDark: true,
                ),
              ),
              _buildGalleryItem(
                label: 'Checkout with Google Pay',
                button: _galleryButton(
                  color: GooglePayColor.black,
                  type: GooglePayType.checkout,
                ),
              ),
              _buildGalleryItem(
                label: 'Donate with Google Pay',
                button: _galleryButton(
                  color: GooglePayColor.black,
                  type: GooglePayType.donate,
                ),
              ),
              _buildGalleryItem(
                label: 'Pay with Google Pay',
                button: _galleryButton(
                  color: GooglePayColor.black,
                  type: GooglePayType.pay,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _galleryButton({
    required GooglePayColor color,
    GooglePayType type = GooglePayType.buy,
    bool onDark = false,
  }) {
    final button = SizedBox(
      width: 200,
      height: 48,
      child: GooglePayButton(
        color: color,
        type: type,
        onPressed: _handlePayPress,
      ),
    );

    if (!onDark) return button;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(8),
      ),
      child: button,
    );
  }

  Widget _buildGalleryItem({required String label, required Widget button}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 88, child: Center(child: button)),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
