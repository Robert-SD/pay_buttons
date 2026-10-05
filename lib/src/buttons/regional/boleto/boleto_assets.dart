import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'boleto_color.dart';

/// Vector asset generator for Brazilian Boleto Bancário payment branding.
class BoletoAssets {
  BoletoAssets._();

  /// Renders the official barcode + "BOLETO" wordmark vector logo.
  static Widget logo({required BoletoColor color, double height = 24.0}) {
    final String barColor = color == BoletoColor.black ? '#FFFFFF' : '#1A1A1A';

    return SvgPicture.string(
      _boletoLogoSvg(barColor: barColor),
      height: height,
      fit: BoxFit.contain,
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

  static String _boletoLogoSvg({required String barColor}) {
    return '''
<svg viewBox="0 0 148 32" fill="none" xmlns="http://www.w3.org/2000/svg">
  <rect x="2" y="3" width="3" height="26" rx="1" fill="$barColor"/>
  <rect x="7" y="3" width="2" height="26" rx="1" fill="$barColor"/>
  <rect x="11" y="3" width="4" height="26" rx="1" fill="$barColor"/>
  <rect x="17" y="3" width="2" height="26" rx="1" fill="$barColor"/>
  <rect x="21" y="3" width="5" height="26" rx="1" fill="$barColor"/>
  <rect x="28" y="3" width="2" height="26" rx="1" fill="$barColor"/>
  <rect x="32" y="3" width="3" height="26" rx="1" fill="$barColor"/>
  <!-- "BOLETO" lettering -->
  <text x="44" y="23" fill="$barColor" font-family="-apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif" font-weight="900" font-size="16" letter-spacing="2">BOLETO</text>
</svg>
''';
  }
}
