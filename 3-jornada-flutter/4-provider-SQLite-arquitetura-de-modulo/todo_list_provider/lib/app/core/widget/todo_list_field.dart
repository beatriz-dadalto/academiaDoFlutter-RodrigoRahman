import 'package:flutter/material.dart';
import 'package:todo_list_provider/app/core/ui/todo_list_icons.dart';

class TodoListField extends StatelessWidget {
  final String label;
  final IconButton? suffixIconButton;
  final bool obscureText;
  final ValueNotifier<bool> obscureTextValueNotifier;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;

  TodoListField({
    super.key,
    required this.label,
    this.suffixIconButton,
    this.obscureText = false,
    this.controller,
    this.validator
  }) : assert(
         obscureText == true ? suffixIconButton == null : true,
         'obscureText nao pode ser enviado em conjunto com suffixIconButton',
       ),
       obscureTextValueNotifier = ValueNotifier(obscureText);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: obscureTextValueNotifier,
      builder: (_, obscureTextValue, child) {
        return TextFormField(
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(fontSize: 15, color: Colors.black),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.red),
            ),
            isDense: true,
            suffixIcon:
                suffixIconButton ??
                (obscureText == true
                    ? IconButton(
                        onPressed: () {
                          obscureTextValueNotifier.value = !obscureTextValue;
                        },
                        icon: Icon(
                          !obscureTextValue
                              ? TodoListIcons.eyeSlash
                              : TodoListIcons.eye,
                          size: 15,
                        ),
                      )
                    : null),
          ),
          obscureText: obscureTextValue,
        );
      },
    );
  }
}
