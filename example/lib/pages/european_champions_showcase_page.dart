import 'package:flutter/material.dart';
import 'package:pay_buttons/pay_buttons.dart';

enum RegionalChampion {
  wero('Wero', 'Europe 🇪🇺'),
  twint('TWINT', 'Switzerland 🇨🇭'),
  blik('BLIK', 'Poland 🇵🇱'),
  ideal('iDEAL', 'Netherlands 🇳🇱'),
  bancontact('Bancontact', 'Belgium 🇧🇪'),
  bizum('Bizum', 'Spain 🇪🇸');

  const RegionalChampion(this.title, this.country);
  final String title;
  final String country;
}

class EuropeanChampionsShowcasePage extends StatefulWidget {
  const EuropeanChampionsShowcasePage({
    super.key,
    this.initialChampion = RegionalChampion.wero,
  });

  final RegionalChampion initialChampion;

  @override
  State<EuropeanChampionsShowcasePage> createState() =>
      _EuropeanChampionsShowcasePageState();
}

class _EuropeanChampionsShowcasePageState
    extends State<EuropeanChampionsShowcasePage> {
  late RegionalChampion _selectedChampion = widget.initialChampion;

  // Shared Playground State
  PayButtonVariant _variant = PayButtonVariant.responsive;
  PayButtonTextPosition _textPosition = PayButtonTextPosition.leading;
  bool _isLoading = false;
  bool _enabled = true;
  bool _fullWidth = false;
  double _height = 48.0;

  // Wero state
  WeroColor _weroColor = WeroColor.yellow;
  WeroShape _weroShape = WeroShape.rounded;
  String? _weroText = 'Pay with';

  // TWINT state
  TwintColor _twintColor = TwintColor.black;
  TwintShape _twintShape = TwintShape.rounded;
  String? _twintText = 'Bezahlen mit';

  // iDEAL state
  IdealColor _idealColor = IdealColor.white;
  IdealShape _idealShape = IdealShape.rounded;
  String? _idealText = 'Betaal met';

  // BLIK state
  BlikColor _blikColor = BlikColor.black;
  BlikShape _blikShape = BlikShape.rounded;
  String? _blikText = 'Zapłać z';

  // Bancontact state
  BancontactColor _bancontactColor = BancontactColor.white;
  BancontactShape _bancontactShape = BancontactShape.rounded;
  String? _bancontactText = 'Betaal met';

  // Bizum state
  BizumColor _bizumColor = BizumColor.white;
  BizumShape _bizumShape = BizumShape.rounded;
  String? _bizumText = 'Pagar con';

  late final TextEditingController _weroTextController;
  late final TextEditingController _twintTextController;
  late final TextEditingController _idealTextController;
  late final TextEditingController _blikTextController;
  late final TextEditingController _bancontactTextController;
  late final TextEditingController _bizumTextController;

  @override
  void initState() {
    super.initState();
    _weroTextController = TextEditingController(text: _weroText);
    _twintTextController = TextEditingController(text: _twintText);
    _idealTextController = TextEditingController(text: _idealText);
    _blikTextController = TextEditingController(text: _blikText);
    _bancontactTextController = TextEditingController(text: _bancontactText);
    _bizumTextController = TextEditingController(text: _bizumText);
  }

  @override
  void dispose() {
    _weroTextController.dispose();
    _twintTextController.dispose();
    _idealTextController.dispose();
    _blikTextController.dispose();
    _bancontactTextController.dispose();
    _bizumTextController.dispose();
    super.dispose();
  }

  void _handlePayPress(String name) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$name payment action triggered!'),
        backgroundColor: const Color(0xFF1E293B),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('European Regional Champions')),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          _buildQuickOverviewSection(),
          const SizedBox(height: 28),
          const Divider(),
          const SizedBox(height: 20),
          _buildChampionSelector(),
          const SizedBox(height: 20),
          _buildInteractivePlayground(),
          const SizedBox(height: 32),
          const Divider(),
          const SizedBox(height: 24),
          _buildGallerySection(),
        ],
      ),
    );
  }

  Widget _buildQuickOverviewSection() {
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
                const Icon(Icons.public, color: Color(0xFF003399)),
                const SizedBox(width: 8),
                Text(
                  'Top European Payment Methods',
                  style: Theme.of(context).textTheme.titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Hyper-local payment systems dominating e-commerce checkout across European national markets.',
              style: TextStyle(color: Colors.grey.shade600),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                WeroButton(
                  text: 'Pay with',
                  onPressed: () => _handlePayPress('Wero'),
                ),
                TwintButton(
                  text: 'Bezahlen mit',
                  onPressed: () => _handlePayPress('TWINT'),
                ),
                BlikButton(
                  text: 'Zapłać z',
                  onPressed: () => _handlePayPress('BLIK'),
                ),
                IdealButton(
                  text: 'Betaal met',
                  onPressed: () => _handlePayPress('iDEAL'),
                ),
                BancontactButton(
                  text: 'Betaal met',
                  onPressed: () => _handlePayPress('Bancontact'),
                ),
                BizumButton(
                  text: 'Pagar con',
                  onPressed: () => _handlePayPress('Bizum'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChampionSelector() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: RegionalChampion.values.map((champ) {
          final isSelected = champ == _selectedChampion;
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ChoiceChip(
              label: Text('${champ.title} (${champ.country})'),
              selected: isSelected,
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
                const Icon(Icons.tune, color: Color(0xFF003399)),
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

            // Live Preview
            Container(
              padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 16),
              decoration: BoxDecoration(
                color: _resolvePreviewBackground(),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Center(child: _buildSelectedButton()),
            ),
            const SizedBox(height: 24),

            // Specific options for selected champion
            ..._buildChampionControls(),

            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 16),

            // Common Controls
            Text(
              'Common Controls',
              style: Theme.of(context).textTheme.titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _buildDropdown<PayButtonVariant>(
              label: 'Variant',
              value: _variant,
              items: PayButtonVariant.values,
              onChanged: (v) => setState(() => _variant = v!),
            ),
            const SizedBox(height: 8),
            _buildDropdown<PayButtonTextPosition>(
              label: 'Text Pos',
              value: _textPosition,
              items: PayButtonTextPosition.values,
              onChanged: (p) => setState(() => _textPosition = p!),
            ),
            const SizedBox(height: 12),
            SwitchListTile(
              title: const Text('Is Loading State'),
              subtitle: const Text('Shows indeterminate progress indicator'),
              value: _isLoading,
              onChanged: (val) => setState(() => _isLoading = val),
            ),
            SwitchListTile(
              title: const Text('Enabled State'),
              subtitle: const Text('Toggles button interactivity and opacity'),
              value: _enabled,
              onChanged: (val) => setState(() => _enabled = val),
            ),
            SwitchListTile(
              title: const Text('Full Width'),
              subtitle: const Text(
                'Expands button to fill available horizontal space',
              ),
              value: _fullWidth,
              onChanged: (val) => setState(() => _fullWidth = val),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Row(
                children: [
                  Text('Height: ${_height.toStringAsFixed(0)} dp'),
                  Expanded(
                    child: Slider(
                      min: 36.0,
                      max: 64.0,
                      divisions: 7,
                      value: _height,
                      onChanged: (val) => setState(() => _height = val),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _resolvePreviewBackground() {
    switch (_selectedChampion) {
      case RegionalChampion.wero:
        return _weroColor == WeroColor.black
            ? const Color(0xFF1E293B)
            : const Color(0xFFF8FAFC);
      case RegionalChampion.twint:
        return _twintColor == TwintColor.white
            ? const Color(0xFF1E293B)
            : const Color(0xFFF8FAFC);
      case RegionalChampion.ideal:
        return _idealColor == IdealColor.white
            ? const Color(0xFFF8FAFC)
            : const Color(0xFFF8FAFC);
      case RegionalChampion.blik:
        return _blikColor == BlikColor.white
            ? const Color(0xFF1E293B)
            : const Color(0xFFF8FAFC);
      case RegionalChampion.bancontact:
        return _bancontactColor == BancontactColor.white
            ? const Color(0xFFF8FAFC)
            : const Color(0xFF1E293B);
      case RegionalChampion.bizum:
        return _bizumColor == BizumColor.white
            ? const Color(0xFFF8FAFC)
            : const Color(0xFFF8FAFC);
    }
  }

  Widget _buildSelectedButton() {
    final width = _fullWidth ? double.infinity : null;
    void onPressed() => _handlePayPress(_selectedChampion.title);

    switch (_selectedChampion) {
      case RegionalChampion.wero:
        return WeroButton(
          onPressed: onPressed,
          color: _weroColor,
          shape: _weroShape,
          text: _weroText,
          variant: _variant,
          textPosition: _textPosition,
          isLoading: _isLoading,
          enabled: _enabled,
          width: width,
          height: _height,
        );
      case RegionalChampion.twint:
        return TwintButton(
          onPressed: onPressed,
          color: _twintColor,
          shape: _twintShape,
          text: _twintText,
          variant: _variant,
          textPosition: _textPosition,
          isLoading: _isLoading,
          enabled: _enabled,
          width: width,
          height: _height,
        );
      case RegionalChampion.ideal:
        return IdealButton(
          onPressed: onPressed,
          color: _idealColor,
          shape: _idealShape,
          text: _idealText,
          variant: _variant,
          textPosition: _textPosition,
          isLoading: _isLoading,
          enabled: _enabled,
          width: width,
          height: _height,
        );
      case RegionalChampion.blik:
        return BlikButton(
          onPressed: onPressed,
          color: _blikColor,
          shape: _blikShape,
          text: _blikText,
          variant: _variant,
          textPosition: _textPosition,
          isLoading: _isLoading,
          enabled: _enabled,
          width: width,
          height: _height,
        );
      case RegionalChampion.bancontact:
        return BancontactButton(
          onPressed: onPressed,
          color: _bancontactColor,
          shape: _bancontactShape,
          text: _bancontactText,
          variant: _variant,
          textPosition: _textPosition,
          isLoading: _isLoading,
          enabled: _enabled,
          width: width,
          height: _height,
        );
      case RegionalChampion.bizum:
        return BizumButton(
          onPressed: onPressed,
          color: _bizumColor,
          shape: _bizumShape,
          text: _bizumText,
          variant: _variant,
          textPosition: _textPosition,
          isLoading: _isLoading,
          enabled: _enabled,
          width: width,
          height: _height,
        );
    }
  }

  List<Widget> _buildChampionControls() {
    switch (_selectedChampion) {
      case RegionalChampion.wero:
        return [
          _buildDropdown<WeroColor>(
            label: 'Color Palette',
            value: _weroColor,
            items: WeroColor.values,
            onChanged: (c) => setState(() => _weroColor = c!),
          ),
          const SizedBox(height: 12),
          _buildDropdown<WeroShape>(
            label: 'Shape',
            value: _weroShape,
            items: WeroShape.values,
            onChanged: (s) => setState(() => _weroShape = s!),
          ),
          const SizedBox(height: 12),
          _buildTextInput(
            'Custom Text',
            _weroTextController,
            (t) => setState(() => _weroText = t),
          ),
        ];

      case RegionalChampion.twint:
        return [
          _buildDropdown<TwintColor>(
            label: 'Color Palette',
            value: _twintColor,
            items: TwintColor.values,
            onChanged: (c) => setState(() => _twintColor = c!),
          ),
          const SizedBox(height: 12),
          _buildDropdown<TwintShape>(
            label: 'Shape',
            value: _twintShape,
            items: TwintShape.values,
            onChanged: (s) => setState(() => _twintShape = s!),
          ),
          const SizedBox(height: 12),
          _buildTextInput(
            'Custom Text',
            _twintTextController,
            (t) => setState(() => _twintText = t),
          ),
        ];

      case RegionalChampion.ideal:
        return [
          _buildDropdown<IdealColor>(
            label: 'Color Palette',
            value: _idealColor,
            items: IdealColor.values,
            onChanged: (c) => setState(() => _idealColor = c!),
          ),
          const SizedBox(height: 12),
          _buildDropdown<IdealShape>(
            label: 'Shape',
            value: _idealShape,
            items: IdealShape.values,
            onChanged: (s) => setState(() => _idealShape = s!),
          ),
          const SizedBox(height: 12),
          _buildTextInput(
            'Custom Text',
            _idealTextController,
            (t) => setState(() => _idealText = t),
          ),
        ];

      case RegionalChampion.blik:
        return [
          _buildDropdown<BlikColor>(
            label: 'Color Palette',
            value: _blikColor,
            items: BlikColor.values,
            onChanged: (c) => setState(() => _blikColor = c!),
          ),
          const SizedBox(height: 12),
          _buildDropdown<BlikShape>(
            label: 'Shape',
            value: _blikShape,
            items: BlikShape.values,
            onChanged: (s) => setState(() => _blikShape = s!),
          ),
          const SizedBox(height: 12),
          _buildTextInput(
            'Custom Text',
            _blikTextController,
            (t) => setState(() => _blikText = t),
          ),
        ];

      case RegionalChampion.bancontact:
        return [
          _buildDropdown<BancontactColor>(
            label: 'Color Palette',
            value: _bancontactColor,
            items: BancontactColor.values,
            onChanged: (c) => setState(() => _bancontactColor = c!),
          ),
          const SizedBox(height: 12),
          _buildDropdown<BancontactShape>(
            label: 'Shape',
            value: _bancontactShape,
            items: BancontactShape.values,
            onChanged: (s) => setState(() => _bancontactShape = s!),
          ),
          const SizedBox(height: 12),
          _buildTextInput(
            'Custom Text',
            _bancontactTextController,
            (t) => setState(() => _bancontactText = t),
          ),
        ];

      case RegionalChampion.bizum:
        return [
          _buildDropdown<BizumColor>(
            label: 'Color Palette',
            value: _bizumColor,
            items: BizumColor.values,
            onChanged: (c) => setState(() => _bizumColor = c!),
          ),
          const SizedBox(height: 12),
          _buildDropdown<BizumShape>(
            label: 'Shape',
            value: _bizumShape,
            items: BizumShape.values,
            onChanged: (s) => setState(() => _bizumShape = s!),
          ),
          const SizedBox(height: 12),
          _buildTextInput(
            'Custom Text',
            _bizumTextController,
            (t) => setState(() => _bizumText = t),
          ),
        ];
    }
  }

  Widget _buildTextInput(
    String label,
    TextEditingController controller,
    ValueChanged<String?> onChanged,
  ) {
    return Row(
      children: [
        SizedBox(
          width: 140,
          child: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
        Expanded(
          child: TextField(
            decoration: const InputDecoration(
              hintText: 'Leave empty for logo only',
              isDense: true,
            ),
            controller: controller,
            onChanged: (val) => onChanged(val.isEmpty ? null : val),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdown<T>({
    required String label,
    required T value,
    required List<T> items,
    required ValueChanged<T?> onChanged,
  }) {
    return Row(
      children: [
        SizedBox(
          width: 140,
          child: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
        Expanded(
          child: DropdownButton<T>(
            value: value,
            isExpanded: true,
            underline: Container(height: 1, color: Colors.grey.shade400),
            items: items.map((T item) {
              final text = item is Enum ? item.name : item.toString();
              return DropdownMenuItem<T>(value: item, child: Text(text));
            }).toList(),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }

  Widget _buildGallerySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${_selectedChampion.title} Gallery',
          style: Theme.of(context).textTheme.titleLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          'Visual matrix across available styles and shapes.',
          style: TextStyle(color: Colors.grey.shade600),
        ),
        const SizedBox(height: 16),
        _buildChampionGallery(),
      ],
    );
  }

  Widget _buildChampionGallery() {
    switch (_selectedChampion) {
      case RegionalChampion.wero:
        return Column(
          children: [
            for (final color in WeroColor.values)
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: color == WeroColor.black
                        ? const Color(0xFF1E293B)
                        : const Color(0xFFF8FAFC),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: [
                      WeroButton(
                        color: color,
                        shape: WeroShape.rounded,
                        text: 'Pay with',
                        onPressed: () {},
                      ),
                      WeroButton(
                        color: color,
                        shape: WeroShape.pill,
                        text: 'Pay with',
                        onPressed: () {},
                      ),
                      WeroButton(color: color, onPressed: () {}),
                    ],
                  ),
                ),
              ),
          ],
        );

      case RegionalChampion.twint:
        return Column(
          children: [
            for (final color in TwintColor.values)
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: color == TwintColor.white
                        ? const Color(0xFF1E293B)
                        : const Color(0xFFF8FAFC),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: [
                      TwintButton(
                        color: color,
                        shape: TwintShape.rounded,
                        text: 'Bezahlen mit',
                        onPressed: () {},
                      ),
                      TwintButton(
                        color: color,
                        shape: TwintShape.pill,
                        text: 'Bezahlen mit',
                        onPressed: () {},
                      ),
                      TwintButton(color: color, onPressed: () {}),
                    ],
                  ),
                ),
              ),
          ],
        );

      case RegionalChampion.ideal:
        return Column(
          children: [
            for (final color in IdealColor.values)
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8FAFC),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: [
                      IdealButton(
                        color: color,
                        shape: IdealShape.rounded,
                        text: 'Betaal met',
                        onPressed: () {},
                      ),
                      IdealButton(
                        color: color,
                        shape: IdealShape.pill,
                        text: 'Betaal met',
                        onPressed: () {},
                      ),
                      IdealButton(color: color, onPressed: () {}),
                    ],
                  ),
                ),
              ),
          ],
        );

      case RegionalChampion.blik:
        return Column(
          children: [
            for (final color in BlikColor.values)
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: color == BlikColor.white
                        ? const Color(0xFF1E293B)
                        : const Color(0xFFF8FAFC),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: [
                      BlikButton(
                        color: color,
                        shape: BlikShape.rounded,
                        text: 'Zapłać z',
                        onPressed: () {},
                      ),
                      BlikButton(
                        color: color,
                        shape: BlikShape.pill,
                        text: 'Zapłać z',
                        onPressed: () {},
                      ),
                      BlikButton(color: color, onPressed: () {}),
                    ],
                  ),
                ),
              ),
          ],
        );

      case RegionalChampion.bancontact:
        return Column(
          children: [
            for (final color in BancontactColor.values)
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: color == BancontactColor.white
                        ? const Color(0xFFF8FAFC)
                        : const Color(0xFF1E293B),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: [
                      BancontactButton(
                        color: color,
                        shape: BancontactShape.rounded,
                        text: 'Betaal met',
                        onPressed: () {},
                      ),
                      BancontactButton(
                        color: color,
                        shape: BancontactShape.pill,
                        text: 'Betaal met',
                        onPressed: () {},
                      ),
                      BancontactButton(color: color, onPressed: () {}),
                    ],
                  ),
                ),
              ),
          ],
        );

      case RegionalChampion.bizum:
        return Column(
          children: [
            for (final color in BizumColor.values)
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8FAFC),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: [
                      BizumButton(
                        color: color,
                        shape: BizumShape.rounded,
                        text: 'Pagar con',
                        onPressed: () {},
                      ),
                      BizumButton(
                        color: color,
                        shape: BizumShape.pill,
                        text: 'Pagar con',
                        onPressed: () {},
                      ),
                      BizumButton(color: color, onPressed: () {}),
                    ],
                  ),
                ),
              ),
          ],
        );
    }
  }
}
