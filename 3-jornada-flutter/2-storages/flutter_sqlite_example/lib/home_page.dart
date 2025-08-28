import 'package:flutter/material.dart';
import 'package:flutter_sqlite_example/database/database_sqlite.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    _database();
  }

  Future<void> _database() async {
    final database = await DatabaseSQLite().openConnection();

    database.insert('teste', {'nome': 'Beatriz Dadalto'});
    //database.delete('teste', where: 'nome = ?', whereArgs: ['Beatriz Dadalto']);
    /*database.update(
      'teste',
      {'nome': 'Academia do Flutter'},
      where: 'nome = ?',
      whereArgs: ['Beatriz Dadalto'],
    );*/

    //var result = await database.query('teste');
    //print(result);

    //database.rawInsert('INSERT INTO teste VALUES(null, ?)', ['Flutter é top']);
    /*database.rawUpdate('UPDATE teste SET nome = ? WHERE id = ?', [
      'Flutter é 10',
      5,
    ]);*/
    //database.rawDelete('DELETE FROM teste WHERE id = ?', [5]);
    //var result = await database.rawQuery('SELECT * FROM teste');
    //print(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Container(),
    );
  }
}
