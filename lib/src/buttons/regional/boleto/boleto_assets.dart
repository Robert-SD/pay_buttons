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
<svg viewBox="0 0 120 32" fill="none" xmlns="http://www.w3.org/2000/svg">
  <!-- Barcode mark -->
  <rect x="2" y="3" width="3" height="26" rx="1" fill="$barColor"/>
  <rect x="7" y="3" width="2" height="26" rx="1" fill="$barColor"/>
  <rect x="11" y="3" width="4" height="26" rx="1" fill="$barColor"/>
  <rect x="17" y="3" width="2" height="26" rx="1" fill="$barColor"/>
  <rect x="21" y="3" width="5" height="26" rx="1" fill="$barColor"/>
  <rect x="28" y="3" width="2" height="26" rx="1" fill="$barColor"/>
  <rect x="32" y="3" width="3" height="26" rx="1" fill="$barColor"/>
  <!-- Vectorized "BOLETO" lettering -->
  <g transform="translate(44, 5.5) scale(2.0) translate(-2.78, -15.5)">
    <path fill="$barColor" d="M2.78 25.64v-9.45H6.1a3.89 3.89 0 0 1 1.63.28 2.13 2.13 0 0 1 .96.89 2.42 2.42 0 0 1 .35 1.24 2.23 2.23 0 0 1-1.24 2 2.3 2.3 0 0 1 1.24.87 2.4 2.4 0 0 1 .43 1.43 2.92 2.92 0 0 1-.26 1.23 2.38 2.38 0 0 1-.65.88 2.67 2.67 0 0 1-.97.47 5.53 5.53 0 0 1-1.43.16zm1.18-5.48h1.91a4.01 4.01 0 0 0 1.12-.11 1.24 1.24 0 0 0 .67-.47 1.43 1.43 0 0 0 .23-.83 1.58 1.58 0 0 0-.22-.83 1.08 1.08 0 0 0-.6-.5 4.75 4.75 0 0 0-1.34-.13H3.96v2.87zm0 4.37h2.2a4.7 4.7 0 0 0 .8-.05 1.81 1.81 0 0 0 .68-.25 1.35 1.35 0 0 0 .44-.53 1.74 1.74 0 0 0 .18-.8 1.64 1.64 0 0 0-.26-.92 1.34 1.34 0 0 0-.7-.55 4.09 4.09 0 0 0-1.3-.16H3.96v3.26zm6.57-2.32a3.65 3.65 0 0 1 1-2.8 2.87 2.87 0 0 1 2.01-.77 2.8 2.8 0 0 1 2.16.93 3.65 3.65 0 0 1 .84 2.55 4.78 4.78 0 0 1-.37 2.07 2.73 2.73 0 0 1-1.08 1.18 2.98 2.98 0 0 1-1.55.41 2.8 2.8 0 0 1-2.18-.92 3.83 3.83 0 0 1-.83-2.65zm1.12 0a3.03 3.03 0 0 0 .53 1.97 1.73 1.73 0 0 0 2.71 0 3.11 3.11 0 0 0 .54-2 2.94 2.94 0 0 0-.54-1.92 1.73 1.73 0 0 0-2.7 0 3.03 3.03 0 0 0-.54 1.96zm6.15 3.43h1.08v-9.45h-1.09v9.45zm7.14-2.22 1.13.16a2.93 2.93 0 0 1-.99 1.63 2.83 2.83 0 0 1-1.83.57 2.83 2.83 0 0 1-2.22-.92 3.76 3.76 0 0 1-.82-2.59 3.94 3.94 0 0 1 .83-2.68 2.73 2.73 0 0 1 2.15-.95 2.65 2.65 0 0 1 2.1.93 3.88 3.88 0 0 1 .81 2.63v.31h-4.78a2.73 2.73 0 0 0 .6 1.73 1.72 1.72 0 0 0 1.33.6 1.58 1.58 0 0 0 1.02-.34 2.24 2.24 0 0 0 .67-1.08zm-3.56-1.86h3.57a2.42 2.42 0 0 0-.4-1.3 1.62 1.62 0 0 0-1.35-.67 1.67 1.67 0 0 0-1.26.54 2.2 2.2 0 0 0-.56 1.43zm8.42 3.04.15 1.03a3.8 3.8 0 0 1-.82.1 1.75 1.75 0 0 1-.92-.2 1.1 1.1 0 0 1-.45-.52 4.45 4.45 0 0 1-.13-1.38v-3.95h-.8v-.9h.8V17.1l1.08-.7v2.4h1.1v.9h-1.1v4a2.12 2.12 0 0 0 .06.65.47.47 0 0 0 .19.23.7.7 0 0 0 .37.08 3.2 3.2 0 0 0 .47-.05m.67-2.4a3.65 3.65 0 0 1 .99-2.8 2.87 2.87 0 0 1 2.02-.77 2.8 2.8 0 0 1 2.16.93 3.65 3.65 0 0 1 .84 2.55 4.78 4.78 0 0 1-.38 2.07 2.73 2.73 0 0 1-1.08 1.18 2.98 2.98 0 0 1-1.54.41 2.8 2.8 0 0 1-2.18-.92 3.83 3.83 0 0 1-.83-2.65zm1.11 0a3.04 3.04 0 0 0 .54 1.97 1.73 1.73 0 0 0 2.7 0 3.12 3.12 0 0 0 .54-2 2.94 2.94 0 0 0-.54-1.92 1.73 1.73 0 0 0-2.7 0 3.03 3.03 0 0 0-.54 1.96z"/>
  </g>
</svg>
''';
  }
}
