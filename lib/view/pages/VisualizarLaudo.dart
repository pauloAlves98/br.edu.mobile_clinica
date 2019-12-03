
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class VisualizarLaudo extends StatefulWidget {
  static String hora_emissao = " ";
  static String data_emissao = " ";
  static String nomeMedico = " ";
  static String nomePaciente = " ";
  static String descricao = " ";
  static String cod = " ";
  @override
  _VisualizarLaudoState createState() => _VisualizarLaudoState();
}

class _VisualizarLaudoState extends State<VisualizarLaudo> {
  DateFormat   f = new DateFormat('dd/MM/yyyy hh:mm');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent,
        child: Icon(Icons.save_alt, color: Colors.white),
        onPressed: (){
          Navigator.pop(context); //Mudar
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
        icon: const Icon(Icons.keyboard_backspace,color: Colors.white,size: 20),
       onPressed: () {  Navigator.pop(context);},
        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      )],
        leading:Builder(
    builder: (BuildContext context) {
      return IconButton(
        icon: const Icon(Icons.library_books,color: Colors.white,size: 40),
       // onPressed: () { Scaffold.of(context).openDrawer(); },
        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      );
    },
  ) ,
        title: Text("Visualizar de Laudo",style: TextStyle(fontSize: 15),),
        
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
                      const ListTile(
                        leading:
                            Icon(Icons.date_range, size: 50, color: Colors.white),
                        title: Text('Data da Emissão',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600)),
                        subtitle: Text(VisualizarLaudo.data_emissao,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300)),
                        trailing: Text('18:00 h', style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600)),
                      ),
                    _divisor(),
                      const ListTile(
                        leading:
                            Icon(Icons.person, size: 50, color: Colors.white),
                        title: Text('Paciente',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600)),
                        subtitle: Text('Kakashi Hatake',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300)),
                        trailing: Text('ID:1',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600)),
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
                                color: Colors.white,
                                fontWeight: FontWeight.w600)),
                      ),
                      Container(
                        // padding: EdgeInsets.all(),
                        height: (MediaQuery.of(context).size.height - 100)*0.40,
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.all(1),
                          child: SingleChildScrollView(
                            child:Container(
                              width: 400,
                              child:  new Text("descricao",
                            textWidthBasis: TextWidthBasis.longestLine,
                            maxLines: null,
                            )
                           // keyboardType: TextInputType.multiline,
                          ),
                          )
                          
                         
                        ),
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
}