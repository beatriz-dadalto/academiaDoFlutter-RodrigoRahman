import 'package:flutter/material.dart';

/// Pequeno utilitário com validadores reutilizáveis para formulários.
///
/// Esta classe apenas expõe validadores estáticos que retornam
/// `FormFieldValidator<String>` compatíveis com `TextFormField.validator`.
///
/// A classe possui construtor privado porque não é instanciável — os
/// validadores são acessados como métodos estáticos.
class Validators {
  Validators._();

  /// Retorna um validador que compara o valor do campo atual com o texto
  /// do [valueTxtController].
  ///
  /// - [valueTxtController]: controlador cujo `text` será usado como valor de
  ///   referência para comparação (por exemplo a senha original).
  /// - [message]: mensagem de erro a ser retornada quando os valores não
  ///   coincidem.
  ///
  /// Comportamento:
  /// - Se o valor do campo for `null` ou diferente de `valueTxtController.text`,
  ///   o validador retorna a [message].
  /// - Caso contrário, retorna `null` (validação passada).
  ///
  /// Exemplo de uso:
  /// ```dart
  /// final _passwordController = TextEditingController();
  /// final _confirmController = TextEditingController();
  ///
  /// TextFormField(
  ///   controller: _confirmController,
  ///   validator: Validators.compare(_passwordController, 'Senhas diferentes'),
  /// )
  /// ```
  static FormFieldValidator compare(
    TextEditingController? valueTxtController,
    String message,
  ) {
    return (value) {
      final valueCompare = valueTxtController?.text ?? '';
      if (value == null || value != valueCompare) {
        return message;
      }
      return null;
    };
  }
}
