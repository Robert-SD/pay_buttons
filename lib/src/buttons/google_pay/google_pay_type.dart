/// Supported button types (transaction intents) for Google Pay buttons adhering
/// to official Google Pay guidelines.
enum GooglePayType {
  /// Standard "Pay with GPay" button.
  pay,

  /// "Buy with GPay" button.
  buy,

  /// "Check out with GPay" button.
  checkout,

  /// "Donate with GPay" button.
  donate,

  /// "Order with GPay" button.
  order,

  /// "Book with GPay" button.
  book,

  /// "Subscribe with GPay" button.
  subscribe,

  /// Plain GPay mark without an action verb.
  plain;

  /// The string identifier consumed by the Google Pay Web JS SDK `buttonType`.
  String get jsValue => switch (this) {
    GooglePayType.pay => 'pay',
    GooglePayType.buy => 'buy',
    GooglePayType.checkout => 'checkout',
    GooglePayType.donate => 'donate',
    GooglePayType.order => 'order',
    GooglePayType.book => 'book',
    GooglePayType.subscribe => 'subscribe',
    GooglePayType.plain => 'plain',
  };
}
