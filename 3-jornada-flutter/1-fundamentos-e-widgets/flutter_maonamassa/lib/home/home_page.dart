import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Minha AppBar',
          style: TextStyle(fontFamily: 'Tourney'),
        ),
        backgroundColor: Colors.grey,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add_link_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.airplanemode_active_outlined),
          )
        ],
      ),
      drawer: const Drawer(
        child: Center(
          child: Text('Drawer aberto'),
        ),
      ),
      endDrawer: const Drawer(
        child: Center(
          child: Text('Drawer end'),
        ),
      ),
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue,
                  blurRadius: 20,
                  offset: Offset(10, 10),
                )
              ]),
        ),
      ),
    );
  }
}
