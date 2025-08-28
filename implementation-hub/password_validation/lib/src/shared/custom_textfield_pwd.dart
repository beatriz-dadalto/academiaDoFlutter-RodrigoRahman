import 'package:flutter/material.dart';
import 'package:password_validation/src/shared/custom_text_field.dart';

class CustomTextfieldPwd extends StatefulWidget {
  final String label;
  final Color backgroundColor;
  final TextEditingController controller;

  const CustomTextfieldPwd({
    super.key,
    required this.label,
    required this.backgroundColor,
    required this.controller,
  });

  @override
  State<CustomTextfieldPwd> createState() => _CustomTextfieldPwdState();
}

class _CustomTextfieldPwdState extends State<CustomTextfieldPwd> {
  var obscureText = true;
  @override
  Widget build(BuildContext context) {
    final CustomTextfieldPwd(:label, :backgroundColor, :controller) = widget;

    return CustomTextField(
      label: label,
      backgroundColor: backgroundColor,
      controller: controller,
      obscureText: obscureText,
      suffix: IconButton(
        onPressed: () {
          setState(() {
            obscureText = !obscureText;
          });
        },
        icon: Icon(
          obscureText
          ? Icons.visibility_outlined
          : Icons.visibility_off_outlined,
        ),
      ),
    );
  }
}
