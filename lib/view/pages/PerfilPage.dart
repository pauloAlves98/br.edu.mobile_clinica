import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:projeto_mobile_clinica/WebService/EnderecoUrls.dart';
import 'package:projeto_mobile_clinica/WebService/WebService.dart';
import 'package:projeto_mobile_clinica/model/Cores.dart';
import "dart:io";
import 'package:masked_text/masked_text.dart';
import 'package:projeto_mobile_clinica/model/bin/Corrente.dart';
import 'package:projeto_mobile_clinica/model/bin/Paciente.dart';
import 'package:projeto_mobile_clinica/view/pages/PacienteHomePage.dart';
import 'package:intl/intl.dart';

class PerfilPage extends StatefulWidget {
  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  static DateFormat   f = new DateFormat('dd/MM/yyyy');
  String _path = '';
  String title = 'Dados Pessoais';
  int op=0;
  bool foco = false;
  List<Widget> opcoes = new List<Widget>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   
  }
  Widget preencher(Paciente paciente){
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
                                onTap:(){
                                  editDados(Icons.person, 'Nome',paciente.nome);
                                
                                },
                                child:Row(
                                  children: <Widget>[
                                      Icon(Icons.person,size: 30,),
                                      Expanded(
                                        child:Padding(
                                          padding: EdgeInsets.only(left: 20),
                                          child:  Column(
                                            children: <Widget>[
                                              Row(children: <Widget>[Text("Nome",style: TextStyle(fontSize: 15),),],), 
                                              Row(children: <Widget>[Text(paciente.nome,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)])
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
                                onTap: (){
                                  editDados(Icons.perm_identity, 'RG',paciente.rg);
                                },
                                child:Row(
                                  children: <Widget>[
                                      Icon(Icons.perm_identity,size: 30,),
                                      Expanded(
                                        child:Padding(
                                          padding: EdgeInsets.only(left: 20),
                                          child:  Column(
                                            children: <Widget>[
                                              Row(children: <Widget>[Text("RG",style: TextStyle(fontSize: 15),),],), 
                                              Row(children: <Widget>[Text(paciente.rg,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)])
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
                                onTap: (){
                                 editDados(Icons.picture_in_picture, 'CPF',paciente.cpf);
                                },
                                child:Row(
                                  children: <Widget>[
                                      Icon(Icons.picture_in_picture,size: 30,),
                                      Expanded(
                                        child:Padding(
                                          padding: EdgeInsets.only(left: 20),
                                          child:  Column(
                                            children: <Widget>[
                                              Row(children: <Widget>[Text("CPF",style: TextStyle(fontSize: 15),),],), 
                                              Row(children: <Widget>[Text(paciente.cpf,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)])
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
                                onTap: (){
                                  editDados(Icons.date_range, 'Data de Nascimento',f.format(paciente.data_nascimento));
                                },
                                child:Row(
                                  children: <Widget>[
                                      Icon(Icons.date_range,size: 30,),
                                      Expanded(
                                        child:Padding(
                                          padding: EdgeInsets.only(left: 20),
                                          child:  Column(
                                            children: <Widget>[
                                              Row(children: <Widget>[Text("Data de Nascimento",style: TextStyle(fontSize: 15),),],), 
                                              Row(children: <Widget>[Text(f.format(paciente.data_nascimento),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)])
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
                                onTap: (){
                                editDados(Icons.person, 'Sexo',paciente.sexo);
                                },
                                child:Row(
                                  children: <Widget>[
                                      Icon(Icons.person,size: 30,),
                                      Expanded(
                                        child:Padding(
                                          padding: EdgeInsets.only(left: 20),
                                          child:  Column(
                                            children: <Widget>[
                                              Row(children: <Widget>[Text("Sexo",style: TextStyle(fontSize: 15),),],), 
                                              Row(children: <Widget>[Text(paciente.sexo,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)])
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
                                onTap: (){
                                  editDados(Icons.phone, 'Telefone 1',paciente.id_contato.fone1);
                                },
                                child:Row(
                                  children: <Widget>[
                                      Icon(Icons.phone,size: 30,),
                                      Expanded(
                                        child:Padding(
                                          padding: EdgeInsets.only(left: 20),
                                          child:  Column(
                                            children: <Widget>[
                                              Row(children: <Widget>[Text("Telefone 1",style: TextStyle(fontSize: 15),),],), 
                                              Row(children: <Widget>[Text(paciente.id_contato.fone1,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)])
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
                                onTap: (){
                                  editDados(Icons.phone, 'Telefone 2',paciente.id_contato.fone2);
                                },
                                child:Row(
                                  children: <Widget>[
                                      Icon(Icons.phone,size: 30,),
                                      Expanded(
                                        child:Padding(
                                          padding: EdgeInsets.only(left: 20),
                                          child:  Column(
                                            children: <Widget>[
                                              Row(children: <Widget>[Text("Telefone 2",style: TextStyle(fontSize: 15),),],), 
                                              Row(children: <Widget>[Text(paciente.id_contato.fone2,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)])
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
                                onTap: (){
                                  editDados(Icons.streetview, 'Rua',paciente.id_endereco.rua);
                                },
                                child:Row(
                                  children: <Widget>[
                                      Icon(Icons.streetview,size: 30,),
                                      Expanded(
                                        child:Padding(
                                          padding: EdgeInsets.only(left: 20),
                                          child:  Column(
                                            children: <Widget>[
                                              Row(children: <Widget>[Text("Rua",style: TextStyle(fontSize: 15),),],), 
                                              Row(children: <Widget>[Text(paciente.id_endereco.rua,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)])
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
                                onTap: (){
                                  editDados(Icons.format_list_numbered_rtl, 'Numero',paciente.id_endereco.numero.toString());
                                },
                                child:Row(
                                  children: <Widget>[
                                      Icon(Icons.format_list_numbered_rtl,size: 30,),
                                      Expanded(
                                        child:Padding(
                                          padding: EdgeInsets.only(left: 20),
                                          child:  Column(
                                            children: <Widget>[
                                              Row(children: <Widget>[Text("Numero",style: TextStyle(fontSize: 15),),],), 
                                              Row(children: <Widget>[Text(paciente.id_endereco.numero.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)])
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
                                onTap: (){
                                  editDados(Icons.location_on, 'Bairro',paciente.id_endereco.bairro);
                                },
                                child:Row(
                                  children: <Widget>[
                                      Icon(Icons.location_on,size: 30,),
                                      Expanded(
                                        child:Padding(
                                          padding: EdgeInsets.only(left: 20),
                                          child:  Column(
                                            children: <Widget>[
                                              Row(children: <Widget>[Text("Bairro",style: TextStyle(fontSize: 15),),],), 
                                              Row(children: <Widget>[Text(paciente.id_endereco.bairro,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)])
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
                                onTap: (){
                                  editDados(Icons.home, 'Complemento',paciente.id_endereco.complemento);
                                },
                                child:Row(
                                  children: <Widget>[
                                      Icon(Icons.home,size: 30,),
                                      Expanded(
                                        child:Padding(
                                          padding: EdgeInsets.only(left: 20),
                                          child:  Column(
                                            children: <Widget>[
                                              Row(children: <Widget>[Text("Complemento",style: TextStyle(fontSize: 15),),],), 
                                              Row(children: <Widget>[Text(paciente.id_endereco.complemento,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)])
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
                                onTap: (){
                                  editDados(Icons.location_on, 'CEP',paciente.id_endereco.cep);
                                },
                                child:Row(
                                  children: <Widget>[
                                      Icon(Icons.location_on,size: 30,),
                                      Expanded(
                                        child:Padding(
                                          padding: EdgeInsets.only(left: 20),
                                          child:  Column(
                                            children: <Widget>[
                                              Row(children: <Widget>[Text("CEP",style: TextStyle(fontSize: 15),),],), 
                                              Row(children: <Widget>[Text(paciente.id_endereco.cep,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)])
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
                                onTap: (){
                                  editDados(Icons.picture_in_picture, 'Estado',paciente.id_endereco.estado);
                                },
                                child:Row(
                                  children: <Widget>[
                                      Icon(Icons.location_on,size: 30,),
                                      Expanded(
                                        child:Padding(
                                          padding: EdgeInsets.only(left: 20),
                                          child:  Column(
                                            children: <Widget>[
                                              Row(children: <Widget>[Text("Estado",style: TextStyle(fontSize: 15),),],), 
                                              Row(children: <Widget>[Text(paciente.id_endereco.estado,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)])
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
                                onTap: (){
                                  editDados(Icons.location_city, 'Cidade',paciente.id_endereco.cidade);
                                },
                                child:Row(
                                  children: <Widget>[
                                      Icon(Icons.location_city,size: 30,),
                                      Expanded(
                                        child:Padding(
                                          padding: EdgeInsets.only(left: 20),
                                          child:  Column(
                                            children: <Widget>[
                                              Row(children: <Widget>[Text("Cidade",style: TextStyle(fontSize: 15),),],), 
                                              Row(children: <Widget>[Text(paciente.id_endereco.cidade,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)])
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
                                onTap: (){
                                  editDados(Icons.person, 'Login',paciente.nome_usuario);
                                },
                                child:Row(
                                  children: <Widget>[
                                      Icon(Icons.person,size: 30,),
                                      Expanded(
                                        child:Padding(
                                          padding: EdgeInsets.only(left: 20),
                                          child:  Column(
                                            children: <Widget>[
                                              Row(children: <Widget>[Text("Login",style: TextStyle(fontSize: 15),),],), 
                                              Row(children: <Widget>[Text(paciente.nome_usuario,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)])
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
                                onTap: (){
                                  editDados(Icons.lock, 'Senha',paciente.senha);
                                },
                                child:Row(
                                  children: <Widget>[
                                      Icon(Icons.lock,size: 30,),
                                      Expanded(
                                        child:Padding(
                                          padding: EdgeInsets.only(left: 20),
                                          child:  Column(
                                            children: <Widget>[
                                              Row(children: <Widget>[Text("Senha",style: TextStyle(fontSize: 15),),],), 
                                              Row(children: <Widget>[Text(paciente.senha,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)])
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
                                onTap: (){
                                  editDados(Icons.email, 'e-mail',paciente.id_contato.email);
                                },
                                child:Row(
                                
                                  children: <Widget>[
                                      Icon(Icons.email,size: 30,),
                                      Expanded(
                                        child:Padding(
                                          padding: EdgeInsets.only(left: 20),
                                          child:  Column(
                                            children: <Widget>[
                                              Row(children: <Widget>[Text("e-mail",style: TextStyle(fontSize: 15),),],), 
                                              Row(children: <Widget>[Text(paciente.id_contato.email,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)])
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
    preencher(Corrente.pacienteCorrente);
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
              top: 24,
              left: 2,
              child: IconButton(icon:Icon( Icons.arrow_back,size: 25,color: Colors.white,),
              onPressed: (){
                  Navigator.pop(context);
              },
              ),
            ),
            Positioned(
              top:120,
              left: 210,
              child:
              Container(
                width: 40,
                child:Center(child: 
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 25,
                child:Center(child: IconButton(
              icon:Icon(Icons.camera_alt,size: 25,color: Colors.blue,),
              onPressed: (){
                
              },
              ))) ))
              ,),
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
  void editDados(IconData icone, String title, String valor){
      TextEditingController field = new TextEditingController();
      field.text=valor;
     showDialog(

        context: context, 
        builder: (BuildContext context){
                    return Stack(
                            children: <Widget>[ 
                                         Positioned(
                                          left: -30,
                                          top:MediaQuery.of(context).size.height-440,
                                          child: Padding(
                                            padding:  EdgeInsets.all(8.0),
                                            child: Container(
                                             
                                              decoration: BoxDecoration(
                                                // color: Colors.white,
                                               borderRadius: BorderRadius.all(new Radius.circular(36))
                                              ),
                                              child:
                                              AlertDialog(
                                              contentPadding: EdgeInsets.all(5.0),
                                              content: Container(
                                                  decoration: BoxDecoration(
                                                    //color: Colors.black,
                                               borderRadius: BorderRadius.all(new Radius.circular(100))
                                              ),
                                              width:MediaQuery.of(context).size.width-39,
                                              height: 81,
                                              
                                              child: Column(
                                                children: <Widget>[
                                                  Row(children: <Widget>[
                                                  Icon(icone),
                                                  Padding(
                                                    padding: EdgeInsets.only(left: 10)
                                                  ),
                                                  Expanded(
                                                    child:new MaskedTextField(
                                                      maskedTextFieldController: field,
                                                      escapeCharacter: '#',
                                                      mask: title=="Data de Nascimento"
                                                            ?"##/##/####":title=="CPF"? "###.###.###-##":
                                                            title=="Telefone 1"?"(##) # ####-####":
                                                            title=="Telefone 2"?"(##) # ####-####":
                                                            title=="CEP"?"##.###-###":"",
                                                      
                                                      keyboardType:title=="Telefone 1"?TextInputType.number:
                                                                   title=="Telefone 2"?TextInputType.number:
                                                                   title=="RG"?TextInputType.number:
                                                                   title=="CPF"?TextInputType.number:
                                                                   title=="Numero"?TextInputType.number:
                                                                   title=="CEP"?TextInputType.number:
                                                                   title=="Data de Nascimento"?TextInputType.number:
                                                                   TextInputType.text,
                                                      inputDecoration: InputDecoration(
                                                         
                                                         labelText: title
                                                      ),
                                                     
                                                    ),
                                                  )
                                                  ],)
                                                  
                                                ],
                                              ),
                                            ),
                                            actions: <Widget>[
                                              FlatButton(child: Text("Salvar"),
                                              onPressed: (){
                                                    if(title=="Nome"){
                                                      Corrente.pacienteCorrente.nome=field.text;
                                                    }else if(title=="RG"){
                                                      Corrente.pacienteCorrente.rg = field.text;
                                                    }else if(title=="CPF"){
                                                      Corrente.pacienteCorrente.cpf = field.text;
                                                    }else if(title=="Data de Nascimento"){
                                                      Corrente.pacienteCorrente.data_nascimento=DateTime(int.parse(field.text.split("/")[2]), int.parse(field.toString().split("/")[1]), int.parse(field.toString().split("/")[0]));
                                                    }else if(title=="Sexo"){
                                                      Corrente.pacienteCorrente.sexo=field.text;
                                                    }else if(title=="Telefone 1"){
                                                      Corrente.pacienteCorrente.id_contato.fone1=field.text;
                                                    }else if(title=="Telefone 2"){
                                                      Corrente.pacienteCorrente.id_contato.fone2=field.text;
                                                    }else if(title=="Rua"){
                                                      Corrente.pacienteCorrente.id_endereco.rua=field.text;
                                                    }else if(title=="Numero"){
                                                      Corrente.pacienteCorrente.id_endereco.numero=int.parse(field.text);
                                                    }else if(title=="Bairro"){
                                                      Corrente.pacienteCorrente.id_endereco.bairro=field.text;
                                                    }else if(title=="Complemento"){
                                                      Corrente.pacienteCorrente.id_endereco.complemento=field.text;
                                                    }else if(title=="CEP"){
                                                      Corrente.pacienteCorrente.id_endereco.cep=field.text;
                                                    }else if(title=="Estado"){
                                                      Corrente.pacienteCorrente.id_endereco.estado=field.text;
                                                    }else if(title=="Cidade"){
                                                      Corrente.pacienteCorrente.id_endereco.cidade=field.text;
                                                    }else if(title=="Login"){
                                                      Corrente.pacienteCorrente.nome_usuario=field.text;
                                                    }else if(title=="Senha"){
                                                      Corrente.pacienteCorrente.senha=field.text;
                                                    }else if(title=="e-mail"){
                                                      Corrente.pacienteCorrente.id_contato.email=field.text;
                                                    }
                                                    WebService.pacienteSaveEdit(Corrente.pacienteCorrente,EnderecoUrls.PACIENTE_SAVE_EDIT);
                                                    Navigator.pop(context);
                                                    setState(() {
                                                      PacienteHomePage.nome=Corrente.pacienteCorrente.nome;
                                                      opcoes.clear();
                                                      preencher(Corrente.pacienteCorrente);
                                                    });   
                                              },
                                              )
                                            ],
                                        ),),
                                          ),),
                                        
                                      ]
                                      ,);
                                    }
                                  );
  }
}