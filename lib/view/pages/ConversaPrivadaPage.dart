import 'package:flutter/material.dart';
import 'dart:math';
class ConversaPrivadaPage extends StatefulWidget {
  @override
  _ConversaPrivadaPageState createState() => _ConversaPrivadaPageState();
}

class _ConversaPrivadaPageState extends State<ConversaPrivadaPage> {
  double r=2.5;
  List <Text> mensagens = new List<Text>();
  TextEditingController msgControler = new TextEditingController();
  bool selecionado=false;
  bool foco = false;
   FocusNode myFocusNode;
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myFocusNode = FocusNode();
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            child: Container(
              color: Colors.blue,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/6.5,
              child:Padding(padding: EdgeInsets.only(top:10), 
              child:
              Row(
                children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: (){
                        //Navigator.popAndPushNamed(context, routeName);
                      },
                      
                    ),
                    CircleAvatar(
                      radius: 25,
                    ),
                     Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left:8,right: 8,top:25),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            child: Text("Felipe Antonio",style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            child: Text("Online",style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black87)),
                          ),
                        ),
                        
                      ],
                    ),
                  ),
                ),
                ],
              ),
            ),
          )
          ),
          Positioned(
              top:MediaQuery.of(context).size.height/6.5,
              child:Container(
                width:MediaQuery.of(context).size.width ,
                height: 400,
                 child: ListView.builder(
                      itemCount: mensagens.length,
                      itemBuilder: (context, index) { 
                        return Padding(padding: EdgeInsets.only(left:40,bottom:5,right: 5),
                         child:Container(
                       // width: 150,
                       alignment: Alignment.topRight,
                        child:Column(
                          children:<Widget>[
                          ClipPath(
                            clipper: ClipRThread(r),
                            //clipBehavior: Clip.antiAlias,
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(r)),
                              child: Container(
                                //width: 150,
                                // constraints: BoxConstraints.loose(MediaQuery.of(context).size * 0.8),
                                 padding: EdgeInsets.fromLTRB(8.0 + 2 * r, 8.0, 8.0, 8.0),
                                color: Colors.deepOrange,
                                child: Transform(
                                  transform: Matrix4.diagonal3Values(1.0, 1.0, 1.0),
                                  child: mensagens[index],
                                  alignment: Alignment.topRight,
                                ),
                              ),
                            ),)
                         
                        
                          ])));
                        
                      },
                    
                 
                 ),
              ) ,
              
          ),

          Positioned(
            top: selecionado ? MediaQuery.of(context).size.height/2.15  :MediaQuery.of(context).size.height-64,
            child:Padding(
          padding: EdgeInsets.only(top:4,bottom: 4),
          child:Container(
            color: Colors.blue,
            height: 60,
            width:MediaQuery.of(context).size.width ,
            child:Padding(padding: EdgeInsets.all(3), 
            child:Row(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Container(
                      color: Colors.white,
                      child: Row(
                        children: <Widget>[
                          SizedBox(width: 8.0),
                          Icon(Icons.insert_emoticon,
                              size: 30.0, color: Theme.of(context).hintColor),
                          SizedBox(width: 8.0),
                          Expanded(
                            child: TextField(
                              autofocus: foco,
                              controller: msgControler,
                              decoration: InputDecoration(
                                hintText: 'Digite Aqui',
                                border: InputBorder.none,
                              ),
                              onTap: (){
                                setState(() {
                                  foco = true;
                                  selecionado=true;
                                });
                                
                              },
                            ),
                          ),
                          IconButton(
                            icon:Icon(
                              Icons.camera_alt,
                              size: 30.0, color: Theme.of(context).hintColor
                            ),
                            onPressed: (){

                            },
                         ),
                          // SizedBox(width: 8.0),
                          // Icon(Icons.camera_alt,
                          //     size: 30.0, color: Theme.of(context).hintColor),
                          SizedBox(width: 8.0),
                        ],
                      ),
                    ),
                  )
                ),
                Expanded(
                  child: CircleAvatar(
                    //color:Colors.white,
                    child: IconButton(
                        icon: Icon(Icons.send),
                        onPressed: (){
                          setState(() {
                           foco = false;
                           selecionado=false;
                           mensagens.add(new Text(msgControler.text,softWrap: true,)); 
                           msgControler.clear();
                          });
                        },
                    ),
                    radius: 35,
                  ),
                )
              ],
            ),)
          ) 
       )
          )
        ],
          
      ),
          
      // bottomNavigationBar: BottomAppBar(
      //   color: Colors.blue,
      //   shape:CircularNotchedRectangle(),
      //   child: 
        
      // ),
    );
  }

  
}

class ClipRThread extends CustomClipper<Path> {
  final double chatRadius;

  ClipRThread(this.chatRadius);

  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, chatRadius);
    // path.lineTo(chatRadius, chatRadius + chatRadius / 2);
    final r = chatRadius;
    final angle = 0.785;
    path.conicTo(
      r - r * sin(angle),
      r + r * cos(angle),
      r - r * sin(angle * 0.5),
      r + r * cos(angle * 0.5),
      1,
    );
    final moveIn = 2 * r; // need to be > 2 * r
    path.lineTo(moveIn, r + moveIn * tan(angle));
    
    path.lineTo(moveIn, size.height - chatRadius);

    path.conicTo(
      moveIn + r - r * cos(angle),
      size.height - r + r * sin(angle),
      moveIn + r,
      size.height,
      1,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}