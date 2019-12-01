import 'package:flutter/material.dart';
import 'package:projeto_mobile_clinica/model/utils/Task.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:projeto_mobile_clinica/model/Cores.dart';

final Map<DateTime, List> _holidays = {
  DateTime(2019, 1, 1): ['New Year\'s Day'],
  DateTime(2019, 1, 6): ['Epiphany'],
  DateTime(2019, 2, 14): ['Valentine\'s Day'],
  DateTime(2019, 4, 21): ['Easter Sunday'],
  DateTime(2019, 4, 22): ['Easter Monday'],
};

class AgendarConsultaPage extends StatefulWidget {
  @override
  _AgendarConsultaPageState createState() => _AgendarConsultaPageState();
}

class _AgendarConsultaPageState extends State<AgendarConsultaPage> {
  CalendarController _calendarController;
   List<Widget> _containers = new List<Widget>(); 
  List<Task> medicosModel = new List<Task>();
  List _cities =
  ["Cluj-Napoca", "Bucuresti", "Timisoara", "Brasov", "Constanta"];

   List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _currentCity;
  @override
  void initState() {

    // TODO: implement initState
    super.initState();
    _dropDownMenuItems = getDropDownMenuItems();
    _currentCity = _dropDownMenuItems[0].value;
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
          backgroundColor: Colors.blue,
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
                top: -10,
                child:Container( 
                  width: MediaQuery.of(context).size.width,
                  height:MediaQuery.of(context).size.height/1.25 ,
                  child:TableCalendar(
                    holidays: _holidays,                 
                    calendarController: _calendarController,
                    locale: 'pt-br',
            
                    calendarStyle: CalendarStyle(
                      selectedColor: Colors.black45,
                      todayColor: Colors.orange,
                      markersColor: Colors.green,
                      outsideDaysVisible: false,
                    ),
                    headerStyle: HeaderStyle(
                      centerHeaderTitle: true,
                      formatButtonVisible: false,
                      formatButtonTextStyle:TextStyle().copyWith(color: Colors.white, fontSize: 15.0),
                      formatButtonDecoration: BoxDecoration(
                        color: Colors.deepOrange[400],
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),

           
                    onDaySelected: (DateTime data, List<dynamic> list){
                        
                    }, 
                  ),
                  
                  /*
                  ), */
                )
              ),
              Positioned(
                top: 312,
                child:Container( 
                 
                  width: MediaQuery.of(context).size.width,
                  height:MediaQuery.of(context).size.height/2.95,
                  child:ListView.builder(
                      itemCount:medicosModel.length,
                      itemBuilder: (context,index){
                        return _container(medicosModel[index].medico, medicosModel[index].area, medicosModel[index].endereco,index);
                      },
                  )
                )
              )
            ]
          )
        
        )
            
    );
  }
  Widget _container(String nome,String area,String endereco,int i){
    return Material(
      shadowColor: Colors.black38,
      elevation: 14,
      child:Container(
        decoration: BoxDecoration(
          border: Border.all(color:Colors.black45),
          gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomRight,
                stops: [0.3, 1], //de acordo com o numero de cores!
                colors: [Color(0xFF6CD8F0), blueLogin1],
              ),
        ),
                    
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top:4),),
          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  width: 80,
                  height: 80,
                  child:Center(
                   child:CircleAvatar(
                    radius: 50,
                  ),)
                ),
              ),
             
                  ],
              ),
              
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
                          Text(nome+"("+area+")",style: TextStyle(fontSize: 14,fontWeight:FontWeight.bold,color: Colors.white ),),
                        ],),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              
              Icon(Icons.location_on,color: Colors.white,),

              Align(
                 alignment: Alignment.centerLeft,
                 child:Text(endereco,style: TextStyle(color: Colors.white),),
                )
              
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
               Container(
                 width: 140,
                 height: 40,
                 child: Center(
                   child:new DropdownButton(
                value: _currentCity,
                items: _dropDownMenuItems,
                onChanged: changedDropDownItem,
                iconEnabledColor: Colors.white,
                iconDisabledColor: Colors.white,
              ))
               ),
              Container(
                height: 30,
                
              child:RaisedButton(
                onPressed: (){
                    setState(() {
                      
                    });

                },
                color: Colors.black,
                child: Text("Preco",style: TextStyle(color: Colors.white),),
                ))
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 5,right: 5,bottom: 5),
            child:Row(children: <Widget>[
            Expanded(
              child:Container(
                height: 30,
               child:RaisedButton(
                onPressed: (){
                    setState(() {
                      
                    });
                },
                color: Colors.white,
                child: Text("Agendar consulta",style: TextStyle(color: Colors.blue),),) ))
          ],)),

          
        ],
      ),
    ));
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String city in _cities) {
      items.add(new DropdownMenuItem(
          value: city,
          child: new Text(city)
      ));
    }
    return items;
  }

   void changedDropDownItem(String selectedCity) {
    setState(() {
      _currentCity = selectedCity;
    });
  }
}