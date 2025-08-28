import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DatabaseSQLite {
  Future<Database> openConnection() async {
    final databasePath = await getDatabasesPath();
    final databaseFinalPath = join(databasePath, 'SQLITE_EXAMPLE');

    print(databasePath);
    print(databaseFinalPath);

     return await openDatabase(
      databaseFinalPath,
      version: 2,
      onConfigure: (db) async {
        print('--onConfigure sendo chamado--');
        await db.execute('PRAGMA foreign_keys = ON');
      },
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

        batch.execute('''
          CREATE TABLE produto(
            id Integer primary key autoincrement,
            nome varchar(200)
          )
          ''');

        // batch.execute('''
        //   CREATE TABLE categoria(
        //     id Integer primary key autoincrement,
        //     nome varchar(200)
        //   )
        //   ''');

        batch.commit();
      },
      //chamado smepre que houver uma alteracao no version incremental (1 -> 2)
      onUpgrade: (db, oldVersion, newVersion) {
        print('onUpdate aqui...');
        final batch = db.batch();

        if (oldVersion == 1) {
          batch.execute('''
          CREATE TABLE produto(
            id Integer primary key autoincrement,
            nome varchar(200)
          )
          ''');

          // batch.execute('''
          // CREATE TABLE categoria(
          //   id Integer primary key autoincrement,
          //   nome varchar(200)
          // )
          // ''');
        }

        // if (oldVersion == 2) {
        //   batch.execute('''
        //   CREATE TABLE categoria(
        //     id Integer primary key autoincrement,
        //     nome varchar(200)
        //   )
        //   ''');
        // }

        batch.commit();
      },
      //chamado sempre que houver uma alteracao no version decremental (2 -> 1)
      onDowngrade: (db, oldVersion, newVersion) {
        print('onDowngrade aqui...');
        final batch = db.batch();

        if (oldVersion == 3) {
          batch.execute('''
            drop table categoria
          ''');
        }
      },
    );
  }
}
