import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:projeto_mobile_clinica/view/pages/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:projeto_mobile_clinica/view/pages/ChatPage.dart';
import 'package:projeto_mobile_clinica/view/pages/LaudosPage.dart';
import 'package:projeto_mobile_clinica/view/pages/consustasPage.dart';
import 'package:projeto_mobile_clinica/model/utils/round_clipper.dart';


class PacienteHomePage extends StatefulWidget {
  static String nome = "";
  @override
  _PacienteHomePageState createState() => _PacienteHomePageState();
}

class _PacienteHomePageState extends State<PacienteHomePage> {
 
  var path = "";
  final double _imageHeight = 200.0;
  final double _alturaTabBar = 35;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child:Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.blue,
        //   leading:Builder(
        //     builder: (BuildContext context) {
        //       return GestureDetector(
        //           onTap: () {
        //                 Navigator.pushReplacementNamed(context, '/perfilPage');    
        //           },
        //           child:Padding(
        //             padding: EdgeInsets.all(5),
        //             child:Container(
        //               width: 100,
        //               height: 100,
        //               child: CircleAvatar(
        //               // backgroundImage: FileImage(File(path)),
        //                 radius: 35.0,
        //               ),
        //             )
              
        //           )
        //       );
        //     }),
        //   bottom: TabBar(
            
        //     tabs: <Widget>[
        //       Row(
        //         children: <Widget>[
        //           Text("consulta".toUpperCase(),textAlign: TextAlign.center),
        //         ],
        //       ),
        //       Row(
        //         children: <Widget>[
        //           Text("Chat".toUpperCase(),textAlign: TextAlign.center),
        //         ],
        //       ),
        //       Row(
        //         children: <Widget>[
        //           Text("Laudos".toUpperCase(),textAlign: TextAlign.center),
        //         ],
        //       ),
        //     ],
        //   ),
        // ),
        // body: 
        // TabBarView(
          
        //   children: <Widget>[
        //     ConsultaPage(),
        //     ChatPage(),
        //     LaudosPage(),
        //   ],
        // ),
        body: new Stack(
            children: <Widget>[
              //_buildTimeline(),
              _buildImage(),
              _buildCabecario(),
              _buildProfileRow(), //Perfil
              _buildTabBar(),
            ],
          ),
      )
    );
  }
  Widget _buildImage() {
    return new Positioned.fill(
      bottom: null,
      child: new ClipPath(
        clipper: new RoundClipper(),
        child: new Image.asset(
          'images/birds.jpg',
          fit: BoxFit.cover,
          height: _imageHeight,
          colorBlendMode: BlendMode.srcOver,
          color: new Color.fromARGB(120, 20, 10, 40),
        ),
      ),
    );
  }

  Widget _buildCabecario() {
    return new Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 32.0),
      child: new Row(
        children: <Widget>[
        FlutterLogo(colors: MaterialColor(0xFF880E4F, LoginPage.color)),
          new Expanded(
            child: new Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: new Text(
                "Clinica Mobile",
                style: new TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.exit_to_app, color: Colors.white, size: 30),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileRow() {
    return new Padding(
      padding: new EdgeInsets.only(left: 12.0, top: _imageHeight / 2.4),
      child: new Row(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/perfilPage');
            },
            child: Padding(
              padding: EdgeInsets.all(1),
              child: Container(
                width: 100,
                height: 100,
                child: CircleAvatar(
                  minRadius: 28.0,
                  maxRadius: 28.0,
                  backgroundImage: new AssetImage('images/birds.jpg'),
                ),
              ),
            ),
          ),
          new Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Text(
                  PacienteHomePage.nome,
                  style: new TextStyle(
                      fontSize: 26.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
                new Text(
                  'Paciente',
                  style: new TextStyle(
                      fontSize: 14.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return new Padding(
      padding: new EdgeInsets.only(top: _imageHeight),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: _alturaTabBar,
            child: SizedBox.expand(
              child: TabBar(
                tabs: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          "Consulta".toUpperCase(),
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black38),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: Text("Chat".toUpperCase(),
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.black38))),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text("Laudos".toUpperCase(),
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black38)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Divider(
            height: 1,
          ),
          _buildTabView()
        ],
      ),
    );
  }

  Widget _buildTabView() {
    return SingleChildScrollView(
        child: Container(
      height: MediaQuery.of(context).size.height -
          (_imageHeight + _alturaTabBar + 1),
      child: TabBarView(
        children: <Widget>[
         
          ConsultaPage(),
          ChatPage(),
          LaudosPage(),
          
        ],
      ),
    )

        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //      Navigator.pushReplacementNamed(context, '/agendarConsulta');
        //    },
        //   child: Icon(Icons.add),
        //   backgroundColor: Colors.green,
        // ),

        );
  }

}