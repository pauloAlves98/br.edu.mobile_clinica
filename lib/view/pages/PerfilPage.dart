import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:projeto_mobile_clinica/model/Cores.dart';
import "dart:io";
class PerfilPage extends StatefulWidget {
  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  String _path = '';
  String title = 'Dados Pessoais';
  int op=0;
  List<Widget> opcoes = new List<Widget>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   
  }
  Widget preencher(){
     opcoes.add(
      Positioned(
              top: 220.0,
              left: 18.0,
              child: Container(
                color: Colors.white,
                width: 325,
                height: MediaQuery.of(context).size.height/1.85,
                child: SingleChildScrollView(
                  child:Padding(
                    padding: EdgeInsets.all(15),
                    child:Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child:GestureDetector(
                                child:Row(
                                  children: <Widget>[
                                      Icon(Icons.person,size: 30,),
                                      Expanded(
                                        child:Padding(
                                          padding: EdgeInsets.only(left: 20),
                                          child:  Column(
                                            children: <Widget>[
                                              Row(children: <Widget>[Text("Nome",style: TextStyle(fontSize: 15),),],), 
                                              Row(children: <Widget>[Text("Felipe Antonio",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)])
                                            ],
                                          ),
                                        )
                                       
                                      ),
                                      Icon(Icons.edit,size: 28,)
                                  ],
                                ),
                                
                              ) 
                              
                            ),
                            
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top:10),
                        ),
                        Divider(
                          color: Colors.black87,
                        ),
Padding(
                          padding: EdgeInsets.only(top:10),
                        ),
                        Row(children: <Widget>[
                            Expanded(
                              child:GestureDetector(
                                child:Row(
                                  children: <Widget>[
                                      Icon(Icons.perm_identity,size: 30,),
                                      Expanded(
                                        child:Padding(
                                          padding: EdgeInsets.only(left: 20),
                                          child:  Column(
                                            children: <Widget>[
                                              Row(children: <Widget>[Text("RG",style: TextStyle(fontSize: 15),),],), 
                                              Row(children: <Widget>[Text("9.634.379",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)])
                                            ],
                                          ),
                                        )
                                       
                                      ),
                                      Icon(Icons.edit,size: 28,)
                                  ],
                                ),
                              ) 
                            ),
                          ],),
                          Padding(
                          padding: EdgeInsets.only(top:10),
                        ),
                        Divider(
                          color: Colors.black87,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top:10),
                        ),
                        Row(children: <Widget>[
                            Expanded(
                              child:GestureDetector(
                                child:Row(
                                  children: <Widget>[
                                      Icon(Icons.picture_in_picture,size: 30,),
                                      Expanded(
                                        child:Padding(
                                          padding: EdgeInsets.only(left: 20),
                                          child:  Column(
                                            children: <Widget>[
                                              Row(children: <Widget>[Text("CPF",style: TextStyle(fontSize: 15),),],), 
                                              Row(children: <Widget>[Text("057.439.634-79",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)])
                                            ],
                                          ),
                                        )
                                       
                                      ),
                                      Icon(Icons.edit,size: 28,)
                                  ],
                                ),
                              ) 
                            ),
                          ],),
                        Padding(
                          padding: EdgeInsets.only(top:10),
                        ),
                        Divider(
                          color: Colors.black87,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top:10),
                        ),
                        Row(children: <Widget>[
                            Expanded(
                              child:GestureDetector(
                                child:Row(
                                  children: <Widget>[
                                      Icon(Icons.date_range,size: 30,),
                                      Expanded(
                                        child:Padding(
                                          padding: EdgeInsets.only(left: 20),
                                          child:  Column(
                                            children: <Widget>[
                                              Row(children: <Widget>[Text("Data de Nascimento",style: TextStyle(fontSize: 15),),],), 
                                              Row(children: <Widget>[Text("13/06/1999",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)])
                                            ],
                                          ),
                                        )
                                       
                                      ),
                                      Icon(Icons.edit,size: 28,)
                                  ],
                                ),
                              ) 
                            ),
                          ],),
                        Padding(
                          padding: EdgeInsets.only(top:10),
                        ),
                        Divider(
                          color: Colors.black87,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top:10),
                        ),
                        Row(children: <Widget>[
                            Expanded(
                              child:GestureDetector(
                                child:Row(
                                  children: <Widget>[
                                      Icon(Icons.person,size: 30,),
                                      Expanded(
                                        child:Padding(
                                          padding: EdgeInsets.only(left: 20),
                                          child:  Column(
                                            children: <Widget>[
                                              Row(children: <Widget>[Text("Sexo",style: TextStyle(fontSize: 15),),],), 
                                              Row(children: <Widget>[Text("Masculino",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)])
                                            ],
                                          ),
                                        )
                                       
                                      ),
                                      Icon(Icons.edit,size: 28,)
                                  ],
                                ),
                              ) 
                            ),
                          ],),
                        Padding(
                          padding: EdgeInsets.only(top:10),
                        ),
                        Divider(
                          color: Colors.black87,
                        ),
                        Row(children: <Widget>[
                            Expanded(
                              child:GestureDetector(
                                child:Row(
                                  children: <Widget>[
                                      Icon(Icons.phone,size: 30,),
                                      Expanded(
                                        child:Padding(
                                          padding: EdgeInsets.only(left: 20),
                                          child:  Column(
                                            children: <Widget>[
                                              Row(children: <Widget>[Text("Telefone 1",style: TextStyle(fontSize: 15),),],), 
                                              Row(children: <Widget>[Text("(87) 9 9819-9559",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)])
                                            ],
                                          ),
                                        )
                                       
                                      ),
                                      Icon(Icons.edit,size: 28,)
                                  ],
                                ),
                              ) 
                            ),
                          ],),
                          Padding(
                          padding: EdgeInsets.only(top:10),
                        ),
                        Divider(
                          color: Colors.black87,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top:10),
                        ),
                        Row(children: <Widget>[
                            Expanded(
                              child:GestureDetector(
                                child:Row(
                                  children: <Widget>[
                                      Icon(Icons.phone,size: 30,),
                                      Expanded(
                                        child:Padding(
                                          padding: EdgeInsets.only(left: 20),
                                          child:  Column(
                                            children: <Widget>[
                                              Row(children: <Widget>[Text("Telefone 2",style: TextStyle(fontSize: 15),),],), 
                                              Row(children: <Widget>[Text("(87) 9 9856-8765",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)])
                                            ],
                                          ),
                                        )
                                       
                                      ),
                                      Icon(Icons.edit,size: 28,)
                                  ],
                                ),
                              ) 
                            ),
                          ],),
                      ],
                    ),
                  ),
                ),
              )
            )
        
    );
     opcoes.add(
        Positioned(
              top: 220.0,
              left: 18.0,
              child: Container(
                color: Colors.white,
                width: 325,
                height: MediaQuery.of(context).size.height/1.85,
                child: SingleChildScrollView(
                  child:Padding(
                    padding: EdgeInsets.all(15),
                    child:Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child:GestureDetector(
                                child:Row(
                                  children: <Widget>[
                                      Icon(Icons.person,size: 30,),
                                      Expanded(
                                        child:Padding(
                                          padding: EdgeInsets.only(left: 20),
                                          child:  Column(
                                            children: <Widget>[
                                              Row(children: <Widget>[Text("Rua",style: TextStyle(fontSize: 15),),],), 
                                              Row(children: <Widget>[Text("Saturnino Bezerra",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)])
                                            ],
                                          ),
                                        )
                                       
                                      ),
                                      Icon(Icons.edit,size: 28,)
                                  ],
                                ),
                                
                              ) 
                              
                            ),
                            
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top:10),
                        ),
                        Divider(
                          color: Colors.black87,
                        ),
Padding(
                          padding: EdgeInsets.only(top:10),
                        ),
                        Row(children: <Widget>[
                            Expanded(
                              child:GestureDetector(
                                child:Row(
                                  children: <Widget>[
                                      Icon(Icons.perm_identity,size: 30,),
                                      Expanded(
                                        child:Padding(
                                          padding: EdgeInsets.only(left: 20),
                                          child:  Column(
                                            children: <Widget>[
                                              Row(children: <Widget>[Text("Numero",style: TextStyle(fontSize: 15),),],), 
                                              Row(children: <Widget>[Text("9.634",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)])
                                            ],
                                          ),
                                        )
                                       
                                      ),
                                      Icon(Icons.edit,size: 28,)
                                  ],
                                ),
                              ) 
                            ),
                          ],),
                          Padding(
                          padding: EdgeInsets.only(top:10),
                        ),
                        Divider(
                          color: Colors.black87,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top:10),
                        ),
                        Row(children: <Widget>[
                            Expanded(
                              child:GestureDetector(
                                child:Row(
                                  children: <Widget>[
                                      Icon(Icons.picture_in_picture,size: 30,),
                                      Expanded(
                                        child:Padding(
                                          padding: EdgeInsets.only(left: 20),
                                          child:  Column(
                                            children: <Widget>[
                                              Row(children: <Widget>[Text("Bairro",style: TextStyle(fontSize: 15),),],), 
                                              Row(children: <Widget>[Text("os bolas",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)])
                                            ],
                                          ),
                                        )
                                       
                                      ),
                                      Icon(Icons.edit,size: 28,)
                                  ],
                                ),
                              ) 
                            ),
                          ],),
                        Padding(
                          padding: EdgeInsets.only(top:10),
                        ),
                        Divider(
                          color: Colors.black87,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top:10),
                        ),
                        Row(children: <Widget>[
                            Expanded(
                              child:GestureDetector(
                                child:Row(
                                  children: <Widget>[
                                      Icon(Icons.date_range,size: 30,),
                                      Expanded(
                                        child:Padding(
                                          padding: EdgeInsets.only(left: 20),
                                          child:  Column(
                                            children: <Widget>[
                                              Row(children: <Widget>[Text("complemento",style: TextStyle(fontSize: 15),),],), 
                                              Row(children: <Widget>[Text("simbora",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)])
                                            ],
                                          ),
                                        )
                                       
                                      ),
                                      Icon(Icons.edit,size: 28,)
                                  ],
                                ),
                              ) 
                            ),
                          ],),
                        Padding(
                          padding: EdgeInsets.only(top:10),
                        ),
                        Divider(
                          color: Colors.black87,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top:10),
                        ),
                        Row(children: <Widget>[
                            Expanded(
                              child:GestureDetector(
                                child:Row(
                                  children: <Widget>[
                                      Icon(Icons.person,size: 30,),
                                      Expanded(
                                        child:Padding(
                                          padding: EdgeInsets.only(left: 20),
                                          child:  Column(
                                            children: <Widget>[
                                              Row(children: <Widget>[Text("CEP",style: TextStyle(fontSize: 15),),],), 
                                              Row(children: <Widget>[Text("56820-000",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)])
                                            ],
                                          ),
                                        )
                                       
                                      ),
                                      Icon(Icons.edit,size: 28,)
                                  ],
                                ),
                              ) 
                            ),
                          ],),
                        Padding(
                          padding: EdgeInsets.only(top:10),
                        ),
                        Divider(
                          color: Colors.black87,
                        ),
                        Row(children: <Widget>[
                            Expanded(
                              child:GestureDetector(
                                child:Row(
                                  children: <Widget>[
                                      Icon(Icons.phone,size: 30,),
                                      Expanded(
                                        child:Padding(
                                          padding: EdgeInsets.only(left: 20),
                                          child:  Column(
                                            children: <Widget>[
                                              Row(children: <Widget>[Text("Estado",style: TextStyle(fontSize: 15),),],), 
                                              Row(children: <Widget>[Text("Pernambuco",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)])
                                            ],
                                          ),
                                        )
                                       
                                      ),
                                      Icon(Icons.edit,size: 28,)
                                  ],
                                ),
                              ) 
                            ),
                          ],),
                          Padding(
                          padding: EdgeInsets.only(top:10),
                        ),
                        Divider(
                          color: Colors.black87,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top:10),
                        ),
                        Row(children: <Widget>[
                            Expanded(
                              child:GestureDetector(
                                child:Row(
                                  children: <Widget>[
                                      Icon(Icons.phone,size: 30,),
                                      Expanded(
                                        child:Padding(
                                          padding: EdgeInsets.only(left: 20),
                                          child:  Column(
                                            children: <Widget>[
                                              Row(children: <Widget>[Text("Cidade",style: TextStyle(fontSize: 15),),],), 
                                              Row(children: <Widget>[Text("Carnaiba",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)])
                                            ],
                                          ),
                                        )
                                       
                                      ),
                                      Icon(Icons.edit,size: 28,)
                                  ],
                                ),
                              ) 
                            ),
                          ],),
                      ],
                    ),
                  ),
                ),
              )
            )
        
    );
     opcoes.add(
      Positioned(
              top: 220.0,
              left: 18.0,
              child: Container(
                color: Colors.white,
                width: 325,
                height: MediaQuery.of(context).size.height/1.85,
                child: SingleChildScrollView(
                  child:Padding(
                    padding: EdgeInsets.all(15),
                    child:Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child:GestureDetector(
                                child:Row(
                                  children: <Widget>[
                                      Icon(Icons.person,size: 30,),
                                      Expanded(
                                        child:Padding(
                                          padding: EdgeInsets.only(left: 20),
                                          child:  Column(
                                            children: <Widget>[
                                              Row(children: <Widget>[Text("Login",style: TextStyle(fontSize: 15),),],), 
                                              Row(children: <Widget>[Text("Felipe Antonio",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)])
                                            ],
                                          ),
                                        )
                                       
                                      ),
                                      Icon(Icons.edit,size: 28,)
                                  ],
                                ),
                                
                              ) 
                              
                            ),
                            
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top:10),
                        ),
                        Divider(
                          color: Colors.black87,
                        ),
Padding(
                          padding: EdgeInsets.only(top:10),
                        ),
                        Row(children: <Widget>[
                            Expanded(
                              child:GestureDetector(
                                child:Row(
                                  children: <Widget>[
                                      Icon(Icons.perm_identity,size: 30,),
                                      Expanded(
                                        child:Padding(
                                          padding: EdgeInsets.only(left: 20),
                                          child:  Column(
                                            children: <Widget>[
                                              Row(children: <Widget>[Text("Senha",style: TextStyle(fontSize: 15),),],), 
                                              Row(children: <Widget>[Text("123",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)])
                                            ],
                                          ),
                                        )
                                       
                                      ),
                                      Icon(Icons.edit,size: 28,)
                                  ],
                                ),
                              ) 
                            ),
                          ],),
                          Padding(
                          padding: EdgeInsets.only(top:10),
                        ),
                        Divider(
                          color: Colors.black87,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top:10),
                        ),
                        Row(children: <Widget>[
                            Expanded(
                              child:GestureDetector(
                                child:Row(
                                  children: <Widget>[
                                      Icon(Icons.picture_in_picture,size: 30,),
                                      Expanded(
                                        child:Padding(
                                          padding: EdgeInsets.only(left: 20),
                                          child:  Column(
                                            children: <Widget>[
                                              Row(children: <Widget>[Text("e-mail",style: TextStyle(fontSize: 15),),],), 
                                              Row(children: <Widget>[Text("lipe6330@gmail.com",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)])
                                            ],
                                          ),
                                        )
                                       
                                      ),
                                      Icon(Icons.edit,size: 28,)
                                  ],
                                ),
                              ) 
                            ),
                          ],),
                        Padding(
                          padding: EdgeInsets.only(top:10),
                        ),
                      ]          
                    ),
                  ),
                ),
              )
            )
        
    );
  }
  @override
  Widget build(BuildContext context) {
    preencher();
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            Positioned(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/3,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF6CD8F0), blueLogin1],
                     begin: Alignment.centerRight,
                     end: Alignment(-1.0,-1.0),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: ()async{
                        String caminho; 
                        caminho = await FilePicker.getFilePath(type: FileType.IMAGE);
                        setState(() {
                          _path=caminho;
                        });
                      },
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 40),
                          child:Container(
                          
                          width: 130,
                          height: 130,
                          child: CircleAvatar(
                            backgroundImage: _path.isNotEmpty ? FileImage(File(_path)) : NetworkImage("https://ap.imagensbrasil.org/images/imagens-lobos.jpg"),
                            radius: 90,
                          ),
                        ), 
                        ) 
                        
                      ),
                    )
                    
                  ],
                ),
              ),
            ),
            Positioned(
              top: 178.0,
              left: 18.0,
              child: Container(
                color: Colors.white,
                width: 325,
                height: 50,
                child: Center(
                  child: Text(title,style:TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                ),
              )
            ),
            
            opcoes[op],  
          ])), 
      // CustomScrollView(
      //   slivers: <Widget>[
      //     SliverAppBar(
      //         expandedHeight: 200.0,
      //         pinned: true,
      //         centerTitle: true,
      //         flexibleSpace:GestureDetector(
      //          onTap: ()async{
      //           String caminho; 
      //           caminho = await FilePicker.getFilePath(type: FileType.IMAGE);
      //           setState(() {
      //             _path=caminho;
      //           });
      //          },
               
      //           child:Center(
      //           //flex: 1,
      //           child: Container(
      //             width: 150,
      //             height: 150,
      //             child: CircleAvatar(
      //               backgroundImage: _path.isNotEmpty ? FileImage(File(_path)) : NetworkImage("https://ap.imagensbrasil.org/images/imagens-lobos.jpg"),
      //               radius: 90,
                    
      //             ),
      //           ),
      //             )
                    
              
                  
              
      //         )
      //     ),
      //     SliverFillRemaining(

      //     )
      //   ],
      // ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor:Colors.blue,
        
        items: <BottomNavigationBarItem>[
          
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_ind,color: Colors.white,size: 30,),
            title: Text('')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.place,color: Colors.white,size: 30,),
            title: Text('')          
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lock,color: Colors.white,size: 30,),
                        title: Text('')
          ),
        ],
        currentIndex: op,
        selectedItemColor: Colors.orange,
        onTap: (int i){
          String temp = '';
          i==0 ? temp = "Dados Pessoais":
          i==1 ? temp = "Endereco":
          temp="Conta";
          setState(() {
             op=i;
             title=temp;
          });
         
        },
      ));
    
  }
}