import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'twint_color.dart';

/// Vector asset generator for Swiss TWINT payment branding.
class TwintAssets {
  TwintAssets._();

  /// Renders the official TWINT logo.
  static Widget logo({required TwintColor color, double height = 24.0}) {
    final String textColor = color == TwintColor.black ? '#FFFFFF' : '#000000';

    return SvgPicture.string(
      _twintSvg(textColor: textColor),
      height: height,
      fit: BoxFit.contain,
    );
  }

  /// Official TWINT SVG geometry.
  static String _twintSvg({required String textColor}) {
    return '''
<svg viewBox="0 0 140 46" fill="none" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <radialGradient id="twintA" cx="22.45%" cy="8.76%" fx="22.45%" fy="8.76%" r="113.287%">
      <stop stop-color="#FFCC00" offset="0%"/>
      <stop stop-color="#FF1800" offset="55.03%"/>
      <stop stop-color="#FF0000" offset="100%"/>
    </radialGradient>
    <radialGradient id="twintB" cx="2.431%" cy="14.525%" fx="2.431%" fy="14.525%" r="139.175%">
      <stop stop-color="#00B4E6" offset="0%"/>
      <stop stop-color="#0292CD" offset="57.37%"/>
      <stop stop-color="#054696" offset="100%"/>
    </radialGradient>
  </defs>
  <!-- Letters "TWINT" -->
  <path d="M66.674 14.082h-16.161v3.861h5.796v16.503h4.568v-16.503h5.796z" fill="$textColor"/>
  <path d="M81.018 22.149l.147.91 4.249 11.387h1.842l5.772-20.364h-4.446l-2.751 10.699-.172 1.156-.221-1.156-3.684-10.699h-1.474l-3.684 10.699-.221 1.156-.147-1.156-2.751-10.699h-4.47l5.772 20.364h1.842l4.249-11.387.147-.91" fill="$textColor"/>
  <path d="M96.344 14.082v20.364h4.519v-20.364z" fill="$textColor"/>
  <path d="M113.389 13.443c-5.084 0-7.909 3.246-7.909 7.944v13.06h4.519v-13.158c0-2.041 1.204-3.615 3.439-3.615 2.235 0 3.414 1.869 3.414 3.615v13.158h4.519v-13.06c.025-4.698-2.898-7.944-7.982-7.944z" fill="$textColor"/>
  <path d="M139.989 14.082h-16.137v3.861h5.796v16.503h4.568v-16.503h5.772z" fill="$textColor"/>

  <!-- TWINT Emblem -->
  <path d="M29.414 23.059l-4.716 6.911-2.407-3.689 2.775-4.156c.516-.738 1.621-2.779.344-5.558-1.032-2.263-3.267-3.345-5.232-3.345-1.965 0-4.102 1.008-5.256 3.345-1.302 2.681-.172 4.771.319 5.485 0 0 1.547 2.263 2.825 4.181l2.088 3.025 3.144 4.821c.025.025.516.787 1.4.787.835 0 1.351-.762 1.425-.836l7.368-10.92h-4.077v-.049zm-9.26.172s-1.228-1.869-2.039-3.173c-.86-1.402.098-3.492 2.039-3.492 1.94 0 2.898 2.091 2.039 3.492-.786 1.304-2.039 3.173-2.039 3.173z" fill="url(#twintA)"/>
  <path d="M15.635 29.749l-4.618-6.493s-1.228-1.869-2.039-3.173c-.86-1.402.098-3.492 2.039-3.492.246 0 .467.025.688.098l1.621-2.976c-.737-.32-1.547-.492-2.284-.492-1.965 0-4.102 1.008-5.256 3.345-1.302 2.681-.172 4.771.319 5.485l8.081 11.978c.074.098.589.861 1.449.861.86 0 1.351-.738 1.425-.836l2.432-3.714-2.088-3.074-1.768 2.484z" fill="url(#twintB)"/>
</svg>
''';
  }
}
