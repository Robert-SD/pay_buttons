import 'package:flutter/material.dart';
import 'package:pay_buttons/pay_buttons.dart';

class AmazonPayShowcasePage extends StatefulWidget {
  const AmazonPayShowcasePage({super.key});

  @override
  State<AmazonPayShowcasePage> createState() => _AmazonPayShowcasePageState();
}

class _AmazonPayShowcasePageState extends State<AmazonPayShowcasePage> {
  // Playground state
  AmazonPayColor _color = AmazonPayColor.gold;
  AmazonPayShape _shape = AmazonPayShape.pill;
  AmazonPayButtonType _type = AmazonPayButtonType.pay;
  bool _isLoading = false;
  bool _enabled = true;
  bool _fullWidth = false;
  double _height = 48.0;
  double _elevation = 0.0;
  String _localeCode = 'en';

  void _handlePayPress() {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Amazon Pay ${_type.name} triggered (${_color.name}, ${_shape.name})',
        ),
        backgroundColor: const Color(0xFF232F3E),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Amazon Pay Showcase'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          // 1. Interactive Playground
          _buildPlaygroundSection(),

          const SizedBox(height: 32),
          const Divider(),
          const SizedBox(height: 24),

          // 2. All Variants Gallery Grid
          _buildGallerySection(),

          const SizedBox(height: 32),
          const Divider(),
          const SizedBox(height: 24),

          // 3. Localized Action Verbs
          _buildLocalizedSection(),
        ],
      ),
    );
  }

  Widget _buildPlaygroundSection() {
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
                const Icon(Icons.tune, color: Color(0xFF232F3E)),
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
              'Customize parameters in real-time and observe behavior.',
              style: TextStyle(color: Colors.grey.shade600),
            ),
            const SizedBox(height: 24),

            // Live Preview Box
            Container(
              padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 16),
              decoration: BoxDecoration(
                color: _color == AmazonPayColor.darkGray
                    ? const Color(0xFFF7F9FA)
                    : const Color(0xFF1E293B),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Center(
                child: AmazonPayButton(
                  onPressed: _enabled ? _handlePayPress : null,
                  isLoading: _isLoading,
                  enabled: _enabled,
                  color: _color,
                  shape: _shape,
                  type: _type,
                  height: _height,
                  width: _fullWidth ? double.infinity : null,
                  elevation: _elevation,
                  locale: Locale(_localeCode),
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
                DropdownButton<AmazonPayColor>(
                  value: _color,
                  items: AmazonPayColor.values.map((c) {
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
                DropdownButton<AmazonPayShape>(
                  value: _shape,
                  items: AmazonPayShape.values.map((s) {
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
                DropdownButton<AmazonPayButtonType>(
                  value: _type,
                  items: AmazonPayButtonType.values.map((t) {
                    return DropdownMenuItem(
                      value: t,
                      child: Text('Type: ${t.name}'),
                    );
                  }).toList(),
                  onChanged: (val) {
                    if (val != null) setState(() => _type = val);
                  },
                ),

                // Locale Picker
                DropdownButton<String>(
                  value: _localeCode,
                  items: const [
                    DropdownMenuItem(value: 'en', child: Text('Locale: English (en)')),
                    DropdownMenuItem(value: 'de', child: Text('Locale: German (de)')),
                    DropdownMenuItem(value: 'fr', child: Text('Locale: French (fr)')),
                    DropdownMenuItem(value: 'es', child: Text('Locale: Spanish (es)')),
                    DropdownMenuItem(value: 'it', child: Text('Locale: Italian (it)')),
                  ],
                  onChanged: (val) {
                    if (val != null) setState(() => _localeCode = val);
                  },
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Switches
            Wrap(
              spacing: 24,
              runSpacing: 8,
              children: [
                FilterChip(
                  label: const Text('Loading Spinner'),
                  selected: _isLoading,
                  onSelected: (val) => setState(() => _isLoading = val),
                ),
                FilterChip(
                  label: const Text('Enabled'),
                  selected: _enabled,
                  onSelected: (val) => setState(() => _enabled = val),
                ),
                FilterChip(
                  label: const Text('Full Width'),
                  selected: _fullWidth,
                  onSelected: (val) => setState(() => _fullWidth = val),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Sliders
            Row(
              children: [
                const SizedBox(width: 80, child: Text('Height:')),
                Expanded(
                  child: Slider(
                    value: _height,
                    min: 40.0,
                    max: 60.0,
                    divisions: 10,
                    label: '${_height.round()} dp',
                    onChanged: (val) => setState(() => _height = val),
                  ),
                ),
                Text('${_height.round()} dp'),
              ],
            ),
            Row(
              children: [
                const SizedBox(width: 80, child: Text('Elevation:')),
                Expanded(
                  child: Slider(
                    value: _elevation,
                    min: 0.0,
                    max: 8.0,
                    divisions: 8,
                    label: '${_elevation.round()} dp',
                    onChanged: (val) => setState(() => _elevation = val),
                  ),
                ),
                Text('${_elevation.round()} dp'),
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
          'Amazon Pay Color Schemes (Pill & Rounded)',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 8),
        Text(
          'Official Gold, Dark Squid Ink, and Light Gray themes.',
          style: TextStyle(color: Colors.grey.shade600),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: AmazonPayColor.values.map((color) {
            return Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: color == AmazonPayColor.darkGray
                    ? const Color(0xFFF7F9FA)
                    : const Color(0xFF1E293B),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Color: ${color.name.toUpperCase()}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: color == AmazonPayColor.darkGray
                          ? Colors.black87
                          : Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 12),
                  AmazonPayButton(
                    onPressed: _handlePayPress,
                    color: color,
                    shape: AmazonPayShape.pill,
                    type: AmazonPayButtonType.pay,
                  ),
                  const SizedBox(height: 10),
                  AmazonPayButton(
                    onPressed: _handlePayPress,
                    color: color,
                    shape: AmazonPayShape.rounded,
                    type: AmazonPayButtonType.pay,
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildLocalizedSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Localized Checkout & Buy Now Actions',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 8),
        Text(
          'Full-context verbs in English, German, French, and Spanish.',
          style: TextStyle(color: Colors.grey.shade600),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16,
          runSpacing: 12,
          children: [
            AmazonPayButton(
              onPressed: _handlePayPress,
              type: AmazonPayButtonType.checkout,
              locale: const Locale('en'),
            ),
            AmazonPayButton(
              onPressed: _handlePayPress,
              type: AmazonPayButtonType.checkout,
              locale: const Locale('de'),
            ),
            AmazonPayButton(
              onPressed: _handlePayPress,
              type: AmazonPayButtonType.buyNow,
              locale: const Locale('fr'),
            ),
            AmazonPayButton(
              onPressed: _handlePayPress,
              type: AmazonPayButtonType.buyNow,
              locale: const Locale('es'),
            ),
          ],
        ),
      ],
    );
  }
}
