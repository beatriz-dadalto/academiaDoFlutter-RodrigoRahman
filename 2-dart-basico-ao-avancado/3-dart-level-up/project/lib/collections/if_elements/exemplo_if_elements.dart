/*
if elements é perfeito para incluir ou excluir elementos condicionalmente ao construir coleções, sem precisar de .where() ou lógica separada.

Quando Usar If Elements
✅ Use quando:

Precisa adicionar/remover elementos baseado em condição
Quer evitar .where() e manter código conciso
Está construindo UI (Flutter) com listas condicionais
Precisa de alternativas (if-else) para elementos
❌ Não use quando:

Precisa filtrar muitos elementos (use .where())
A lógica é complexa demais

 ❌ Sem if elements (verboso)
List<Widget> buttons = [button1, button2];
if (showAdminButton) buttons.add(adminButton);
if (showLogoutButton) buttons.add(logoutButton);

 ✅ Com if elements (limpo)
List<Widget> buttons = [
  button1,
  button2,
  if (showAdminButton) adminButton,
  if (showLogoutButton) logoutButton,
];

*/

final incluirChave = false;
final incluirLaranja = true;

void main() {
  final frutas = [
    'Maçã',
    'Banana',
    if (incluirLaranja) 'Laranja' else 'Abacaxi',
    'Pera',
  ];

  print(frutas);

  // com MAP

  final frutasMap = {
    'M': 'Maçã',
    'B': 'Banana',
    if (incluirLaranja) 'L': 'Laranja' else 'A': 'Abacaxi',
    'P': 'Pera',
  };

  print(frutasMap);
}
