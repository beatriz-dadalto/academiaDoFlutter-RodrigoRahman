import 'package:flutter/material.dart';
import 'package:password_validation/src/pages/widgets/password_dot_validation_widget.dart';
import 'package:password_validation/src/shared/colors_app.dart';

class PasswordValidationPanelWidget extends StatefulWidget {
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final ValueChanged<bool> passwordValid;

  const PasswordValidationPanelWidget({
    super.key,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.passwordValid,
  });

  @override
  State<PasswordValidationPanelWidget> createState() =>
      _PasswordValidationPanelWidgetState();
}

class _PasswordValidationPanelWidgetState
    extends State<PasswordValidationPanelWidget> {
  final validationRulesPasswordText = ValueNotifier('');
  final linkedConfirmPasswordText = ValueNotifier('');
  final approvedRules = List.generate(5, (_) => false);
  var passwordValid = false;

  @override
  void initState() {
    final PasswordValidationPanelWidget(
      :passwordController,
      :confirmPasswordController,
    ) = widget;

    passwordController.addListener(() {
      validationRulesPasswordText.value = passwordController.text;
    });
    confirmPasswordController.addListener(() {
      linkedConfirmPasswordText.value = confirmPasswordController.text;
    });

    super.initState();
  }

  void updateValidRule(ValueKey<int> key, bool isValid) {
    approvedRules[key.value] = isValid;
    checkRules();
  }

  void checkRules() {
    final isAllRulesValid = approvedRules.every((rule) => rule);
    if (isAllRulesValid != passwordValid) {
      passwordValid = isAllRulesValid;
      widget.passwordValid(isAllRulesValid);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 11.0,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 6.0),
          child: Text(
            'SUA SENHA DEVE CONTER',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
          ),
        ),

        PasswordDotValidationWidget(
          label: 'Mínimo de 8 caracteres',
          key: ValueKey<int>(0),
          passwordValue: validationRulesPasswordText,
          patternValidation: r'^.{8,}$',
          updateMatch: updateValidRule,
        ),
        PasswordDotValidationWidget(
          label: '1 letra Maiúscula',
          key: ValueKey<int>(1),
          passwordValue: validationRulesPasswordText,
          patternValidation: r'[A-Z]',
          updateMatch: updateValidRule,
        ),
        PasswordDotValidationWidget(
          label: '1 ou mais números',
          key: ValueKey<int>(2),
          passwordValue: validationRulesPasswordText,
          patternValidation: r'[0-9]+',
          updateMatch: updateValidRule,
        ),
        PasswordDotValidationWidget(
          label: '1 ou mais caracteres especiais - ^#%!@',
          key: ValueKey<int>(3),
          passwordValue: validationRulesPasswordText,
          patternValidation: r'[^\w\s]+',
          updateMatch: updateValidRule,
        ),
        ValueListenableBuilder(
          valueListenable: widget.confirmPasswordController,
          builder: (_, confirmPasswordText, child) {
            return PasswordDotValidationWidget(
              label: 'Senha igual a repetir senha',
              key: ValueKey<int>(4),
              passwordValue: validationRulesPasswordText,
              patternValidation:
                  '^${RegExp.escape(confirmPasswordText.text)}\$',
              updateMatch: updateValidRule,
            );
          },
        ),
      ],
    );
  }
}
