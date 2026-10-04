/// Regional branding variants for Afterpay / Clearpay.
enum AfterpayBrand {
  /// Global branding ("afterpay") used in US, Australia, New Zealand, Canada.
  afterpay,

  /// European/UK branding ("clearpay") used in United Kingdom and Europe.
  clearpay;

  /// The official lowercase brand name.
  String get displayName =>
      this == AfterpayBrand.clearpay ? 'clearpay' : 'afterpay';
}
