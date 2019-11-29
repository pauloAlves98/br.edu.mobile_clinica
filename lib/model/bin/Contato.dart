import 'package:projeto_mobile_clinica/Sqlite/SQLUtil.dart';
import 'package:projeto_mobile_clinica/Sqlite/SqLite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Contato.g.dart';

@JsonSerializable()
class Contato{
  int id;
  String fone1 ;
  String fone2 ;
  String email ;

  Contato();


  @override
  String toString() {
    return 'Contato{id: $id, fone1: $fone1, fone2: $fone2, email: $email}';
  }

  Contato.fromMapWeb(Map map) {//Construtor
    id = map["id"];
    fone1 = map["fone1"];
    fone2 = map["fone2"];
    email = map["email"];
  }

  Contato.fromMapSqLite(Map map) {
    id = map[TabelaContato.COL_ID];
    fone1 = map[TabelaContato.COL_FONE1];
    fone2 = map[TabelaContato.COL_FONE2];
    email = map[TabelaContato.COL_EMAIL];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      TabelaContato.COL_ID: id,
      TabelaContato.COL_FONE1: fone1,
      TabelaContato.COL_FONE2: fone2,
      TabelaContato.COL_EMAIL: email,
    };
    return map;
  }
   Map toMapSave() {
    Map<String, dynamic> map = {
      TabelaContato.COL_FONE1: fone1,
      TabelaContato.COL_FONE2: fone2,
      TabelaContato.COL_EMAIL: email
    };
    return map;
  }
  factory Contato.fromJson(Map<String, dynamic> json) => _$ContatoFromJson(json);
  Map<String, dynamic> toJson() => _$ContatoToJson(this);

  Future save() async {
    Database dataBase = await SqlHelper().db;
    int valor = await dataBase.insert(TabelaContato.NOME_TABELA, toMap());
    print("VALOR");
    print(valor);
  }

  static Future<List<Contato>> getAll() async {
    Database dataBase = await SqlHelper().db;
    List listMap = await dataBase.rawQuery(Comum.getAll(TabelaContato.NOME_TABELA));
    List<Contato> contatos = List();
    for (Map m in listMap) {
      contatos.add(Contato.fromMapSqLite(m));
    }
    return contatos;
  }

  // static Future removeId(int id) async {
  //   Database dataBase = await SqlHelper().db;
  //   await dataBase.rawDelete(TabelaUsuario.removeId(id));
  // }

  // static Future removeAll() async {
  //   Database dataBase = await SqlHelper().db;
  //   await dataBase.rawDelete(TabelaUsuario.removeAll());
  // }
}
