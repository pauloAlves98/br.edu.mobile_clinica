import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:projeto_mobile_clinica/model/utils/ConversaTask.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ConversasTask> conversasTasks = new List<ConversasTask>();

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    conversasTasks.add(new ConversasTask("Felipe Antonio","15:30","Genecologista",Colors.black));
    conversasTasks.add(new ConversasTask("Antonio","15:30","Dermatologista",Colors.blue));
    conversasTasks.add(new ConversasTask("Gessica","15:30","Radiologista",Colors.red));
    conversasTasks.add(new ConversasTask("Flavia","15:30","Ondotologista",Colors.orange));
    conversasTasks.add(new ConversasTask("Julio","15:30","Nutricionista",Colors.green));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    IconButton(icon: Icon(Icons.search),
                      onPressed: (){

                      },
                    )      
                 ]))),
               
              
          )
        ),))
      
      
            ),

            Positioned(
              top:51,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height:MediaQuery.of(context).size.height/1.95 ,
                child:ListView.builder(
                  dragStartBehavior:DragStartBehavior.start,
                  itemCount: conversasTasks.length,
                  itemBuilder: (context,position){
                    return listConversas(conversasTasks[position].nome, conversasTasks[position].tempo,conversasTasks[position].status, conversasTasks[position].tema);
                  
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
  Widget listConversas(String nome,String tempo,String status,Color tema){
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
            child:Column(children:<Widget>[
             Container(
            child: Row(
              children: <Widget>[
                Container(
                  width: 10,
                  height: 94,
                  color: tema,
                ),
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
                    padding: EdgeInsets.only(left:8,right: 8,top:2,bottom:0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            child: Text(nome,style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            child: Text(status,style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black87)),
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
    
  }

}