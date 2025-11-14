import 'package:flutter/material.dart';

/// Classe base para todos os controllers da aplicação.
///
/// Esta classe deve ser estendida por todos os controllers que precisam
/// notificar mudanças de estado para a UI usando o padrão Provider.
///
/// **Funcionalidades principais:**
/// - Gerenciamento centralizado de estado de loading
/// - Tratamento padronizado de erros
/// - Controle de estado de sucesso para operações
/// - Notificação automática de mudanças para a UI
/// - Dispose seguro de recursos
///
/// **Exemplo de uso:**
/// ```dart
/// class UserController extends DefaultChangeNotifier {
///   String? _userName;
///
///   String? get userName => _userName;
///
///   Future<void> loadUser() async {
///     showLoading();
///     clearError();
///     notifyListeners(); // Controle manual da notificação
///     try {
///       _userName = await userService.getCurrentUser();
///       showSuccess();
///       notifyListeners(); // Notifica sucesso
///     } catch (e) {
///       showError('Erro ao carregar usuário');
///       notifyListeners(); // Notifica erro
///     } finally {
///       hideLoading();
///       notifyListeners(); // Notifica fim do loading
///     }
///   }
/// }
/// ```
///
/// **Padrões recomendados:**
/// - Use `showLoading()` no início de operações assíncronas
/// - Sempre chame `notifyListeners()` após métodos de estado
/// - Use `hideLoading()` no `finally` sempre
/// - Use `showError()` para erros que devem ser exibidos na UI
/// - Use `showSuccess()` para indicar operações bem-sucedidas
/// - Use `clearError()` e `clearSuccess()` antes de novas operações
/// - Implemente `dispose()` para limpar recursos específicos
/// - **IMPORTANTE:** Todos os métodos requerem `notifyListeners()` manual
///
/// **Estados disponíveis:**
/// - `isLoading`: indica se uma operação está em andamento
/// - `error`: mensagem de erro atual (null se não houver erro)
/// - `hasError`: true se existe um erro ativo
/// - `success`: indica se a última operação foi bem-sucedida
///
/// {@category Core}
/// {@category State Management}
/// {@subCategory Controllers}
class DefaultChangeNotifier extends ChangeNotifier {
  bool _loading = false;
  String? _error;
  bool _success = false;
  String? _successMessage;
  bool _disposed = false;

  /// Indica se o controller está executando uma operação assíncrona.
  ///
  /// Use este getter para mostrar indicadores de loading na UI.
  ///
  /// **Exemplo:**
  /// ```dart
  /// if (controller.isLoading) {
  ///   return CircularProgressIndicator();
  /// }
  /// ```
  bool get isLoading => _loading;

  /// Mensagem de erro atual.
  ///
  /// Retorna `null` se não houver erro ativo.
  /// Use este getter para exibir mensagens de erro na UI.
  ///
  /// **Exemplo:**
  /// ```dart
  /// if (controller.hasError) {
  ///   ScaffoldMessenger.of(context).showSnackBar(
  ///     SnackBar(content: Text(controller.error!)),
  ///   );
  /// }
  /// ```
  String? get error => _error;

  /// Indica se existe um erro ativo.
  ///
  /// Conveniência para verificar se `error` não é null.
  bool get hasError => _error != null;

  /// Indica se a última operação foi bem-sucedida.
  ///
  /// Use para mostrar feedback positivo na UI ou navegar para próxima tela.
  ///
  /// **Exemplo:**
  /// ```dart
  /// if (controller.success) {
  ///   Navigator.of(context).pop();
  /// }
  /// ```
  bool get isSuccess => _success;

  /// Mensagem de sucesso customizada.
  ///
  /// Retorna `null` se não houver mensagem ou apenas showSuccess() sem parâmetro.
  /// Use este getter para exibir mensagens personalizadas de sucesso na UI.
  ///
  /// **Exemplo:**
  /// ```dart
  /// if (controller.isSuccess && controller.successMessage != null) {
  ///   ScaffoldMessenger.of(context).showSnackBar(
  ///     SnackBar(content: Text(controller.successMessage!)),
  ///   );
  /// }
  /// ```
  String? get successMessage => _successMessage;

