import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:projeto_mobile_clinica/model/bin/Paciente.dart';

class WebService {
  //static final String URL = "http://172.24.40.74:8000";
  static final String URL = 'http://192.168.0.109:8000';

  static Future<Paciente> getPacienteLoginSenha(
      String login, String senha) async {
    try {
      //Se GET
      // http.Response responser = await http.get(URL+'/clinica/login?login=${login.toString()}&senha=${senha.toString()}');
      //Se POST
      http.Response responser = await http.post(URL + '/clinica/login?login',
          body: {'login': login.toString(), 'senha': senha.toString()});
      //print("RESPOSER" + responser.toString());
      String body = responser.body;
      Map valueMap = json.decode(body);
      print(valueMap['response']);
      if (valueMap['response'] == false) {
        print("Response False");
        return null;
      } else {
        return Paciente.fromMapWeb(valueMap['paciente']);
      }
    } catch (e) {
      print("Exceccao!" + e.toString());
      return null;
    }
  }
}