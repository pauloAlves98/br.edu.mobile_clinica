import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:projeto_mobile_clinica/model/Cores.dart';

class AgendarConsultaPage extends StatefulWidget {
  @override
  _AgendarConsultaPageState createState() => _AgendarConsultaPageState();
}

class _AgendarConsultaPageState extends State<AgendarConsultaPage> {
  CalendarController _calendarController;
   List<Widget> _containers = new List<Widget>(); 
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _calendarController = new CalendarController(
      
    );
    _containers.add(
        Stack(
          children: [
          Positioned(
            //alignment: Alignment(-0.9, -0.9),
            child: TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: 'What do people call you?',
                labelText: 'Name *',
              ),
          )  
        )]
    ));
    _containers.add(Container(
      
     
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
Text("Ana Paula",style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold ),),
                        ],),
                        Row(children: <Widget>[
 Text("Genecologista",style: TextStyle(fontSize: 15,fontStyle: FontStyle.italic,color: Colors.black45),),
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
          Row(),
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
          Row(children: <Widget>[
            Expanded(child: RaisedButton(
              onPressed: (){

              },
              child: Text("Agendar consulta"),) )
          ],),
          Row(children: <Widget>[
          Expanded(child: Container(
            height: 5,
            decoration: BoxDecoration(
                              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomRight,
                stops: [0.3, 1], //de acordo com o numero de cores!
                colors: [Color(0xFF6CD8F0), blueLogin1],
              ),
                      //         borderRadius: BorderRadius.all(Radius.circular(100))
                            ),
                )),
          ]),  
          Padding(padding: EdgeInsets.only(top: 5),)
        ],
      ),
    ));
     _containers.add(Container(
      
     
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
                    radius: 35,
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
Text("Ana Paula",style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold ),),
                        ],),
                        Row(children: <Widget>[
 Text("Genecologista",style: TextStyle(fontSize: 15,fontStyle: FontStyle.italic,color: Colors.black45),),
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
          Row(),
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
          Row(children: <Widget>[
            Expanded(child: RaisedButton(
              onPressed: (){

              },
              child: Text("Agendar consulta"),) )
          ],),
        

        ],
      ),
    ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Agendar Consulta"),
        ),
        body:Padding(
          padding: EdgeInsets.all(5),
          child:Container(
          child:SingleChildScrollView(child: Column(
            children: _containers,
          ),
        )), 
        
    ));
  }
}