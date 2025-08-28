import 'package:flutter/material.dart';
import 'package:password_validation/src/pages/widgets/password_validation_button.dart';
import 'package:password_validation/src/pages/widgets/password_validation_panel_widget.dart';
import 'package:password_validation/src/shared/colors_app.dart';
import 'package:password_validation/src/shared/custom_textfield_pwd.dart';

class ValidationPage extends StatefulWidget {
  const ValidationPage({super.key});

  @override
  State<ValidationPage> createState() => _ValidationPageState();
}

class _ValidationPageState extends State<ValidationPage> {
  final passwordValidationController = TextEditingController();
  final confirmPasswordValidationController = TextEditingController();
  final passwordValidValueNotifier = ValueNotifier(false);

  @override
  void dispose() {
    passwordValidationController.dispose();
    confirmPasswordValidationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: lightGreyColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 30.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 44.0, bottom: 42.0),
                  child: Image.asset('assets/images/logo.png'),
                ),
                Text(
                  'Defina uma senha!',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
                Text(
                  'Uma senha forte ajuda a manter sua conta segura',
                  style: TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.w600,
                    color: mediumGreyColor,
                  ),
                ),
                SizedBox(height: 26.0),
                CustomTextfieldPwd(
                  key: Key('password_field'),
                  label: 'Senha',
                  backgroundColor: Colors.white,
                  controller: passwordValidationController,
                ),
                SizedBox(height: 22.0),
                CustomTextfieldPwd(
                  key: Key('confirm_password_field'),
                  label: 'Repetir Senha',
                  backgroundColor: Colors.white,
                  controller: confirmPasswordValidationController,
                ),
                SizedBox(height: 37.0),
                PasswordValidationPanelWidget(
                  passwordController: passwordValidationController,
                  confirmPasswordController:
                      confirmPasswordValidationController,
                  passwordValid: (bool value) {
                    Future.microtask(() {
                      passwordValidValueNotifier.value = value;
                    });
                  },
                ),
                SizedBox(height: 40.0),
                ValueListenableBuilder(
                  valueListenable: passwordValidValueNotifier,
                  builder: (_, passwordIsValid, _) {
                    return PasswordValidationButton(
                      variant:
                          passwordIsValid
                              ? PasswordValidationButtonVariant.approved
                              : PasswordValidationButtonVariant.rejected,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
