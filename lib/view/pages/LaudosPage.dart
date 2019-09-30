import 'package:flutter/material.dart';
import 'package:projeto_mobile_clinica/model/utils/Task.dart';
class LaudosPage extends StatefulWidget {
  @override
  _LaudosPageState createState() => _LaudosPageState();
}

class _LaudosPageState extends State<LaudosPage> {
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
      Positioned(
        top: 0,
        child: Padding(
          padding:EdgeInsets.only(top:0),
        child:Container(
          color: Colors.blue,
          width: MediaQuery.of(context).size.width,
          height: 91,
          child:Material(
            color: Colors.blue,
            elevation: 14,
            shadowColor:Color(0x802196F3),
           child:Column(
             children:<Widget>[
               Padding(
                 padding: EdgeInsets.only(left: 8,right: 8,top:3),
                 child:
               Row(
                 children: <Widget>[
                    Expanded(
                      
                      child:Center(child:Container(
                        height: 40,
                        child:Center(child: 
                    TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        
                        border: InputBorder.none,
                        hintStyle: TextStyle(),
                        hintText: "dd/MM/YYYY"
                      ),
                    )),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(100))
                    ),
                    ),)),
                     Padding(
                       padding: EdgeInsets.only(left: 2,right: 2),
                       child:Container(
                         
                         decoration: BoxDecoration(
                           color: Colors.white,
                           shape: BoxShape.circle
                         ),
                         child:Icon(Icons.compare_arrows)),
                     ),
                     Expanded(
                      
                      child:
                    Center(child:Container(
                        height: 40,
                        child:Center(child: 
                    TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        
                        border: InputBorder.none,
                        hintStyle: TextStyle(),
                        hintText: "dd/MM/YYYY"
                      ),
                    )),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(100))
                    ),
                    ),)),
                 ],
               ),),
               Padding(
                 padding: EdgeInsets.only(left: 8,right: 8),
               child:Padding(
                 padding: EdgeInsets.only(top: 4),
                 child:
               Row(
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
                        hintText: "Nome ou Profissão"
                      ),
                    )),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(100))
                    ),
                    ),)),
              //       Expanded(child:
              //       Padding(
              //         padding: EdgeInsets.only(left:2,right:8),
              //         child:
              //       Container(
              //           height: 40,
                        
              //           child:Center(child:
              //             IconButton(
              //               icon: Icon(Icons.search),
              //               onPressed: (){

              //               },
              //             )
              //           ),
              //           decoration: BoxDecoration(
              //         color: Colors.white,
              //         borderRadius: BorderRadius.all(Radius.circular(100))
              //       ),
              //         ))
              //       ),
              //     ]
              //  )
              //)
                 ]))),
               
              ]
            )
          )
        ),)
      ),
      

      Positioned(
      top: 100,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height:MediaQuery.of(context).size.height-160 ,
        child:ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context,position){
            return Dismissible(
              key: Key(tasks[position].toString()),
              background: _background(tasks[position].tema),
              child: _listContainers(tasks[position].medico,tasks[position].tempo , tasks[position].area, tasks[position].endereco, tasks[position].tema),
              onDismissed: (direction){
                if(direction==DismissDirection.startToEnd){
                    Scaffold.of(context).showSnackBar(SnackBar(content: Text("delete"),));
                    if(direction==DismissDirection.endToStart){
                        setState(() {
                          tasks.remove(tasks.removeAt(position));
                        });
                    }
                }
              },
            );
          },

        )
      ),
    )]
    ),
    floatingActionButton: FloatingActionButton(
          onPressed: () {
             Navigator.pushReplacementNamed(context, '/agendarConsulta');
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
      child: Container(
        height: 80,
        child: Material(
          color: Colors.white,
          elevation: 14,
          shadowColor: Color(0x802196F3),
          child: Container(
            child: Row(
              children: <Widget>[
                Container(
                  width: 10,
                  height: 80,
                  color: tema,
                ),
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
    );
  }
}