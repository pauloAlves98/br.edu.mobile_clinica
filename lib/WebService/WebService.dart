import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:projeto_mobile_clinica/model/bin/Consulta.dart';
import 'package:projeto_mobile_clinica/model/bin/Contato.dart';
import 'package:projeto_mobile_clinica/model/bin/Laudo.dart';
import 'package:projeto_mobile_clinica/model/bin/Medico.dart';
import 'package:projeto_mobile_clinica/model/bin/Paciente.dart';

import 'EnderecoUrls.dart';

class WebService {
  //static final String URL = "http://172.24.40.74:8000";
  //static final String URL = 'http://192.168.0.105:8000';
  
  static final String URL = 'http://192.168.137.1:8000';

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
    static Future<bool> laudoSaveEdit(Laudo c, String src) async {//
    print(c.toString()+ " String");
    String d = json.encode(c);
    print(d+ "Encode");
    print(c.toJson());
    //flutter pub run build_runner watch comando para criar os serialzier json
    try {
      http.Response responser = await http.post(URL + src.toString(),
        body:{"Laudo":d});
      String body = responser.body;
      Map valueMap = json.decode(body);
      print(valueMap['response']);
      return valueMap['response'];
    } catch (e) {
      print("Exceccao!" + e.toString());
      return false;
    }
  }
  static Future<List<Laudo>> consultaLaudoAll(int id,String usuario
      ) async {
    try {
      http.Response responser = await http.post(URL + EnderecoUrls.CONSULTA_LAUDO_ALL,
          body: {'id':id.toString(),'usuario':usuario});
      //print("RESPOSER" + responser.toString());
      String body = responser.body;
      Map valueMap = json.decode(body);
      print(valueMap['response']);

      if (valueMap['response'] == false) {
        print("Response False");
        return  List<Laudo>();
      } else {
        print("Entrou Else");
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
   static Future<List<Laudo>> consultaLaudoFiltro(String data1, String data2, String filtro,int id,String usuario
      ) async {
    try {
      http.Response responser = await http.post(URL + (EnderecoUrls.CONSULTA_LAUDO_FILTRO).toString(),
          body: {'data1':data1, 'data2':data2, 'filtro':filtro, 'id':id.toString(),'usuario':usuario});
      //print("RESPOSER" + responser.toString());
      String body = responser.body;
      Map valueMap = json.decode(body);
     //print(valueMap['response']);
print("Response KK");
      if (valueMap['response']==false) {
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
  static Future<List<Consulta>> consultaConsultaFiltro(String data1, String data2, String filtro,int id,String usuario
      ) async {
    try {
      http.Response responser = await http.post(URL + (EnderecoUrls.CONSULTA_LAUDO_FILTRO).toString(),
          body: {'data1':data1, 'data2':data2, 'filtro':filtro, 'id':id,'usuario':usuario});
      //print("RESPOSER" + responser.toString());
      String body = responser.body;
      Map valueMap = json.decode(body);
     //print(valueMap['response']);
      print("Response KK");
      if (valueMap['response']==false) {
        print("Response False");
        return  List<Consulta>();
      } else {

        //print(valueMap['laudos'].length>0?valueMap['laudos'][0]:'Sem Laudo');
        List<Consulta> listl = new List<Consulta>();
        print("Response False");
        print(valueMap['consultas'].toString());
        if(valueMap['consultas']==null)
            return listl;
        for(var i=0;i<valueMap['consultas'].length;i++){
          listl.add(Consulta.fromJson(valueMap['consultas'][i]));
       }
        return listl;
       // Medico.fromJson(valueMap['medico']);
      }
    } catch (e) {
      print("Exceccao!" + e.toString());
      
      return List<Consulta>();
    }
  }
static Future<List<Medico>> consultaMedicoAll(
      ) async {
    try {
      http.Response responser = await http.post(URL + EnderecoUrls.CONSULTA_MEDICO_ALL,
          body: {});
      //print("RESPOSER" + responser.toString());
      String body = responser.body;
      Map valueMap = json.decode(body);
      print(valueMap['response']);

      if (valueMap['response'] == false) {
        print("Response False");
        return  List<Medico>();
      } else {

        print(valueMap['medicos'][0]);
        List<Medico> listl = new List<Medico>();
        for(var i=0;i<valueMap['medicos'].length;i++){
          listl.add(Medico.fromJson(valueMap['medicos'][i]));
       }
        return listl;
       // Medico.fromJson(valueMap['medico']);
      }
    } catch (e) {
      print("Exceccao!" + e.toString());
      return  List<Medico>();
    }
  }

  static Future<List<Medico>> consultaMedicoFiltro(String filtro
      ) async {
    try {
      http.Response responser = await http.post(URL + EnderecoUrls.CONSULTA_MEDICO_FILTRO,
          body: {'filtro':filtro});
      //print("RESPOSER" + responser.toString());
      String body = responser.body;
      Map valueMap = json.decode(body);
      print(valueMap['response']);

      if (valueMap['response'] == false) {
        print("Response False");
        return  List<Medico>();
      } else {

        print(valueMap['medicos'][0]);
        List<Medico> listl = new List<Medico>();
        for(var i=0;i<valueMap['medicos'].length;i++){
          listl.add(Medico.fromJson(valueMap['medicos'][i]));
       }
        return listl;
       // Medico.fromJson(valueMap['medico']);
      }
    } catch (e) {
      print("Exceccao!" + e.toString());
      return  List<Medico>();
    }
  }

  static Future<List<Consulta>> consultaConsultaAll(int id,String usuario
      ) async {
    try {
      http.Response responser = await http.post(URL + EnderecoUrls.CONSULTA_CONSULTA_ALL,
          body: {'id':id,'usuario':usuario});
      //print("RESPOSER" + responser.toString());
      String body = responser.body;
      Map valueMap = json.decode(body);
      print(valueMap['response']);

      if (valueMap['response'] == false) {
        print("Response False");
        return  List<Consulta>();
      } else {

        print(valueMap['consultas'][0]);
        List<Consulta> listl = new List<Consulta>();
        for(var i=0;i<valueMap['consultas'].length;i++){
          listl.add(Consulta.fromJson(valueMap['consultas'][i]));
       }
        return listl;
       // Medico.fromJson(valueMap['medico']);
      }
    } catch (e) {
      print("Exceccao!" + e.toString());
      return  List<Consulta>();
    }
  }
}






