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
    final String wordmarkColor = color == AlipayColor.blue
        ? '#FFFFFF'
        : (color == AlipayColor.white ? '#1A1A1A' : '#FFFFFF');

    return SvgPicture.string(
      _alipayLogoSvg(
        badgeBg: badgeBg,
        markColor: markColor,
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
    required String wordmarkColor,
  }) {
    return '''
<svg viewBox="0 0 115 36" fill="none" xmlns="http://www.w3.org/2000/svg">
  <!-- Alipay Badge -->
  <rect x="0" y="0" width="36" height="36" rx="8" fill="$badgeBg"/>
  <g transform="translate(5, 5) scale(0.59)">
    <path d="M16.677 0C15.926 0 15.926 0.733 15.926 0.733V5.089H5.31V6.792H15.926V9.843H7.159V11.55H24.162C23.542 13.669 22.71 15.661 21.711 17.468C16.196 15.67 10.313 14.208 6.611 15.105C4.249 15.68 2.724 16.712 1.825 17.79C-2.278 22.729 0.669 30.241 9.345 30.241C14.469 30.241 19.412 27.411 23.24 22.752C28.948 25.464 40.257 30.128 40.257 30.128V23.485C40.257 23.485 38.84 23.372 32.579 21.299C30.842 20.719 28.503 19.841 25.908 18.912C27.469 16.223 28.715 13.167 29.533 9.843H20.964V6.792H31.463V5.089H20.964V0H16.677ZM3.111 19.216C4.227 18.238 6.264 17.762 7.348 17.658C11.37 17.26 15.09 18.777 19.475 20.896C16.39 24.875 12.463 27.361 8.531 27.361C1.766 27.361 -0.236 22.095 3.111 19.216Z" fill="$markColor"/>
  </g>
  <!-- Wordmark "Alipay" -->
  <g transform="translate(42, 6) scale(0.95)" fill="$wordmarkColor">
    <!-- A -->
    <path d="M7.75 18.035H5.727L5.141 20.085H2.661L5.51 11.615L6.727 8.003H10.145L12.157 14.674L13.791 20.076H10.824L10.258 18.007H7.75ZM7.783 15.978H9.245L8.5 10.578L7.992 12.322L7.467 14.133L7.783 15.978Z"/>
    <!-- l -->
    <path d="M15.023 14.028V7.836H17.429V20.316H15.023V14.028Z"/>
    <!-- i -->
    <path d="M22.497 15.738V20.25H20.077V11.172H22.497V15.738ZM21.102 7.22A1.525 1.525 0 0 1 22.708 8.796A1.485 1.485 0 0 1 21.395 10.272A1.73 1.73 0 0 1 20.039 9.95A1.399 1.399 0 0 1 19.503 8.9A1.475 1.475 0 0 1 20.133 7.5A1.638 1.638 0 0 1 21.102 7.22Z"/>
    <!-- p -->
    <path d="M23.902 17.213V11.226H26.294V11.814A5.26 5.26 0 0 1 27.351 11.139A3.382 3.382 0 0 1 30.285 11.125A3.482 3.482 0 0 1 31.905 12.77A5.644 5.644 0 0 1 32.474 14.963A5.79 5.79 0 0 1 32.052 17.758A4.435 4.435 0 0 1 28.566 20.49A5.602 5.602 0 0 1 26.345 20.389V23.082H23.912V17.213H23.902ZM26.703 16.118V18.496A3.163 3.163 0 0 0 27.91 18.65A2.589 2.589 0 0 0 28.999 17.129A4.682 4.682 0 0 0 29.171 15.454A3.57 3.57 0 0 0 28.48 13.255A1.73 1.73 0 0 0 26.427 12.039A3.016 3.016 0 0 0 25.329 12.509V16.118H26.703Z"/>
    <!-- a -->
    <path d="M41.608 15.957V17.379A9.846 9.846 0 0 1 41.76 19.131L41.932 20.32H39.376L39.241 19.609A5.621 5.621 0 0 1 37.702 20.483A2.886 2.886 0 0 1 34.107 19.79A2.532 2.532 0 0 1 33.394 18.172A3.456 3.456 0 0 1 33.492 16.94A2.175 2.175 0 0 1 34.664 15.538A8.608 8.608 0 0 1 36.644 14.885C37.304 14.726 37.971 14.601 38.638 14.476V14.26A2.087 2.087 0 0 0 38.502 13.21A1.057 1.057 0 0 0 37.734 12.765A3.31 3.31 0 0 0 36.138 13.05C35.605 13.25 35.089 13.492 34.568 13.722L34.145 11.885A17.758 17.758 0 0 1 36.756 10.91A6.566 6.566 0 0 1 39.453 11.002A2.753 2.753 0 0 1 41.5 13.15A4.358 4.358 0 0 1 41.608 14.18V15.957ZM38.806 17.047V16.063A11.156 11.156 0 0 0 37.004 16.609A1.845 1.845 0 0 0 36.56 16.876A1.056 1.056 0 0 0 36.246 18.007A0.934 0.934 0 0 0 37.012 18.784A1.64 1.64 0 0 0 37.636 18.778A4.117 4.117 0 0 0 38.799 18.315V17.047H38.806Z"/>
    <!-- y -->
    <path d="M51.5 11.063L47.327 21.959C47.16 22.397 46.991 22.835 46.829 23.275A0.206 0.206 0 0 1 46.6 23.434H44.468L45.894 20.819L42.319 11.800H45.094L46.886 17.208L48.427 11.85H51.5V11.063Z"/>
  </g>
</svg>
''';
  }
}
