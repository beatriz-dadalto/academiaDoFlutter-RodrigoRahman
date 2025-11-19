void main() {
  print('soma é: ${soma(7, 25)}');
  exibirMensagem('Olá, Beatriz Dadalto');
  print(saudacao('Bia'));
  print(saudacao('Bia', 'Boa tarde'));
  print(saudacao2());
  print(saudacao2('Boa noite', 'Beatriz'));
  print(saudacao2('Beatriz', 'Tudo bem?'));
  print(formatarEndereco());
  print(formatarEnderecoObrigatorio(rua: 'Manifesto', cidade: 'São Paulo'));
}

// Com parametros OBRAIGATORIOS
int soma(int valorA, int valorB) {
  return valorA + valorB;
}

void exibirMensagem(String mensagem) {
  print(mensagem);
}

// Com parametros OPCIONAIS
String saudacao(String nome, [String? saudacao]) {
  if (saudacao != null) {
    return '$saudacao, $nome';
  } else {
    return nome;
  }
}

String saudacao2([String? nome, String? saudacao]) {
  if (nome != null && saudacao != null) {
    return '$nome, $saudacao';
  }
  return 'Bom dia!';
}

// Com parametros NOMEADOS - eles sao opcionais por default
String formatarEndereco({String? rua, String? cidade}) {
  if (rua != null && cidade != null) {
    return '$rua, $cidade';
  }
  return '';
}

// Com parametros NOMEADOS OBRIGATORIOS
String formatarEnderecoObrigatorio({
  required String rua,
  required String cidade,
}) {
  return '$rua, $cidade';
}
