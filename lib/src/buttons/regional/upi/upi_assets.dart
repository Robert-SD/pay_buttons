import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'upi_color.dart';

/// Vector asset generator for India UPI (Unified Payments Interface) branding.
class UpiAssets {
  UpiAssets._();

  /// Renders the official UPI logo (wordmark with dual directional arrows).
  static Widget logo({required UpiColor color, double height = 24.0}) {
    final (textFill, saffron, green) = switch (color) {
      UpiColor.white => ('#2E3138', '#F47920', '#028C45'),
      UpiColor.black => ('#FFFFFF', '#F47920', '#028C45'),
      UpiColor.navy => ('#FFFFFF', '#F47920', '#028C45'),
      UpiColor.orange => ('#FFFFFF', '#FFFFFF', '#0B2545'),
    };

    return SvgPicture.string(
      _upiLogoSvg(textFill: textFill, saffron: saffron, green: green),
      height: height,
      fit: BoxFit.contain,
    );
  }

  /// Renders the standalone UPI dual directional arrows emblem.
  static Widget emblem({required UpiColor color, double height = 24.0}) {
    final (saffron, green) = switch (color) {
      UpiColor.white ||
      UpiColor.black ||
      UpiColor.navy => ('#F47920', '#028C45'),
      UpiColor.orange => ('#FFFFFF', '#0B2545'),
    };

    return SvgPicture.string(
      _upiEmblemSvg(saffron: saffron, green: green),
      height: height,
      fit: BoxFit.contain,
    );
  }

  static String _upiLogoSvg({
    required String textFill,
    required String saffron,
    required String green,
  }) {
    return '''
<svg viewBox="520 200 372 103" fill="none" xmlns="http://www.w3.org/2000/svg">
  <g fill="$textFill">
    <g transform="translate(639.77002,294.63)">
      <path d="m 0,0 c -0.96,3.84 -4.49,6.57 -8.49,6.57 h -100.73 c -2.72,0 -4.81,-0.96 -6.09,-2.89 -1.44,-1.92 -1.6,-4.16 -0.96,-6.88 l 24.659999,-88.439999 H -72.07 L -94.010002,-12.66 H -16.02 l 22.1,-78.979999 h 19.379999 z" />
    </g>
    <g transform="translate(791.90997,205.71001)">
      <path d="m 0,0 c -1.28,-1.76 -3.37,-2.72 -6.25,-2.72 h -107.3 l -5.28,19.22 h 19.539999 v 0 h 77.990002 L -26.91,37.009998 h -77.99 v -0.16 h -19.54 l -16.17,58.64 h 19.38 l 10.89,-39.409996 h 87.76 c 2.719999,0 5.440001,-0.810002 7.84,-2.730004 2.41,-1.919998 4.01,-4.159999 4.81,-6.889999 L 0.8,7.21 C 1.6,4.33 1.44,1.92 0,0 Z" />
    </g>
    <path d="M 802.15997,300.72 H 782.62 l 27.05999,-98.05 h 19.53998 z" />
  </g>
  <path fill="$green" d="M 862.84998,202.83 887.67999,252.00999 835.63,301.20001 Z" />
  <path fill="$saffron" d="m 845.56,202.83 24.65997,49.17999 -51.88995,49.19002 z" />
</svg>''';
  }

  static String _upiEmblemSvg({
    required String saffron,
    required String green,
  }) {
    return '''
<svg viewBox="816 200 74 104" fill="none" xmlns="http://www.w3.org/2000/svg">
  <path fill="$green" d="M 862.84998,202.83 887.67999,252.00999 835.63,301.20001 Z" />
  <path fill="$saffron" d="m 845.56,202.83 24.65997,49.17999 -51.88995,49.19002 z" />
</svg>''';
  }
}
