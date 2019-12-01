
import 'package:flutter/material.dart';
import 'package:projeto_mobile_clinica/model/utils/round_clipper.dart';
import 'package:projeto_mobile_clinica/view/pages/ChatPage.dart';

import '../LoginPage.dart';
import 'ConsultaMedicoPage.dart';
import 'LaudoMedicoPage.dart';


class MedicoHomePage extends StatefulWidget {
  static String nome = "";
  static String especialidade = "";
  @override
  _MedicoHomePageState createState() => _MedicoHomePageState();
}

class _MedicoHomePageState extends State<MedicoHomePage> {
  //var _path = "";
  int _tamTab = 3;

  final GlobalKey<AnimatedListState> _listKey =
      new GlobalKey<AnimatedListState>();
  final double _imageHeight = 200.0;
  final double _alturaTabBar = 35;
  bool showOnlyCompleted = false;
  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _tamTab,
        child: Scaffold(
          resizeToAvoidBottomPadding: false,
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
              Navigator.pushNamed(context, '/medicoPerfilPage');
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
                  MedicoHomePage.nome,
                  style: new TextStyle(
                      fontSize: 26.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
                new Text(
                  MedicoHomePage.especialidade,
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
          ConsultaMedicoPage(),
          ChatPage(),
          LaudoMedicoPage(),
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


  Widget _buildTimeline() {
    return new Positioned(
      top: 0.0,
      bottom: 0.0,
      left: 32.0,
      child: new Container(
        width: 1.0,
        color: Colors.grey[300],
      ),
    );
  }
}
