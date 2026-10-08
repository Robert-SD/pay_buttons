/// Supported color themes for Alipay payment buttons adhering to brand guidelines.
enum AlipayColor {
  /// Signature Alipay Blue (`#1677FF`) background with white typography and emblem.
  blue,

  /// Clean White (`#FFFFFF`) background with border (`#E0E0E0`) and `#1677FF` emblem.
  white,

  /// Deep Black (`#000000`) for high-contrast or dark mode checkouts.
  ///
  /// Note: Official Ant Group Alipay brand guidelines specify blue or white
  /// themes for checkout acceptance buttons.
  @Deprecated(
    'Brand guidelines authorize only primary blue and white themes for checkout buttons.',
  )
  black,
}
