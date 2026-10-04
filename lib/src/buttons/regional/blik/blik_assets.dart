import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'blik_color.dart';

/// Vector asset generator for Polish BLIK payment branding.
class BlikAssets {
  BlikAssets._();

  /// Renders the official BLIK logo.
  static Widget logo({required BlikColor color, double height = 24.0}) {
    final String textColor = color == BlikColor.black ? '#FFFFFF' : '#000000';

    return SvgPicture.string(
      _blikSvg(textColor: textColor),
      height: height,
      fit: BoxFit.contain,
    );
  }

  /// Renders the standalone Polish BLIK 'b' mark with orange dot.
  static Widget bMark({required BlikColor color, double height = 24.0}) {
    final String textColor = color == BlikColor.black ? '#FFFFFF' : '#000000';

    return SvgPicture.string(
      _blikMarkSvg(textColor: textColor),
      height: height,
      fit: BoxFit.contain,
    );
  }

  static String _blikMarkSvg({required String textColor}) {
    return '''
<svg viewBox="20 20 28 40" fill="none" xmlns="http://www.w3.org/2000/svg">
  <path d="M46.14 26.71C46.16 23.57 43.63 21.02 40.50 21C37.37 20.98 34.82 23.50 34.80 26.63C34.78 29.76 37.30 32.32 40.43 32.34C43.56 32.36 46.12 29.84 46.14 26.71Z" fill="#E52F08"/>
  <path d="M34.11 34.99C32.13 34.99 30.18 35.48 28.43 36.42V22.82H22.09V47.01C22.09 49.39 22.79 51.71 24.11 53.69C25.43 55.67 27.31 57.21 29.51 58.12C31.71 59.03 34.12 59.27 36.46 58.81C38.79 58.34 40.93 57.20 42.61 55.52C44.30 53.84 45.44 51.69 45.91 49.36C46.37 47.03 46.13 44.61 45.22 42.41C44.31 40.22 42.77 38.34 40.79 37.02C38.82 35.70 36.49 34.99 34.11 34.99ZM34.11 52.80C32.97 52.80 31.85 52.46 30.90 51.82C29.95 51.19 29.21 50.28 28.77 49.23C28.33 48.17 28.22 47.01 28.44 45.88C28.66 44.76 29.21 43.73 30.02 42.92C30.83 42.11 31.86 41.56 32.99 41.34C34.11 41.11 35.27 41.23 36.33 41.67C37.39 42.10 38.29 42.85 38.93 43.80C39.56 44.75 39.90 45.87 39.90 47.01C39.90 48.52 39.17 49.93 38.21 51.10C37.03 52.07 35.63 52.65 34.11 52.80Z" fill="$textColor"/>
</svg>
''';
  }

  static String _blikSvg({required String textColor}) {
    return '''
<svg viewBox="20 20 80 42" fill="none" xmlns="http://www.w3.org/2000/svg">
  <!-- BLIK Red/Orange Dot -->
  <path d="M46.14 26.71C46.16 23.57 43.63 21.02 40.50 21C37.37 20.98 34.82 23.50 34.80 26.63C34.78 29.76 37.30 32.32 40.43 32.34C43.56 32.36 46.12 29.84 46.14 26.71Z" fill="#E52F08"/>

  <!-- Letters "b", "l", "i", "k" -->
  <path d="M89.75 58.78H97.91L88.10 46.11L97.00 35.23H89.59L80.86 46.18V22.82H74.52V58.78H80.86L80.85 46.21L89.75 58.78Z" fill="$textColor"/>
  <path d="M50.59 22.82H56.93V58.78H50.59V22.82Z" fill="$textColor"/>
  <path d="M62.56 35.23H68.90V58.78H62.56V35.23Z" fill="$textColor"/>
  <path d="M34.11 34.99C32.13 34.99 30.18 35.48 28.43 36.42V22.82H22.09V47.01C22.09 49.39 22.79 51.71 24.11 53.69C25.43 55.67 27.31 57.21 29.51 58.12C31.71 59.03 34.12 59.27 36.46 58.81C38.79 58.34 40.93 57.20 42.61 55.52C44.30 53.84 45.44 51.69 45.91 49.36C46.37 47.03 46.13 44.61 45.22 42.41C44.31 40.22 42.77 38.34 40.79 37.02C38.82 35.70 36.49 34.99 34.11 34.99ZM34.11 52.80C32.97 52.80 31.85 52.46 30.90 51.82C29.95 51.19 29.21 50.28 28.77 49.23C28.33 48.17 28.22 47.01 28.44 45.88C28.66 44.76 29.21 43.73 30.02 42.92C30.83 42.11 31.86 41.56 32.99 41.34C34.11 41.11 35.27 41.23 36.33 41.67C37.39 42.10 38.29 42.85 38.93 43.80C39.56 44.75 39.90 45.87 39.90 47.01C39.90 48.52 39.17 49.93 38.21 51.10C37.03 52.07 35.63 52.65 34.11 52.80Z" fill="$textColor"/>
</svg>
''';
  }
}
