import 'package:flutter/material.dart';
import 'package:projeto_mobile_clinica/WebService/EnderecoUrls.dart';
import 'package:projeto_mobile_clinica/WebService/WebService.dart';
import 'package:projeto_mobile_clinica/model/Cores.dart';
import 'package:projeto_mobile_clinica/model/bin/Consulta.dart';

class GerenciaConsultaMedicoPage extends StatefulWidget {
  static String hora = " ";
  static String data = " ";
  static String situacao = " ";
  static String tipo = " ";
  static String nomePaciente = " ";

  //static TextEditingController descricao = new TextEditingController();
  static String cod = " ";
  static Consulta consultaAtual = Consulta();

  @override
  _GerenciaConsultaMedicoPageState createState() =>
      _GerenciaConsultaMedicoPageState();
}

class _GerenciaConsultaMedicoPageState
    extends State<GerenciaConsultaMedicoPage> {
  int _paginaBotton = 0;

  //String texto
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent,
        child: Icon(Icons.save, color: Colors.white),
        onPressed: () async {
          GerenciaConsultaMedicoPage.consultaAtual.situacao = GerenciaConsultaMedicoPage.situacao;
          bool l = await saveEdit( GerenciaConsultaMedicoPage.consultaAtual);
          if (l) {
            print("Navega");
            Navigator.pop(context); //Muda
          }
          print("Passou " + l.toString());
        },
      ),
      bottomNavigationBar: BottomAppBar(
        //hasNotch: true,
        shape: CircularNotchedRectangle(),
        color: Colors.blue,
        child: Container(
          height: 60,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.keyboard_backspace,
                color: Colors.white, size: 20),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/medicoHomePage');
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          )
        ],
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.library_books,
                  color: Colors.white, size: 40),
              // onPressed: () { Scaffold.of(context).openDrawer(); },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: Text(
          "Gerencia de Consulta",
          style: TextStyle(fontSize: 15),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
              //height: MediaQuery.of(context).size.height - 100,
              child: Center(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              color: Colors.blue,
              // elevation: 5,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading:
                        Icon(Icons.date_range, size: 50, color: Colors.white),
                    title: Text('Data da Consulta',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600)),
                    subtitle: Text(GerenciaConsultaMedicoPage.data,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w300)),
                    //trailing: Text('ID:1', style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600)),
                  ),
                  _divisor(),
                  ListTile(
                    leading: Icon(Icons.timer, size: 50, color: Colors.white),
                    title: Text('Horario',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600)),
                    subtitle: Text(GerenciaConsultaMedicoPage.hora + " h",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w300)),
                    //trailing: Text('ID:1', style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600)),
                  ),
                  _divisor(),
                  ListTile(
                    leading: Icon(Icons.label, size: 50, color: Colors.white),
                    title: Text('Tipo de Consulta',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600)),
                    subtitle: Text(GerenciaConsultaMedicoPage.tipo,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w300)),
                    //trailing: Text('ID:1', style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600)),
                  ),
                  _divisor(),
                  ListTile(
                    trailing: IconButton(
                      icon: Icon(Icons.near_me, size: 25, color: Colors.white),
                      onPressed: () {
                       if(GerenciaConsultaMedicoPage.situacao.toUpperCase() =="AGENDADA")
                          GerenciaConsultaMedicoPage.situacao = "FINALIZADA";
                       else if(GerenciaConsultaMedicoPage.situacao.toUpperCase() =="FINALIZADA")
                          GerenciaConsultaMedicoPage.situacao = "CANCELADA";
                       else if(GerenciaConsultaMedicoPage.situacao.toUpperCase() =="CANCELADA")
                          GerenciaConsultaMedicoPage.situacao = "AGENDADA";
                      setState(() {
                         GerenciaConsultaMedicoPage.situacao;
                      });
                      },
                    ),
                    leading: Icon(Icons.warning, size: 50, color: Colors.white),
                      
                  
                    title: Text('Situação da Consulta',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600)),
                    subtitle: Text(GerenciaConsultaMedicoPage.situacao,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w300)),
                    //trailing: Text('ID:1', style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600)),
                  ),
                  _divisor(),
                  ListTile(
                    leading: Icon(Icons.person, size: 50, color: Colors.white),
                    title: Text('Paciente',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600)),
                    subtitle: Text(GerenciaConsultaMedicoPage.nomePaciente,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w300)),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.info,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  _divisor(),
                  
                  Container(
                    height: 70,
                    //width: 110,
                  ),
                ],
              ),
            ),
          )),
        ),
        // child:  Column(
        //   children: <Widget>[
        //      Container(//
        //   height: MediaQuery.of(context).size.height/2,
        //   color: Colors.black12,
        //   child: Padding(
        //     padding: EdgeInsets.all(10),
        //     child: Container(
        //       color: Colors.blue,
        //     ),
        //     ),
        //  ),
        // ],
        // )
      ),
    );
  }

  Widget _divisor() {
    return Container(
      height: 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(60), bottomRight: Radius.circular(60)),
        color: Colors.white,
      ),
    );
  }
  Future<bool> saveEdit(Consulta  p) async {
    print("Iserir");
    bool l = await WebService.consultaSaveEdit(p, EnderecoUrls.CONSULTA_SAVE_EDIT);
    print("Passou Consulta");
    print(l);
    return l;
  }
}
