import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projeto_mobile_clinica/WebService/WebService.dart';
import 'package:projeto_mobile_clinica/model/Cores.dart';
import 'package:projeto_mobile_clinica/model/bin/Consulta.dart';
import 'package:projeto_mobile_clinica/model/bin/Corrente.dart';
import 'package:projeto_mobile_clinica/model/bin/Laudo.dart';
import 'package:projeto_mobile_clinica/model/bin/Laudo.dart';
import 'package:projeto_mobile_clinica/model/bin/Laudo.dart';
import 'package:projeto_mobile_clinica/view/widgets/ShowDateWidget.dart';

import 'GerenciaConsultaMedicoPage.dart';

class ConsultaMedicoPage extends StatefulWidget {
  static DateFormat f = new DateFormat('dd/MM/yyyy hh:mm'); //yyyy-MM-dd hh:mm
  @override
  _ConsultaMedicoPageState createState() => _ConsultaMedicoPageState();
}

class _ConsultaMedicoPageState extends State<ConsultaMedicoPage> {
  DateTime selectedDate = DateTime.now();
  int _paginaBotton = 0;
  List<String> _laudos = ["1", "2", "3", "4", "4", "4", "4"];

  List<Consulta> consultas = List<Consulta>();

  bool vazio = false;
  String campoData1 = " ", campoData2 = "";
  TextEditingController filtroController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
        children: <Widget>[
          _builderCabecarioBusca(),
          _builderListaConsulta(context),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blueGrey[600],
        child: Container(height: 20),
      ),
    );
  }

  Widget _builderCabecarioBusca() {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Container(
        height: 140, //MediaQuery.of(context).size.height/2,
        color: Colors.blueGrey[600],
        child: Column(
          children: <Widget>[
            Container(
                height: 25,
                child: Center(
                  child: new Text(
                    'Periodo',
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w200),
                  ),
                )),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    width: 20,
                    child: IconButton(
                      onPressed: () async {
                        DateTime d = await selectDate(context, DateTime.now(),
                            campodata: campoData1);
                        setState(() {
                          print(d);
                          DateFormat f =
                              new DateFormat('dd/MM/yyyy'); //yyyy-MM-dd hh:mm
                          if (d == null)
                            campoData1 = f.format(DateTime.now());
                          else
                            campoData1 = f.format(d);
                        });
                      },
                      icon: Icon(
                        Icons.date_range,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    child: Text(
                      campoData1,
                      style: TextStyle(color: Colors.white),
                    ),
                    // )
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Text(
                      'até',
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    // )
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: 20,
                    child: IconButton(
                      onPressed: () async {
                        DateTime d = await selectDate(context, DateTime.now(),
                            campodata: campoData2);
                        setState(() {
                          print(d);
                          DateFormat f =
                              new DateFormat('dd/MM/yyyy'); //yyyy-MM-dd hh:mm
                          if (d == null)
                            campoData2 = f.format(DateTime.now());
                          else
                            campoData2 = f.format(d);
                        });
                      },
                      //data 2
                      icon: Icon(
                        Icons.date_range,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    child: Text(
                      campoData2,
                      style: TextStyle(color: Colors.white),
                    ),
                    // )
                  ),
                  // )
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.blueGrey[600],
                    child: Icon(
                      Icons.find_in_page,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                    flex: 2,
                    child: new Theme(
                      data: new ThemeData(
                        hintColor: Colors.blueGrey[100],
                      ),
                      child: TextField(
                        controller: filtroController,
                        autofocus: false,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: "Filtro",
                        ),
                      ),
                    )
                    // child: TextField(
                    //   style: TextStyle(color: Colors.white),
                    //   decoration: InputDecoration(hintText: "Filtro",fillColor: Colors.white,focusColor: Colors.white,hoverColor: Colors.white),
                    // ),
                    ),
                Expanded(flex: 2, child: _buttomBuscar(context))
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buttomBuscar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 40,
        alignment: Alignment.topCenter,

        margin: const EdgeInsets.symmetric(horizontal: 16.0),
        // width: double.infinity,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.centerRight,
            stops: [0.3, 1], //de acordo com o numero de cores!
            colors: [Color(0xFF6CD8F0), blueLogin1],
          ),
          //borderRadius: BorderRadius.all(Radius.circular(360)),
        ),
        child: SizedBox.expand(
          child: FlatButton(
              textColor: Colors.white,
              child: Icon(Icons.search),
              onPressed: () async {
                String filtro = filtroController.text.trim();
                print(campoData1);
                print(campoData2);
                print(filtro + " Filtro");
                try {
                  if (campoData2.trim().length <= 0 &&
                      campoData1.trim().length <= 0 &&
                      filtro.length <= 0) {
                    consultas = await WebService.consultaConsultaAll(
                        Corrente.medicoCorrente.id, Corrente.usuarioMedico);
                  } else if (campoData2.trim().length <= 0 &&
                      campoData1.trim().length <= 0) {
                    campoData2 = "01/12/2200";
                    campoData1 = "01/01/1900";
                    print("Cond 2");
                    consultas = await WebService.consultaConsultaFiltro(
                        campoData1,
                        campoData2,
                        filtro,
                        Corrente.medicoCorrente.id,
                        Corrente.usuarioMedico);
                    //Datas padroes.
                  } else if (campoData2.trim().length <= 0) {
                    campoData2 = "01/12/2200";
                    print("Cond 3");
                    consultas = await WebService.consultaConsultaFiltro(
                        campoData1,
                        campoData2,
                        filtro,
                        Corrente.medicoCorrente.id,
                        Corrente.usuarioMedico);
                  } else if (campoData1.trim().length <= 0) {
                    campoData1 = "01/01/1900";
                    print("Cond 4");
                    consultas = await WebService.consultaConsultaFiltro(
                        campoData1,
                        campoData2,
                        filtro,
                        Corrente.medicoCorrente.id,
                        Corrente.usuarioMedico);
                  } else if (campoData2.trim().length <= 0 &&
                      campoData1.trim().length <= 0 &&
                      filtro.length != 0) {
                    campoData1 = "01/01/1900";
                    campoData2 = "01/12/2200";
                    consultas = await WebService.consultaConsultaFiltro(
                        campoData1,
                        campoData2,
                        filtro,
                        Corrente.medicoCorrente.id,
                        Corrente.usuarioMedico);
                    print("Cond 5");
                  } else
                    consultas = await WebService.consultaConsultaFiltro(
                        campoData1,
                        campoData2,
                        filtro,
                        Corrente.medicoCorrente.id,
                        Corrente.usuarioMedico);

                  if (consultas.length <= 0) {
                    consultas.add(Consulta()); //pra movvimentar o len
                    vazio = true;
                  }
                  setState(() {
                    consultas;
                  });
                } catch (e) {
                  print("Excecao!");
                }
                //Navigator.pushReplacementNamed(context, '/'); //Mudar
              }),
        ),
      ),
    );
  }

  Widget _builderListaConsulta(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        margin: EdgeInsets.only(top: 140),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: consultas.length,
          //gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) {
            print("Chamou Biluder");
            var obj;
            if (consultas.length > 0 && vazio == false)
              obj = _builderCardConsulta(index, consultas[index]);
            else {
              obj = Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Nenhuma Consulta disponivel"),
              );
              vazio = false;
              consultas.clear();
            }
            return Padding(
              padding: const EdgeInsets.all(3.0),
              child: obj,
            );
          },
        ),
      ),
    );
  }

  Widget _builderCardConsulta(int index, Consulta c) {
    String idd = index.toString();
    DateFormat f = new DateFormat('dd/MM/yyyy hh:mm'); //yyyy-MM-dd hh:mm
    return Container(
      width: 300,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        color: Colors.blue,
        elevation: 10,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10)),
                color: Colors.blueGrey,
              ),
              height: 20,
              child: Row(
                children: <Widget>[
                  Expanded(
                      flex: 2,
                      child: Text(
                        "Consulta",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 12),
                        textAlign: TextAlign.center,
                      )),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.person_add, size: 40, color: Colors.white),
              title: Text('Paciente', style: TextStyle(color: Colors.white)),
              subtitle: Text(
                c.id_paciente.nome,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
                textAlign: TextAlign.left,
              ),
              trailing: Text("ID:" + c.id.toString(),
                  style: TextStyle(color: Colors.white)),
            ),

            //Divider(),
            ListTile(
              leading: Icon(Icons.date_range, size: 40, color: Colors.white),
              title: Text(f.format(c.data_hora).toString().split(" ")[0],
                  style: TextStyle(color: Colors.white)),
              subtitle: Text(
                f.format(c.data_hora).toString().split(" ")[1],
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
                textAlign: TextAlign.left,
              ),
              trailing: Text(c.situacao, style: TextStyle(color: Colors.white)),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(90),
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(10)),
                color: Colors.blueGrey,
              ),
              height: 50,
              child: Row(
                children: <Widget>[
                  // Expanded(flex:2, child: Text("Data: 28/09/2019",
                  // style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 12),textAlign: TextAlign.center,)),

                  Expanded(
                    flex: 2,
                    child: FlatButton(
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Ver/Editar',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      onPressed: () {
                        atualizarGerenciaConsulta(c);
                        Navigator.pushNamed(
                            context, "/gerenciaConsultaMedicoPage");
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void atualizarGerenciaConsulta(Consulta la) {
    GerenciaConsultaMedicoPage.data =
        ConsultaMedicoPage.f.format(la.data_hora).toString().split(" ")[0];
    GerenciaConsultaMedicoPage.hora =
        ConsultaMedicoPage.f.format(la.data_hora).toString().split(" ")[1];
    GerenciaConsultaMedicoPage.cod = la.id.toString();
    GerenciaConsultaMedicoPage.tipo = la.tipo;
    GerenciaConsultaMedicoPage.situacao = la.situacao;
    //GerenciaLaudoMedicoPage.descricao.text = la.descricao;
    GerenciaConsultaMedicoPage.nomePaciente = la.id_paciente.nome;
    GerenciaConsultaMedicoPage.consultaAtual = la;
  }
}
