import 'package:flutter/material.dart';
import 'package:pay_buttons/pay_buttons.dart';

enum LatinChampion {
  pix('Pix', 'Brazil 🇧🇷'),
  oxxo('OXXO', 'Mexico 🇲🇽'),
  boleto('Boleto Bancário', 'Brazil 🇧🇷');

  const LatinChampion(this.title, this.country);
  final String title;
  final String country;
}

class LatinAmericaShowcasePage extends StatefulWidget {
  const LatinAmericaShowcasePage({
    super.key,
    this.initialChampion = LatinChampion.pix,
  });

  final LatinChampion initialChampion;

  @override
  State<LatinAmericaShowcasePage> createState() =>
      _LatinAmericaShowcasePageState();
}

class _LatinAmericaShowcasePageState extends State<LatinAmericaShowcasePage> {
  late LatinChampion _selectedChampion = widget.initialChampion;

  // Shared Playground State
  PayButtonVariant _variant = PayButtonVariant.responsive;
  PayButtonTextPosition _textPosition = PayButtonTextPosition.leading;
  bool _isLoading = false;
  bool _enabled = true;
  bool _fullWidth = false;
  double _height = 48.0;

  // Pix state
  PixColor _pixColor = PixColor.teal;
  PixShape _pixShape = PixShape.rounded;
  String? _pixText = 'Pagar com';

  // OXXO state
  OxxoColor _oxxoColor = OxxoColor.red;
  OxxoShape _oxxoShape = OxxoShape.rounded;
  String? _oxxoText = 'Pagar con';

