import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_localizations/firebase_ui_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PhoneInputView', () {
    testWidgets('shows back button when canPop is true', (tester) async {
      final navigatorKey = GlobalKey<NavigatorState>();

      await tester.pumpWidget(
        MaterialApp(
          navigatorKey: navigatorKey,
          localizationsDelegates: const [
            FirebaseUILocalizations.delegate,
          ],
          home: const SizedBox(),
        ),
      );

      navigatorKey.currentState!.push(
        MaterialPageRoute(
          builder: (_) => const PhoneInputView(
            flowKey: 'test-flow',
          ),
        ),
      );
      await tester.pumpAndSettle();

      final labels = const DefaultLocalizations();
      expect(find.text(labels.goBackButtonLabel), findsOneWidget);
    });

    testWidgets('does not show back button when cannot pop', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: const [
            FirebaseUILocalizations.delegate,
          ],
          home: const PhoneInputView(
            flowKey: 'test-flow',
          ),
        ),
      );

      final labels = const DefaultLocalizations();
      expect(find.text(labels.goBackButtonLabel), findsNothing);
    });
  });
}
