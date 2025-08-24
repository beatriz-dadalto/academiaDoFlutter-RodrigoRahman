import 'package:flutter/material.dart';

class ColorsPage extends StatelessWidget {
  const ColorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    //final cor = Colors.blue;
    //final cor = Colors.blue.withValues(alpha: 0.5);
    //const cor = Color.fromRGBO(0, 0, 255, 1);
    const cor = Color(0XFF45D1FD);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Colors'),
      ),
      body: Center(
        child: Container(
          width: 400.0,
          height: 400.0,
          color: cor,
        ),
      ),
    );
  }
}
