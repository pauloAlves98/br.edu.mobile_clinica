import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projeto_mobile_clinica/WebService/WebService.dart';
import 'package:projeto_mobile_clinica/model/bin/Consulta.dart';
import 'package:projeto_mobile_clinica/model/bin/Corrente.dart';
import 'package:projeto_mobile_clinica/model/utils/Task.dart';
import 'package:projeto_mobile_clinica/model/Cores.dart';
import 'package:projeto_mobile_clinica/view/widgets/ShowDateWidget.dart';

class ConsultaPage extends StatefulWidget {
  @override
  _ConsultaPageState createState() => _ConsultaPageState();
}

class _ConsultaPageState extends State<ConsultaPage> {
  List<Consulta> consultas = List<Consulta>();
  DateTime selectedDate = DateTime.now();
   bool vazio = false;
  String campoData1=" ", campoData2="";
  TextEditingController filtroController = new TextEditingController();
  List<Task> tasks = new List<Task>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tasks.add(new Task("Ana Paula","13:00","Genecologista","Recife-PE",Colors.red));
    tasks.add(new Task("Rafael","15:00","Dermatologista","Recife-PE",Colors.blue));
    tasks.add(new Task("Ana Paula","13:00","Genecologista","Recife-PE",Colors.red));
    tasks.add(new Task("Rafael","15:00","Dermatologista","Recife-PE",Colors.blue));
    tasks.add(new Task("Ana Paula","13:00","Genecologista","Recife-PE",Colors.red));
    tasks.add(new Task("Rafael","15:00","Dermatologista","Recife-PE",Colors.blue));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Stack(children:<Widget>[ 
      _builderCabecarioBusca(),
      

      Positioned(
      top: 90,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height:MediaQuery.of(context).size.height/2.55 ,
        child:ListView.builder(
          itemCount: consultas.length,
          itemBuilder: (context,position){
              return _builderCardLaudos(consultas[position],position);//_listContainers(tasks[position].medico,tasks[position].tempo , tasks[position].area, tasks[position].endereco, tasks[position].tema),
              
            
          },

        )
      ),
    )]
    ),
    floatingActionButton: FloatingActionButton(
          onPressed: () {
             Navigator.pushNamed(context, '/agendarConsulta');
           },
          child: Icon(Icons.add),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    bottomNavigationBar: BottomAppBar(
      color: Colors.blue,
      shape: CircularNotchedRectangle(),
      child: Row(
        children: <Widget>[
          
             Container(
               height: 50,
             ),
          
        ],
      ),
    ),
    );
  }
  Widget _background(Color cor){
    return Container(
      height: MediaQuery.of(context).size.height,
      color: cor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              icon: Icon(Icons.delete,color: Colors.white,),
              onPressed: (){

              },
              )
          
          ),
            Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: Icon(Icons.archive,color: Colors.white,),
              onPressed: (){

              },
              )
          
          )
        ],
      ),
    );
  }

  Widget _listContainers(String medico,String tempo,String area, String endereco,Color tema){
    return Padding(
      padding: EdgeInsets.all(8),
      child:GestureDetector(
        onTap: (){
          vizualizarConsulta();
        }, 
      child:Container(
        height: 80,
        child: Material(
          color: Colors.white,
          elevation: 14,
          shadowColor: Color(0x802196F3),
          child: Container(
            child: Row(
              children: <Widget>[
                
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            child: Text(medico+"("+area+")",style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            child: Text(endereco,style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black87)),
                          ),
                        ),
                        
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    child: Text(tempo,style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.lightGreen)),
                  ),
                ),
                Padding(
                          padding: EdgeInsets.only(right: 8),
                        )
              ],
            ),
          ),
        )
      ),
    ));
  }
   Widget _builderCardLaudos(Consulta consulta,int index) {
    String idd = index.toString();
    DateFormat   f = new DateFormat('dd/MM/yyyy hh:mm');
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        color: Colors.white,
        elevation: 10,
        child:Row(children: <Widget>[
          
          Expanded(
         
          child:Column(
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
              leading: Icon(Icons.person_add, size: 40, color: Colors.blue),
              title: Text('Medico', style: TextStyle(color: Colors.blue)),
              subtitle: 
                  Text(consulta.id_medico.nome,
                  style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w300),textAlign: TextAlign.left,),
                
                 
              trailing: Text(consulta.id_medico.area, style: TextStyle(color: Colors.blue)),
            ),
            
            //Divider(),
             ListTile(
              leading: Icon(Icons.date_range, size: 40, color: Colors.blue),
              title: Text(f.format(consulta.data_hora), style: TextStyle(color: Colors.blue)),     
                 
              trailing: Text(consulta.situacao, style: TextStyle(color: Colors.blue)),
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
                      onPressed: () { vizualizarConsulta();
},
                    ), 
                   ),
                   
                  
                ],
              ),
        
             
            )
          ],
        )),
        ],)
         
      ),
    );
  }
  void vizualizarConsulta(){
    Navigator.pushNamed(context, '/vizualisarEditarConsulta');
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
                        DateFormat  f = new DateFormat('dd/MM/yyyy');//yyyy-MM-dd hh:mm
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
                        hintColor: Colors.blue,
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
            colors: [Color(0xFF6CD8F0), Colors.black],
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
                 consultas = await WebService.consultaConsultaAll(Corrente.pacienteCorrente.id,Corrente.usuarioPaciente);
              }else if(campoData2.trim().length<=0 && campoData1.trim().length<=0 ){
                campoData2 = "01/12/2200";
                campoData1 = "01/01/1900";
                print("Cond 2");
                consultas = await WebService.consultaConsultaFiltro(campoData1,campoData2,filtro,Corrente.pacienteCorrente.id,Corrente.usuarioPaciente);
                
                      //Datas padroes.
              }
              else if(campoData2.trim().length<=0){
                       campoData2 = "01/12/2200";
                       print("Cond 3");
                       consultas = await WebService.consultaConsultaFiltro(campoData1,campoData2,filtro,Corrente.pacienteCorrente.id,Corrente.usuarioPaciente);
              }else if(campoData1.trim().length<=0){
                      campoData1 = "01/01/1900";
                      print("Cond 4");
                      consultas = await WebService.consultaConsultaFiltro(campoData1,campoData2,filtro,Corrente.pacienteCorrente.id,Corrente.usuarioPaciente);
              }else if(campoData2.trim().length<=0 && campoData1.trim().length<=0 && filtro.length!=0){
                       campoData1 = "01/01/1900";
                       campoData2 = "01/12/2200";
                       consultas = await WebService.consultaConsultaFiltro(campoData1,campoData2,filtro,Corrente.pacienteCorrente.id,Corrente.usuarioPaciente);
                       print("Cond 5");
              }else
                 consultas = await WebService.consultaConsultaFiltro(campoData1,campoData2,filtro,Corrente.pacienteCorrente.id,Corrente.usuarioPaciente);

              if(consultas.length<=0){
                    consultas.add(new Consulta());//pra movvimentar o len
                    vazio = true;
                }
              setState(() {
                consultas;
              });
              
              //Navigator.pushReplacementNamed(context, '/'); //Mudar
            }
               
          ),
        ),
      ),
    );
  }

}
