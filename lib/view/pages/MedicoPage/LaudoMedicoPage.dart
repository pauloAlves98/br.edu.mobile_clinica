import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projeto_mobile_clinica/WebService/WebService.dart';
import 'package:projeto_mobile_clinica/model/Cores.dart';
import 'package:projeto_mobile_clinica/model/bin/Corrente.dart';
import 'package:projeto_mobile_clinica/model/bin/Laudo.dart';
import 'package:projeto_mobile_clinica/view/widgets/ShowDateWidget.dart';

import 'GerenciaLaudoMedicoPage.dart';

class LaudoMedicoPage extends StatefulWidget {
  static DateFormat   f = new DateFormat('dd/MM/yyyy hh:mm');//yyyy-MM-dd hh:mm 
  @override
  _LaudoMedicoPageState createState() => _LaudoMedicoPageState();
}

class _LaudoMedicoPageState extends State<LaudoMedicoPage> {
  List<String> _laudos = ["1", "2", "3", "4", "4", "4", "4"];
  List<Laudo>laudos = List<Laudo>();
  int _paginaBotton = 0;
  bool vazio = false;
  String campoData1=" ", campoData2="";
  TextEditingController filtroController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
        children: <Widget>[
          _builderCabecarioBusca(),
          _builderListaLaudos(context),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent,
        child: Icon(Icons.add, color: Colors.white),
        onPressed: () async {
          GerenciaLaudoMedicoPage.tipo="INSERIR";
          atualizarGerencialaudoInserir();
         

          Navigator.pushNamed(context, "/gerenciaLaudoMedicoPage");
        //   GerenciaLaudoMedicoPage.laudoAtual.descricao = GerenciaLaudoMedicoPage.descricao.text;
        //   bool l = await saveEdit(GerenciaLaudoMedicoPage.laudoAtual);
        //   if (l) {
        //     print("Navega");
        //     Navigator.pop(context); //Mudar

        //   }
        //   print("Passou " + l.toString());
        },
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
                        DateTime d = await selectDate(context, DateTime.now(),campodata: campoData1);
                        setState(()  {
                        print(d);
                        DateFormat   f = new DateFormat('dd/MM/yyyy');//yyyy-MM-dd hh:mm
                          if(d==null)
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
                  child: 
                  Container(
                    
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
                        DateTime d = await selectDate(context, DateTime.now(),campodata: campoData2);
                        setState(()  {
                        print(d);
                        DateFormat   f = new DateFormat('dd/MM/yyyy');//yyyy-MM-dd hh:mm
                          if(d==null)
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
            onPressed: ()async{
              String filtro = filtroController.text.trim();
              print(campoData1);
              print(campoData2);
              print(filtro+ " Filtro");
              if(campoData2.trim().length<=0 && campoData1.trim().length<=0 && filtro.length<=0){
                 laudos = await WebService.consultaLaudoAll(Corrente.medicoCorrente.id,Corrente.usuarioMedico);
              }else if(campoData2.trim().length<=0 && campoData1.trim().length<=0 ){
                campoData2 = "01/12/2200";
                campoData1 = "01/01/1900";
                print("Cond 2");
                laudos = await WebService.consultaLaudoFiltro(campoData1,campoData2,filtro,Corrente.medicoCorrente.id,Corrente.usuarioMedico);
                
                      //Datas padroes.
              }
              else if(campoData2.trim().length<=0){
                       campoData2 = "01/12/2200";
                       print("Cond 3");
                       laudos = await WebService.consultaLaudoFiltro(campoData1,campoData2,filtro,Corrente.medicoCorrente.id,Corrente.usuarioMedico);
              }else if(campoData1.trim().length<=0){
                      campoData1 = "01/01/1900";
                      print("Cond 4");
                       laudos = await WebService.consultaLaudoFiltro(campoData1,campoData2,filtro,Corrente.medicoCorrente.id,Corrente.usuarioMedico);
              }else if(campoData2.trim().length<=0 && campoData1.trim().length<=0 && filtro.length!=0){
                       campoData1 = "01/01/1900";
                       campoData2 = "01/12/2200";
                       laudos = await WebService.consultaLaudoFiltro(campoData1,campoData2,filtro,Corrente.medicoCorrente.id,Corrente.usuarioMedico);
                       print("Cond 5");
              }else
                 laudos = await WebService.consultaLaudoFiltro(campoData1,campoData2,filtro,Corrente.medicoCorrente.id,Corrente.usuarioMedico);

              if(laudos.length<=0){
                    laudos.add(new Laudo());//pra movvimentar o len
                    vazio = true;
                }
              setState(() {
                laudos;
              });
              
              //Navigator.pushReplacementNamed(context, '/'); //Mudar
            }
               
          ),
        ),
      ),
    );
  }

  Widget _builderListaLaudos(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        margin: EdgeInsets.only(top: 140),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: laudos.length,
          //gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) {
            print("Chamou Biluder");
            var obj;
            if(laudos.length>0 && vazio == false)
              obj = _builderCardLaudos(index, laudos[index]);
            else{
              obj = Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Nenhum Laudo disponivel"),
              );
              vazio = false;
              laudos.clear();
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

  Widget _builderCardLaudos(int index, Laudo l) {
    String idd = index.toString();
    DateFormat   f = new DateFormat('dd/MM/yyyy hh:mm');//yyyy-MM-dd hh:mm                  
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
            ListTile(
              leading: Icon(Icons.library_books, size: 40, color: Colors.white),
              title: Text('Paciente', style: TextStyle(color: Colors.white)),
              subtitle: 
                  Text(l.id_paciente.nome,
                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300),textAlign: TextAlign.left,),
                
                 
              trailing: Text("ID:"+l.id.toString(), style: TextStyle(color: Colors.white)),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.blueGrey,
              ),
              height: 50,
              child: Row(
                children: <Widget>[
                  Expanded(flex:2, child: Text("Data:"+f.format(l.data_hora),
                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 12),textAlign: TextAlign.center,)),
                  
                   Expanded(
                     flex: 2,
                     child: FlatButton(
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Ver/Editar',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      onPressed: () { 
                        atualizarGerencialaudo (l);
                        GerenciaLaudoMedicoPage.tipo="EDITAR";
                        Navigator.pushNamed(context, "/gerenciaLaudoMedicoPage");
                        },
                    ), 
                   ),
                   
                  
                ],
              ),
              // child: ButtonTheme.bar(
              //   child: ButtonBar(
              //     children: <Widget>[
              //       FlatButton(
              //         child: Row(
              //           children: <Widget>[
              //             Text(
              //               'Visualizar/Editar',
              //               style: TextStyle(color: Colors.white),
              //             )
              //           ],
              //         ),
              //         onPressed: () { Navigator.pushNamed(context, "/cadastroLaudoPage");},
              //       ),
              //     ],
              //   ),
             
            )
          ],
        ),
      ),
    );
  }

void atualizarGerencialaudoInserir (){
    GerenciaLaudoMedicoPage.data_emissao = LaudoMedicoPage.f.format(DateTime.now()).toString().split(" ")[0];
    GerenciaLaudoMedicoPage.hora_emissao = LaudoMedicoPage.f.format(DateTime.now()).toString().split(" ")[1];
    GerenciaLaudoMedicoPage.cod = " ";
    GerenciaLaudoMedicoPage.descricao.text = " ";
    GerenciaLaudoMedicoPage.nomePaciente = " ";
    GerenciaLaudoMedicoPage.laudoAtual = new Laudo();
  }
  void atualizarGerencialaudo (Laudo la){
    GerenciaLaudoMedicoPage.data_emissao = LaudoMedicoPage.f.format(la.data_hora).toString().split(" ")[0];
    GerenciaLaudoMedicoPage.hora_emissao = LaudoMedicoPage.f.format(la.data_hora).toString().split(" ")[1];
    GerenciaLaudoMedicoPage.cod = la.id.toString();
    //GerenciaLaudoMedicoPage.descricao.text = la.descricao;
    GerenciaLaudoMedicoPage.nomePaciente = la.id_paciente.nome;
    GerenciaLaudoMedicoPage.laudoAtual = la;
  }
}
