import 'package:flutter/material.dart';
import 'package:projeto_mobile_clinica/model/utils/Task.dart';
import 'package:projeto_mobile_clinica/model/Cores.dart';

class ConsultaPage extends StatefulWidget {
  @override
  _ConsultaPageState createState() => _ConsultaPageState();
}

class _ConsultaPageState extends State<ConsultaPage> {
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
          //color: Colors.blue,
          width: MediaQuery.of(context).size.width,
          height: 91,
          
          child:Material(
           // color: Colors.blue,
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
          ))
        ),)
      ),
      

      Positioned(
      top: 90,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height:MediaQuery.of(context).size.height/2.55 ,
        child:ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context,position){
              return _builderCardLaudos(tasks[position].medico,position,tasks[position].area);//_listContainers(tasks[position].medico,tasks[position].tempo , tasks[position].area, tasks[position].endereco, tasks[position].tema),
              
            
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
   Widget _builderCardLaudos(String medico,int index,String area) {
    String idd = index.toString();
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
                  Text(medico,
                  style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w300),textAlign: TextAlign.left,),
                
                 
              trailing: Text(area, style: TextStyle(color: Colors.blue)),
            ),
            
            //Divider(),
             ListTile(
              leading: Icon(Icons.date_range, size: 40, color: Colors.blue),
              title: Text('28/09/2019', style: TextStyle(color: Colors.blue)),
              subtitle: 
                  Text("19:00 h",
                  style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w300),textAlign: TextAlign.left,),
                
                 
              trailing: Text("Agendada", style: TextStyle(color: Colors.blue)),
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
}
