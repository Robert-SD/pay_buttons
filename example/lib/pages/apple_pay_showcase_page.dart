import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pay_buttons/pay_buttons.dart';

/// Demonstrates [ApplePayButton], which renders only Apple's own controls.
///
/// Apple's guidelines do not permit reproducing the Apple Pay mark, so the
/// button intentionally renders nothing on Android, desktop, and in browsers
/// without Apple Pay support. That makes this page look empty in Chrome; it is
/// working as intended.
class ApplePayShowcasePage extends StatefulWidget {
  const ApplePayShowcasePage({super.key});

  @override
  State<ApplePayShowcasePage> createState() => _ApplePayShowcasePageState();
}

class _ApplePayShowcasePageState extends State<ApplePayShowcasePage> {
  ApplePayColor _color = ApplePayColor.black;
  ApplePayType _type = ApplePayType.plain;
  ApplePayShape _shape = ApplePayShape.pill;
  double _height = 48.0;
  double _width = 200.0;

  void _handlePayPress() {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Apple Pay button triggered (${_type.name})'),
        backgroundColor: const Color(0xFF1E293B),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  bool get _isApplePayCapablePlatform =>
      kIsWeb || defaultTargetPlatform == TargetPlatform.iOS;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Apple Pay Showcase')),
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
    final capable = _isApplePayCapablePlatform;

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
                    ? 'Apple Pay renders only Apple\'s own controls: the '
                          'Apple Pay JS SDK element in supporting browsers, and '
                          'the native PassKit button on iOS.'
                    : 'Apple Pay is not available on this platform. Apple\'s '
                          'guidelines forbid drawing the Apple Pay mark '
                          'manually, so the button correctly renders nothing '
                          'here. Open this page on iOS or in Safari to see it.',
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
    final isWhiteTheme = _color != ApplePayColor.black;

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
                child: ApplePayButton(
                  onPressed: _handlePayPress,
                  color: _color,
                  type: _type,
                  shape: _shape,
                  width: _width,
                  height: _height,
                ),
              ),
            ),

            const SizedBox(height: 24),

            Wrap(
              spacing: 16,
              runSpacing: 12,
              children: [
                // Color Picker
                DropdownButton<ApplePayColor>(
                  value: _color,
                  items: ApplePayColor.values.map((c) {
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
                DropdownButton<ApplePayShape>(
                  value: _shape,
                  items: ApplePayShape.values.map((s) {
                    return DropdownMenuItem(
                      value: s,
                      child: Text('Shape: ${s.name}'),
                    );
                  }).toList(),
                  onChanged: (val) {
                    if (val != null) setState(() => _shape = val);
                  },
                ),

                // Label Picker
                DropdownButton<ApplePayType>(
                  value: _type,
                  items: ApplePayType.values.map((t) {
                    return DropdownMenuItem(
                      value: t,
                      child: Text('Label: ${t.name}'),
                    );
                  }).toList(),
                  onChanged: (val) {
                    if (val != null) setState(() => _type = val);
                  },
                ),
              ],
            ),

            const SizedBox(height: 20),

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
          'Apple Pay Button Styles',
          style: Theme.of(context).textTheme.titleLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          'Apple Pay controls in each supported style and type.',
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
                  color: ApplePayColor.black,
                  type: ApplePayType.plain,
                ),
              ),
              _buildGalleryItem(
                label: 'White',
                button: _galleryButton(
                  color: ApplePayColor.white,
                  type: ApplePayType.plain,
                  onDark: true,
                ),
              ),
              _buildGalleryItem(
                label: 'White Outline',
                button: _galleryButton(
                  color: ApplePayColor.whiteOutline,
                  type: ApplePayType.plain,
                ),
              ),
              _buildGalleryItem(
                label: 'Buy with Apple Pay',
                button: _galleryButton(
                  color: ApplePayColor.black,
                  type: ApplePayType.buy,
                ),
              ),
              _buildGalleryItem(
                label: 'Check out with Apple Pay',
                button: _galleryButton(
                  color: ApplePayColor.black,
                  type: ApplePayType.checkout,
                ),
              ),
              _buildGalleryItem(
                label: 'Donate with Apple Pay',
                button: _galleryButton(
                  color: ApplePayColor.black,
                  type: ApplePayType.donate,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _galleryButton({
    required ApplePayColor color,
    required ApplePayType type,
    bool onDark = false,
  }) {
    final button = SizedBox(
      width: 200,
      height: 48,
      child: ApplePayButton(
        onPressed: _handlePayPress,
        color: color,
        type: type,
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
