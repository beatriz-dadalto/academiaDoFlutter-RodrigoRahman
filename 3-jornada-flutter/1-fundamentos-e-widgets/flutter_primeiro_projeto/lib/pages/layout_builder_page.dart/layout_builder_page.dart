import 'package:flutter/material.dart';

class LayoutBuilderPage extends StatelessWidget {
  const LayoutBuilderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final statusBar = mediaQuery.padding.top;
    final heightBody = mediaQuery.size.height - statusBar - kToolbarHeight;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Layout Builder'),
      ),
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.red,
                  width: constraints.maxWidth * 0.90,
                  height: constraints.maxHeight * 0.5,
                ),
                Container(
                  color: Colors.purple,
                  width: constraints.maxWidth,
                  height: constraints.maxHeight * 0.5,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
