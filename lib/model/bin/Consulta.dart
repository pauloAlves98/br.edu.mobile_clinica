import 'package:projeto_mobile_clinica/Sqlite/SQLUtil.dart';
import 'package:projeto_mobile_clinica/Sqlite/SqLite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'Contato.dart';
import 'Endereco.dart';
import 'package:json_annotation/json_annotation.dart';

import 'Medico.dart';
import 'Paciente.dart';

part 'Consulta.g.dart';

@JsonSerializable()
class Consulta {
  int id;
  double  valor; 
  String  tipo; 
  String  situacao; 
  DateTime  data_hora; 
  Paciente id_paciente; 
  Medico  id_medico;

  Consulta();


  @override
  String toString() {
    return 'Usuario{id: $id, valor: $valor, situação: $situacao, data_hora: $data_hora, paciente: $id_paciente, medico: $id_medico}';
  }


factory Consulta.fromJson(Map<String, dynamic> json) => _$ConsultaFromJson(json);

 Map<String, dynamic> toJson() => _$ConsultaToJson(this);

 /*  Consulta.fromMapWeb(Map map) {
    id = map["id"];
    valor = map["valor"];
    situacao = map["situacao"];
    tipo = map["tipo"];
    data_hora = DateTime.parse(map["data_hora"]);
    paciente = Paciente.fromMapWeb(map["id_paciente"]);
    medico = Medico.fromMapWeb(map["id_medico"]);
  }
 */
 /*  Usuario.fromMapSqLite(Map map) {
    id = map[TabelaUsuario.COL_ID];
    nome = map[TabelaUsuario.COL_NOME];
    login = map[TabelaUsuario.COL_LOGIN];
    senha = map[TabelaUsuario.COL_SENHA];
    ativo = map[TabelaUsuario.COL_ATIVO] == 1 ? ativo = true : ativo = false;
  } */

  /* Map toMap() {
    Map<String, dynamic> map = {
      TabelaUsuario.COL_ID: id,
      TabelaUsuario.COL_NOME: nome,
      TabelaUsuario.COL_LOGIN: login,
      TabelaUsuario.COL_SENHA: senha,
      TabelaUsuario.COL_ATIVO: ativo,
    };
    return map;
  }
 */
 /*  Future save() async {
    Database dataBase = await SqlHelper().db;
    int valor = await dataBase.insert(TabelaUsuario.NOME_TABELA, toMap());
    print("VALOR");
    print(valor);
  }

  static Future<List<Usuario>> getAll() async {
    Database dataBase = await SqlHelper().db;
    List listMap = await dataBase.rawQuery(TabelaUsuario.getAll());
    List<Usuario> usuarios = List();
    for (Map m in listMap) {
      usuarios.add(Usuario.fromMapSqLite(m));
    }
    return usuarios;
  }

  static Future<Usuario> getAtivo() async {
    Database dataBase = await SqlHelper().db;
    List listMapUsuario =
        await dataBase.rawQuery(TabelaUsuario.getAllPorAtivo(true));
    if (listMapUsuario.length > 0) {
      Usuario usuario = Usuario.fromMapSqLite(listMapUsuario.first);
      return usuario;
    }
    return null;
  }

  static Future removeId(int id) async {
    Database dataBase = await SqlHelper().db;
    await dataBase.rawDelete(TabelaUsuario.removeId(id));
  }

  static Future removeAll() async {
    Database dataBase = await SqlHelper().db;
    await dataBase.rawDelete(TabelaUsuario.removeAll());
  } */
//}

}