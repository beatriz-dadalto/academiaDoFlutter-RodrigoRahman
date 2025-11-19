void main() {
  /*
  Tipos Numéricos no Dart:
  int - Números inteiros (sem casas decimais)

  Exemplo: 42, -10, 0
  double - Números de ponto flutuante (com casas decimais)

  Exemplo: 3.14, -0.5, 2.0
  num - Tipo genérico que pode ser int ou double

  É a superclasse de int e double
  Útil quando você quer aceitar qualquer tipo numérico
  */

  int idade = 58;
  int hexBlack = 0XFF000000;

  double y = 1.1;
  double salario = 10000.50;

  int quantidade = 10;
  double preco = 19.99;
  num total = quantidade * preco; // num pode receber int ou double

  // O Dart suporta o uso de underscore (_) como separador de dígitos para melhorar a legibilidade de números grandes.
  double salario2 = 10_000.50;
  int populacao = 1_000_000;
  int hex = 0xFF_00_00_00;
  double pi = 3.141_592_653;

  // É uma forma mais compacta e legível de representar números com muitos zeros!
  double exponents = 1.42e5;
  double a = 1e3; // 1 × 10³ = 1000.0
  double b = 2.5e2; // 2.5 × 10² = 250.0
  double c = 3e-2; // 3 × 10⁻² = 0.03
  double d = 1.5e-3; // 1.5 × 10⁻³ = 0.0015
  double e = 6.02e23; // 6.02 × 10²³ (número de Avogadro)

  // Strings: representa os textos
  String nome = 'Beatriz';
  String multiline = '''Nome
 Beatriz Dadalto
 Programadora''';
  String sobrenome = 'Dadalto';
  String nomeCompleto = '$nome $sobrenome';

  // Boleano: representa valores como verdadeiro e false
  bool aprovado = true;
  bool reprovado = false;

  // Records: estrutura de dados imutaveis
  (int, int) coordenadas = (10, 20);
  ({int idade, String nome}) usuario = (idade: 18, nome: 'Catarina');

  // COLECOES -> List, Set, Map

  // Lists: colecao ordenada de elementos, pode conter repetidos
  List<String> frutas = ['Maçã', 'Banana', 'Laranja'];
  frutas.add('Abacaxi');

  // Sets: colecao nao ordenada de elementos UNICOS
  Set<String> frutasUnicas = {'Maçã', 'Banana', 'Laranja', 'Abacaxi'};

  // Maps: colecoes de pares Chave: Valor
  Map<String, int> telefones = {'Beatriz': 123, 'Anny': 123456};
  telefones['Mia'] = 98248566; // adicionou
  telefones['Beatriz'] = 9824856666; // alterou

  // Runes, symbols, null, dynamic

  // Runes: eh a representacao dos caracteres unicode
  String emoji = '😍';
  emoji.runes;
  Runes leatraA = Runes('\u0041');

  // Symbols: representam identificadores unicos no codigo
  Symbol simbolo = #minhaVariavel;

  // Null: representa a ausencia de valor
  String? nomeNulo;

  // Dynamic: tipo dinamico que pode mudar durante a execução
  dynamic nomeQueviraIdade = 'Mia Colucci';
  nomeQueviraIdade = 5;
}
