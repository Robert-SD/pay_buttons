import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'stripe_link_color.dart';

/// Vector asset generator for Link by Stripe branding.
class StripeLinkAssets {
  StripeLinkAssets._();

  /// Renders the official Link logo (icon + wordmark).
  static Widget logo({
    required StripeLinkColor color,
    double height = 22.0,
  }) {
    final String iconColor;
    final String textColor;

    switch (color) {
      case StripeLinkColor.green:
        iconColor = '#0A2540';
        textColor = '#0A2540';
        break;
      case StripeLinkColor.dark:
        iconColor = '#00D66F';
        textColor = '#FFFFFF';
        break;
      case StripeLinkColor.white:
        iconColor = '#00D66F';
        textColor = '#0A2540';
        break;
    }

    return SvgPicture.string(
      _linkSvg(iconColor: iconColor, textColor: textColor),
      height: height,
      fit: BoxFit.contain,
    );
  }

  /// Official Link by Stripe vector geometry.
  static String _linkSvg({
    required String iconColor,
    required String textColor,
  }) {
    return '''
<svg viewBox="0 0 116 36" fill="none" xmlns="http://www.w3.org/2000/svg">
  <!-- Link Interlocking Rings Icon -->
  <g transform="translate(2, 4)">
    <path fill-rule="evenodd" clip-rule="evenodd" d="M12.45 3.35C9.32 0.22 4.25 0.22 1.12 3.35C-2.01 6.48 -2.01 11.55 1.12 14.68L7.15 20.71C10.28 23.84 15.35 23.84 18.48 20.71C21.61 17.58 21.61 12.51 18.48 9.38L16.42 7.32C15.83 6.73 14.88 6.73 14.3 7.32C13.71 7.91 13.71 8.86 14.3 9.44L16.36 11.5C18.31 13.45 18.31 16.63 16.36 18.59C14.41 20.54 11.23 20.54 9.27 18.59L3.24 12.56C1.29 10.61 1.29 7.43 3.24 5.47C5.19 3.52 8.37 3.52 10.33 5.47L12.39 7.53C12.98 8.12 13.93 8.12 14.51 7.53C15.1 6.94 15.1 5.99 14.51 5.41L12.45 3.35Z" fill="$iconColor"/>
    <path fill-rule="evenodd" clip-rule="evenodd" d="M15.55 24.65C18.68 27.78 23.75 27.78 26.88 24.65C30.01 21.52 30.01 16.45 26.88 13.32L20.85 7.29C17.72 4.16 12.65 4.16 9.52 7.29C6.39 10.42 6.39 15.49 9.52 18.62L11.58 20.68C12.17 21.27 13.12 21.27 13.7 20.68C14.29 20.09 14.29 19.14 13.7 18.56L11.64 16.5C9.69 14.55 9.69 11.37 11.64 9.41C13.59 7.46 16.77 7.46 18.73 9.41L24.76 15.44C26.71 17.39 26.71 20.57 24.76 22.53C22.81 24.48 19.63 24.48 17.67 22.53L15.61 20.47C15.02 19.88 14.07 19.88 13.49 20.47C12.9 21.06 12.9 22.01 13.49 22.59L15.55 24.65Z" fill="$iconColor"/>
  </g>

  <!-- Wordmark "link" -->
  <!-- "l" -->
  <rect x="42" y="6" width="4.5" height="22" rx="2.25" fill="$textColor"/>

  <!-- "i" -->
  <circle cx="53.25" cy="8.25" r="2.5" fill="$textColor"/>
  <rect x="51" y="13" width="4.5" height="15" rx="2.25" fill="$textColor"/>

  <!-- "n" -->
  <path d="M62 15.25C62 14.01 63.01 13 64.25 13H64.5C65.74 13 66.75 14.01 66.75 15.25V16.3C68.1 14.2 70.6 12.8 73.5 12.8C78.2 12.8 81.5 16.1 81.5 21.1V25.75C81.5 26.99 80.49 28 79.25 28C78.01 28 77 26.99 77 25.75V21.3C77 18.3 75.1 16.8 72.4 16.8C69.3 16.8 66.75 19.1 66.75 22.6V25.75C66.75 26.99 65.74 28 64.5 28C63.26 28 62.25 26.99 62.25 25.75L62 15.25Z" fill="$textColor"/>

  <!-- "k" -->
  <rect x="87" y="6" width="4.5" height="22" rx="2.25" fill="$textColor"/>
  <path d="M99.8 13.8C100.7 12.9 102.2 13 103 13.9C103.8 14.8 103.7 16.3 102.8 17.1L94.5 23.5L103.2 25.8C104.4 26.1 105.1 27.4 104.8 28.6C104.5 29.8 103.2 30.5 102 30.2L91.5 27.4V24.2L99.8 13.8Z" fill="$textColor"/>
</svg>
''';
  }
}
