import 'package:flutter/material.dart';
import 'package:flutter_primeiro_projeto/pages/bottom_navigation_bar/page1.dart';
import 'package:flutter_primeiro_projeto/pages/bottom_navigation_bar/page2.dart';

class BottomNavigatorBarPage extends StatefulWidget {
  const BottomNavigatorBarPage({super.key});

  @override
  State<BottomNavigatorBarPage> createState() => _BottomNavigatorBarPageState();
}

class _BottomNavigatorBarPageState extends State<BottomNavigatorBarPage> {
  int indice = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom Navigation Bar'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indice,
        onTap: (index) {
          setState(() {
            indice = index;
          });
        },
        iconSize: 16.0,
        backgroundColor: Theme.of(context).primaryColorLight,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.add_a_photo_outlined),
            label: 'Página 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.airline_seat_legroom_extra_sharp),
            label: 'Página 2',
          ),
        ],
      ),
      body: IndexedStack(
        index: indice,
        children: [
          Page1(),
          Page2(),
        ],
      ),
    );
  }
}