  // Boleto state
  BoletoColor _boletoColor = BoletoColor.white;
  BoletoShape _boletoShape = BoletoShape.rounded;
  String? _boletoText = 'Pagar via';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Latin American Champions'),
        backgroundColor: const Color(0xFF00A859),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 24),
            _buildChampionSelector(),
            const SizedBox(height: 24),
            _buildInteractivePlayground(),
            const SizedBox(height: 36),
            _buildAllChampionsOverview(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF00A859).withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFF00A859).withValues(alpha: 0.2),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFF00A859),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
              child: Text(
                'LAT',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Latin American Market Leaders',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF00753E),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Official brand assets, vector typography, and styling for Pix, OXXO, and Boleto Bancário.',
                  style: TextStyle(color: Colors.grey.shade700, fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChampionSelector() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: LatinChampion.values.map((champ) {
          final isSelected = champ == _selectedChampion;
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ChoiceChip(
              label: Text('${champ.title} (${champ.country})'),
              selected: isSelected,
              selectedColor: const Color(0xFF00A859).withValues(alpha: 0.2),
              onSelected: (selected) {
                if (selected) {
                  setState(() => _selectedChampion = champ);
                }
              },
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildInteractivePlayground() {
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
                const Icon(Icons.tune, color: Color(0xFF00A859)),
                const SizedBox(width: 8),
                Text(
                  '${_selectedChampion.title} Playground',
                  style: Theme.of(context).textTheme.titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Customize parameters in real-time for ${_selectedChampion.title} (${_selectedChampion.country}).',
              style: TextStyle(color: Colors.grey.shade600),
            ),
            const SizedBox(height: 24),

            // Live Preview Box
            Center(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 36,
                  horizontal: 20,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Center(
                  child: SizedBox(
                    width: _fullWidth ? double.infinity : null,
                    child: _buildSelectedButton(),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Controls
            _buildPlaygroundControls(),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectedButton() {
    switch (_selectedChampion) {
      case LatinChampion.pix:
        return PixButton(
          onPressed: _enabled ? () => _handlePayPress('Pix') : null,
          color: _pixColor,
          shape: _pixShape,
          text: _pixText,
          height: _height,
          isLoading: _isLoading,
          enabled: _enabled,
          variant: _variant,
          textPosition: _textPosition,
        );
      case LatinChampion.oxxo:
        return OxxoButton(
          onPressed: _enabled ? () => _handlePayPress('OXXO') : null,
          color: _oxxoColor,
          shape: _oxxoShape,
          text: _oxxoText,
          height: _height,
          isLoading: _isLoading,
          enabled: _enabled,
          variant: _variant,
          textPosition: _textPosition,
        );
      case LatinChampion.boleto:
        return BoletoButton(
          onPressed: _enabled ? () => _handlePayPress('Boleto') : null,
          color: _boletoColor,
          shape: _boletoShape,
          text: _boletoText,
          height: _height,
          isLoading: _isLoading,
          enabled: _enabled,
          variant: _variant,
          textPosition: _textPosition,
        );
    }
  }

  Widget _buildPlaygroundControls() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        const SizedBox(height: 12),
        const Text(
          'Specific Parameters',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 12),
        _buildChampionSpecificControls(),
        const SizedBox(height: 16),
        const Divider(),
        const SizedBox(height: 12),
        const Text(
          'Common Layout Parameters',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 12),

        // Variant selector
        DropdownButtonFormField<PayButtonVariant>(
          initialValue: _variant,
          decoration: const InputDecoration(
            labelText: 'Variant',
            border: OutlineInputBorder(),
          ),
          items: PayButtonVariant.values.map((v) {
            return DropdownMenuItem(value: v, child: Text(v.name));
          }).toList(),
          onChanged: (val) {
            if (val != null) setState(() => _variant = val);
          },
        ),
        const SizedBox(height: 12),

        // Text Position selector
        DropdownButtonFormField<PayButtonTextPosition>(
          initialValue: _textPosition,
          decoration: const InputDecoration(
            labelText: 'Text Position',
            border: OutlineInputBorder(),
          ),
          items: PayButtonTextPosition.values.map((pos) {
            return DropdownMenuItem(value: pos, child: Text(pos.name));
          }).toList(),
          onChanged: (val) {
            if (val != null) setState(() => _textPosition = val);
          },
        ),

        const SizedBox(height: 16),

        // Sliders & Toggles
        Text('Height: ${_height.toStringAsFixed(0)} dp'),
        Slider(
          value: _height,
          min: 36,
          max: 64,
          divisions: 28,
          onChanged: (val) => setState(() => _height = val),
        ),

        SwitchListTile(
          title: const Text('Full Width'),
          value: _fullWidth,
          onChanged: (val) => setState(() => _fullWidth = val),
        ),
        SwitchListTile(
          title: const Text('Loading Indicator'),
          value: _isLoading,
          onChanged: (val) => setState(() => _isLoading = val),
        ),
        SwitchListTile(
          title: const Text('Enabled'),
          value: _enabled,
          onChanged: (val) => setState(() => _enabled = val),
        ),
      ],
    );
  }

  Widget _buildChampionSpecificControls() {
    switch (_selectedChampion) {
      case LatinChampion.pix:
        return Column(
          children: [
            DropdownButtonFormField<PixColor>(
              initialValue: _pixColor,
              decoration: const InputDecoration(
                labelText: 'Color Theme',
                border: OutlineInputBorder(),
              ),
              items: PixColor.values.map((c) {
                return DropdownMenuItem(value: c, child: Text(c.name));
              }).toList(),
              onChanged: (val) {
                if (val != null) setState(() => _pixColor = val);
              },
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<PixShape>(
              initialValue: _pixShape,
              decoration: const InputDecoration(
                labelText: 'Shape',
                border: OutlineInputBorder(),
              ),
              items: PixShape.values.map((s) {
                return DropdownMenuItem(value: s, child: Text(s.name));
              }).toList(),
              onChanged: (val) {
                if (val != null) setState(() => _pixShape = val);
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              initialValue: _pixText,
              decoration: const InputDecoration(
                labelText: 'Button Text (Empty for Logo-Only)',
                border: OutlineInputBorder(),
              ),
              onChanged: (val) => setState(() => _pixText = val),
            ),
          ],
        );
      case LatinChampion.oxxo:
        return Column(
          children: [
            DropdownButtonFormField<OxxoColor>(
              initialValue: _oxxoColor,
              decoration: const InputDecoration(
                labelText: 'Color Theme',
                border: OutlineInputBorder(),
              ),
              items: OxxoColor.values.map((c) {
                return DropdownMenuItem(value: c, child: Text(c.name));
              }).toList(),
              onChanged: (val) {
                if (val != null) setState(() => _oxxoColor = val);
              },
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<OxxoShape>(
              initialValue: _oxxoShape,
              decoration: const InputDecoration(
                labelText: 'Shape',
                border: OutlineInputBorder(),
              ),
              items: OxxoShape.values.map((s) {
                return DropdownMenuItem(value: s, child: Text(s.name));
              }).toList(),
              onChanged: (val) {
                if (val != null) setState(() => _oxxoShape = val);
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              initialValue: _oxxoText,
              decoration: const InputDecoration(
                labelText: 'Button Text (Empty for Logo-Only)',
                border: OutlineInputBorder(),
              ),
              onChanged: (val) => setState(() => _oxxoText = val),
            ),
          ],
        );
      case LatinChampion.boleto:
        return Column(
          children: [
            DropdownButtonFormField<BoletoColor>(
              initialValue: _boletoColor,
              decoration: const InputDecoration(
                labelText: 'Color Theme',
                border: OutlineInputBorder(),
              ),
              items: BoletoColor.values.map((c) {
                return DropdownMenuItem(value: c, child: Text(c.name));
              }).toList(),
              onChanged: (val) {
                if (val != null) setState(() => _boletoColor = val);
              },
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<BoletoShape>(
              initialValue: _boletoShape,
              decoration: const InputDecoration(
                labelText: 'Shape',
                border: OutlineInputBorder(),
              ),
              items: BoletoShape.values.map((s) {
                return DropdownMenuItem(value: s, child: Text(s.name));
              }).toList(),
              onChanged: (val) {
                if (val != null) setState(() => _boletoShape = val);
              },
            ),

            const SizedBox(height: 12),
            TextFormField(
              initialValue: _boletoText,
              decoration: const InputDecoration(
                labelText: 'Button Text (Empty for Logo-Only)',
                border: OutlineInputBorder(),
              ),
              onChanged: (val) => setState(() => _boletoText = val),
            ),
          ],
        );
    }
  }

  Widget _buildAllChampionsOverview() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Latin American Quick Checkout Stack',
              style: Theme.of(context).textTheme.titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Sample checkout presentation showing all Latin payment buttons in a single responsive vertical stack.',
              style: TextStyle(color: Colors.grey.shade600),
            ),
            const SizedBox(height: 24),
            Column(
              children: [
                PixButton(
                  text: 'Pagar com',
                  onPressed: () => _handlePayPress('Pix'),
                ),
                const SizedBox(height: 12),
                OxxoButton(
                  text: 'Pagar con',
                  onPressed: () => _handlePayPress('OXXO'),
                ),
                const SizedBox(height: 12),
                BoletoButton(
                  text: 'Pagar via',
                  onPressed: () => _handlePayPress('Boleto Bancário'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _handlePayPress(String name) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$name button pressed!'),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}
