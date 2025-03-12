import 'package:flutter/material.dart';

class MediaQueryPage extends StatelessWidget {
  const MediaQueryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    print('Largura ${mediaQuery.size.width}');
    print('Altura ${mediaQuery.size.height}');
    print('Orientação ${mediaQuery.orientation}');
    print('StatusBar ${mediaQuery.padding.top}');
    print('AppbarDefault $kToolbarHeight');
    print('StatusBar ${mediaQuery.padding.top}');
    print('HeightBody ${mediaQuery.size.height - mediaQuery.padding.top - kToolbarHeight}');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Media Query'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              color: Colors.red,
              width: mediaQuery.size.width,
              height: mediaQuery.size.height * 0.5,
            ),
          ],
        ),
      ),
    );
  }
}
