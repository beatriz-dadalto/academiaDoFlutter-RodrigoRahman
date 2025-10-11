import 'package:flutter/material.dart';
import 'package:todo_list_provider/app/core/ui/theme_extensions.dart';

class Messages {
  final BuildContext context;
  Messages._(this.context);

  factory Messages.of(BuildContext context) {
    return Messages._(context);
  }

  void showError(String messageError) =>
      _showMessage(message: messageError, color: Colors.red);

  void showInfo(String messageInfo) =>
      _showMessage(message: messageInfo, color: context.primaryColor);

  void _showMessage({required String message, required Color color}) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message), backgroundColor: color));
  }
}
