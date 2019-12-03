import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../WebService/EnderecoUrls.dart';
import '../../../WebService/WebService.dart';
import '../../../model/bin/Corrente.dart';
import '../../../model/bin/Laudo.dart';
import '../../../model/bin/Paciente.dart';

class GerenciaLaudoMedicoPage extends StatefulWidget {
  GerenciaLaudoMedicoPage() {}

  static String tipo = "EDITAR";
  String texto = "";
  static String hora_emissao = " ";
  static String data_emissao = " ";
  static String nomePaciente = " ";
  static TextEditingController descricao = new TextEditingController();
  static String cod = " ";
  static Laudo laudoAtual = Laudo();
  static List<Paciente> pacientes = List<Paciente>();
  static Paciente paciente = Paciente();
  @override
  _GerenciaLaudoMedicoPageState createState() =>
      _GerenciaLaudoMedicoPageState();
}

class _GerenciaLaudoMedicoPageState extends State<GerenciaLaudoMedicoPage> {
  int _paginaBotton = 0;
  @override
  void initState() {
    GerenciaLaudoMedicoPage.descricao.text =
        GerenciaLaudoMedicoPage.laudoAtual.descricao;
    super.initState();
  }

  //String texto
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent,
        child: Icon(Icons.save_alt, color: Colors.white),
        onPressed: () async {
              GerenciaLaudoMedicoPage.laudoAtual.descricao =
              GerenciaLaudoMedicoPage.descricao.text;
            if(GerenciaLaudoMedicoPage.tipo=="INSERIR"){
              DateFormat   f = new DateFormat('dd/MM/yyyy hh:mm');
              GerenciaLaudoMedicoPage.laudoAtual.id_paciente = GerenciaLaudoMedicoPage.paciente;
              GerenciaLaudoMedicoPage.laudoAtual.id_medico = Corrente.medicoCorrente;
              GerenciaLaudoMedicoPage.laudoAtual.data_hora = f.parse(GerenciaLaudoMedicoPage.data_emissao+" "+GerenciaLaudoMedicoPage.hora_emissao);
            }
              
          bool l = await saveEdit(GerenciaLaudoMedicoPage.laudoAtual);
          if (l) {
            print("Navega");
            GerenciaLaudoMedicoPage.tipo = "EDITAR";
            Navigator.pop(context); //Mudar

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
          "Gerenciamento de Laudo",
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
                    title: Text('Data da Emissão',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600)),
                    subtitle: Text(
                        GerenciaLaudoMedicoPage.data_emissao.toString() + ' ',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w300)),
                    trailing: Text(GerenciaLaudoMedicoPage.hora_emissao + ' h',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600)),
                  ),
                  _divisor(),
                  ListTile(
                    leading: Icon(Icons.person, size: 50, color: Colors.white),
                    title: Text('Paciente',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600)),
                    subtitle: Text(
                        GerenciaLaudoMedicoPage.nomePaciente.toString(),
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w300)),
                    trailing: IconButton(
                      icon: Icon(Icons.near_me, size: 25, color: Colors.white),
                      onPressed: () {
                        if (GerenciaLaudoMedicoPage.tipo == "EDITAR") return;
                         showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return buscarPaciente(context);
                              ;
                            },
                          );
                        setState(() {
                         

                          print("Inserir");
                        });
                      },
                    ),
                  ),
                  _divisor(),
                  const ListTile(
                    leading: Icon(
                      Icons.mode_edit,
                      size: 50,
                      color: Colors.white,
                    ),
                    title: Text('Descrição do Laudo',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600)),
                  ),
                  Container(
                    // padding: EdgeInsets.all(),
                    height: (MediaQuery.of(context).size.height - 100) * 0.40,
                    color: Colors.white,
                    child: Padding(
                        padding: EdgeInsets.all(1),
                        child: SingleChildScrollView(
                          child: new TextField(
                            controller: GerenciaLaudoMedicoPage.descricao,
                            minLines: 20,
                            maxLines: null,
                            keyboardType: TextInputType.multiline,
                          ),
                        )),
                  ),
                  Container(
                    height: 40,
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

  // Widget _builderCreateLaudo(){
  //   return   Container(//
  //         //height: MediaQuery.of(context).size.height/2,
  //         color: Colors.black12,
  //         child: Padding(
  //           padding: EdgeInsets.all(10),
  //           child: Container(
  //             color: Colors.blue,
  //           ),
  //           ),
  //        ),

  Widget buscarPaciente(BuildContext context) {
    TextEditingController c = new TextEditingController();
    FocusNode fo = new FocusNode();
    fo.unfocus();
    // configura o button
    Widget okButton = FlatButton(
      child: Text("Buscar"),
      onPressed: () async {
        
        print("Buscou  " + c.text);
        GerenciaLaudoMedicoPage.pacientes =
            await WebService.consultaPacienteFiltro(c.text);
        print(GerenciaLaudoMedicoPage.pacientes.length);
        setState(() {
           fo.unfocus();
           FocusScope.of(context).requestFocus(fo);
          GerenciaLaudoMedicoPage.pacientes;

          print("Set State!");
        });
        //Navigator.pop(context);
      },
    );
    // configura o  AlertDialog

    AlertDialog alerta = AlertDialog(
      title: Text("Buscar Paciente"),
      content: Column(
        children: <Widget>[
          TextField(
            focusNode: fo,
            controller: c,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              hintText: "Filtro",
            ),
          ),
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: GerenciaLaudoMedicoPage.pacientes.length,
            //gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) {
              print("Chamou Biluder");

              return Padding(
                padding: const EdgeInsets.all(3.0),
                child: ListTile(
                  leading: Icon(Icons.person, size:30, color: Colors.black),
                  title: Text(GerenciaLaudoMedicoPage.pacientes[index].nome,
                      style: TextStyle(color: Colors.black)),
                  subtitle: Text(
                    GerenciaLaudoMedicoPage.pacientes[index].rg,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w300),
                    textAlign: TextAlign.left,
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.navigate_next),
                    onPressed: () {
                      print("Escolheu!");
                      Navigator.pop(context);
                      GerenciaLaudoMedicoPage.paciente = GerenciaLaudoMedicoPage.pacientes[index];
                      GerenciaLaudoMedicoPage.pacientes = List<Paciente>();
                      GerenciaLaudoMedicoPage.nomePaciente = GerenciaLaudoMedicoPage.paciente.nome;

                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
      actions: [
        okButton,
      ],
    );
    // exibe o dialog

    print("FIm");
    return alerta;
  }

  Future<bool> saveEdit(Laudo p) async {
    print("Iserir");
    bool l = await WebService.laudoSaveEdit(p, EnderecoUrls.LAUDO_SAVE_EDIT);
    print("Passou Laudo");
    print(l);
    return l;
  }
}
