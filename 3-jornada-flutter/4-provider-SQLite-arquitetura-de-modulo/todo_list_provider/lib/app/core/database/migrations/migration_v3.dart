import 'package:sqflite_common/sqlite_api.dart';
import 'package:todo_list_provider/app/core/database/migrations/migration.dart';

class MigrationV3 implements Migration {
  @override
  void create(Batch batch) {
    batch.execute('''
      CREATE TABLE teste2(
        id Integer primary key autoincrement,
        nome varchar(80),
        age Integer
      )
    ''');
  }

  @override
  void upgrade(Batch batch) {
    batch.execute('''
      CREATE TABLE teste2(
        id Integer primary key autoincrement,
        nome varchar(80),
        age Integer,
        fav_color varchar(20)
      )
    ''');
  }
}
