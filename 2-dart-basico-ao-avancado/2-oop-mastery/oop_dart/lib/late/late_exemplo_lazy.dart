void main() {
  // late -> otimizar algum processo, use quando precisa de alguma condicao especifica
  late final temperatura = lerTemperatura();

  print('Olá, Beatriz');
  print('Vou te mostrar a temperatura');
  print('A temperatura é $temperatura');
}

String lerTemperatura() {
  print('Lendo temperatura');
  return '30';
}
