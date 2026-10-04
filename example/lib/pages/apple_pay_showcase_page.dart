import 'package:flutter/material.dart';
import 'package:pay_buttons/pay_buttons.dart';

class ApplePayShowcasePage extends StatefulWidget {
  const ApplePayShowcasePage({super.key});

  @override
  State<ApplePayShowcasePage> createState() => _ApplePayShowcasePageState();
}

class _ApplePayShowcasePageState extends State<ApplePayShowcasePage> {
  // Playground state
  ApplePayColor _color = ApplePayColor.black;
  ApplePayShape _shape = ApplePayShape.rounded;
  String? _text;
  bool _logoFirst = false;
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
          'Apple Pay button triggered (${_color.name}, ${_shape.name})',
        ),
        backgroundColor: const Color(0xFF1E293B),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Apple Pay Showcase')),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          _buildPlaygroundSection(),
          const SizedBox(height: 32),
          const Divider(),
          const SizedBox(height: 24),
          _buildGallerySection(),
          const SizedBox(height: 32),
          const Divider(),
          const SizedBox(height: 24),
          _buildActionVerbsSection(),
        ],
      ),
    );
  }

  Widget _buildPlaygroundSection() {
    final isWhiteTheme =
        _color == ApplePayColor.white || _color == ApplePayColor.whiteOutline;

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
              'Customize parameters in real-time and observe Apple Pay HIG behavior.',
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
                child: ApplePayButton(
                  onPressed: _enabled ? _handlePayPress : null,
                  isLoading: _isLoading,
                  enabled: _enabled,
                  color: _color,
                  shape: _shape,
                  text: _text,
                  logoFirst: _logoFirst,
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

                // Custom Text Input
                SizedBox(
                  width: 200,
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'Text prefix (e.g. Buy with)',
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
              spacing: 16,
              runSpacing: 8,
              children: [
                FilterChip(
                  label: const Text('Logo First'),
                  selected: _logoFirst,
                  onSelected: (val) => setState(() => _logoFirst = val),
                ),
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

            const SizedBox(height: 20),

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
                    min: 40.0,
                    max: 64.0,
                    divisions: 12,
                    label: '${_height.toInt()} dp',
                    onChanged: (val) => setState(() => _height = val),
                  ),
                ),
              ],
            ),

            // Elevation Slider
            Row(
              children: [
                SizedBox(
                  width: 90,
                  child: Text('Elevation: ${_elevation.toInt()}'),
                ),
                Expanded(
                  child: Slider(
                    value: _elevation,
                    min: 0.0,
                    max: 8.0,
                    divisions: 8,
                    label: '${_elevation.toInt()}',
                    onChanged: (val) => setState(() => _elevation = val),
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
          'Brand Colors & Contour Shapes',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 8),
        Text(
          'Apple Pay buttons with standard colors, outline styling, and contour shapes.',
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
                label: 'Black Rounded (HIG Default)',
                button: ApplePayButton(
                  color: ApplePayColor.black,
                  shape: ApplePayShape.rounded,
                  onPressed: _handlePayPress,
                ),
              ),
              _buildGalleryItem(
                label: 'White Rounded',
                button: ApplePayButton(
                  color: ApplePayColor.white,
                  shape: ApplePayShape.rounded,
                  onPressed: _handlePayPress,
                ),
              ),
              _buildGalleryItem(
                label: 'White Outline Rounded',
                button: ApplePayButton(
                  color: ApplePayColor.whiteOutline,
                  shape: ApplePayShape.rounded,
                  onPressed: _handlePayPress,
                ),
              ),
              _buildGalleryItem(
                label: 'Black Pill',
                button: ApplePayButton(
                  color: ApplePayColor.black,
                  shape: ApplePayShape.pill,
                  onPressed: _handlePayPress,
                ),
              ),
              _buildGalleryItem(
                label: 'White Pill',
                button: ApplePayButton(
                  color: ApplePayColor.white,
                  shape: ApplePayShape.pill,
                  onPressed: _handlePayPress,
                ),
              ),
              _buildGalleryItem(
                label: 'White Outline Pill',
                button: ApplePayButton(
                  color: ApplePayColor.whiteOutline,
                  shape: ApplePayShape.pill,
                  onPressed: _handlePayPress,
                ),
              ),
              _buildGalleryItem(
                label: 'Black Rect',
                button: ApplePayButton(
                  color: ApplePayColor.black,
                  shape: ApplePayShape.rect,
                  onPressed: _handlePayPress,
                ),
              ),
              _buildGalleryItem(
                label: 'White Rect',
                button: ApplePayButton(
                  color: ApplePayColor.white,
                  shape: ApplePayShape.rect,
                  onPressed: _handlePayPress,
                ),
              ),
              _buildGalleryItem(
                label: 'White Outline Rect',
                button: ApplePayButton(
                  color: ApplePayColor.whiteOutline,
                  shape: ApplePayShape.rect,
                  onPressed: _handlePayPress,
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

  Widget _buildActionVerbsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Approved Action Callouts',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 8),
        Text(
          'Official phrases supported by Apple Pay Human Interface Guidelines.',
          style: TextStyle(color: Colors.grey.shade600),
        ),
        const SizedBox(height: 16),
        Center(
          child: Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: [
              ApplePayButton(
                text: 'Buy with',
                color: ApplePayColor.black,
                onPressed: _handlePayPress,
              ),
              ApplePayButton(
                text: 'Check out with',
                color: ApplePayColor.whiteOutline,
                onPressed: _handlePayPress,
              ),
              ApplePayButton(
                text: 'Pay with',
                color: ApplePayColor.black,
                onPressed: _handlePayPress,
              ),
              ApplePayButton(
                text: 'Donate with',
                color: ApplePayColor.whiteOutline,
                onPressed: _handlePayPress,
              ),
              ApplePayButton(
                text: 'Subscribe with',
                color: ApplePayColor.black,
                onPressed: _handlePayPress,
              ),
              ApplePayButton(
                text: 'Top Up with',
                color: ApplePayColor.whiteOutline,
                onPressed: _handlePayPress,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
