typedef ValidationResult = ({bool isValid, String message});

ValidationResult passwordValidation(String password) {
  if (password.length < 8) {
    return (
      isValid: false,
      message: 'password precisa ter pelo menso 8 caracteres',
    );
  }

  if (!RegExp(r'[A-Z]').hasMatch(password)) {
    return (
      isValid: false,
      message: 'Password deve ter pelo menos 1 caractere maiúsculo',
    );
  }

  if (!RegExp(r'[0-9]').hasMatch(password)) {
    return (isValid: false, message: 'Password deve ter pelo menos 1 número');
  }

  return (isValid: true, message: 'Password válido!');
}

void main() {
  ValidationResult result = passwordValidation('Pass1234');

  print('Is valid: ${result.isValid}, Message: ${result.message}');
}
