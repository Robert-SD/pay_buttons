import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'bancontact_color.dart';

/// Vector asset generator for Belgian Bancontact payment branding.
class BancontactAssets {
  BancontactAssets._();

  /// Renders the official Bancontact logo.
  static Widget logo({required BancontactColor color, double height = 24.0}) {
    final String textColor =
        color == BancontactColor.blue ? '#FFFFFF' : '#1E3764';

    return SvgPicture.string(
      _bancontactSvg(textColor: textColor),
      height: height,
      fit: BoxFit.contain,
    );
  }

  /// Renders the standalone Belgian Bancontact wings mark vector.
  static Widget wings({double height = 24.0}) {
    return SvgPicture.string(
      _bancontactWingsSvg,
      height: height,
      fit: BoxFit.contain,
    );
  }

  static const String _bancontactWingsSvg = '''
<svg viewBox="15 12 90 38" fill="none" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <linearGradient id="bcBlue_w" x1="24.5" y1="40" x2="57.2" y2="28" gradientUnits="userSpaceOnUse">
      <stop stop-color="#005AB9"/>
      <stop offset="1" stop-color="#1E3764"/>
    </linearGradient>
    <linearGradient id="bcYellow_w" x1="62.7" y1="31.7" x2="97.4" y2="20" gradientUnits="userSpaceOnUse">
      <stop stop-color="#FBA900"/>
      <stop offset="1" stop-color="#FFD800"/>
    </linearGradient>
  </defs>
  <path d="M33.18 48.24C46.59 48.24 53.29 39.18 60 30.12H15.5V48.24H33.18Z" fill="url(#bcBlue_w)"/>
  <path d="M86.82 12C73.41 12 66.71 21.06 60 30.12H104.5V12H86.82Z" fill="url(#bcYellow_w)"/>
</svg>
''';

