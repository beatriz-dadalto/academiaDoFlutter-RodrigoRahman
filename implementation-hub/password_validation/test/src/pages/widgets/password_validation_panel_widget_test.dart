import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:password_validation/src/pages/widgets/password_dot_validation_widget.dart';
import 'package:password_validation/src/pages/widgets/password_validation_panel_widget.dart';

void main() {
  group("Teste do componente de painel de validação de password", () {
    late TextEditingController passwordController;
    late TextEditingController confirmPasswordController;
    late bool passwordValid;

    // setup() vai executar toda vez que eu chamar um teste
    setUp(() {
      passwordController = TextEditingController();
      confirmPasswordController = TextEditingController();
      passwordValid = false;
    });

    Future<void> pumpWidget(WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PasswordValidationPanelWidget(
              passwordController: passwordController,
              confirmPasswordController: confirmPasswordController,
              passwordValid: (valid) {
                passwordValid = valid;
              },
            ),
          ),
        ),
      );
    }

    testWidgets('Cenário 1: Senha válida', (tester) async {
      await pumpWidget(tester);
      passwordController.text = 'Valid1Password!';
      confirmPasswordController.text = 'Valid1Password!';
      await tester.pump();

      expect(passwordValid, isTrue);
    });

    testWidgets('Cenário 2: Senha inválida com Menos de 8 caracteres', (
      tester,
    ) async {
      await pumpWidget(tester);
      passwordController.text = 'Short1!';
      confirmPasswordController.text = 'Short1!';
      await tester.pump();

      final dotVisibilityFinder = find.descendant(
        of: find.byKey(ValueKey(0)),
        matching: find.byType(Visibility),
      );

      final dotVisibility = tester.widget<Visibility>(dotVisibilityFinder);

      expect(passwordValid, isFalse);
      expect(dotVisibility.visible, isFalse);
    });

    testWidgets('Cenário 2: Senha inválida SOMENTE Menos de 8 caracteres', (
      tester,
    ) async {
      await pumpWidget(tester);
      passwordController.text = 'Short1!';
      confirmPasswordController.text = 'Short1!';
      await tester.pump();

      final dotRulesFilter = find.byType(PasswordDotValidationWidget);

      for (final dot in dotRulesFilter.evaluate()) {
        final widgetKey = dot.widget.key!;
        final dotVisibilityFinder = find.descendant(
          of: find.byKey(widgetKey),
          matching: find.byType(Visibility),
        );
        final dotVisibility = tester.widget<Visibility>(dotVisibilityFinder);

        if (widgetKey == ValueKey(0)) {
          expect(dotVisibility.visible, isFalse);
        } else {
          expect(dotVisibility.visible, isTrue);
        }
      }

      expect(passwordValid, isFalse);

    });

    testWidgets('Cenário 3: Senha inválida Sem letra maiúscula', (
      tester,
    ) async {
      await pumpWidget(tester);
      passwordController.text = 'valid1password!';
      confirmPasswordController.text = 'valid1password!';
      await tester.pump();

      expect(passwordValid, isFalse);
    });

    testWidgets('Cenário 4: Senha inválida Sem número', (tester) async {
      await pumpWidget(tester);
      passwordController.text = 'validPassword!';
      confirmPasswordController.text = 'validPassword!';
      await tester.pump();

      expect(passwordValid, isFalse);
    });

    testWidgets('Cenário 5: Senha inválida Sem letras', (tester) async {
      await pumpWidget(tester);
      passwordController.text = '12345678!';
      confirmPasswordController.text = '12345678!';
      await tester.pump();

      expect(passwordValid, isFalse);
    });

    testWidgets('Cenário 6: Senha inválida Repetir senha diferente de senha', (
      tester,
    ) async {
      await pumpWidget(tester);
      passwordController.text = 'Adf12345678@';
      confirmPasswordController.text = 'Adf12345678';
      await tester.pump();

      expect(passwordValid, isFalse);
    });
  });
}
