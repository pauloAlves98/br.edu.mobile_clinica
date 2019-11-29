import 'package:projeto_mobile_clinica/Sqlite/SQLUtil.dart';
import 'package:projeto_mobile_clinica/Sqlite/SqLite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Endereco.g.dart';

@JsonSerializable()
class Endereco{
  int id;
  String rua;
  int numero;
  String complemento;
  String bairro;
  String cidade;
  String estado;
  String cep;
  String uf = "PE";
    
  Endereco();
  // @override
  // String toString() {
  //   return 'Contato{id: $id, fone1: $fone1, fone2: $fone2, email: $email}';
  // }
  Endereco.fromMapWeb(Map map) {//Construtor
    id = map["id"];
    rua = map["fone1"];
    numero = map["fone2"];
    complemento = map["email"];
    bairro = map["bairro"];
    cidade = map["cidade"];
    estado = map["estado"];
    cep = map["cep"];
    uf = map["uf"];
  }

  Endereco.fromMapSqLite(Map map) {
    id = map["id"];
    rua = map["fone1"];
    numero = map["fone2"];
    complemento = map["email"];
    bairro = map["bairro"];
    cidade = map["cidade"];
    estado = map["estado"];
    cep = map["cep"];
    uf = map["uf"];
  }
  factory Endereco.fromJson(Map<String, dynamic> json) => _$EnderecoFromJson(json);
  Map<String, dynamic> toJson() => _$EnderecoToJson(this);
  Map toMap() {
    Map<String, dynamic> map = {
      TabelaEndereco.COL_ID: id,
      TabelaEndereco.COL_RUA: rua,
      TabelaEndereco.COL_NUMERO: numero,
      TabelaEndereco.COL_COMPLEMENTO: complemento,
      TabelaEndereco.COL_BAIRRO: bairro,
      TabelaEndereco.COL_CIDADE: cidade,
      TabelaEndereco.COL_ESTADO: estado,
      TabelaEndereco.COL_CEP: cep,
      TabelaEndereco.COL_UF: uf,
    };
    return map;
  }
   Map toMapSave() {
    Map<String, dynamic> map = {
      TabelaEndereco.COL_RUA: rua,
      TabelaEndereco.COL_NUMERO: numero,
      TabelaEndereco.COL_COMPLEMENTO: complemento,
      TabelaEndereco.COL_BAIRRO: bairro,
      TabelaEndereco.COL_CIDADE: cidade,
      TabelaEndereco.COL_ESTADO: estado,
      TabelaEndereco.COL_CEP: cep,
      TabelaEndereco.COL_UF: uf,
    };
    return map;
  }

  Future save() async {
    Database dataBase = await SqlHelper().db;
    int valor = await dataBase.insert(TabelaEndereco.NOME_TABELA, toMap());
    print("VALOR");
    print(valor);
  }

  static Future<List<Endereco>> getAll() async {
    Database dataBase = await SqlHelper().db;
    List listMap = await dataBase.rawQuery(Comum.getAll(TabelaEndereco.NOME_TABELA));
    List<Endereco> enderecos= List();
    for (Map m in listMap) {
      enderecos.add(Endereco.fromMapSqLite(m));
    }
    return enderecos;
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
