List<String>? nomesGlobais;
List<String>? nomesGlobais2 = ['Anny', 'Bia', 'Lord', 'Mia'];

void main() {
  print('Nomes disponíveis: ${nomesGlobais?.join(' | ') ?? 'Nenhum nome'}');
  print('Nomes disponíveis: ${nomesGlobais2?.join(' | ') ?? 'Nenhum nome'}');
}

/*
RESUMO

null assert operator (bang) ! afirma que um valor NÃO é NULO
null aware operator ?? retorna um valor padrão se a expressao for nula
null aware assigment ??= atribui um valor somente se a variavel for nula
null aware access ?. acessa uma propriedade somenente se o obj nao for nulo
*/
