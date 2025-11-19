/*
1. Descrição curta
2. Paragrafo explicativo (opcional)
3. Descrevaer todos os parametros que vc recebe na sua funcao
4. Exemple - coloque blocos de exemplo do tipo markdown
5. Links para outras funcoes/classes...
*/

/// calcula a soma de numeros inteiros.
/// - [a] é o primeiro numero inteiro.
/// - [b] é o segundo numero inteiro.
/// Exemplo de uso:
/// ```dart
/// var resultado = soma(10,20);
/// print(resultado); // saída: 30
/// ```
int somar(int a, int b) => a + b;

/// Esta funcao calcula o IMC com base do peso e na altura fornecidos.
///
/// - [peso] é o peso da pessoa em quilograma
/// - [altura] é a altura da pessao em metros
///
/// Exemplo de uso:
/// ```dart
/// var imc = calcularIMC(70, 1.75);
/// print(imc); // saída: 22.8571
/// ```
///
/// ### Fórmula do IMC
/// O cálculo do IMC é feito utilizando a seguinte fórmula matemática:
///
/// **IMC = peso / (altura * altura)**
///
/// onde:
/// - `peso`é o peso em quilogramas
/// - `altura` é a altura em metros
///
/// Link: [somar]
double calcularIMC(double peso, double altura) {
  return peso / (altura * altura);
}

void main() {
  print(somar(15, 32));
  print(calcularIMC(70, 1.65));
}
