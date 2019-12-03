import 'package:flutter/material.dart';
import 'package:projeto_mobile_clinica/WebService/EnderecoUrls.dart';
import 'package:projeto_mobile_clinica/WebService/WebService.dart';
import 'package:projeto_mobile_clinica/model/bin/Consulta.dart';
import 'package:projeto_mobile_clinica/model/bin/Corrente.dart';
import 'package:projeto_mobile_clinica/model/bin/Endereco.dart';
import 'package:projeto_mobile_clinica/model/bin/Medico.dart';
import 'package:projeto_mobile_clinica/model/utils/Task.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:projeto_mobile_clinica/model/Cores.dart';
import 'package:intl/intl.dart';


final Map<DateTime, List> _holidays = {
  DateTime(2019, 1, 1): ['New Year\'s Day'],
  DateTime(2019, 1, 6): ['Epiphany'],
  DateTime(2019, 2, 14): ['Valentine\'s Day'],
  DateTime(2019, 4, 21): ['Easter Sunday'],
  DateTime(2019, 4, 22): ['Easter Monday'],
};

class AgendarConsultaPage extends StatefulWidget {
  
  static List<Medico> medicos = new List<Medico>();
  @override
  _AgendarConsultaPageState createState() => _AgendarConsultaPageState();
}

class _AgendarConsultaPageState extends State<AgendarConsultaPage> {
  CalendarController _calendarController;
   List<Widget> _containers = new List<Widget>(); 
  
  List _cities =
  ["6:00 h","8 h e 30 min", "10:00 h","11 h e 30 min","15:00 h","16 h e 30 min", "18:00 h"];
  DateTime data_consulta=DateTime.now();
   List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _currentCity;
  @override
  void initState() {

    // TODO: implement initState
    super.initState();
    _dropDownMenuItems = getDropDownMenuItems();
    _currentCity = _dropDownMenuItems[0].value;
    
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
                        data_consulta = data;
                        
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
                      itemCount:AgendarConsultaPage.medicos.length,
                      itemBuilder: (context,index){
                        return _container(AgendarConsultaPage.medicos[index], index);
                      },
                  )
                )
              )
            ]
          )
        
        )
            
    );
  }
  Widget _container(Medico m,int i){
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
                          Text(m.nome+"("+m.area+")",style: TextStyle(fontSize: 14,fontWeight:FontWeight.bold,color: Colors.white ),),
                     
                        ],),
          /* Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              
              Icon(Icons.location_on,color: Colors.white,),

              Align(
                 alignment: Alignment.centerLeft,
                 child:Text(endereco.cidade+","+endereco.rua+","+,style: TextStyle(color: Colors.white),),
                )
              
            ],
          ), */
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
                onPressed: () async{
                    Consulta consulta = new Consulta();
                    var temp = _currentCity.split(" ");
                    String hora;
                    String min;
                    if(temp.length>2){
                      hora=temp[0];
                      
                      min = temp[3];
                    }else{
                      hora=temp[0].split(":")[0];
                      min=temp[0].split(":")[1];
                    }
                    print(min);
                   
                    DateFormat   f = new DateFormat('dd/MM/yyyy hh:mm');
                    data_consulta = f.parse(data_consulta.day.toString()+"/"+data_consulta.month.toString()+"/"+data_consulta.year.toString()+" "
                                    +hora+":"+min);
                    consulta.data_hora=data_consulta;
                    consulta.situacao = "Agendada";
                    consulta.tipo="Primeira";
                    consulta.id_paciente=Corrente.pacienteCorrente;
                    consulta.id_medico=m;
                    consulta.valor=50;
                    //consulta.id_medico = 
                    bool v = await WebService.consultaSaveEdit(consulta, EnderecoUrls.CONSULTA_SAVE_EDIT);
                    print(v);
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