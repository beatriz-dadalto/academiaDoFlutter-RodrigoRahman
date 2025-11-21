// ignore_for_file: unused_local_variable

void main() {
  int nonNullableNumber = 42;
  int? nullableNumber;

  String nome = 'Beatriz';
  String? nomeNull;

  List<String?> listaNaoNulaQueAceitaNulo = ['Beatriz', null, 'Dadalto'];
  List<String> listaNaoNulaQueNaoAceitaNulo = ['Beatriz', 'Dadalto'];
  List<String>? listaPodeSerNula;

  Map<String, String> naoNulo = {'Nome': 'Beatriz Dadalto'};
  Map<String, String>? mapaPodeSerNulo;
  Map<String, String?> mapaComValorNulo = {
    'Nome': null,
    'Sobrenome': 'Dadalto',
  };
  
}
