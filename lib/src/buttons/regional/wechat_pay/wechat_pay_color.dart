/// Supported color themes for WeChat Pay buttons adhering to brand guidelines.
enum WeChatPayColor {
  /// Signature WeChat Pay Green (`#07C160`) background with white typography and emblem.
  green,

  /// Clean White (`#FFFFFF`) background with border (`#E0E0E0`) and `#07C160` emblem.
  white,

  /// Deep Black (`#000000`) for high-contrast or dark mode checkouts.
  ///
  /// Note: Official Tencent WeChat Pay brand guidelines specify green or white
  /// themes for checkout acceptance buttons.
  @Deprecated(
    'Brand guidelines authorize only primary green and white themes for checkout buttons.',
  )
  black,
}
