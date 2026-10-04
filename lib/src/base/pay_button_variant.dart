/// Defines the visual layout variant of a payment button.
enum PayButtonVariant {
  /// Dynamically adapts between [full], [medium], and [compact]
  /// based on the available width of the parent container:
  /// - `width > 200dp`: [full] (text + brand logo if text provided)
  /// - `84dp <= width <= 200dp`: [medium] (full brand logo / wordmark)
  /// - `width < 84dp`: [compact] (standalone icon / monogram / badge)
  responsive,

  /// Full variant: Displays custom text (if provided) alongside the brand logo.
  full,

  /// Medium variant: Displays the official brand wordmark or standard logo without custom text.
  medium,

  /// Compact variant: Displays the standalone icon, monogram, or brand emblem without wordmarks or text.
  compact,
}

/// Specifies the position of custom text relative to the brand logo.
enum PayButtonTextPosition {
  /// The custom text precedes the brand logo (e.g. "Buy with [Pay]").
  leading,

  /// The custom text follows the brand logo (e.g. "[Klarna.] Pay in 4").
  trailing,
}
