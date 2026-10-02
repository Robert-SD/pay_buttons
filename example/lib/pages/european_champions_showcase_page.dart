import 'package:flutter/material.dart';
import 'package:pay_buttons/pay_buttons.dart';

enum RegionalChampion {
  twint('TWINT', 'Switzerland 🇨🇭'),
  ideal('iDEAL', 'Netherlands 🇳🇱'),
  blik('BLIK', 'Poland 🇵🇱'),
  bancontact('Bancontact', 'Belgium 🇧🇪'),
  bizum('Bizum', 'Spain 🇪🇸');

  const RegionalChampion(this.title, this.country);
  final String title;
  final String country;
}

class EuropeanChampionsShowcasePage extends StatefulWidget {
  const EuropeanChampionsShowcasePage({super.key});

  @override
  State<EuropeanChampionsShowcasePage> createState() =>
      _EuropeanChampionsShowcasePageState();
}

class _EuropeanChampionsShowcasePageState
    extends State<EuropeanChampionsShowcasePage> {
  RegionalChampion _selectedChampion = RegionalChampion.twint;

  // Shared Playground State
  bool _isLoading = false;
  bool _enabled = true;
  bool _fullWidth = false;
  double _height = 48.0;

  // TWINT state
  TwintColor _twintColor = TwintColor.black;
  TwintShape _twintShape = TwintShape.rounded;
  TwintButtonType _twintType = TwintButtonType.payWith;
  String _twintLocale = 'de';

  // iDEAL state
  IdealColor _idealColor = IdealColor.white;
  IdealShape _idealShape = IdealShape.rounded;
  IdealButtonType _idealType = IdealButtonType.payWith;
  String _idealLocale = 'nl';

  // BLIK state
  BlikColor _blikColor = BlikColor.black;
  BlikShape _blikShape = BlikShape.rounded;
  BlikButtonType _blikType = BlikButtonType.payWith;
  String _blikLocale = 'pl';

  // Bancontact state
  BancontactColor _bancontactColor = BancontactColor.white;
  BancontactShape _bancontactShape = BancontactShape.rounded;
  BancontactButtonType _bancontactType = BancontactButtonType.payWith;
  String _bancontactLocale = 'nl';

  // Bizum state
  BizumColor _bizumColor = BizumColor.white;
  BizumShape _bizumShape = BizumShape.rounded;
  BizumButtonType _bizumType = BizumButtonType.payWith;
  String _bizumLocale = 'es';

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
      appBar: AppBar(
        title: const Text('European Regional Champions'),
      ),
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
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
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
                TwintButton(
                  locale: const Locale('de'),
                  onPressed: () => _handlePayPress('TWINT'),
                ),
                IdealButton(
                  locale: const Locale('nl'),
                  onPressed: () => _handlePayPress('iDEAL'),
                ),
                BlikButton(
                  locale: const Locale('pl'),
                  onPressed: () => _handlePayPress('BLIK'),
                ),
                BancontactButton(
                  locale: const Locale('nl'),
                  onPressed: () => _handlePayPress('Bancontact'),
                ),
                BizumButton(
                  locale: const Locale('es'),
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
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
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
              child: Center(
                child: _buildSelectedButton(),
              ),
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
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
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
              subtitle: const Text('Expands button to fill available horizontal space'),
              value: _fullWidth,
              onChanged: (val) => setState(() => _fullWidth = val),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
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
      case RegionalChampion.twint:
        return TwintButton(
          onPressed: onPressed,
          color: _twintColor,
          shape: _twintShape,
          type: _twintType,
          locale: Locale(_twintLocale),
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
          type: _idealType,
          locale: Locale(_idealLocale),
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
          type: _blikType,
          locale: Locale(_blikLocale),
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
          type: _bancontactType,
          locale: Locale(_bancontactLocale),
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
          type: _bizumType,
          locale: Locale(_bizumLocale),
          isLoading: _isLoading,
          enabled: _enabled,
          width: width,
          height: _height,
        );
    }
  }

  List<Widget> _buildChampionControls() {
    switch (_selectedChampion) {
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
          _buildDropdown<TwintButtonType>(
            label: 'Button Type',
            value: _twintType,
            items: TwintButtonType.values,
            onChanged: (t) => setState(() => _twintType = t!),
          ),
          const SizedBox(height: 12),
          _buildDropdown<String>(
            label: 'Locale / Language',
            value: _twintLocale,
            items: const ['de', 'fr', 'it', 'en'],
            onChanged: (l) => setState(() => _twintLocale = l!),
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
          _buildDropdown<IdealButtonType>(
            label: 'Button Type',
            value: _idealType,
            items: IdealButtonType.values,
            onChanged: (t) => setState(() => _idealType = t!),
          ),
          const SizedBox(height: 12),
          _buildDropdown<String>(
            label: 'Locale / Language',
            value: _idealLocale,
            items: const ['nl', 'en', 'de', 'fr'],
            onChanged: (l) => setState(() => _idealLocale = l!),
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
          _buildDropdown<BlikButtonType>(
            label: 'Button Type',
            value: _blikType,
            items: BlikButtonType.values,
            onChanged: (t) => setState(() => _blikType = t!),
          ),
          const SizedBox(height: 12),
          _buildDropdown<String>(
            label: 'Locale / Language',
            value: _blikLocale,
            items: const ['pl', 'en'],
            onChanged: (l) => setState(() => _blikLocale = l!),
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
          _buildDropdown<BancontactButtonType>(
            label: 'Button Type',
            value: _bancontactType,
            items: BancontactButtonType.values,
            onChanged: (t) => setState(() => _bancontactType = t!),
          ),
          const SizedBox(height: 12),
          _buildDropdown<String>(
            label: 'Locale / Language',
            value: _bancontactLocale,
            items: const ['nl', 'fr', 'de', 'en'],
            onChanged: (l) => setState(() => _bancontactLocale = l!),
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
          _buildDropdown<BizumButtonType>(
            label: 'Button Type',
            value: _bizumType,
            items: BizumButtonType.values,
            onChanged: (t) => setState(() => _bizumType = t!),
          ),
          const SizedBox(height: 12),
          _buildDropdown<String>(
            label: 'Locale / Language',
            value: _bizumLocale,
            items: const ['es', 'en'],
            onChanged: (l) => setState(() => _bizumLocale = l!),
          ),
        ];
    }
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
          child: Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
        ),
        Expanded(
          child: DropdownButton<T>(
            value: value,
            isExpanded: true,
            underline: Container(height: 1, color: Colors.grey.shade400),
            items: items.map((T item) {
              final text = item is Enum ? item.name : item.toString();
              return DropdownMenuItem<T>(
                value: item,
                child: Text(text),
              );
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
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
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
                        locale: const Locale('de'),
                        onPressed: () {},
                      ),
                      TwintButton(
                        color: color,
                        shape: TwintShape.pill,
                        locale: const Locale('de'),
                        onPressed: () {},
                      ),
                      TwintButton(
                        color: color,
                        type: TwintButtonType.logoOnly,
                        onPressed: () {},
                      ),
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
                        locale: const Locale('nl'),
                        onPressed: () {},
                      ),
                      IdealButton(
                        color: color,
                        shape: IdealShape.pill,
                        locale: const Locale('nl'),
                        onPressed: () {},
                      ),
                      IdealButton(
                        color: color,
                        type: IdealButtonType.logoOnly,
                        onPressed: () {},
                      ),
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
                        locale: const Locale('pl'),
                        onPressed: () {},
                      ),
                      BlikButton(
                        color: color,
                        shape: BlikShape.pill,
                        locale: const Locale('pl'),
                        onPressed: () {},
                      ),
                      BlikButton(
                        color: color,
                        type: BlikButtonType.logoOnly,
                        onPressed: () {},
                      ),
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
                        locale: const Locale('nl'),
                        onPressed: () {},
                      ),
                      BancontactButton(
                        color: color,
                        shape: BancontactShape.pill,
                        locale: const Locale('nl'),
                        onPressed: () {},
                      ),
                      BancontactButton(
                        color: color,
                        type: BancontactButtonType.logoOnly,
                        onPressed: () {},
                      ),
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
                        locale: const Locale('es'),
                        onPressed: () {},
                      ),
                      BizumButton(
                        color: color,
                        shape: BizumShape.pill,
                        locale: const Locale('es'),
                        onPressed: () {},
                      ),
                      BizumButton(
                        color: color,
                        type: BizumButtonType.logoOnly,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
          ],
        );
    }
  }
}
