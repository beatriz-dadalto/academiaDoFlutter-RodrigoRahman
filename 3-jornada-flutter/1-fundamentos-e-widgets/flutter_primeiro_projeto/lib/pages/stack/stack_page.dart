import 'package:flutter/material.dart';

class StackPage extends StatelessWidget {
  const StackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stack'),
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.green,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              color: Colors.purple,
              width: 300.0,
              height: 300.0,
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              color: Colors.pinkAccent,
              width: 150.0,
              height: 150.0,
            ),
          ),
          Positioned(
            top: 40.0,
            right: 100.0,
            bottom: 10.0,
            child: Container(
              color: Colors.yellow,
              width: 150.0,
              height: 150.0,
            ),
          ),
        ],
      ),
    );
  }
}
