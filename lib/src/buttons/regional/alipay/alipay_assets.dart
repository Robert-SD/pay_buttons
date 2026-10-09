import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'alipay_color.dart';

/// Vector asset generator for Alipay payment branding.
class AlipayAssets {
  AlipayAssets._();

  /// Renders the official full Alipay logo (emblem badge + "Alipay" wordmark).
  static Widget logo({required AlipayColor color, double height = 24.0}) {
    final String badgeBg = color == AlipayColor.blue ? '#FFFFFF' : '#1677FF';
    final String markColor = color == AlipayColor.blue ? '#1677FF' : '#FFFFFF';
    final String dotColor = color == AlipayColor.blue ? '#FFFFFF' : '#1677FF';
    final String wordmarkColor = color == AlipayColor.blue
        ? '#FFFFFF'
        : (color == AlipayColor.white ? '#1A1A1A' : '#FFFFFF');

    return SvgPicture.string(
      _alipayLogoSvg(
        badgeBg: badgeBg,
        markColor: markColor,
        dotColor: dotColor,
        wordmarkColor: wordmarkColor,
      ),
      height: height,
      fit: BoxFit.contain,
    );
  }

  /// Renders the standalone iconic Alipay "支" emblem badge.
  static Widget emblem({required AlipayColor color, double height = 24.0}) {
    final String badgeBg = color == AlipayColor.blue ? '#FFFFFF' : '#1677FF';
    final String markColor = color == AlipayColor.blue ? '#1677FF' : '#FFFFFF';

    return SvgPicture.string(
      _alipayEmblemSvg(badgeBg: badgeBg, markColor: markColor),
      height: height,
      fit: BoxFit.contain,
    );
  }

  static String _alipayEmblemSvg({
    required String badgeBg,
    required String markColor,
  }) {
    return '''
<svg viewBox="0 0 44 44" fill="none" xmlns="http://www.w3.org/2000/svg">
  <rect width="44" height="44" rx="9" fill="$badgeBg"/>
  <g transform="translate(6, 6) scale(0.72)">
    <path d="M16.677 0C15.926 0 15.926 0.733 15.926 0.733V5.089H5.31V6.792H15.926V9.843H7.159V11.55H24.162C23.542 13.669 22.71 15.661 21.711 17.468C16.196 15.67 10.313 14.208 6.611 15.105C4.249 15.68 2.724 16.712 1.825 17.79C-2.278 22.729 0.669 30.241 9.345 30.241C14.469 30.241 19.412 27.411 23.24 22.752C28.948 25.464 40.257 30.128 40.257 30.128V23.485C40.257 23.485 38.84 23.372 32.579 21.299C30.842 20.719 28.503 19.841 25.908 18.912C27.469 16.223 28.715 13.167 29.533 9.843H20.964V6.792H31.463V5.089H20.964V0H16.677ZM3.111 19.216C4.227 18.238 6.264 17.762 7.348 17.658C11.37 17.26 15.09 18.777 19.475 20.896C16.39 24.875 12.463 27.361 8.531 27.361C1.766 27.361 -0.236 22.095 3.111 19.216Z" fill="$markColor"/>
  </g>
</svg>
''';
  }

