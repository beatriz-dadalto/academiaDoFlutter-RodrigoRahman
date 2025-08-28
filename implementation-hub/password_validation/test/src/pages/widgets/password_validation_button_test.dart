import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:password_validation/src/pages/widgets/password_validation_button.dart';
import 'package:password_validation/src/shared/colors_app.dart';

void main() {
  group('Grupo de variações do botão de senha', () {
    testWidgets('Teste apresentação do botão de senha aprovada', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PasswordValidationButton(
              variant: PasswordValidationButtonVariant.approved,
            ),
          ),
        ),
      );

      expect(find.text('SENHA APROVADA'), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
      final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      final colorButton =
          button.style?.backgroundColor?.resolve({}) ?? Colors.transparent;
      expect(colorButton, equals(primaryColor));
    });

    testWidgets('Teste apresentação do botão de senha reprovada', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PasswordValidationButton(
              variant: PasswordValidationButtonVariant.rejected,
            ),
          ),
        ),
      );

      expect(find.text('SENHA REPROVADA'), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
      final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      final colorButton =
          button.style?.backgroundColor?.resolve({}) ?? Colors.transparent;
      expect(colorButton, equals(redColor));
    });

    testWidgets('Teste click ElevatedButton', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PasswordValidationButton(
              variant: PasswordValidationButtonVariant.approved,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(ElevatedButton));
      expect(find.text("SENHA APROVADA"), findsOneWidget);
    });
  });
}
