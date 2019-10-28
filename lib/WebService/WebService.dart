import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:projeto_mobile_clinica/model/bin/Paciente.dart';

class WebService {
  //static final String URL = "http://172.24.40.74:8000";
  static final String URL = "http://127.0.0.1:8000";
  static Future<Paciente> getPacienteLoginSenha(Paciente paciente) async {
    http.Response responser = await http
        .get(URL + '/clinica/login?login=${paciente.nome_paciente}&senha=${paciente.senha}');
    print(responser);
    String body = responser.body;
    Map valueMap = json.decode(body);
    print(valueMap['response']);
    if (valueMap['response'] == false) {
      print("Response False");
      return null;
    } else {
      return Paciente.fromMapWeb(valueMap['paciente']);
    }
  }
}
