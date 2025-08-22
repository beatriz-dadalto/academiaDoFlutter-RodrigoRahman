import 'package:flutter/material.dart';

class ListviewPage extends StatelessWidget {
  const ListviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView Page'),
      ),
      body: ListView.separated(
        itemCount: 1000,
        separatorBuilder: (context, index) {
          return const Divider(
            color: Colors.red,
            thickness: 4.0,
          );
        },
        itemBuilder: (context, index) {
          print('Carregando o índice $index');
          return ListTile(
            title: Text('Índice $index'),
            subtitle: const Text('Flutter é top'),
            leading: const CircleAvatar(
              backgroundColor: Colors.lightBlueAccent,
              maxRadius: 40.0,
              backgroundImage: NetworkImage('https://storage.googleapis.com/cms-storage-bucket/shadow-dash.d406c736e7c4c57f5f61.png'),
            ),
            trailing: const CircleAvatar(
              backgroundColor: Colors.black,
            ),
          );
        },
      ),
    );
  }
}
