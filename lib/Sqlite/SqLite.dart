import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'SQLUtil.dart';

class SqlHelper {
  static const String NOME_BASE_DADOS = "clinica.db";
  static final SqlHelper _instance = SqlHelper.internal();//Singleton

  factory SqlHelper() => _instance;

  SqlHelper.internal();

  Database _db;

  Future<Database> get db async {
    if (_db == null) {
      _db = await initDd();
    }
    return _db;
  }

  Future<Database> initDd() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, NOME_BASE_DADOS);
    print("Caminho Db "+ databasePath);
    return await openDatabase(path,
        version: 1, onCreate: create, onUpgrade: update);
  }

  void create(Database db, int newVersion) async {
    print("CREATE");
    await db.execute(TabelaContato.createTable);
    await db.execute(TabelaEndereco.createTable);
    await db.execute(TabelaPaciente.createTable);
  }

  void update(Database db, int oldVersion, int newVersion) async {
    print("UPDATE");
//    await db.execute(TabelaUsuario.createTable);
  }
}
