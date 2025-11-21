// variavel de nivel superior ou GLobal
int variavelGlobal = 42;

void funcaoGlobal() {
  print('Todo mundo consegue acessa-la');
}

int _variavelPrivadaGlobal = 42;
void _funcaoPrivada() {}

void qualquer() {
  variavelGlobal;
  funcaoGlobal();
  _funcaoPrivada();
  _variavelPrivadaGlobal;
}
