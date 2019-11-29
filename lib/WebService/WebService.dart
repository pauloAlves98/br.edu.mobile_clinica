import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:projeto_mobile_clinica/model/bin/Contato.dart';
import 'package:projeto_mobile_clinica/model/bin/Paciente.dart';

class WebService {
  //static final String URL = "http://172.24.40.74:8000";
  //static final String URL = 'http://192.168.0.105:8000';
  
  static final String URL = "http://192.168.0.115:8000";

  static Future<Paciente> getPacienteLoginSenha(
      String login, String senha) async {
    try {
      //Se GET
      // http.Response responser = await http.get(URL+'/clinica/login?login=${login.toString()}&senha=${senha.toString()}');
      //Se POST
      http.Response responser = await http.post(URL + '/clinica/login',
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
  static Future<bool> classeSaveEdit(c, String src) async {//
    print(c.toString()+ " String");
    print("AAA");
    try {
      http.Response responser = await http.post(URL + src.toString(),
        body:(c.id == null)? c.toMapSave():c.toMap());
      String body = responser.body;
      Map valueMap = json.decode(body);
      print(valueMap['response']);
      return valueMap['response'];
    } catch (e) {
      print("Exceccao!" + e.toString());
      return false;
    }
  }
  static Future<bool> pacienteSaveEdit(Paciente c, String src) async {//
    print(c.toString()+ " String");
    c.sexo="M";//Esqueci de colocar esse campo!
    String d = json.encode(c);
    print(d+ "Encode");
    print(c.toJson());
    //flutter pub run build_runner watch comando para criar os serialzier json
    try {
      http.Response responser = await http.post(URL + src.toString(),
        body:{"Paciente":d});
      String body = responser.body;
      Map valueMap = json.decode(body);
      print(valueMap['response']);
      return valueMap['response'];
    } catch (e) {
      print("Exceccao!" + e.toString());
      return false;
    }
  }
}




