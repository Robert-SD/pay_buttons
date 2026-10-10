import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../base/pay_button_fonts.dart';
import 'boleto_color.dart';

/// Vector asset generator for Brazilian Boleto Bancário payment branding.
class BoletoAssets {
  BoletoAssets._();

  /// Renders the barcode mark + "Boleto" typography.
  static Widget logo({required BoletoColor color, double height = 24.0}) {
    final Color textColor = color == BoletoColor.black
        ? Colors.white
        : const Color(0xFF1A1A1A);

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        barcode(color: color, height: height),
        const SizedBox(width: 8),
        Text(
          'Boleto',
          style: TextStyle(
            color: textColor,
            fontSize: height * 0.70,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.2,
            fontFamilyFallback: PayButtonFonts.boleto,
          ),
        ),
      ],
    );
  }

  /// Renders the standalone barcode icon mark.
  static Widget barcode({required BoletoColor color, double height = 24.0}) {
    final String barColor = color == BoletoColor.black ? '#FFFFFF' : '#1A1A1A';

    return SvgPicture.string(
      _boletoBarcodeSvg(barColor: barColor),
      height: height,
      fit: BoxFit.contain,
    );
  }

  static String _boletoBarcodeSvg({required String barColor}) {
    return '''
<svg viewBox="0 0 46 32" fill="none" xmlns="http://www.w3.org/2000/svg">
  <rect x="2" y="3" width="3" height="26" rx="1" fill="$barColor"/>
  <rect x="7" y="3" width="2" height="26" rx="1" fill="$barColor"/>
  <rect x="11" y="3" width="4" height="26" rx="1" fill="$barColor"/>
  <rect x="17" y="3" width="2" height="26" rx="1" fill="$barColor"/>
  <rect x="21" y="3" width="5" height="26" rx="1" fill="$barColor"/>
  <rect x="28" y="3" width="2" height="26" rx="1" fill="$barColor"/>
  <rect x="32" y="3" width="4" height="26" rx="1" fill="$barColor"/>
  <rect x="38" y="3" width="2" height="26" rx="1" fill="$barColor"/>
  <rect x="42" y="3" width="3" height="26" rx="1" fill="$barColor"/>
</svg>
''';
  }
}
