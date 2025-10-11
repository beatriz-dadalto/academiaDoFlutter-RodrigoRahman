import 'package:flutter/material.dart';
import 'package:todo_list_provider/app/core/ui/todo_list_icons.dart';

class TodoListField extends StatefulWidget {
  final String label;
  final IconButton? suffixIconButton;
  final bool obscureText;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;

  const TodoListField({
    super.key,
    required this.label,
    this.suffixIconButton,
    this.obscureText = false,
    this.controller,
    this.validator,
  }) : assert(
         obscureText == true ? suffixIconButton == null : true,
         'obscureText nao pode ser enviado em conjunto com suffixIconButton',
       );

  @override
  State<TodoListField> createState() => _TodoListFieldState();
}

class _TodoListFieldState extends State<TodoListField> {
  late final ValueNotifier<bool> obscureTextValueNotifier;

  @override
  void initState() {
    super.initState();
    obscureTextValueNotifier = ValueNotifier<bool>(widget.obscureText);
  }

  @override
  void dispose() {
    obscureTextValueNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: obscureTextValueNotifier,
      builder: (_, obscureTextValue, child) {
        return TextFormField(
          controller: widget.controller,
          validator: widget.validator,
          decoration: InputDecoration(
            labelText: widget.label,
            labelStyle: const TextStyle(fontSize: 15, color: Colors.black),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.red),
            ),
            isDense: true,
            suffixIcon:
                widget.suffixIconButton ??
                (widget.obscureText
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