  /// Exibe o estado de loading.
  ///
  /// **Importante:** Você deve chamar `notifyListeners()` manualmente após este método.
  ///
  /// **Exemplo:**
  /// ```dart
  /// Future<void> saveData() async {
  ///   showLoading();
  ///   notifyListeners();
  ///   try {
  ///     await repository.save(data);
  ///   } finally {
  ///     hideLoading();
  ///     notifyListeners();
  ///   }
  /// }
  /// ```
  void showLoading() {
    if (_disposed) return;
    _loading = true;
  }

  /// Oculta o estado de loading.
  ///
  /// **Importante:** Você deve chamar `notifyListeners()` manualmente após este método.
  ///
  /// **Exemplo:**
  /// ```dart
  /// Future<void> saveData() async {
  ///   showLoading();
  ///   notifyListeners();
  ///   try {
  ///     await repository.save(data);
  ///   } finally {
  ///     hideLoading();
  ///     notifyListeners();
  ///   }
  /// }
  /// ```
  void hideLoading() {
    if (_disposed) return;
    _loading = false;
  }

  /// Exibe uma mensagem de erro.
  ///
  /// Automaticamente define `loading` como `false` e `success` como `false`.
  ///
  /// **Importante:** Você deve chamar `notifyListeners()` manualmente após este método.
  ///
  /// **Exemplo:**
  /// ```dart
  /// try {
  ///   await riskyOperation();
  /// } catch (e) {
  ///   showError('Falha na operação: ${e.toString()}');
  ///   notifyListeners();
  /// }
  /// ```
  void showError(String errorMessage) {
    if (_disposed) return;
    _error = errorMessage;
    _loading = false;
    _success = false;
  }

  /// Marca a operação como bem-sucedida.
  ///
  /// Automaticamente limpa qualquer erro existente e define success como true.
  /// Pode aceitar uma mensagem customizada opcional.
  ///
  /// **Importante:** Você deve chamar `notifyListeners()` manualmente após este método.
  ///
  /// **Exemplo:**
  /// ```dart
  /// await repository.save(data);
  /// showSuccess('Dados salvos com sucesso!');
  /// notifyListeners();
  /// ```
  void showSuccess([String? message]) {
    if (_disposed) return;
    _success = true;
    _successMessage = message;
    _error = null; // Limpa erro quando bem-sucedido
  }

  /// Limpa o erro atual.
  ///
  /// Deve ser chamado antes de iniciar novas operações.
  ///
  /// **Importante:** Você deve chamar `notifyListeners()` manualmente após este método.
  ///
  /// **Exemplo:**
  /// ```dart
  /// Future<void> retry() async {
  ///   clearError();
  ///   notifyListeners();
  ///   await performOperation();
  /// }
  /// ```
  void clearError() {
    if (_disposed) return;
    _error = null;
  }

  /// Limpa o estado de sucesso.
  ///
  /// Útil antes de iniciar nova operação.
  ///
  /// **Importante:** Você deve chamar `notifyListeners()` manualmente após este método.
  void clearSuccess() {
    if (_disposed) return;
    _success = false;
    _successMessage = null;
  }

  /// Redefine o controller para o estado inicial.
  ///
  /// Limpa `erro`, `loading`, `success` e `successMessage`. Útil para reset de formulários ou telas.
  ///
  /// **Importante:** Você deve chamar `notifyListeners()` manualmente após este método.
  ///
  /// **Exemplo:**
  /// ```dart
  /// void resetForm() {
  ///   clearState();
  ///   notifyListeners();
  ///   _formData.clear();
  /// }
  /// ```
  void clearState() {
    if (_disposed) return;
    _loading = false;
    _error = null;
    _success = false;
    _successMessage = null;
  }

  @override
  void notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }
}
