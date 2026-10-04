import 'paypal_button.dart';
import 'paypal_color.dart';
import 'paypal_shape.dart';

/// A specialized PayPal button preconfigured with "Pay Later" text.
class PayPalPayLaterButton extends PayPalButton {
  const PayPalPayLaterButton({
    super.key,
    required super.onPressed,
    super.text = 'Pay Later',
    super.isLoading,
    super.enabled,
    super.width,
    super.height = 48.0,
    super.borderRadius,
    super.margin,
    super.elevation,
    super.semanticLabel,
    super.color = PayPalColor.white,
    super.shape = PayPalShape.pill,
    super.textStyle,
    super.fontFamily,
    super.fontFamilyFallback,
  });

  @override
  String get defaultSemanticLabel => 'PayPal Pay Later';
}
