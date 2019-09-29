import 'package:flutter/material.dart';


class GerenciaLaudoMedicoPage extends StatefulWidget {
  String texto = "";
  @override
  _GerenciaLaudoMedicoPageState createState() => _GerenciaLaudoMedicoPageState();
}

class _GerenciaLaudoMedicoPageState extends State<GerenciaLaudoMedicoPage> {
  int _paginaBotton = 0;
 
  //String texto
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent,
        child: Icon(Icons.save_alt, color: Colors.white),
        onPressed: (){
          Navigator.pushReplacementNamed(context, '/medicoHomePage'); //Mudar
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
       onPressed: () {  Navigator.pushReplacementNamed(context, '/medicoHomePage');},
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
        title: Text("Gerenciamento de Laudo",style: TextStyle(fontSize: 15),),
        
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
                        subtitle: Text('28/09/2019',
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
                            child:  new TextField(
                            minLines: 20,
                            maxLines: null,
                            keyboardType: TextInputType.multiline,
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

}
