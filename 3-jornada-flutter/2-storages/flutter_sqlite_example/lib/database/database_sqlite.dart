import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DatabaseSQLite {
  Future<void> openConnection() async {
    final databasePath = await getDatabasesPath();
    final databaseFinalPath = join(databasePath, 'SQLITE_EXAMPLE');

    print(databasePath);
    print(databaseFinalPath);

    openDatabase(
      databaseFinalPath,
      version: 1,
      //chamado somente na primeira vez que carrega o app
      onCreate: (Database db, int version) {
        print('onCreate aqui...');
        final batch = db.batch();

        batch.execute('''
          CREATE TABLE teste(
            id Integer primary key autoincrement,
            nome varchar(200)
          )
        ''');
        batch.commit();
      },
      //chamado smepre que houver uma alteracao no version incremental (1 -> 2)
      onUpgrade: (db, oldVersion, newVersion) {
        print('onUpdate aqui...');
      },
      //chamado sempre que houver uma alteracao no version decremental (2 -> 1)
      onDowngrade: (db, oldVersion, newVersion) {
        print('onDowngrade aqui...');
      },
    );
  }
}
