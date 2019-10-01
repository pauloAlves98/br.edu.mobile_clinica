import 'package:flutter/material.dart';
import 'package:projeto_mobile_clinica/model/utils/Task.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:projeto_mobile_clinica/model/Cores.dart';

class AgendarConsultaPage extends StatefulWidget {
  @override
  _AgendarConsultaPageState createState() => _AgendarConsultaPageState();
}

class _AgendarConsultaPageState extends State<AgendarConsultaPage> {
  CalendarController _calendarController;
   List<Widget> _containers = new List<Widget>(); 
  List<Task> medicosModel = new List<Task>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    medicosModel.add(new Task("Felipe Antonio","15:30","Genecologista","Carnaiba,Rua  nova, N° Sala 17",Colors.black));
    medicosModel.add(new Task("Antonio","15:30","Dermatologista","Carnaiba,Rua  nova, N° Sala 17",Colors.blue));
    medicosModel.add(new Task("Gessica","15:30","Radiologista","Carnaiba,Rua  nova, N° Sala 17",Colors.red));
    medicosModel.add(new Task("Flavia","15:30","Ondotologista","Carnaiba,Rua  nova, N° Sala 17",Colors.orange));
    medicosModel.add(new Task("Julio","15:30","Nutricionista","Carnaiba,Rua  nova, N° Sala 17",Colors.green));
    _calendarController = new CalendarController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Agendar Consulta"),
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
        ),
        body:Padding(
          padding: EdgeInsets.all(0),
          child:Stack(
            children: <Widget>[
              Positioned(
                top: 0,
                child:Container(
          //color: Colors.blue,
          width: MediaQuery.of(context).size.width,
          height: 50,
          child:Material(
            //color: Colors.blue,
            elevation: 14,
            shadowColor:Color(0x802196F3),
            child:Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [ Colors.blue,Color(0xFF6CD8F0),],
                    begin: Alignment.topRight,
                    end: Alignment.bottomRight,
                    stops: [0.3, 1],
                  ),
              ),
            child: Padding(
              padding: EdgeInsets.only(left: 8,right: 8),
              child:Padding(
                padding: EdgeInsets.only(top: 4),
                child:Row(
                 children:<Widget>[
                
                    Expanded(
                      flex: 3,
                      child:Center(
                        child:Container(
                          height: 40,
                          child:Center(
                            child:TextField(
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                          
                                border: InputBorder.none,
                                hintStyle: TextStyle(),
                                hintText: "Nome"
                              ),
                            ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(100))
                        ),
                      ),
                    )
                  ),
                  IconButton(icon: Icon(Icons.search),
                     onPressed: (){

                    },
                  )

                 ]
                 )
                 )
                 ),
               
          ),
          ))),
              Positioned(
                top: 51,
                child:Container( 
                  width: MediaQuery.of(context).size.width,
                  height:MediaQuery.of(context).size.height/1.25 ,
                  child:ListView.builder(
                    itemCount:medicosModel.length,
                    itemBuilder: (context,index){
                      return _container(medicosModel[index].medico, medicosModel[index].area, medicosModel[index].endereco);
                    },
                  ),
                )
              )
            ]
          )
        
        )
            
    );
  }
  Widget _container(String nome,String area,String endereco){
    return Material(
      shadowColor: Colors.black38,
      elevation: 14,
      child:Container(
        decoration: BoxDecoration(
          border: Border.all(color:Colors.black45)
        ),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  width: 100,
                  height: 100,
                  child: CircleAvatar(
                    radius: 80,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child:Container(
                 padding: EdgeInsets.only(left: 10,top: 3),
                 width: 100,
                 height: 80,
                 alignment: Alignment.topLeft,
                  child:Column(
                    
                    children: <Widget>[
                        Row(children: <Widget>[
                          Text(nome,style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold ),),
                        ],),
                        Row(children: <Widget>[
                          Text(area,style: TextStyle(fontSize: 15,fontStyle: FontStyle.italic,color: Colors.black45),),
                        ],), 
                       
                        
                          Container(
                            alignment: Alignment.topCenter,
                            padding: EdgeInsets.only(top: 10),
                            height: 35,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomRight,
                                stops: [0.3, 1], //de acordo com o numero de cores!
                                colors: [Color(0xFF6CD8F0), blueLogin1],
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(100))
                            ),
                            child:Center(
                              child: Text("Ver preço",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),textDirection: TextDirection.ltr,),),
                          )
                        
                    ],
                  )
                ) 
              )
              
            ],
          ),
          Divider(
            color: Colors.black54,
          ),
          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child:Align(
                 alignment: Alignment.centerLeft,
                 child:Icon(Icons.location_on),
                )
              ),
              Expanded(
                flex: 4,
                child:Align(
                 alignment: Alignment.centerLeft,
                 child:Text(endereco),
                )
              ),
            ],
          ),
          Divider(
            color: Colors.black54,
          ),
          TableCalendar(
            initialCalendarFormat: CalendarFormat.twoWeeks,
            calendarController: _calendarController,
            locale: 'pt-br',
            
            

            headerStyle: HeaderStyle(
              centerHeaderTitle: true,
              formatButtonVisible: false,
            ),
            onDaySelected: (DateTime data, List<dynamic> list){
                
            }, 
          ),
          Padding(
            padding: EdgeInsets.only(left: 5,right: 5),
            child:Row(children: <Widget>[
            Expanded(
              child: RaisedButton(
                onPressed: (){
                    setState(() {
                      
                    });
                },
                color: Colors.blue,
                child: Text("Agendar consulta"),) )
          ],)),
            
          Padding(padding: EdgeInsets.only(bottom: 5),)
        ],
      ),
    ));
  }
}