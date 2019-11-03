import 'package:projeto_mobile_clinica/Sqlite/SQLUtil.dart';
import 'package:projeto_mobile_clinica/Sqlite/SqLite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'Contato.dart';
import 'Endereco.dart';


class Paciente {
  int id;
  bool ativo = false;
  int cpf;
  int rg;
  String nome_usuario; //Login
  String nome;
  DateTime data_nascimento;
  String senha;
  String sexo;
  Contato contato;
  Endereco endereco;

  Paciente();


  // @override
  // String toString() {
  //   return 'Paciente{id: $id, nome: $nome, login: $login, senha: $senha, ativo: $ativo}';
  // }

  Paciente.fromMapWeb(Map map) {
    
    id = map["id"];
    cpf = map["cpf"];
    rg = map["rg"];
    nome_usuario = map["nome_usuario"];
    nome = map["nome"];
    data_nascimento = DateTime.parse(map["data_nascimento"]);
    senha = map["senha"];
    sexo = map["sexo"];
    contato =  Contato.fromMapWeb(map["id_contato"]);
    endereco = Endereco.fromMapWeb(map["id_endereco"]);
  }

  Paciente.fromMapSqLite(Map map) {
    id = map[TabelaPaciente.COL_ID];
    cpf = map[TabelaPaciente.COL_CPF];
    rg = map[TabelaPaciente.COL_RG];
    nome_usuario = map[TabelaPaciente.COL_NOME_PACIENTE];
    nome = map[TabelaPaciente.COL_NOME];
    data_nascimento = DateTime.parse(map[TabelaPaciente.COL_DATA_NASCIMENTO]);
    senha = map[TabelaPaciente.COL_SENHA];
    sexo = map[TabelaPaciente.COL_SEXO];
    //contato =  Contato.fromMapWeb(map["contato"]); Tem q fazer um join
    //endereco = Endereco.fromMapWeb(map["endereco"]); Tem q fazer um join
    ativo = map[TabelaPaciente.COL_ATIVO] == 1 ? ativo = true : ativo = false;
  }

  

  Map toMap() {
    Map<String, dynamic> map = {
      TabelaPaciente.COL_ID: id,
      TabelaPaciente.COL_CPF: cpf,
      TabelaPaciente.COL_RG: rg,
      TabelaPaciente.COL_NOME_PACIENTE: nome_usuario,
      TabelaPaciente.COL_NOME: nome,
      TabelaPaciente.COL_DATA_NASCIMENTO:data_nascimento,//Talvez tenha que converter em String
      TabelaPaciente.COL_SENHA: senha,
      TabelaPaciente.COL_SEXO: sexo,
      TabelaPaciente.COL_ATIVO: ativo,
    };
    return map;
  }

  Future save() async {
    Database dataBase = await SqlHelper().db;
    int valor = await dataBase.insert(TabelaPaciente.NOME_TABELA, toMap());
    print("VALOR");
    print(valor);
  }

  static Future<List<Paciente>> getAll() async {
    Database dataBase = await SqlHelper().db;
    List listMap = await dataBase.rawQuery(Comum.getAll(TabelaPaciente.NOME_TABELA));
    List<Paciente> Pacientes = List();
    for (Map m in listMap) {
      Pacientes.add(Paciente.fromMapSqLite(m));
    }
    return Pacientes;
  }

  static Future<Paciente> getAtivo() async {
    Database dataBase = await SqlHelper().db;
    List listMapPaciente =
        await dataBase.rawQuery(TabelaPaciente.getAllPorAtivo(true));
    if (listMapPaciente.length > 0) {
      Paciente paciente = Paciente.fromMapSqLite(listMapPaciente.first);
      return paciente;
    }
    return null;
  }

  // static Future removeId(int id) async {
  //   Database dataBase = await SqlHelper().db;
  //   await dataBase.rawDelete(TabelaPaciente.removeId(id));
  // }

  // static Future removeAll() async {
  //   Database dataBase = await SqlHelper().db;
  //   await dataBase.rawDelete(TabelaPaciente.removeAll());
  // }
}
