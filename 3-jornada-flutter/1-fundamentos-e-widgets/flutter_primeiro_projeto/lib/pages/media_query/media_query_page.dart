import 'package:flutter/material.dart';

class MediaQueryPage extends StatelessWidget {
  const MediaQueryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    // Seus prints para depuração (mantidos para referência, mas o cálculo do body
    // será feito pelo LayoutBuilder para maior precisão)
    final statusBar = mediaQuery.padding.top;
    final bottomSafeArea = mediaQuery.padding.bottom;
    const appBarHeight = kToolbarHeight; // kToolbarHeight é o padrão para AppBar

    print('--- Informações do MediaQuery ---');
    print('Largura Total da Tela: ${mediaQuery.size.width}');
    print('Altura Total da Tela: ${mediaQuery.size.height}');
    print('Orientação: ${mediaQuery.orientation}');
    print('Padding Top (Status Bar): $statusBar');
    print('Padding Bottom (Área Segura Inferior/Barra de Navegação): $bottomSafeArea');
    print('Altura Padrão da AppBar (kToolbarHeight): $appBarHeight');
    print('---------------------------------');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Media Query'),
      ),
      // O body do Scaffold será um LayoutBuilder
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          // 'constraints.maxHeight' nos dá a altura exata disponível para o body
          // do Scaffold, já considerando StatusBar, AppBar e Bottom SafeArea.
          final heightBody = constraints.maxHeight;

          print('Altura REAL Disponível para o Body (obtida via LayoutBuilder): $heightBody');

          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.red,
                  width: mediaQuery.size.width * 0.5, // 50% da largura da tela
                  height: heightBody * 0.5, // 50% da altura REAL disponível para o body
                ),
                Container(
                  color: Colors.purple,
                  width: mediaQuery.size.width, // 100% da largura da tela
                  height: heightBody * 0.5, // 50% da altura REAL disponível para o body
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
