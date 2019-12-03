import 'package:flutter/material.dart';
import 'package:projeto_mobile_clinica/model/Cores.dart';

class VizualisarEditarConsultaPage extends StatefulWidget {
  @override
  _VizualisarEditarConsultaPageState createState() => _VizualisarEditarConsultaPageState();
}

class _VizualisarEditarConsultaPageState extends State<VizualisarEditarConsultaPage> {
 bool foco = false;
 static String hora_emissao = " ";
  static String data_emissao = " ";
  //static String nomeMedico = " ";
  static String nomePaciente = " ";
  static String descricao = " ";
  static String cod = " ";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.keyboard_backspace,
                color: Colors.white, size: 20),
            onPressed: () {
              Navigator.pop(context);
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
          "Consulta",
          style: TextStyle(fontSize: 15),
        ),
      ),
      body:Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF6CD8F0), blueLogin1],
                     begin: Alignment.centerRight,
                     end: Alignment(-1.0,-1.0),
                  ),
                   
                ),
                child: Stack(
        children: <Widget>[
         

          // Positioned(
          //   top:10,
           
          //   child:Padding(
          //     padding: EdgeInsets.all(10),
          //     child:Container(
          //     width: MediaQuery.of(context).size.width/1.05,
          //     height:MediaQuery.of(context).size.height/6.5 ,
          //     color:Colors.white,
          //     child:Column(children: <Widget>[SizedBox(height: 10,),
          //     Text("Consulta".toUpperCase(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
          //     ])),)
          //  ),

          //  Positioned(
          //   top:15 ,
          //   left: 10,
          //   child: IconButton(
          //     icon: Icon(Icons.arrow_back,size: 30,),
          //     onPressed: (){
          //         Navigator.popAndPushNamed(context,'/pacienteHomePage');
          //     },
          //   ),
          // ),

          Positioned(
            top: 5 ,
            child:Padding(
              padding: EdgeInsets.all(10),
              child: Container(
              width: MediaQuery.of(context).size.width/1.05,
              height:MediaQuery.of(context).size.height/1.25,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top:0,
                  bottom: 10
                ),
                child:SingleChildScrollView(
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
                    trailing: IconButton(
                      icon: Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                    leading:
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 25,
                        ),
                    title: Text('Medico',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600)),
                    subtitle: Text('Ana Paula',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w300)),
                    //trailing: Text('ID:1', style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600)),
                  ),
                  _divisor(),
                   ListTile(
                    trailing: IconButton(
                      icon: Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                      onPressed:(){
                        editDados(Icons.date_range,'Data da Consulta');
                      },
                    ),
                    leading:
                        Icon(Icons.date_range, size: 50, color: Colors.white),
                    title: Text('Data da Consulta',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600)),
                    subtitle: Text('28/09/2019',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w300)),
                    //trailing: Text('ID:1', style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600)),
                  ),
                  _divisor(),
                  ListTile(
                    trailing: IconButton(
                      icon: Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        editDados(Icons.timer,'Horario');
                      },
                    ),
                    leading:
                        Icon(Icons.timer, size: 50, color: Colors.white),
                    title: Text('Horario',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600)),
                    subtitle: Text('19:00 h',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w300)),
                    //trailing: Text('ID:1', style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600)),
                  ),
                   _divisor(),
                  
                  ListTile(
                    trailing: IconButton(
                      icon: Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        editDados(Icons.label, 'Tipo de Consulta');
                      },
                    ),
                    leading:
                        Icon(Icons.label, size: 50, color: Colors.white),
                    title: Text('Tipo de Consulta',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600)),
                    subtitle: Text('Retorno',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w300)),
                    //trailing: Text('ID:1', style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600)),
                  ),
                  _divisor(),
                   ListTile(
                    trailing: IconButton(
                      icon: Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        editDados(Icons.warning,'Situação da Consulta');
                      },
                    ),
                    leading:
                        Icon(Icons.warning, size: 50, color: Colors.white),
                    title: Text('Situação da Consulta',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600)),
                    subtitle: Text('Agendada',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w300)),
                    //trailing: Text('ID:1', style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600)),
                  ),
                  _divisor(),
                  ListTile(
                    trailing: IconButton(
                      icon: Icon(
                        Icons.info,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        
                      },
                    ),
                    leading: Icon(
                      Icons.book,
                      size: 45,
                      color: Colors.white,
                    ),
                    title: Text('Laudo',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600)),
                  ),
                  Container(
                    height: 60,
                    //width: 110,
                  ),
                ],
              ),
            ),
          )),
        ),),
  
      ), 
  
            )    
              
            
          ),
          ),
          // Positioned(
          //   top: 0,
          //   left:MediaQuery.of(context).size.width/2.75 ,
          //   child: Center(
          //     child:Container(
          //       child: CircleAvatar(

          //         radius: 50,
          //       ),
          //     ) ,),
          // )
        ],
      ),
                ), 
    floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent,
        child: Icon(Icons.save_alt, color: Colors.white),
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/pacienteHomePage'); //Mudar
        },
      ),
      bottomNavigationBar: BottomAppBar(
        //hasNotch: true,
        shape: CircularNotchedRectangle(),
        color: Colors.blue,
        child: Container(
          height: 50,
        ),
      ),
    );   
    
  }
  void editDados(IconData icone, String title){
     showDialog(
        context: context,
                                    builder: (BuildContext context){
                                        return Stack(children: <Widget>[ 
                                        Positioned(
                                          left: -39,
                                          top:foco ?MediaQuery.of(context).size.height-460 :MediaQuery.of(context).size.height-220,
                                          child:Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(new Radius.circular(360))
                                            ),
                                            child:AlertDialog(
                                          content: Container(
                                            width:MediaQuery.of(context).size.width-39,
                                            height: 60,
                                            
                                            child: Column(
                                              children: <Widget>[
                                                Row(children: <Widget>[
                                                Icon(icone),
                                                Padding(
                                                  padding: EdgeInsets.only(left: 10)
                                                ),
                                                Expanded(
                                                  child: TextField(
                                                    decoration: InputDecoration(
                                                      labelText: title
                                                    ),
                                                    onTap: (){
                                                        setState(() {
                                                         foco=true; 
                                                        });
                                                    },
                                                  ),
                                                ),
                                                ])
                                                
                                              ],
                                            ),
                                          ),
                                          actions: <Widget>[
                                            FlatButton(child: Text("Salvar"),
                                            onPressed: (){

                                            },
                                            )
                                          ],
                                        )))]);
                                    }
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