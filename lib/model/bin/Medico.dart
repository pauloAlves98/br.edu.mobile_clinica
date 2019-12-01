import 'package:projeto_mobile_clinica/Sqlite/SQLUtil.dart';
import 'package:projeto_mobile_clinica/Sqlite/SqLite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'Contato.dart';
import 'Endereco.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Medico.g.dart';

@JsonSerializable(explicitToJson: true)
class Medico{
  int id;
  bool ativo = false;
  String cpf;
  String  rg;
  String nome_usuario; //Login
  String nome;
  DateTime data_nascimento = new DateTime.now();
  String senha;
  String sexo="M";
  Contato id_contato;
  Endereco id_endereco;
  int crm;
  String especialidade;
  String area;
   
   
  Medico();


  // @override
  // String toString() {
  //   return 'Paciente{id: $id, nome: $nome, login: $login, senha: $senha, ativo: $ativo}';
  // }

  Medico.fromMapWeb(Map map) {
    
    id = map["id"];
    cpf = map["cpf"];
    rg = map["rg"];
    nome_usuario = map["nome_usuario"];
    nome = map["nome"];
    data_nascimento = DateTime.parse(map["data_nascimento"]);
    senha = map["senha"];
    sexo = map["sexo"];
    crm = map["crm"];
    especialidade = map["especialidade"];
    area = map["area"];
    id_contato =  Contato.fromMapWeb(map["id_contato"]);
    id_endereco = Endereco.fromMapWeb(map["id_endereco"]);
  }

  Medico.fromMapSqLite(Map map) {
    id = map[TabelaMedico.COL_ID];
    cpf = map[TabelaMedico.COL_CPF];
    rg = map[TabelaMedico.COL_RG];
    nome_usuario = map[TabelaMedico.COL_NOME_MEDICO];
    nome = map[TabelaMedico.COL_NOME];
    data_nascimento = DateTime.parse(map[TabelaMedico.COL_DATA_NASCIMENTO]);
    senha = map[TabelaMedico.COL_SENHA];
    sexo = map[TabelaMedico.COL_SEXO];
    crm = map[TabelaMedico.COL_CRM];
    especialidade = map[TabelaMedico.COL_ESPECIALIDADE];
    area = map[TabelaMedico.COL_AREA];
    //contato =  Contato.fromMapWeb(map["contato"]); Tem q fazer um join
    //endereco = Endereco.fromMapWeb(map["endereco"]); Tem q fazer um join
    ativo = map[TabelaMedico.COL_ATIVO] == 1 ? ativo = true : ativo = false;
    
  }

  

  Map toMap() {
    Map<String, dynamic> map = {
      TabelaMedico.COL_ID: id,
      TabelaMedico.COL_CPF: cpf,
      TabelaMedico.COL_RG: rg,
      TabelaMedico.COL_NOME_MEDICO: nome_usuario,
      TabelaMedico.COL_NOME: nome,
      TabelaMedico.COL_DATA_NASCIMENTO:data_nascimento.toString(),//Talvez tenha que converter em String
      TabelaMedico.COL_SENHA: senha,
      TabelaMedico.COL_SEXO: sexo,
      TabelaMedico.COL_CRM : crm,
      TabelaMedico.COL_ESPECIALIDADE :especialidade,
      TabelaMedico.COL_AREA: area,
      TabelaMedico.COL_ATIVO: ativo,
    };
    return map;
  }
  
  factory Medico.fromJson(Map<String, dynamic> json) => _$MedicoFromJson(json);

  Map<String, dynamic> toJson() => _$MedicoToJson(this);

  Future save() async {
    Database dataBase = await SqlHelper().db;
    int valor = await dataBase.insert(TabelaMedico.NOME_TABELA, toMap());
    print("VALOR");
    print(valor);
  }

  static Future<List<Medico>> getAll() async {
    Database dataBase = await SqlHelper().db;
    List listMap = await dataBase.rawQuery(Comum.getAll(TabelaMedico.NOME_TABELA));
    List<Medico> Medicos = List();
    for (Map m in listMap) {
      Medicos.add(Medico.fromMapSqLite(m));
    }
    return Medicos;
  }

  static Future<Medico> getAtivo() async {
    Database dataBase = await SqlHelper().db;
    List listMapMedico =
        await dataBase.rawQuery(TabelaMedico.getAllPorAtivo(true));
    if (listMapMedico.length > 0) {
      Medico medico = Medico.fromMapSqLite(listMapMedico.first);
      return medico;
    }
    return null;
  }

  // static Future removeId(int id) async {
  //   Database dataBase = await SqlHelper().db;
  //   await dataBase.rawDelete(TabelaMedico.removeId(id));
  // }

  // static Future removeAll() async {
  //   Database dataBase = await SqlHelper().db;
  //   await dataBase.rawDelete(TabelaMedico.removeAll());
  // }
}
