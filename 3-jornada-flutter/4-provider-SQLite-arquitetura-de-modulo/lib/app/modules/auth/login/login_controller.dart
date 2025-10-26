import 'package:todo_list_provider/app/core/notifier/default_change_notifier.dart';
import 'package:todo_list_provider/app/exceptions/auth_exception.dart';
import 'package:todo_list_provider/app/services/user/user_service.dart';

class LoginController extends DefaultChangeNotifier {
  final UserService _userService;
  String? infoMessage;

  LoginController({required UserService userService})
    : _userService = userService;

  bool get hasInfo => infoMessage != null;

  Future<void> googleLogin() async {
    try {
      showLoading();
      clearState();
      infoMessage = null;
      notifyListeners(); // update and show loader
      final user = await _userService.googleLogin();
      if (user != null) {
        showSuccess();
      } else {
        _userService.logout();
        showError('Erro ao realizar login com o google');
      }
    } on AuthException catch (e) {
      _userService.logout();
      showError(e.message);
    } finally {
      hideLoading();
      notifyListeners();
    }
  }

  Future<void> login({required String email, required String password}) async {
    try {
      clearState();
      showLoading();
      infoMessage = null;
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

  void forgotPassword(String email) async {
    try {
      clearState();
      showLoading();
      infoMessage = null;
      notifyListeners();
      await _userService.forgotPassword(email);
      infoMessage = 'Reset de senha enviado para seu e-mail';
      // Mensagem genérica por segurança
      //showSuccess();
    } on AuthException catch (e) {
      showError(e.message);
    } catch (e) {
      showError('Erro ao resetar a senha');
    } finally {
      hideLoading();
      notifyListeners();
    }
  }
}
