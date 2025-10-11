import 'package:todo_list_provider/app/core/notifier/default_change_notifier.dart';
import 'package:todo_list_provider/app/exceptions/auth_exception.dart';
import 'package:todo_list_provider/app/services/user/user_service.dart';

class RegisterController extends DefaultChangeNotifier {
  final UserService _userService;

  RegisterController({required UserService userService})
    : _userService = userService;

  void registerUser(String email, String password) async {
    try {
      clearState();
      showLoading();
      notifyListeners(); // Notifica estado inicial: loading=true

      final user = await _userService.register(email, password);
      if (user != null) {
        showSuccess();
      } else {
        showError('Erro ao registrar usuário');
      }
    } on AuthException catch (e) {
      showError(e.message);
    } catch (e) {
      // Catch unexpected errors (platform/channel/pigeon decoding issues)
      // so the UI can display a message instead of the app crashing.
      showError(e.toString());
    } finally {
      hideLoading();
      notifyListeners(); // Notifica fim do loading
    }
  }
}
