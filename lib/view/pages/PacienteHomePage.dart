import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:projeto_mobile_clinica/view/pages/ChatPage.dart';
import 'package:projeto_mobile_clinica/view/pages/LaudosPage.dart';
import 'package:projeto_mobile_clinica/view/pages/consustasPage.dart';
class PacienteHomePage extends StatefulWidget {
  @override
  _PacienteHomePageState createState() => _PacienteHomePageState();
}

class _PacienteHomePageState extends State<PacienteHomePage> {
  var path = "";
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child:Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          leading:Builder(
            builder: (BuildContext context) {
              return GestureDetector(
                  onTap: () {
                        Navigator.pushReplacementNamed(context, '/perfilPage');    
                  },
                  child:Padding(
                    padding: EdgeInsets.all(5),
                    child:Container(
                      width: 100,
                      height: 100,
                      child: CircleAvatar(
                      // backgroundImage: FileImage(File(path)),
                        radius: 35.0,
                      ),
                    )
              
                  )
              );
            }),
          bottom: TabBar(
            
            tabs: <Widget>[
              Row(
                children: <Widget>[
                  Text("consulta".toUpperCase(),textAlign: TextAlign.center),
                ],
              ),
              Row(
                children: <Widget>[
                  Text("Chat".toUpperCase(),textAlign: TextAlign.center),
                ],
              ),
              Row(
                children: <Widget>[
                  Text("Laudos".toUpperCase(),textAlign: TextAlign.center),
                ],
              ),
            ],
          ),
        ),
        body: 
        TabBarView(
          
          children: <Widget>[
            ConsultaPage(),
            ChatPage(),
            LaudosPage(),
          ],
        ),
        
      )
    );
  }
}