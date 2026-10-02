import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pay_buttons/pay_buttons.dart';

class _TestPayButton extends PayButton {
  const _TestPayButton({
    required super.onPressed,
    super.isLoading,
    super.enabled,
    super.semanticLabel,
  });

  @override
  Widget buildButtonContent(BuildContext context) {
    return const Text('Test Pay');
  }

  @override
  PayButtonColors resolveColors(BuildContext context) {
    return const PayButtonColors(
      backgroundColor: Colors.blue,
      progressColor: Colors.white,
    );
  }
}

void main() {
  group('PayButton Base Contract', () {
    testWidgets('renders content and responds to tap when enabled', (tester) async {
      var tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: _TestPayButton(
              onPressed: () => tapped = true,
              semanticLabel: 'Test Pay Button',
            ),
          ),
        ),
      );

      expect(find.text('Test Pay'), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsNothing);

      await tester.tap(find.byType(_TestPayButton));
      await tester.pumpAndSettle();

      expect(tapped, isTrue);
    });

    testWidgets('does not respond to tap when enabled is false', (tester) async {
      var tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: _TestPayButton(
              onPressed: () => tapped = true,
              enabled: false,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(_TestPayButton));
      await tester.pumpAndSettle();

      expect(tapped, isFalse);
    });

    testWidgets('shows CircularProgressIndicator and disables tap when isLoading is true', (tester) async {
      var tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: _TestPayButton(
              onPressed: () => tapped = true,
              isLoading: true,
            ),
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('Test Pay'), findsNothing);

      await tester.tap(find.byType(_TestPayButton));
      await tester.pump();

      expect(tapped, isFalse);
    });

    testWidgets('renders semantics with label', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: _TestPayButton(
              onPressed: () {},
              semanticLabel: 'Custom Semantic Label',
            ),
          ),
        ),
      );

      final semantics = tester.getSemantics(find.byType(_TestPayButton));
      expect(semantics.label, contains('Custom Semantic Label'));
      expect(semantics.flagsCollection.isButton, isTrue);
      expect(semantics.flagsCollection.isEnabled.value, 1);
    });
  });
}
