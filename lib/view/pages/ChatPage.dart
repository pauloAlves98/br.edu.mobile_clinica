import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projeto_mobile_clinica/WebService/WebService.dart';
import 'package:projeto_mobile_clinica/model/bin/Medico.dart';
import 'package:projeto_mobile_clinica/model/utils/ConversaTask.dart';

 List<ConversasTask> conversasTasks = new List<ConversasTask>();

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  //List<ConversasTask> conversasTasks = new List<ConversasTask>();
  TextEditingController filtroController = new TextEditingController();
  DateFormat f = DateFormat("HH:mm");
  List<Medico> medicos = new List<Medico>();
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
        body: Stack(
          children: <Widget>[
            Positioned(
               top: 0,
        child: Padding(
          padding:EdgeInsets.only(top:0),
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
                      child:
                    Center(child:Container(
                        height: 40,
                        child:Center(child: 
                    TextField(
                      controller: filtroController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        
                        border: InputBorder.none,
                        hintStyle: TextStyle(),
                        hintText: "Nome"
                      ),
                    )),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(100))
                    ),
                    ),)),
                    IconButton(icon: Icon(Icons.search,color: Colors.white,),
                      onPressed: () async{
                          String filtro = filtroController.text.trim();
                          if(filtro.length<=0){
                            medicos = await WebService.consultaMedicoAll();
                          }else{
                            medicos = await WebService.consultaMedicoFiltro(filtro);
                          }
                          setState(() {
                            medicos;
                          });
                      },
                    )      
                 ]))),
               
              
          )
        ),))
      
      
            ),

            Positioned(
              top:30,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height:MediaQuery.of(context).size.height/1.95 ,
                child:ListView.builder(
                  dragStartBehavior:DragStartBehavior.start,
                  itemCount: medicos.length,
                  itemBuilder: (context,position){
                    return listConversas(medicos[position],f.format(DateTime.now()));
                  
            // return Dismissible(
            //   key: Key(tasks[position].toString()),
            //   background: _background(tasks[position].tema),
            //   child: _listContainers(tasks[position].medico,tasks[position].tempo , tasks[position].area, tasks[position].endereco, tasks[position].tema),
            //   onDismissed: (direction){
            //     if(direction==DismissDirection.startToEnd){
            //         Scaffold.of(context).showSnackBar(SnackBar(content: Text("delete"),));
            //         if(direction==DismissDirection.endToStart){
            //             setState(() {
            //               tasks.remove(tasks.removeAt(position));
            //             });
            //         }
            //     }
            //   },
            // );
          },

        )
              ),
            )
          ],
        ),


        
    );
  }
  Widget listConversas(Medico medico,String tempo){
    return  Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black26)
        ),
        height: 96,
        child: Material(
          color: Colors.white,
         // elevation: 1,
          shadowColor: Color(0x802196F3),
          child:GestureDetector(
            onTap: (){
                Navigator.pushNamed(context, '/conversaPrivada');
            },
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children:<Widget>[
              
             Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                /* Container(
                  width: 10,
                  height: 94,
                  color: tema,
                ), */
                Padding(padding: EdgeInsets.only(left:4),),
                Container(
                  alignment: Alignment.topLeft,
                  width: 60,
                  height: 60,
                  child: CircleAvatar(
                    radius: 35,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left:8,right: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            child: Text(medico.nome,style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            child: Text(medico.area,style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black87)),
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
          
          ])))
            
    );
  }
  
}