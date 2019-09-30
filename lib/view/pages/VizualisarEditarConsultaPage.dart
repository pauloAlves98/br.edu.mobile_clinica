import 'package:flutter/material.dart';
import 'package:projeto_mobile_clinica/model/Cores.dart';

class VizualisarEditarConsultaPage extends StatefulWidget {
  @override
  _VizualisarEditarConsultaPageState createState() => _VizualisarEditarConsultaPageState();
}

class _VizualisarEditarConsultaPageState extends State<VizualisarEditarConsultaPage> {
 bool foco = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF6CD8F0), blueLogin1],
                     begin: Alignment.centerRight,
                     end: Alignment(-1.0,-1.0),
                  ),
                   
                ),
                child: Stack(
        children: <Widget>[
         

          Positioned(
            top:10,
           
            child:Padding(
              padding: EdgeInsets.all(10),
              child:Container(
              width: MediaQuery.of(context).size.width/1.05,
              height:MediaQuery.of(context).size.height/6.5 ,
              color:Colors.white,
              child:Column(children: <Widget>[SizedBox(height: 10,),
              Text("Consulta".toUpperCase(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
              ])),)
           ),

           Positioned(
            top:15 ,
            left: 10,
            child: IconButton(
              icon: Icon(Icons.arrow_back,size: 30,),
              onPressed: (){
                  Navigator.popAndPushNamed(context,'/pacienteHomePage');
              },
            ),
          ),

          Positioned(
            top: (MediaQuery.of(context).size.height/5.5) ,
            child:Padding(
              padding: EdgeInsets.all(10),
              child: Container(
              width: MediaQuery.of(context).size.width/1.05,
              height:MediaQuery.of(context).size.height/1.35,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top:50,
                  bottom: 10
                ),
                child: Column(
                  children: <Widget>[
                    Text("Felipe Antonio",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                    SizedBox(height: 20,),
                    Text("Dados Do Medico",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                    Container(
                        
                        height: 146,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border:Border.all(color: Colors.black)) ,
                        
                        child:Center(child:Column(
                          children: <Widget>[
                              Row(children: <Widget>[
                                Icon(Icons.location_city),
                                Text("Profissão:",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)) ,
                                Text("Dermatologista",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold))
                              ],),
                              Row(children: <Widget>[
                                Icon(Icons.location_city),
                                Text("Rua:",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)) ,
                                Text("O Cassete come",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold))
                              ],),
                              Row(children: <Widget>[
                                Icon(Icons.location_city),
                                Text("Clinica:",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)) ,
                                Text("Maria gode de santana",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold))
                              ],),
                              Row(children: <Widget>[
                                Icon(Icons.location_city),
                                Text("N° da Sala:",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)) ,
                                Text("12",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold))
                              ],),
                              Container(
                                alignment: Alignment.bottomRight,
                                child:Center(child:IconButton(
                                icon: Icon(Icons.edit,color: Colors.white,),
                                  alignment: Alignment.centerRight,
                                  onPressed: (){
                                      editDados(Icons.person, "Profissao", "Rua", "Clinica", "N° da Sala");
                                  },
                              )),
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                ),
                            )
                          ],
                        ),
                      ) ), 
                    //SizedBox(height: 10,),
                    SizedBox(height: 20,),
                    Text("Dados Da Consulta",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                   Container(
                     alignment: Alignment.bottomRight,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.all(Radius.circular(10)),
                          border:Border.all(color: Colors.black)) ,
                     child:Column(children: <Widget>[
                     Row(children: <Widget>[
                      Icon(Icons.location_city),
                      Text("Data do Agendamento:",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)) ,
                      Text("10/05/1999",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold))
                    ],),
                    Row(children: <Widget>[
                      Icon(Icons.location_city),
                      Text("Data da Consulta:",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)) ,
                      Text("15/02/1999",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold))
                    ],),
                    Row(children: <Widget>[
                      Icon(Icons.location_city),
                      Text("Horario:",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)) ,
                      Text("15:30",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold))
                    ],),
                   Container(
                     alignment: Alignment.bottomRight,
                     child:Center(child:IconButton(
                                icon: Icon(Icons.edit,color: Colors.white,),
                                  alignment: Alignment.center,
                                  onPressed: (){

                                  },
                                )),
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                ),
                            )
                   ],)
                    
                  
            )]))))    
              
            
          ),
          Positioned(
            top: 60,
            left:MediaQuery.of(context).size.width/2.75 ,
            child: Center(
              child:Container(
                child: CircleAvatar(

                  radius: 50,
                ),
              ) ,),
          )
        ],
      ),
            ), 
    );   
    
  }
   void editDados(IconData icone, String profissao,String rua,String clinica, String numero){
     showDialog(
        context: context,
                                    builder: (BuildContext context){
                                        return Stack(children: <Widget>[ 
                                        Positioned(
                                          left: -39,
                                          top:foco ?-35 :MediaQuery.of(context).size.height-400,
                                          child:Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(new Radius.circular(360))
                                            ),
                                            child:AlertDialog(
                                          content: Container(
                                            width:MediaQuery.of(context).size.width-39,
                                            height: 240,
                                            
                                            child: Column(
                                              children: <Widget>[
                                                Row(children: <Widget>[
                                                Icon(icone),
                                                Padding(
                                                  padding: EdgeInsets.only(left: 10)
                                                ),
                                                Expanded(
                                                  child: TextField(
                                                    decoration: InputDecoration(
                                                      labelText: profissao
                                                    ),
                                                    onTap: (){
                                                        setState(() {
                                                         foco=true; 
                                                        });
                                                    },
                                                  ),
                                                ),
                                                ]),
                                                Row(children: <Widget>[
                                                Icon(icone),
                                                Padding(
                                                  padding: EdgeInsets.only(left: 10)
                                                ),
                                                Expanded(
                                                  child: TextField(
                                                    decoration: InputDecoration(
                                                      labelText: clinica
                                                    ),
                                                    onTap: (){
                                                        setState(() {
                                                         foco=true; 
                                                        });
                                                    },
                                                  ),
                                                ),
                                                ]),
                                                Row(children: <Widget>[
                                                Icon(icone),
                                                Padding(
                                                  padding: EdgeInsets.only(left: 10)
                                                ),
                                                Expanded(
                                                  child: TextField(
                                                    decoration: InputDecoration(
                                                      labelText: rua
                                                    ),
                                                    onTap: (){
                                                        setState(() {
                                                         foco=true; 
                                                        });
                                                    },
                                                  ),
                                                ),
                                                ]),
                                                Row(children: <Widget>[
                                                Icon(icone),
                                                Padding(
                                                  padding: EdgeInsets.only(left: 10)
                                                ),
                                                Expanded(
                                                  child: TextField(
                                                    decoration: InputDecoration(
                                                      labelText: numero
                                                    ),
                                                    onTap: (){
                                                        setState(() {
                                                         foco=true; 
                                                        });
                                                    },
                                                  ),
                                                ),
                                                ])
                                                
                                              ],
                                            ),
                                          ),
                                          actions: <Widget>[
                                            FlatButton(child: Text("Salvar"),
                                            onPressed: (){
                                              setState(() {
                                               foco=false; 
                                              });
                                            },
                                            )
                                          ],
                                        )))]);
                                    }
                                  );
  }
}