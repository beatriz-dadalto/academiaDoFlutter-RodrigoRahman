import 'package:todo_list_provider/app/core/notifier/default_change_notifier.dart';
import 'package:todo_list_provider/app/exceptions/auth_exception.dart';
import 'package:todo_list_provider/app/services/user/user_service.dart';

class LoginController extends DefaultChangeNotifier {
  final UserService _userService;

  LoginController({required UserService userService})
    : _userService = userService;

  Future<void> login({required String email, required String password}) async {
    try {
      clearState();
      showLoading();
      notifyListeners();

      final user = await _userService.login(email, password);
      if (user != null) {
        showSuccess();
      } else {
        showError('Erro ao fazer login');
      }
    } on AuthException catch (e) {
      showError(e.message);
    } catch (e) {
      showError('Erro inesperado: ${e.toString()}');
    } finally {
      hideLoading();
      notifyListeners();
    }
  }
}
