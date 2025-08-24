import 'package:flutter/material.dart';

enum PopupMenuPages {
  container,
  rowsColumns,
  mediaQuery,
  layoutBuilder,
  botoesRotacaoTexto,
  scrollsSingleChild,
  scrollsListView,
  dialogs,
  snackbars,
  forms,
  cidades,
  stack,
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        backgroundColor: Colors.orange[800],
        title: const Text('Home Page'),
        actions: [
          PopupMenuButton<PopupMenuPages>(
            tooltip: 'Clique um item do menu',
            onSelected: (PopupMenuPages valueSelected) {
              switch (valueSelected) {
                case PopupMenuPages.container:
                  Navigator.of(context).pushNamed('/container');
                  break;
                case PopupMenuPages.rowsColumns:
                  Navigator.of(context).pushNamed('/rows_columns');
                case PopupMenuPages.mediaQuery:
                  Navigator.of(context).pushNamed('/media_query');
                case PopupMenuPages.layoutBuilder:
                  Navigator.of(context).pushNamed('/layout_builder');
                case PopupMenuPages.botoesRotacaoTexto:
                  Navigator.of(context).pushNamed('/botoes_rotacao_texto');
                case PopupMenuPages.scrollsSingleChild:
                  Navigator.of(context).pushNamed('/scrolls/single_child');
                case PopupMenuPages.scrollsListView:
                  Navigator.of(context).pushNamed('/scrolls/list_view');
                case PopupMenuPages.dialogs:
                  Navigator.of(context).pushNamed('/dialogs/dialogs_page');
                case PopupMenuPages.snackbars:
                  Navigator.of(context).pushNamed('/snackbars');
                case PopupMenuPages.forms:
                  Navigator.of(context).pushNamed('/forms');
                case PopupMenuPages.cidades:
                  Navigator.of(context).pushNamed('/cidades');
                case PopupMenuPages.stack:
                  Navigator.of(context).pushNamed('/stack');
              }
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<PopupMenuPages>>[
                const PopupMenuItem<PopupMenuPages>(
                  value: PopupMenuPages.container,
                  child: Text('Container'),
                ),
                const PopupMenuItem<PopupMenuPages>(
                  value: PopupMenuPages.container,
                  child: Text('Rows & Columns'),
                ),
                const PopupMenuItem<PopupMenuPages>(
                  value: PopupMenuPages.mediaQuery,
                  child: Text('Media Query'),
                ),
                const PopupMenuItem<PopupMenuPages>(
                  value: PopupMenuPages.layoutBuilder,
                  child: Text('Layout Builder'),
                ),
                const PopupMenuItem<PopupMenuPages>(
                  value: PopupMenuPages.botoesRotacaoTexto,
                  child: Text('Botoes Rotacao Texto'),
                ),
                const PopupMenuItem<PopupMenuPages>(
                  value: PopupMenuPages.scrollsSingleChild,
                  child: Text('Scroll SingleChild'),
                ),
                const PopupMenuItem<PopupMenuPages>(
                  value: PopupMenuPages.scrollsListView,
                  child: Text('Scroll ListView'),
                ),
                const PopupMenuItem<PopupMenuPages>(
                  value: PopupMenuPages.dialogs,
                  child: Text('Dialogs'),
                ),
                const PopupMenuItem<PopupMenuPages>(
                  value: PopupMenuPages.snackbars,
                  child: Text('SnackBars'),
                ),
                const PopupMenuItem<PopupMenuPages>(
                  value: PopupMenuPages.forms,
                  child: Text('Forms'),
                ),
                const PopupMenuItem<PopupMenuPages>(
                  value: PopupMenuPages.cidades,
                  child: Text('Cidades'),
                ),
                const PopupMenuItem<PopupMenuPages>(
                  value: PopupMenuPages.stack,
                  child: Text('Stack'),
                ),
              ];
            },
          ),
        ],
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
          primaryColor: Colors.blueGrey,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.pink,
            ),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('Botão X'),
              ),
              const ContainerCustom(),
              Container(
                height: 150.0,
                width: 150.0,
                color: Theme.of(context).primaryColor,
                child: const Center(
                  child: Text(
                    'Pegou o tema Raiz da main',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              // contextInterno eh o carregado dessa pagina em Theme.of(), nao eh o da raiz/pai
              Builder(
                builder: (contextInterno) {
                  return Container(
                    height: 150.0,
                    width: 150.0,
                    color: Theme.of(contextInterno).primaryColor,
                    child: const Center(
                      child: Text('Container do Builder'),
                    ),
                  );
                },
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Cor do contexto raiz/pai/main'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ContainerCustom extends StatelessWidget {
  const ContainerCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      width: 150.0,
      color: Theme.of(context).primaryColor,
      child: const Center(
        child: Text('ContainerCustom'),
      ),
    );
  }
}
