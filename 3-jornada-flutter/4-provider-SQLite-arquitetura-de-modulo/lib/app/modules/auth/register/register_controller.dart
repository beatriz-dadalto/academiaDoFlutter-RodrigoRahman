import 'package:flutter/material.dart';
import 'package:todo_list_provider/app/exceptions/auth_exception.dart';
import 'package:todo_list_provider/app/services/user/user_service.dart';

class RegisterController extends ChangeNotifier {
  final UserService _userService;
  String? error;
  bool success = false;

  RegisterController({required UserService userService})
    : _userService = userService;

  void registerUser(String email, String password) async {
    try {
      error = null;
      success = false;
      notifyListeners();
      final user = await _userService.register(email, password);
      if (user != null) {
        success = true;
        error = null;
      } else {
        error = 'Erro ao registrar usuário';
        success = false;
      }
    } on AuthException catch (e) {
      error = e.message;
      success = false;
    } catch (e) {
      // Catch unexpected errors (platform/channel/pigeon decoding issues)
      // so the UI can display a message instead of the app crashing.
      error = e.toString();
      success = false;
    } finally {
      notifyListeners();
    }
  }
}
