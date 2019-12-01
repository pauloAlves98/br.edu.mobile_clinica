class Comum {

  static String getPorId(int id, String tabela) {
    return "SELECT * FROM $tabela where id='$id'";
  }

  static String getAll(String tabela) {
    return "SELECT * FROM $tabela";
  }

  static String removeId(int id, String tabela) {
    return "DELETE FROM $tabela where id='$id'";
  }

  static String removeAll(String tabela) {
    return "DELETE FROM $tabela";
  }
}

class TabelaUsuario {
  static const String NOME_TABELA = "usuario";
  static const String COL_ID = "id";
  static const String COL_NOME = "nome";
  static const String COL_LOGIN = "login";
  static const String COL_SENHA = "senha";
  static const String COL_ATIVO = "ativo";

  static const createTable = "CREATE TABLE $NOME_TABELA ( "
      "$COL_ID INTEGER PRIMARY KEY, "
      "$COL_NOME TEXT, "
      "$COL_LOGIN TEXT, "
      "$COL_SENHA TEXT, "
      "$COL_ATIVO BOOL);";

  static String getAllPorAtivo(bool ativo) {
    int valor;
    ativo? valor = 1 : valor = 0;
    return "SELECT * FROM $NOME_TABELA where $COL_ATIVO='$valor'";
  }
}
class TabelaPaciente {
  static const String NOME_TABELA = "paciente";
  static const String COL_ID = "id";
  static const String COL_CPF = "cpf";
  static const String COL_RG = "rg";
  static const String COL_NOME_PACIENTE = "nome_usuario";
  static const String COL_DATA_NASCIMENTO = "data_nascimento";
  static const String COL_SENHA = "senha";
  static const String COL_SEXO = "sexo";
  static const String COL_NOME = "nome";
  static const String COL_END_ID = "end_id";
  static const String COL_CONTATO_ID = "contato_id";
  static const String COL_ATIVO = "ativo";

  static const createTable = "CREATE TABLE $NOME_TABELA ( "
      "$COL_ID INTEGER PRIMARY KEY, "
      "$COL_CPF TEXT "
      "$COL_RG TEXT, "
      "$COL_NOME_PACIENTE TEXT, "
      "$COL_DATA_NASCIMENTO TEXT, "
      "$COL_SENHA TEXT, "
      "$COL_SEXO TEXT, "
      "$COL_NOME TEXT, "
      "$COL_END_ID INTEGER, "
      "$COL_CONTATO_ID INTEGER, "
      "$COL_ATIVO BOOL, "
      "FOREIGN KEY($COL_CONTATO_ID) REFERENCES contato(id), "
      "FOREIGN KEY($COL_END_ID) REFERENCES endereco(id));";
       
  static String getAllPorAtivo(bool ativo) {
    int valor;
    ativo? valor = 1 : valor = 0;
    return "SELECT * FROM $NOME_TABELA where $COL_ATIVO='$valor'";
  }
}
class TabelaLaudo {
  static const String NOME_TABELA = "laudo";
  static const String COL_ID = "id";
  static const String COL_DATA_HORA = "data_hora";
  static const String COL_DESCRICAO = "descricao";
  static const String COL_PACIENTE_ID = "paciente_id";
  static const String COL_MEDICO_ID = "medico_id";

  static const createTable = "CREATE TABLE $NOME_TABELA ( "
      "$COL_ID INTEGER PRIMARY KEY, "
      "$COL_DATA_HORA TEXT, "
      "$COL_DESCRICAO TEXT, "
      "$COL_PACIENTE_ID INTEGER, "
      "$COL_MEDICO_ID INTEGER, "
      "FOREIGN KEY($COL_MEDICO_ID) REFERENCES medico(id), "
      "FOREIGN KEY($COL_PACIENTE_ID) REFERENCES paciente(id));";
 
}
class TabelaMedico {
  static const String NOME_TABELA = "medico";
  static const String COL_ID = "id";
  static const String COL_CPF = "cpf";
  static const String COL_RG = "rg";
  static const String COL_NOME_MEDICO = "nome_usuario";
  static const String COL_DATA_NASCIMENTO = "data_nascimento";
  static const String COL_SENHA = "senha";
  static const String COL_SEXO = "sexo";
  static const String COL_NOME = "nome";
  static const String COL_CRM = "crm";
  static const String COL_ESPECIALIDADE = "especialidade";
  static const String COL_AREA = "area";
  static const String COL_END_ID = "end_id";
  static const String COL_CONTATO_ID = "contato_id";
  static const String COL_ATIVO = "ativo";

  static const createTable = "CREATE TABLE $NOME_TABELA ( "
      "$COL_ID INTEGER PRIMARY KEY, "
      "$COL_CPF TEXT, "
      "$COL_RG TEXT, "
      "$COL_NOME_MEDICO TEXT, "
      "$COL_DATA_NASCIMENTO TEXT, "
      "$COL_SENHA TEXT, "
      "$COL_SEXO TEXT, "
      "$COL_NOME TEXT, "
      "$COL_CRM INTEGER, "
      "$COL_ESPECIALIDADE TEXT, "
      "$COL_AREA TEXT, "
      "$COL_END_ID INTEGER, "
      "$COL_CONTATO_ID INTEGER, "
      "$COL_ATIVO BOOL, "
      "FOREIGN KEY($COL_CONTATO_ID) REFERENCES contato(id), "
      "FOREIGN KEY($COL_END_ID) REFERENCES endereco(id));";
       
  static String getAllPorAtivo(bool ativo) {
    int valor;
    ativo? valor = 1 : valor = 0;
    return "SELECT * FROM $NOME_TABELA where $COL_ATIVO='$valor'";
  }
}
class TabelaContato{
  static const String NOME_TABELA = "contato";
  static const String COL_ID = "id";
  static const String COL_FONE1 = "fone1";
  static const String COL_FONE2 = "fone2";
  static const String COL_EMAIL = "email";

  static const createTable = "CREATE TABLE $NOME_TABELA ( "
      "$COL_ID INTEGER PRIMARY KEY, "
      "$COL_FONE1 TEXT, "
      "$COL_FONE2 TEXT, "
      "$COL_EMAIL TEXT);";
}

class TabelaEndereco{
  static const String NOME_TABELA = "endereco";
  static const String COL_ID = "id";
  static const String COL_RUA = "rua";
  static const String COL_NUMERO = "numero";
  static const String COL_COMPLEMENTO = "complemento";
  static const String COL_BAIRRO = "bairro";
  static const String COL_CIDADE = "cidade";
  static const String COL_ESTADO = "estado";
  static const String COL_CEP = "cep";
  static const String COL_UF = "uf";

  static const createTable = "CREATE TABLE $NOME_TABELA ( "
      "$COL_ID INTEGER PRIMARY KEY, "
      "$COL_RUA TEXT, "
      "$COL_NUMERO INTEGER, "
      "$COL_COMPLEMENTO TEXT, "
      "$COL_BAIRRO TEXT, "
      "$COL_CIDADE TEXT, "
      "$COL_ESTADO TEXT, "
      "$COL_CEP TEXT, "
      "$COL_UF TEXT);";
}