  static String _bancontactSvg({required String textColor}) {
    return '''
<svg viewBox="15 12 90 56" fill="none" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <linearGradient id="bcBlue" x1="24.5" y1="40" x2="57.2" y2="28" gradientUnits="userSpaceOnUse">
      <stop stop-color="#005AB9"/>
      <stop offset="1" stop-color="#1E3764"/>
    </linearGradient>
    <linearGradient id="bcYellow" x1="62.7" y1="31.7" x2="97.4" y2="20" gradientUnits="userSpaceOnUse">
      <stop stop-color="#FBA900"/>
      <stop offset="1" stop-color="#FFD800"/>
    </linearGradient>
  </defs>
  <!-- Wings -->
  <path d="M33.18 48.24C46.59 48.24 53.29 39.18 60 30.12H15.5V48.24H33.18Z" fill="url(#bcBlue)"/>
  <path d="M86.82 12C73.41 12 66.71 21.06 60 30.12H104.5V12H86.82Z" fill="url(#bcYellow)"/>

  <!-- Wordmark "Bancontact" -->
  <path d="M15.5 67.78V54.75H19.47C22.35 54.75 24.21 55.85 24.21 58.12C24.21 59.4 23.62 60.29 22.79 60.82C23.98 61.37 24.68 62.45 24.68 63.92C24.68 66.55 22.79 67.78 19.85 67.78H15.5ZM18.05 60.16H19.94C21.1 60.16 21.6 59.59 21.6 58.53C21.6 57.39 20.7 57.02 19.49 57.02H18.05V60.16ZM18.05 65.51H19.63C21.17 65.51 22.07 65.11 22.07 63.89C22.07 62.68 21.3 62.17 19.85 62.17H18.05V65.51ZM29.63 68C27.12 68 25.85 66.75 25.85 65.08C25.85 63.23 27.34 62.16 29.54 62.14C30.09 62.15 30.64 62.2 31.18 62.29V61.84C31.18 60.7 30.53 60.16 29.3 60.16C28.47 60.15 27.65 60.31 26.88 60.61L26.42 58.6C27.21 58.27 28.48 58.04 29.6 58.04C32.3 58.04 33.64 59.49 33.64 62.01V67.18C32.88 67.57 31.47 68 29.63 68ZM31.18 65.9V63.9C30.75 63.81 30.31 63.76 29.87 63.76C29.03 63.76 28.37 64.09 28.37 64.97C28.37 65.75 28.92 66.16 29.89 66.16C30.33 66.17 30.77 66.08 31.18 65.9ZM35.42 67.78V58.86C36.74 58.32 38.15 58.05 39.57 58.04C42.25 58.04 43.8 59.38 43.8 61.86V67.78H41.26V62.04C41.26 60.76 40.67 60.16 39.55 60.16C39 60.16 38.45 60.27 37.94 60.5V67.78H35.42ZM52.65 58.6L52.18 60.63C51.52 60.34 50.81 60.18 50.1 60.16C48.61 60.16 47.8 61.23 47.8 62.97C47.8 64.89 48.65 65.88 50.23 65.88C50.93 65.86 51.63 65.69 52.27 65.39L52.67 67.46C51.84 67.83 50.94 68.02 50.03 68C46.98 68 45.21 66.08 45.21 63.05C45.21 60.03 46.96 58.04 49.88 58.04C50.83 58.04 51.77 58.23 52.65 58.6ZM58.13 68C55.3 68 53.54 66.01 53.54 63.01C53.54 60.03 55.3 58.04 58.13 58.04C60.97 58.04 62.7 60.03 62.7 63.01C62.7 66.01 60.97 68 58.13 68ZM58.13 65.88C59.43 65.88 60.11 64.78 60.11 63.01C60.11 61.26 59.43 60.16 58.13 60.16C56.84 60.16 56.13 61.26 56.13 63.01C56.13 64.78 56.84 65.88 58.13 65.88ZM64.17 67.78V58.86C65.49 58.32 66.9 58.05 68.32 58.04C71 58.04 72.54 59.38 72.54 61.86V67.78H70.01V62.04C70.01 60.76 69.42 60.16 68.3 60.16C67.74 60.16 67.19 60.27 66.68 60.5V67.78H64.17ZM78.26 68C76.07 68 74.95 66.79 74.95 64.33V60.31H73.7V58.27H74.95V56.2L77.49 56.07V58.27H79.53V60.31H77.49V64.3C77.49 65.37 77.93 65.88 78.75 65.88C79.08 65.88 79.41 65.84 79.73 65.77L79.86 67.83C79.33 67.95 78.8 68.01 78.26 68ZM84.66 68C82.14 68 80.87 66.75 80.87 65.08C80.87 63.23 82.36 62.16 84.56 62.14C85.11 62.15 85.66 62.2 86.2 62.29V61.84C86.2 60.7 85.55 60.16 84.32 60.16C83.5 60.15 82.67 60.31 81.9 60.61L81.44 58.6C82.23 58.27 83.5 58.04 84.62 58.04C87.32 58.04 88.66 59.49 88.66 62.01V67.18C87.91 67.57 86.49 68 84.66 68ZM86.2 65.9V63.9C85.77 63.81 85.33 63.76 84.89 63.76C84.05 63.76 83.39 64.09 83.39 64.97C83.39 65.75 83.94 66.16 84.91 66.16C85.35 66.17 85.79 66.08 86.2 65.9ZM97.33 58.6L96.85 60.63C96.2 60.34 95.49 60.18 94.78 60.16C93.29 60.16 92.48 61.23 92.48 62.97C92.48 64.89 93.33 65.88 94.91 65.88C95.61 65.86 96.3 65.69 96.94 65.39L97.35 67.46C96.52 67.83 95.61 68.02 94.7 68C91.66 68 89.89 66.08 89.89 63.05C89.89 60.03 91.64 58.04 94.56 58.04C95.51 58.04 96.45 58.23 97.33 58.6ZM102.9 68C100.72 68 99.6 66.79 99.6 64.33V60.31H98.35V58.27H99.6V56.2L102.13 56.07V58.27H104.17V60.31H102.13V64.3C102.13 65.37 102.57 65.88 103.4 65.88C103.73 65.88 104.05 65.84 104.37 65.77L104.5 67.83C103.98 67.95 103.44 68.01 102.9 68Z" fill="$textColor"/>
</svg>
''';
  }
}
