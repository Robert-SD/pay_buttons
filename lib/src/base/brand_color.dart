import 'pay_button_colors.dart';

/// Contract implemented by brand-specific color palette enums.
abstract interface class BrandColor {
  /// The resolved color palette for this brand theme.
  PayButtonColors get palette;
}
