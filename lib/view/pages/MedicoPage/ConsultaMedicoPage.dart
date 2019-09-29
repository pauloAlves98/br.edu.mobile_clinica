import 'package:flutter/material.dart';
import 'package:projeto_mobile_clinica/model/Cores.dart';

class ConsultaMedicoPage extends StatefulWidget {
  @override
  _ConsultaMedicoPageState createState() => _ConsultaMedicoPageState();
}

class _ConsultaMedicoPageState extends State<ConsultaMedicoPage> {
  List<String> _laudos = ["1", "2", "3", "4", "4", "4", "4"];
  int _paginaBotton = 0;
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
                      'dd/MM/YYYY',
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
                      'dd/MM/YYYY',
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
            onPressed: () =>
                Navigator.pushReplacementNamed(context, '/'), //Mudar
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
          itemCount: _laudos.length,
          //gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(3.0),
              child: _builderCardLaudos(index),
            );
          },
        ),
      ),
    );
  }

  Widget _builderCardLaudos(int index) {
    String idd = index.toString();
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
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10)),
                color: Colors.blueGrey,
              ),
              height: 20,
              child: Row(
                children: <Widget>[
                  Expanded(flex:2, child: Text("Consulta",
                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 12),textAlign: TextAlign.center,)),
                ],
              ),

            ),
            ListTile(
              leading: Icon(Icons.person_add, size: 40, color: Colors.white),
              title: Text('Paciente', style: TextStyle(color: Colors.white)),
              subtitle: 
                  Text("Kakashi hatake $idd",
                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300),textAlign: TextAlign.left,),
                
                 
              trailing: Text("ID: $idd", style: TextStyle(color: Colors.white)),
            ),
            
            //Divider(),
             ListTile(
              leading: Icon(Icons.date_range, size: 40, color: Colors.white),
              title: Text('28/09/2019', style: TextStyle(color: Colors.white)),
              subtitle: 
                  Text("19:00 h",
                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300),textAlign: TextAlign.left,),
                
                 
              trailing: Text("Agendada", style: TextStyle(color: Colors.white)),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(90),bottomLeft: Radius.circular(0), bottomRight: Radius.circular(10)),
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
                      onPressed: () { Navigator.pushNamed(context, "/gerenciaConsultaMedicoPage");},
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
}
