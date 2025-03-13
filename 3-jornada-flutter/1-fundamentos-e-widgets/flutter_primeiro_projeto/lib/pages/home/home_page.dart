import 'package:flutter/material.dart';

enum PopupMenuPages {
  container,
  rowsColumns,
  mediaQuery,
  layoutBuilder,
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
                    child: Text('Layout Builder '),
                  ),
                ];
              })
        ],
      ),
      body: Container(),
    );
  }
}
