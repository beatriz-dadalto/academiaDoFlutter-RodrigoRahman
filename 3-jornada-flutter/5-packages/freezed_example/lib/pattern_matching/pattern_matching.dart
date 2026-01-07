import 'package:freezed_annotation/freezed_annotation.dart';

part 'pattern_matching.freezed.dart';

@freezed
class Union with _$Union {
  factory Union(int value) = UnionData;
  factory Union.loading() = UnionLoading;
  factory Union.error([String? message]) = UnionError;
}

void main() {
  var union = Union(25);

  /*
    PATTERN MATCHING para conseguir acessar os atributos da classe!
    when, maybeWhen, map, maybeMap
  */

  //! When to use each:
  // when       → Simple checks, must handle all
  // maybeWhen  → Optional handling, simple logic
  // map        → Need full object properties
  // maybeMap   → Need full object properties, optional handling


  // when obriga a iniciar todos os construtores da class, evitar usar if is
  //! WHEN - Must handle ALL 3 factories, receives PARAMETERS
  var mensagemWhen = union.when<String>(
    (value) => 'Union data implementado',
    loading: () => 'Loading implementado',
    error: (String? message) => 'Erro implementado',
  );

  // possibilita implementar apenas um dos contrutores
  //! MAYBEWEN - Handle SOME factories, receives PARAMETERS
  var mensagemMaybeWhen = union.maybeWhen(
    null,
    error: (String? message) => 'Error maybeWhen',
    orElse: () => 'Padrão maybeWhen implementado',
  );

  // diferença map e when: no map recebemos a classe
  //! MAP - Must handle ALL 3 factories, receives CLASS INSTANCES
  // You get the entire object, can access any property
  var mensagemMap = union.map(
    (UnionData value) => '${value.runtimeType} implementado',
    loading: (UnionLoading loading) => '${loading.runtimeType} implementado',
    error: (UnionError error) => '${error.runtimeType} implementado',
  );

  //! MAYBEMAP - Handle SOME factories, receives CLASS INSTANCES
  // Only handling UnionData + loading + fallback
  var mensagemMaybeMap = union.maybeMap(
    (UnionData value) => 'retornando data: ${value.value}',
    loading: (UnionLoading loading) => 'retornando loading',
    orElse: () => 'Padrao maybyMap',
  );

  print(mensagemWhen);
  print(mensagemMaybeWhen);
  print(mensagemMap);
  print(mensagemMaybeMap);
}
