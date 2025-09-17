import 'package:todo_list_provider/app/core/database/migrations/migration.dart';
import 'package:todo_list_provider/app/core/database/migrations/migration_v1.dart';
import 'package:todo_list_provider/app/core/database/migrations/migration_v2.dart';
import 'package:todo_list_provider/app/core/database/migrations/migration_v3.dart';

class SqliteMigrationFactory {

  List<Migration> getCreateMigration() => [
    MigrationV1(),
    MigrationV2(),
    MigrationV3(),
  ];

  List<Migration> getUpgradeMigration(int version) {
    /* VERSAO MANUAL
    final migrations = <Migration>[];

    if (version == 1) {
      migrations.add(MigrationV2());
      migrations.add(MigrationV3());
    }

    if (version == 2) {
      migrations.add(MigrationV3());
    }
    return migrations;
    */

    final migrations = getCreateMigration();
    
    /*
    Resumindo a linha return migrations.sublist(version);
    Ela retorna apenas as migrações que precisam ser aplicadas, a partir da versão atual do banco.
    Exemplo: se o banco está na versão 1, retorna as migrações da 2 em diante.
    Mas, para funcionar, a lista migrations precisa estar preenchida com todas as migrações.
    */
    return migrations.sublist(version);
  }
}
