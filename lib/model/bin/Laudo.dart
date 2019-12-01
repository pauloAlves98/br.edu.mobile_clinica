import 'package:projeto_mobile_clinica/Sqlite/SQLUtil.dart';
import 'package:projeto_mobile_clinica/Sqlite/SqLite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'Contato.dart';
import 'Endereco.dart';
import 'package:json_annotation/json_annotation.dart';

import 'Medico.dart';
import 'Paciente.dart';

part 'Laudo.g.dart';

@JsonSerializable(explicitToJson: true)
class Laudo{
  int id;
  DateTime data_hora = new DateTime.now();
  Medico id_medico;
  Paciente id_paciente;
  String descricao;
  

   
  Laudo();


  // @override
  // String toString() {
  //   return 'Paciente{id: $id, nome: $nome, login: $login, senha: $senha, ativo: $ativo}';
  // }

  // Laudo.fromMapWeb(Map map) {
    
  //   id = map["id"];
  //   cpf = map["cpf"];
  //   rg = map["rg"];
  //   data_hora = DateTime.parse(map["data_hora"]);
  //   senha = map["senha"];
  //   sexo = map["sexo"];
  //   crm = map["crm"];
  //   especialidade = map["especialidade"];
  //   area = map["area"];
  //   id_paciente =  Paciente.fromMapWeb(map["id_contato"]);
  //   id_endereco = Endereco.fromMapWeb(map["id_endereco"]);
  // }

  Laudo.fromMapSqLite(Map map) {
    id = map[TabelaLaudo.COL_ID];
    data_hora = DateTime.parse(map[TabelaLaudo.COL_DATA_HORA]);
    descricao = map[TabelaLaudo.COL_DESCRICAO];
    //id_paciente =  Paciente.fromMapWeb(map["id_paciente"]); Tem q fazer um join
    //id_medico = Medico.fromMapWeb(map["id_medico"]); Tem q fazer um joi
  }

  

  Map toMap() {
    Map<String, dynamic> map = {
    TabelaLaudo.COL_ID: id,
    TabelaLaudo.COL_DATA_HORA: data_hora,
    TabelaLaudo.COL_DESCRICAO: descricao,
    TabelaLaudo.COL_MEDICO_ID:id_medico.toMap(),
    TabelaLaudo.COL_PACIENTE_ID:id_paciente.toMap(),
    };

    return map;
  }
  
  factory Laudo.fromJson(Map<String, dynamic> json) => _$LaudoFromJson(json);

 Map<String, dynamic> toJson() => _$LaudoToJson(this);

  Future save() async {
    Database dataBase = await SqlHelper().db;
    int valor = await dataBase.insert(TabelaLaudo.NOME_TABELA, toMap());
    print("VALOR");
    print(valor);
  }

  static Future<List<Laudo>> getAll() async {
    Database dataBase = await SqlHelper().db;
    List listMap = await dataBase.rawQuery(Comum.getAll(TabelaLaudo.NOME_TABELA));
    List<Laudo> Laudos = List();
    for (Map m in listMap) {
      Laudos.add(Laudo.fromMapSqLite(m));
    }
    return Laudos;
  }

  // static Future removeId(int id) async {
  //   Database dataBase = await SqlHelper().db;
  //   await dataBase.rawDelete(TabelaLaudo.removeId(id));
  // }

  // static Future removeAll() async {
  //   Database dataBase = await SqlHelper().db;
  //   await dataBase.rawDelete(TabelaLaudo.removeAll());
  // }
}
