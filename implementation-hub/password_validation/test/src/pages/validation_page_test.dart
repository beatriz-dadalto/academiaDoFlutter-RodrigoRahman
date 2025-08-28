import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:password_validation/src/pages/validation_page.dart';

void main() {
  group('Grupo de validação de tela de password', () {
    (Finder passwordField, Finder confirmPasswordField) getPasswordField(
      WidgetTester tester,
    ) {
      final passwordParentField = find.byKey(Key('password_field'));
      final confirmPasswordParentField = find.byKey(
        Key('confirm_password_field'),
      );

      final passwordField = find.descendant(
        of: passwordParentField,
        matching: find.byType(TextField),
      );
      final confirmPasswordField = find.descendant(
        of: confirmPasswordParentField,
        matching: find.byType(TextField),
      );

      return (passwordField, confirmPasswordField);
    }

    testWidgets('Testando quando preenchimento da senha válida', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: ValidationPage())),
      );

      final (passwordField, confirmPasswordField) = getPasswordField(tester);

      await tester.enterText(passwordField, 'Adf12345678@');
      await tester.enterText(confirmPasswordField, 'Adf12345678@');
      await tester.pumpAndSettle(); // faz todas atualizacoes de telas

      expect(find.text('SENHA APROVADA'), findsOneWidget);
    });

    testWidgets('Testando quando preenchimento da senha inválida', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: ValidationPage())),
      );

      final (passwordField, confirmPasswordField) = getPasswordField(tester);

      await tester.enterText(passwordField, 'Adf12345678');
      await tester.enterText(confirmPasswordField, 'Adf12345678');
      await tester.pumpAndSettle(); // faz todas atualizacoes de telas

      expect(find.text('SENHA REPROVADA'), findsOneWidget);
    });
  });
}
