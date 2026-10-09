import 'package:flutter/material.dart';
import 'package:pay_buttons/pay_buttons.dart';

class KlarnaShowcasePage extends StatefulWidget {
  const KlarnaShowcasePage({super.key});

  @override
  State<KlarnaShowcasePage> createState() => _KlarnaShowcasePageState();
}

class _KlarnaShowcasePageState extends State<KlarnaShowcasePage> {
  // Playground state
  KlarnaColor _color = KlarnaColor.pink;
  KlarnaShape _shape = KlarnaShape.rounded;
  String? _text = 'Pay with';
  PayButtonVariant _variant = PayButtonVariant.responsive;
  PayButtonTextPosition _textPosition = PayButtonTextPosition.trailing;
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
          'Klarna button triggered (${_color.name}, ${_shape.name})',
        ),
        backgroundColor: const Color(0xFF0B051D),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Klarna Buttons Showcase')),
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

          // 3. Custom Text Variations
          _buildInstallmentsSection(),

          const SizedBox(height: 32),
          const Divider(),
          const SizedBox(height: 24),

          // 4. Sign in with Klarna (SIWK) & Responsive Breakpoints
          _buildSiwkSection(),

          const SizedBox(height: 32),
          const Divider(),
          const SizedBox(height: 24),

          // 5. Small & Medium Examples
          _buildSmallAndMediumSection(),
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
                const Icon(Icons.tune, color: Color(0xFF0B051D)),
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
                color:
                    (_color == KlarnaColor.white ||
                        _color == KlarnaColor.offWhite)
                    ? const Color(0xFF1E293B)
                    : const Color(0xFFF7F9FA),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Center(
                child: KlarnaButton(
                  onPressed: _enabled ? _handlePayPress : null,
                  isLoading: _isLoading,
                  enabled: _enabled,
                  color: _color,
                  shape: _shape,
                  text: _text,
                  variant: _variant,
                  textPosition: _textPosition,
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
                DropdownButton<KlarnaColor>(
                  value: _color,
                  items: KlarnaColor.values.map((c) {
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
                DropdownButton<KlarnaShape>(
                  value: _shape,
                  items: KlarnaShape.values.map((s) {
                    return DropdownMenuItem(
                      value: s,
                      child: Text('Shape: ${s.name}'),
                    );
                  }).toList(),
                  onChanged: (val) {
                    if (val != null) setState(() => _shape = val);
                  },
                ),

                // Variant Picker
                DropdownButton<PayButtonVariant>(
                  value: _variant,
                  items: PayButtonVariant.values.map((v) {
                    return DropdownMenuItem(
                      value: v,
                      child: Text('Variant: ${v.name}'),
                    );
                  }).toList(),
                  onChanged: (val) {
                    if (val != null) setState(() => _variant = val);
                  },
                ),

                // Text Position Picker
                DropdownButton<PayButtonTextPosition>(
                  value: _textPosition,
                  items: PayButtonTextPosition.values.map((p) {
                    return DropdownMenuItem(
                      value: p,
                      child: Text('Text Pos: ${p.name}'),
                    );
                  }).toList(),
                  onChanged: (val) {
                    if (val != null) setState(() => _textPosition = val);
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
          'Klarna Color Schemes (Rounded, Rect & Pill)',
          style: Theme.of(context).textTheme.titleLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          'Side-by-side verification of all supported color themes and contour shapes.',
          style: TextStyle(color: Colors.grey.shade600),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: KlarnaColor.values.map((color) {
            return Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color:
                    (color == KlarnaColor.white ||
                        color == KlarnaColor.offWhite)
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
                      color:
                          (color == KlarnaColor.white ||
                              color == KlarnaColor.offWhite)
                          ? Colors.white70
                          : Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),
                  KlarnaButton(
                    onPressed: _handlePayPress,
                    color: color,
                    shape: KlarnaShape.rounded,
                    text: 'Pay with',
                  ),
                  const SizedBox(height: 10),
                  KlarnaButton(
                    onPressed: _handlePayPress,
                    color: color,
                    shape: KlarnaShape.rect,
                    text: 'Pay with',
                  ),
                  const SizedBox(height: 10),
                  KlarnaButton(
                    onPressed: _handlePayPress,
                    color: color,
                    shape: KlarnaShape.pill,
                    text: 'Pay with',
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildInstallmentsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Klarna Custom Text Examples',
          style: Theme.of(context).textTheme.titleLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          'Pay in 30 days, Pay in 3, and Sofort instant payment.',
          style: TextStyle(color: Colors.grey.shade600),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16,
          runSpacing: 12,
          children: [
            KlarnaButton(onPressed: _handlePayPress, text: 'Pay in 30 days'),
            KlarnaButton(
              onPressed: _handlePayPress,
              text: 'In 30 Tagen bezahlen',
            ),
            KlarnaButton(onPressed: _handlePayPress, text: 'Pay in 3'),
            KlarnaButton(onPressed: _handlePayPress, text: 'Sofort bezahlen'),
          ],
        ),
      ],
    );
  }

  Widget _buildSiwkSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sign in with Klarna (SIWK) & Responsive Breakpoints',
          style: Theme.of(context).textTheme.titleLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          'Styled according to Klarna Identity button guidelines. Demonstrates dark/light/off-white themes and dynamic responsive width collapse.',
          style: TextStyle(color: Colors.grey.shade600),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            // Variant 1: Full width (> 200px) with "Continue with Klarna."
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Full Variant (Width > 200px: 335dp default)',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Displays full label: "Continue with" + Klarna logo',
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                  ),
                  const SizedBox(height: 12),
                  KlarnaButton(
                    onPressed: _handlePayPress,
                    width: 335,
                    text: 'Continue with',
                    textPosition: PayButtonTextPosition.leading,
                    color: KlarnaColor.black,
                    shape: KlarnaShape.rounded,
                  ),
                ],
              ),
            ),

            // Variant 2: Medium width (84px - 200px) logo only
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF1E293B),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Medium Variant (84dp ≤ Width ≤ 200dp: 140dp)',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Auto-collapses to "Klarna." wordmark only',
                    style: TextStyle(fontSize: 12, color: Colors.white70),
                  ),
                  const SizedBox(height: 12),
                  KlarnaButton(
                    onPressed: _handlePayPress,
                    width: 140,
                    text: 'Continue with',
                    textPosition: PayButtonTextPosition.leading,
                    color: KlarnaColor.white,
                    shape: KlarnaShape.rect,
                  ),
                ],
              ),
            ),

            // Variant 3: Compact width (< 84px) monogram "K."
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF1E293B),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Compact Variant (Width < 84dp: 54dp)',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Auto-collapses to compact "K." monogram with dot',
                    style: TextStyle(fontSize: 12, color: Colors.white70),
                  ),
                  const SizedBox(height: 12),
                  KlarnaButton(
                    onPressed: _handlePayPress,
                    width: 54,
                    color: KlarnaColor.offWhite,
                    shape: KlarnaShape.pill,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSmallAndMediumSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Small & Medium Size Variants',
          style: Theme.of(context).textTheme.titleLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          'Compact monogram icon and medium wordmark size variations.',
          style: TextStyle(color: Colors.grey.shade600),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Medium (Wordmark)',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                  const SizedBox(height: 8),
                  KlarnaButton(
                    onPressed: _handlePayPress,
                    variant: PayButtonVariant.medium,
                    width: 140,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Small / Compact (K. Monogram)',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                  const SizedBox(height: 8),
                  KlarnaButton(
                    onPressed: _handlePayPress,
                    variant: PayButtonVariant.compact,
                    width: 52,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
