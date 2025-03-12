import 'package:flutter/material.dart';

class MediaQueryPage extends StatelessWidget {
  const MediaQueryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final statusBar = mediaQuery.padding.top;
    final heightBody = mediaQuery.size.height - statusBar - kToolbarHeight;

    print('Largura ${mediaQuery.size.width}');
    print('Altura ${mediaQuery.size.height}');
    print('Orientação ${mediaQuery.orientation}');
    print('StatusBar ${mediaQuery.padding.top}');
    print('AppbarDefault $kToolbarHeight');
    print('StatusBar ${mediaQuery.padding.top}');
    print(
        'HeightBody ${mediaQuery.size.height - mediaQuery.padding.top - kToolbarHeight}');
    print('Tamanho default da AppBar: ${kToolbarHeight}');

    var appBar = AppBar(
      title: const Text('MediaQuery'),
    );

    print('Tamanho da AppBar ${appBar.preferredSize.height}');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Media Query'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.red,
              width: mediaQuery.size.width * 0.5,
              height: heightBody * 0.5,
            ),
            Container(
              color: Colors.purple,
              width: mediaQuery.size.width,
              height: heightBody * 0.5,
            ),
          ],
        ),
      ),
    );
  }
}
