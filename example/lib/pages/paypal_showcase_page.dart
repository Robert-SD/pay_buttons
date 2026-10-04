import 'package:flutter/material.dart';
import 'package:pay_buttons/pay_buttons.dart';

class PayPalShowcasePage extends StatefulWidget {
  const PayPalShowcasePage({super.key});

  @override
  State<PayPalShowcasePage> createState() => _PayPalShowcasePageState();
}

class _PayPalShowcasePageState extends State<PayPalShowcasePage> {
  // Playground state
  PayPalColor _color = PayPalColor.gold;
  PayPalShape _shape = PayPalShape.pill;
  String? _text = 'Checkout';
  bool _isLoading = false;
  bool _enabled = true;
  bool _fullWidth = false;
  double _height = 48.0;
  double _elevation = 0.0;
  late final TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: _text);
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _handlePayPress() {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'PayPal button triggered (${_color.name}, ${_shape.name})',
        ),
        backgroundColor: const Color(0xFF003087),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PayPal Buttons Showcase')),
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

          // 3. Dedicated Pay Later Showcase
          _buildPayLaterSection(),
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
                const Icon(Icons.tune, color: Color(0xFF003087)),
                const SizedBox(width: 8),
                Text(
                  'Interactive Playground',
                  style: Theme.of(context).textTheme.titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
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
                color: _color == PayPalColor.white
                    ? const Color(
                        0xFF232F3E,
                      ) // Dark background for white button
                    : const Color(0xFFF7F9FA),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Center(
                child: PayPalButton(
                  onPressed: _enabled ? _handlePayPress : null,
                  isLoading: _isLoading,
                  enabled: _enabled,
                  color: _color,
                  shape: _shape,
                  text: _text,
                  height: _height,
                  width: _fullWidth ? double.infinity : null,
                  elevation: _elevation,
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
                DropdownButton<PayPalColor>(
                  value: _color,
                  items: PayPalColor.values.map((c) {
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
                DropdownButton<PayPalShape>(
                  value: _shape,
                  items: PayPalShape.values.map((s) {
                    return DropdownMenuItem(
                      value: s,
                      child: Text('Shape: ${s.name}'),
                    );
                  }).toList(),
                  onChanged: (val) {
                    if (val != null) setState(() => _shape = val);
                  },
                ),

                // Custom Text Input
                SizedBox(
                  width: 200,
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'Custom Text (empty = logo only)',
                      isDense: true,
                    ),
                    controller: _textController,
                    onChanged: (val) {
                      setState(() => _text = val.isEmpty ? null : val);
                    },
                  ),
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
          'Brand Color Variants (Pill & Rounded)',
          style: Theme.of(context).textTheme.titleLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          'Side-by-side verification of all supported color schemes.',
          style: TextStyle(color: Colors.grey.shade600),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: PayPalColor.values.map((color) {
            return Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: color == PayPalColor.white
                    ? const Color(0xFF1E293B)
                    : Colors.white,
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
                      color: color == PayPalColor.white
                          ? Colors.white70
                          : Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),
                  PayPalButton(
                    onPressed: _handlePayPress,
                    color: color,
                    shape: PayPalShape.pill,
                    text: 'Checkout',
                  ),
                  const SizedBox(height: 10),
                  PayPalButton(
                    onPressed: _handlePayPress,
                    color: color,
                    shape: PayPalShape.rounded,
                    text: 'Checkout',
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildPayLaterSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'PayPal Pay Later Specialization',
          style: Theme.of(context).textTheme.titleLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          'Dedicated installment checkout button with custom text.',
          style: TextStyle(color: Colors.grey.shade600),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16,
          runSpacing: 12,
          children: [
            PayPalPayLaterButton(
              onPressed: _handlePayPress,
              color: PayPalColor.white,
              text: 'Pay Later',
            ),
            PayPalPayLaterButton(
              onPressed: _handlePayPress,
              color: PayPalColor.gold,
              text: 'Später bezahlen',
            ),
            PayPalPayLaterButton(
              onPressed: _handlePayPress,
              color: PayPalColor.blue,
              text: '4x sans frais',
            ),
          ],
        ),
      ],
    );
  }
}
