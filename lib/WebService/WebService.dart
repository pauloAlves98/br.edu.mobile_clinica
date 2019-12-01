import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:projeto_mobile_clinica/model/bin/Contato.dart';
import 'package:projeto_mobile_clinica/model/bin/Laudo.dart';
import 'package:projeto_mobile_clinica/model/bin/Medico.dart';
import 'package:projeto_mobile_clinica/model/bin/Paciente.dart';

import 'EnderecoUrls.dart';

class WebService {
  //static final String URL = "http://172.24.40.74:8000";
  //static final String URL = 'http://192.168.0.105:8000';
  
  static final String URL = "http://192.168.0.104:8000";

  static Future<Paciente> getPacienteLoginSenha(
      String login, String senha) async {
    try {
      //Se GET
      // http.Response responser = await http.get(URL+'/clinica/login?login=${login.toString()}&senha=${senha.toString()}');
      //Se POST
      http.Response responser = await http.post(URL + EnderecoUrls.LOGIN_PACIENTE,
          body: {'login': login.toString(), 'senha': senha.toString()});
      //print("RESPOSER" + responser.toString());
      String body = responser.body;
      Map valueMap = json.decode(body);
      print(valueMap['response']);
      if (valueMap['response'] == false) {
        print("Response False");
        return null;
      } else {
        print(valueMap['paciente']);
        return Paciente.fromJson(valueMap['paciente']);
      }
    } catch (e) {
      print("Exceccao!" + e.toString());
      return null;
    }
  }
  static Future<Medico> getMedicoLoginSenhaCrm(
      String login, String senha,int crm) async {
    try {
      http.Response responser = await http.post(URL + EnderecoUrls.LOGIN_MEDICO,
          body: {'login': login.toString(), 'senha': senha.toString(), 'crm':crm.toString()});
      //print("RESPOSER" + responser.toString());
      String body = responser.body;
      Map valueMap = json.decode(body);
      print(valueMap['response']);

      if (valueMap['response'] == false) {
        print("Response False");
        return null;
      } else {
        print(valueMap['medico']);
        return Medico.fromJson(valueMap['medico']);
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
  static Future<bool> medicoSaveEdit(Medico c, String src) async {//
    print(c.toString()+ " String");
    c.sexo="M";//Esqueci de colocar esse campo!
    String d = json.encode(c);
    print(d+ "Encode");
    print(c.toJson());
    //flutter pub run build_runner watch comando para criar os serialzier json
    try {
      http.Response responser = await http.post(URL + src.toString(),
        body:{"Medico":d});
      String body = responser.body;
      Map valueMap = json.decode(body);
      print(valueMap['response']);
      return valueMap['response'];
    } catch (e) {
      print("Exceccao!" + e.toString());
      return false;
    }
  }
  static Future<List<Laudo>> consultaLaudoAll(
      ) async {
    try {
      http.Response responser = await http.post(URL + EnderecoUrls.CONSULTA_LAUDO_ALL,
          body: {});
      //print("RESPOSER" + responser.toString());
      String body = responser.body;
      Map valueMap = json.decode(body);
      print(valueMap['response']);

      if (valueMap['response'] == false) {
        print("Response False");
        return  List<Laudo>();
      } else {

        print(valueMap['laudos'][0]);
        List<Laudo> listl = new List<Laudo>();
        for(var i=0;i<valueMap['laudos'].length;i++){
          listl.add(Laudo.fromJson(valueMap['laudos'][i]));
       }
        return listl;
       // Medico.fromJson(valueMap['medico']);
      }
    } catch (e) {
      print("Exceccao!" + e.toString());
      return  List<Laudo>();
    }
  }
   static Future<List<Laudo>> consultaLaudoFiltro(String data1, String data2, String filtro
      ) async {
    try {
      http.Response responser = await http.post(URL + (EnderecoUrls.CONSULTA_LAUDO_FILTRO).toString(),
          body: {'data1':data1, 'data2':data2, 'filtro':filtro});
      //print("RESPOSER" + responser.toString());
      String body = responser.body;
      Map valueMap = json.decode(body);
     //print(valueMap['response']);
print("Response KK");
      if (false) {
        print("Response False");
        return  List<Laudo>();
      } else {

        //print(valueMap['laudos'].length>0?valueMap['laudos'][0]:'Sem Laudo');
        List<Laudo> listl = new List<Laudo>();
        print("Response False");
        print(valueMap['laudos'].toString());
        if(valueMap['laudos']==null)
            return listl;
        for(var i=0;i<valueMap['laudos'].length;i++){
          listl.add(Laudo.fromJson(valueMap['laudos'][i]));
       }
        return listl;
       // Medico.fromJson(valueMap['medico']);
      }
    } catch (e) {
      print("Exceccao!" + e.toString());
      
      return List<Laudo>();
    }
  }
}






