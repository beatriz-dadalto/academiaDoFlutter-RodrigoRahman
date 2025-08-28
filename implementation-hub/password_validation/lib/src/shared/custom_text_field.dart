import 'package:flutter/material.dart';
import 'package:password_validation/src/shared/colors_app.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final String? hintText;
  final Color backgroundColor;
  final Widget? suffix;
  final TextEditingController controller;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final FocusNode? focusNode;
  final Key? textFieldKey;

  const CustomTextField({
    super.key,
    required this.label,
    this.hintText,
    required this.backgroundColor,
    this.suffix,
    required this.controller,
    required this.obscureText,
    this.validator,
    this.focusNode,
    this.textFieldKey,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    final CustomTextField(
      :label,
      :hintText,
      :backgroundColor,
      :suffix,
      :textFieldKey,
      :controller,
      :validator,
      :focusNode,
      :obscureText,
    ) = widget;

    return Column(
      spacing: 5.0,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.w500,
            color: primaryColor,
          ),
        ),
        TextFormField(
          key: textFieldKey,
          controller: controller,
          validator: validator,
          focusNode: focusNode,
          obscureText: obscureText,
          decoration: InputDecoration(
            fillColor: backgroundColor,
            filled: true,
            isDense: true,
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none,
            ),
            suffixIcon: suffix,
          ),
        ),
      ],
    );
  }
}
