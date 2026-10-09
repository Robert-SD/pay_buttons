/// The intent of an Apple Pay transaction, which determines the wording shown
/// on the button.
///
/// Mirrors the `ApplePayButtonType` values of the official `pay` package, and
/// maps onto the `type` attribute of the Apple Pay JS SDK `<apple-pay-button>`
/// element on web.
enum ApplePayType {
  /// Apple Pay mark only, with no accompanying wording.
  plain,

  /// "Buy with Apple Pay".
  buy,

  /// "Set up Apple Pay".
  setUp,

  /// "Apple Pay in-store".
  inStore,

  /// "Donate with Apple Pay".
  donate,

  /// "Check out with Apple Pay".
  checkout,

  /// "Book with Apple Pay".
  book,

  /// "Subscribe with Apple Pay".
  subscribe,

  /// "Reload with Apple Pay".
  reload,

  /// "Add money with Apple Pay".
  addMoney,

  /// "Top up with Apple Pay".
  topUp,

  /// "Order with Apple Pay".
  order,

  /// "Rent with Apple Pay".
  rent,

  /// "Support with Apple Pay".
  support,

  /// "Contribute with Apple Pay".
  contribute,

  /// "Tip with Apple Pay".
  tip;

  /// The value used by the Apple Pay JS SDK `type` attribute for this intent.
  ///
  /// Apple's JS SDK accepts a hyphenated subset of the native types; intents it
  /// does not define render as the plain mark.
  String get jsValue => switch (this) {
    ApplePayType.plain => 'plain',
    ApplePayType.buy => 'buy',
    ApplePayType.setUp => 'set-up',
    ApplePayType.inStore => 'in-store',
    ApplePayType.donate => 'donate',
    ApplePayType.checkout => 'check-out',
    ApplePayType.book => 'book',
    ApplePayType.subscribe => 'subscribe',
    ApplePayType.reload => 'reload',
    ApplePayType.addMoney => 'add-money',
    ApplePayType.topUp => 'top-up',
    ApplePayType.order => 'order',
    ApplePayType.rent => 'rent',
    ApplePayType.support => 'support',
    ApplePayType.contribute => 'contribute',
    ApplePayType.tip => 'tip',
  };
}
