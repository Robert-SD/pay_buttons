import 'package:flutter/material.dart';
import 'package:pay_buttons/pay_buttons.dart';

class AfterpayShowcasePage extends StatefulWidget {
  const AfterpayShowcasePage({super.key});

  @override
  State<AfterpayShowcasePage> createState() => _AfterpayShowcasePageState();
}

class _AfterpayShowcasePageState extends State<AfterpayShowcasePage> {
  // Playground state
  AfterpayColor _color = AfterpayColor.mint;
  AfterpayShape _shape = AfterpayShape.rounded;
  AfterpayBrand _brand = AfterpayBrand.afterpay;
  String? _text = 'Buy now with';
  PayButtonVariant _variant = PayButtonVariant.responsive;
  PayButtonTextPosition _textPosition = PayButtonTextPosition.leading;
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
          '${_brand.displayName} button triggered (${_color.name}, ${_shape.name})',
        ),
        backgroundColor: const Color(0xFF000000),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Afterpay / Clearpay Showcase')),
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

          // 3. Regional Clearpay Comparison
          _buildRegionalSection(),

          const SizedBox(height: 32),
          const Divider(),
          const SizedBox(height: 24),

          // 4. Custom Action Verbs
          _buildLocalizedSection(),

          const SizedBox(height: 32),
          const Divider(),
          const SizedBox(height: 24),

          // 5. Small & Medium Size Variants
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
                const Icon(Icons.tune, color: Color(0xFF00C785)),
                const SizedBox(width: 8),
                Text(
                  'Interactive Playground',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
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
                color: _color == AfterpayColor.white
                    ? const Color(0xFF1E293B)
                    : const Color(0xFFF7F9FA),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Center(
                child: AfterpayButton(
                  onPressed: _enabled ? _handlePayPress : null,
                  isLoading: _isLoading,
                  enabled: _enabled,
                  color: _color,
                  shape: _shape,
                  brand: _brand,
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
                DropdownButton<AfterpayColor>(
                  value: _color,
                  items: AfterpayColor.values.map((c) {
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
                DropdownButton<AfterpayShape>(
                  value: _shape,
                  items: AfterpayShape.values.map((s) {
                    return DropdownMenuItem(
                      value: s,
                      child: Text('Shape: ${s.name}'),
                    );
                  }).toList(),
                  onChanged: (val) {
                    if (val != null) setState(() => _shape = val);
                  },
                ),

                // Brand Picker
                DropdownButton<AfterpayBrand>(
                  value: _brand,
                  items: AfterpayBrand.values.map((b) {
                    return DropdownMenuItem(
                      value: b,
                      child: Text('Brand: ${b.name}'),
                    );
                  }).toList(),
                  onChanged: (val) {
                    if (val != null) setState(() => _brand = val);
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
          'Color Schemes (Rounded & Pill)',
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          'Bondi Mint, Black, and White button themes.',
          style: TextStyle(color: Colors.grey.shade600),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: AfterpayColor.values.map((color) {
            return Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: color == AfterpayColor.white
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
                      color: color == AfterpayColor.white
                          ? Colors.white70
                          : Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),
                  AfterpayButton(
                    onPressed: _handlePayPress,
                    color: color,
                    shape: AfterpayShape.rounded,
                    text: 'Buy now with',
                  ),
                  const SizedBox(height: 10),
                  AfterpayButton(
                    onPressed: _handlePayPress,
                    color: color,
                    shape: AfterpayShape.pill,
                    text: 'Buy now with',
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildRegionalSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Regional Adaptations (Afterpay vs Clearpay)',
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          'Clearpay branding is used in the UK/EU market with identical visual styling.',
          style: TextStyle(color: Colors.grey.shade600),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16,
          runSpacing: 12,
          children: [
            AfterpayButton(
              onPressed: _handlePayPress,
              brand: AfterpayBrand.afterpay,
              text: 'Buy now with',
            ),
            AfterpayButton(
              onPressed: _handlePayPress,
              brand: AfterpayBrand.clearpay,
              text: 'Buy now with',
            ),
            AfterpayButton(
              onPressed: _handlePayPress,
              brand: AfterpayBrand.afterpay,
            ),
            AfterpayButton(
              onPressed: _handlePayPress,
              brand: AfterpayBrand.clearpay,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildLocalizedSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Custom Action Verbs',
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          'Phrases in English, German, French, and Spanish.',
          style: TextStyle(color: Colors.grey.shade600),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16,
          runSpacing: 12,
          children: [
            AfterpayButton(onPressed: _handlePayPress, text: 'Buy now with'),
            AfterpayButton(
              onPressed: _handlePayPress,
              text: 'Jetzt kaufen mit',
            ),
            AfterpayButton(onPressed: _handlePayPress, text: 'Payer avec'),
            AfterpayButton(onPressed: _handlePayPress, text: 'Comprar con'),
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
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          'Compact loop mark and medium badge size variations.',
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
                    'Medium (Badge only)',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                  const SizedBox(height: 8),
                  AfterpayButton(
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
                    'Small / Compact (Loop mark)',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                  const SizedBox(height: 8),
                  AfterpayButton(
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
