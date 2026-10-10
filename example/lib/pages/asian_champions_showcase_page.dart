import 'package:flutter/material.dart';
import 'package:pay_buttons/pay_buttons.dart';

enum AsianChampion {
  alipay('Alipay', 'China 🇨🇳 / Global'),
  wechatPay('WeChat Pay', 'China 🇨🇳 / Global'),
  paynow('PayNow', 'Singapore 🇸🇬'),
  promptpay('PromptPay', 'Thailand 🇹🇭'),
  upi('UPI', 'India 🇮🇳');

  const AsianChampion(this.title, this.country);
  final String title;
  final String country;
}

class AsianChampionsShowcasePage extends StatefulWidget {
  const AsianChampionsShowcasePage({
    super.key,
    this.initialChampion = AsianChampion.alipay,
  });

  final AsianChampion initialChampion;

  @override
  State<AsianChampionsShowcasePage> createState() =>
      _AsianChampionsShowcasePageState();
}

class _AsianChampionsShowcasePageState
    extends State<AsianChampionsShowcasePage> {
  late AsianChampion _selectedChampion = widget.initialChampion;

  // Shared Playground State
  PayButtonVariant _variant = PayButtonVariant.responsive;
  PayButtonTextPosition _textPosition = PayButtonTextPosition.leading;
  bool _isLoading = false;
  bool _enabled = true;
  bool _fullWidth = false;
  double _height = 48.0;

  // Alipay state
  AlipayColor _alipayColor = AlipayColor.blue;
  AlipayShape _alipayShape = AlipayShape.rounded;
  String? _alipayText = 'Pay with';

  // WeChat Pay state
  WeChatPayColor _wechatPayColor = WeChatPayColor.green;
  WeChatPayShape _wechatPayShape = WeChatPayShape.rounded;
  String? _wechatPayText = 'Pay with';

  // PayNow state
  PayNowColor _paynowColor = PayNowColor.purple;
  PayNowShape _paynowShape = PayNowShape.rounded;
  String? _paynowText = 'Pay with';

  // PromptPay state
  PromptPayColor _promptpayColor = PromptPayColor.blue;
  PromptPayShape _promptpayShape = PromptPayShape.rounded;
  String? _promptpayText = 'Pay with';

  // UPI state
  UpiColor _upiColor = UpiColor.white;
  UpiShape _upiShape = UpiShape.rounded;
  String? _upiText = 'Pay with';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Asian Champions'),
        backgroundColor: const Color(0xFFC41230),
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
        color: const Color(0xFFC41230).withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFC41230).withValues(alpha: 0.2),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFFC41230),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
              child: Text(
                'ASIA',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 14,
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
                  'Asian Market Leaders',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF900B22),
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Vector typography and styling for Alipay, WeChat Pay, PayNow, and PromptPay.',
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
        children: AsianChampion.values.map((champ) {
          final isSelected = champ == _selectedChampion;
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ChoiceChip(
              label: Text('${champ.title} (${champ.country})'),
              selected: isSelected,
              selectedColor: const Color(0xFFC41230).withValues(alpha: 0.2),
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
                const Icon(Icons.tune, color: Color(0xFFC41230)),
                const SizedBox(width: 8),
                Text(
                  '${_selectedChampion.title} Playground',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
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
      case AsianChampion.alipay:
        return AlipayButton(
          onPressed: _enabled ? () => _handlePayPress('Alipay') : null,
          color: _alipayColor,
          shape: _alipayShape,
          text: _alipayText,
          height: _height,
          isLoading: _isLoading,
          enabled: _enabled,
          variant: _variant,
          textPosition: _textPosition,
        );
      case AsianChampion.wechatPay:
        return WeChatPayButton(
          onPressed: _enabled ? () => _handlePayPress('WeChat Pay') : null,
          color: _wechatPayColor,
          shape: _wechatPayShape,
          text: _wechatPayText,
          height: _height,
          isLoading: _isLoading,
          enabled: _enabled,
          variant: _variant,
          textPosition: _textPosition,
        );
      case AsianChampion.paynow:
        return PayNowButton(
          onPressed: _enabled ? () => _handlePayPress('PayNow') : null,
          color: _paynowColor,
          shape: _paynowShape,
          text: _paynowText,
          height: _height,
          isLoading: _isLoading,
          enabled: _enabled,
          variant: _variant,
          textPosition: _textPosition,
        );
      case AsianChampion.promptpay:
        return PromptPayButton(
          onPressed: _enabled ? () => _handlePayPress('PromptPay') : null,
          color: _promptpayColor,
          shape: _promptpayShape,
          text: _promptpayText,
          height: _height,
          isLoading: _isLoading,
          enabled: _enabled,
          variant: _variant,
          textPosition: _textPosition,
        );
      case AsianChampion.upi:
        return UpiButton(
          onPressed: _enabled ? () => _handlePayPress('UPI') : null,
          color: _upiColor,
          shape: _upiShape,
          text: _upiText,
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
      case AsianChampion.alipay:
        return Column(
          children: [
            DropdownButtonFormField<AlipayColor>(
              initialValue: _alipayColor,
              decoration: const InputDecoration(
                labelText: 'Color Theme',
                border: OutlineInputBorder(),
              ),
              items: AlipayColor.values.map((c) {
                return DropdownMenuItem(value: c, child: Text(c.name));
              }).toList(),
              onChanged: (val) {
                if (val != null) setState(() => _alipayColor = val);
              },
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<AlipayShape>(
              initialValue: _alipayShape,
              decoration: const InputDecoration(
                labelText: 'Shape',
                border: OutlineInputBorder(),
              ),
              items: AlipayShape.values.map((s) {
                return DropdownMenuItem(value: s, child: Text(s.name));
              }).toList(),
              onChanged: (val) {
                if (val != null) setState(() => _alipayShape = val);
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              initialValue: _alipayText,
              decoration: const InputDecoration(
                labelText: 'Button Text (Empty for Logo-Only)',
                border: OutlineInputBorder(),
              ),
              onChanged: (val) => setState(() => _alipayText = val),
            ),
          ],
        );
      case AsianChampion.wechatPay:
        return Column(
          children: [
            DropdownButtonFormField<WeChatPayColor>(
              initialValue: _wechatPayColor,
              decoration: const InputDecoration(
                labelText: 'Color Theme',
                border: OutlineInputBorder(),
              ),
              items: WeChatPayColor.values.map((c) {
                return DropdownMenuItem(value: c, child: Text(c.name));
              }).toList(),
              onChanged: (val) {
                if (val != null) setState(() => _wechatPayColor = val);
              },
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<WeChatPayShape>(
              initialValue: _wechatPayShape,
              decoration: const InputDecoration(
                labelText: 'Shape',
                border: OutlineInputBorder(),
              ),
              items: WeChatPayShape.values.map((s) {
                return DropdownMenuItem(value: s, child: Text(s.name));
              }).toList(),
              onChanged: (val) {
                if (val != null) setState(() => _wechatPayShape = val);
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              initialValue: _wechatPayText,
              decoration: const InputDecoration(
                labelText: 'Button Text (Empty for Logo-Only)',
                border: OutlineInputBorder(),
              ),
              onChanged: (val) => setState(() => _wechatPayText = val),
            ),
          ],
        );
      case AsianChampion.paynow:
        return Column(
          children: [
            DropdownButtonFormField<PayNowColor>(
              initialValue: _paynowColor,
              decoration: const InputDecoration(
                labelText: 'Color Theme',
                border: OutlineInputBorder(),
              ),
              items: PayNowColor.values.map((c) {
                return DropdownMenuItem(value: c, child: Text(c.name));
              }).toList(),
              onChanged: (val) {
                if (val != null) setState(() => _paynowColor = val);
              },
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<PayNowShape>(
              initialValue: _paynowShape,
              decoration: const InputDecoration(
                labelText: 'Shape',
                border: OutlineInputBorder(),
              ),
              items: PayNowShape.values.map((s) {
                return DropdownMenuItem(value: s, child: Text(s.name));
              }).toList(),
              onChanged: (val) {
                if (val != null) setState(() => _paynowShape = val);
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              initialValue: _paynowText,
              decoration: const InputDecoration(
                labelText: 'Button Text (Empty for Logo-Only)',
                border: OutlineInputBorder(),
              ),
              onChanged: (val) => setState(() => _paynowText = val),
            ),
          ],
        );
      case AsianChampion.promptpay:
        return Column(
          children: [
            DropdownButtonFormField<PromptPayColor>(
              initialValue: _promptpayColor,
              decoration: const InputDecoration(
                labelText: 'Color Theme',
                border: OutlineInputBorder(),
              ),
              items: PromptPayColor.values.map((c) {
                return DropdownMenuItem(value: c, child: Text(c.name));
              }).toList(),
              onChanged: (val) {
                if (val != null) setState(() => _promptpayColor = val);
              },
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<PromptPayShape>(
              initialValue: _promptpayShape,
              decoration: const InputDecoration(
                labelText: 'Shape',
                border: OutlineInputBorder(),
              ),
              items: PromptPayShape.values.map((s) {
                return DropdownMenuItem(value: s, child: Text(s.name));
              }).toList(),
              onChanged: (val) {
                if (val != null) setState(() => _promptpayShape = val);
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              initialValue: _promptpayText,
              decoration: const InputDecoration(
                labelText: 'Button Text (Empty for Logo-Only)',
                border: OutlineInputBorder(),
              ),
              onChanged: (val) => setState(() => _promptpayText = val),
            ),
          ],
        );
      case AsianChampion.upi:
        return Column(
          children: [
            DropdownButtonFormField<UpiColor>(
              initialValue: _upiColor,
              decoration: const InputDecoration(
                labelText: 'Color',
                border: OutlineInputBorder(),
              ),
              items: UpiColor.values.map((c) {
                return DropdownMenuItem(value: c, child: Text(c.name));
              }).toList(),
              onChanged: (val) {
                if (val != null) setState(() => _upiColor = val);
              },
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<UpiShape>(
              initialValue: _upiShape,
              decoration: const InputDecoration(
                labelText: 'Shape',
                border: OutlineInputBorder(),
              ),
              items: UpiShape.values.map((s) {
                return DropdownMenuItem(value: s, child: Text(s.name));
              }).toList(),
              onChanged: (val) {
                if (val != null) setState(() => _upiShape = val);
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              initialValue: _upiText,
              decoration: const InputDecoration(
                labelText: 'Button Text (Empty for Logo-Only)',
                border: OutlineInputBorder(),
              ),
              onChanged: (val) => setState(() => _upiText = val),
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
              'Asian Quick Checkout Stack',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Sample checkout presentation showing Asian market leader payment buttons in a single responsive vertical stack.',
              style: TextStyle(color: Colors.grey.shade600),
            ),
            const SizedBox(height: 24),
            Column(
              children: [
                AlipayButton(
                  text: 'Pay with',
                  onPressed: () => _handlePayPress('Alipay'),
                ),
                const SizedBox(height: 12),
                WeChatPayButton(
                  text: 'Pay with',
                  onPressed: () => _handlePayPress('WeChat Pay'),
                ),
                const SizedBox(height: 12),
                PayNowButton(
                  text: 'Pay with',
                  onPressed: () => _handlePayPress('PayNow'),
                ),
                const SizedBox(height: 12),
                PromptPayButton(
                  text: 'Pay with',
                  onPressed: () => _handlePayPress('PromptPay'),
                ),
                const SizedBox(height: 12),
                UpiButton(
                  text: 'Pay with',
                  onPressed: () => _handlePayPress('UPI'),
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