  static String _alipayLogoSvg({
    required String badgeBg,
    required String markColor,
    required String dotColor,
    required String wordmarkColor,
  }) {
    return '''
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 150 38" fill="none">
  <g transform="translate(13.45,-84.64)">
    <g transform="matrix(0.3528,0,0,-0.3528,17.91,84.64)">
      <path fill="$badgeBg" d="m 0,0 h -71.95 c -9.37,0 -16.958,-7.655 -16.958,-17.104 v -72.559 c 0,-9.443 7.588,-17.101 16.958,-17.101 H 0 c 9.368,0 16.952,7.658 16.952,17.101 v 72.559 C 16.952,-7.655 9.368,0 0,0" />
    </g>
    <g transform="matrix(0.3528,0,0,-0.3528,-3.36,113.61)">
      <path fill="$markColor" d="m 0,0 c -16.469,0 -21.338,13.083 -13.199,20.241 2.716,2.419 7.679,3.6 10.325,3.865 9.783,0.975 18.839,-2.789 29.526,-8.05 C 19.14,6.173 9.572,0 0,0 m 58.554,15.064 c -4.236,1.431 -9.92,3.619 -16.251,5.929 3.802,6.666 6.839,14.257 8.835,22.507 H 30.271 v 7.58 h 25.562 v 4.231 H 30.271 V 67.947 H 19.839 c -1.83,0 -1.83,-1.822 -1.83,-1.822 V 55.311 H -7.844 V 51.08 H 18.009 V 43.5 H -3.336 V 39.27 H 38.062 C 36.547,34.006 34.513,29.064 32.099,24.574 18.666,29.044 4.332,32.667 -4.673,30.437 -10.432,29.006 -14.141,26.452 -16.32,23.776 -26.321,11.504 -19.148,-7.136 1.973,-7.136 c 12.488,0 24.518,7.022 33.842,18.594 C 49.722,4.716 77.256,-6.86 77.256,-6.86 V 9.638 c 0,0 -3.458,0.278 -18.702,5.426" />
    </g>
    <g transform="matrix(0.3528,0,0,-0.3528,67.64,90.16)">
      <path fill="$dotColor" d="m 0,0 c 0,-5.523 4.036,-9.241 9.666,-9.241 5.63,0 9.666,3.718 9.666,9.241 0,5.417 -4.036,9.242 -9.666,9.242 C 4.036,9.242 0,5.417 0,0" />
    </g>
    <path fill="$wordmarkColor" d="m 58.12,115.08 h 5.92 V 87.72 h -5.92 z" />
    <g transform="matrix(0.3528,0,0,-0.3528,39.12,105.60)">
      <path fill="$wordmarkColor" d="M 0,0 9.984,34.522 H 10.41 L 19.864,0 Z M 24.432,48.012 H 1.912 l -25.175,-74.887 h 15.509 l 4.249,14.659 h 26.662 l 4.035,-14.659 h 19.865 z" />
    </g>
    <path fill="$wordmarkColor" d="m 68.09,115.08 h 5.92 V 94.99 h -5.92 z" />
    <g transform="matrix(0.3528,0,0,-0.3528,135.88,95.03)">
      <path fill="$wordmarkColor" d="m 0,0 0.105,0.106 h -15.827 l -9.984,-34.628 h -0.531 L -37.709,0.106 h -18.803 l 22.627,-57.148 -9.454,-17.42 v -0.425 h 14.765 z" />
    </g>
    <g transform="matrix(0.3528,0,0,-0.3528,84.99,111.63)">
      <path fill="$wordmarkColor" d="m 0,0 c -1.911,0 -3.718,0.212 -5.735,0.85 v 30.804 c 3.505,2.443 6.373,3.612 9.984,3.612 6.268,0 11.26,-4.993 11.26,-15.615 C 15.509,6.055 8.18,0 0,0 m 10.623,48.331 c -6.161,0 -10.941,-2.337 -16.358,-6.798 v 5.63 H -22.52 V -27.83 h 16.785 v 18.589 c 3.186,-0.85 6.16,-1.275 9.772,-1.275 14.977,0 28.468,11.047 28.468,30.698 0,17.633 -9.774,28.149 -21.882,28.149" />
    </g>
    <g transform="matrix(0.3528,0,0,-0.3528,108.86,110.21)">
      <path fill="$wordmarkColor" d="m 0,0 c -4.461,-2.443 -7.012,-3.399 -9.984,-3.399 -4.037,0 -6.586,2.655 -6.586,6.904 0,1.594 0.318,3.187 1.592,4.461 2.019,2.019 5.95,3.506 14.978,5.63 z m 16.783,0.425 v 23.793 c 0,12.96 -7.647,20.076 -21.137,20.076 -8.605,0 -14.553,-1.486 -25.388,-4.779 l 2.973,-13.066 c 9.879,4.462 14.235,6.374 18.803,6.374 5.524,0 7.966,-3.93 7.966,-9.985 v -0.425 c -19.227,-3.612 -25.175,-5.63 -28.893,-9.348 -2.761,-2.762 -3.929,-6.692 -3.929,-11.259 0,-10.941 8.498,-16.784 16.465,-16.784 5.948,0 10.727,2.231 17.208,7.118 l 1.168,-5.949 h 16.783 z" />
    </g>
  </g>
</svg>
''';
  }
}
