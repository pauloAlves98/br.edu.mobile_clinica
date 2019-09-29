import 'package:flutter/material.dart';
import 'package:projeto_mobile_clinica/model/Cores.dart';
import 'package:projeto_mobile_clinica/view/pages/LoginPage.dart';



class CadastroMedicoWidget {
  
  static List<DropdownMenuItem<String>> _ufs = [
    new DropdownMenuItem(value: "AC", child: new Text("AC")),
    new DropdownMenuItem(value: "AL", child: new Text("AL")),
    new DropdownMenuItem(value: "AP", child: new Text("AP")),
    new DropdownMenuItem(value: "AM", child: new Text("AM")),
    new DropdownMenuItem(value: "BA", child: new Text("BA")),
    new DropdownMenuItem(value: "CE", child: new Text("CE")),
    new DropdownMenuItem(value: "DF", child: new Text("DF")),
    new DropdownMenuItem(value: "ES", child: new Text("ES")),
    new DropdownMenuItem(value: "GO", child: new Text("GO")),
    new DropdownMenuItem(value: "MA", child: new Text("MA")),
    new DropdownMenuItem(value: "MT", child: new Text("MT")),
    new DropdownMenuItem(value: "MS", child: new Text("MS")),
    new DropdownMenuItem(value: "PE", child: new Text("MS")),
    new DropdownMenuItem(value: "MG", child: new Text("MG")),
    new DropdownMenuItem(value: "PA", child: new Text("PA")),
    new DropdownMenuItem(value: "PB", child: new Text("PB")),
    new DropdownMenuItem(value: "PR", child: new Text("PR")),
    new DropdownMenuItem(value: "PE", child: new Text("PE")),
    new DropdownMenuItem(value: "PI", child: new Text("PI")),
    new DropdownMenuItem(value: "PE", child: new Text("PE")),
    new DropdownMenuItem(value: "RJ", child: new Text("RJ")),
    new DropdownMenuItem(value: "RN", child: new Text("RN")),
    new DropdownMenuItem(value: "RS", child: new Text("RS")),
    new DropdownMenuItem(value: "RO", child: new Text("RO")),
    new DropdownMenuItem(value: "RR", child: new Text("RR")),
    new DropdownMenuItem(value: "SC", child: new Text("SC")),
    new DropdownMenuItem(value: "SP", child: new Text("SP")),
    new DropdownMenuItem(value: "SE", child: new Text("SE")),
    new DropdownMenuItem(value: "TO", child: new Text("TO")),
  ];
  static String _currentUf = _ufs[0].value;
 
  static List<Widget> builderFieldListP1 = [//sobre a conta
    _builderField("Login", false,iconLeft:Icon(Icons.email, color: Colors.white, size: 40)),
    SizedBox(height: 10.0),
    _builderField("Nome",false,iconLeft:Icon(Icons.people, color: Colors.white, size: 40)),
    const SizedBox(height: 10.0),
    _builderField("Senha",true, iconLeft:Icon(Icons.lock, color: Colors.white, size: 40)),
    const SizedBox(height: 10.0),
    _builderField("Confirme a senha",true, iconLeft:Icon(Icons.lock, color: Colors.white, size: 40)),
    ];

  static List<Widget> builderFieldListP2 = [//Pessoais
  _builderField("RG", false, iconLeft: Icon(Icons.perm_identity, color: Colors.white, size: 40), tip: TextInputType.number),
  SizedBox(height: 10.0),
  _builderField("CPF",false, iconLeft: Icon(Icons.perm_identity, color: Colors.white, size: 40), tip: TextInputType.number),
   SizedBox(height: 10.0),
  _builderField("Data de nascimento",false, iconLeft: Icon(Icons.date_range, color: Colors.white, size: 40), tip: TextInputType.number),
  ];

  static List<Widget> builderFieldListP3 = [//End
    //Endereco
    _builderField("Rua", false,
        iconLeft: Icon(Icons.streetview, color: Colors.white, size: 40)),
    SizedBox(height: 10.0),
      Row(
      children: <Widget>[
        Expanded(
          flex: 2,
          child:_builderField("Nº", false,tip: TextInputType.number, iconLeft: Icon(Icons.format_list_numbered_rtl,color: Colors.white, size: 40)) ,
          ),
        Expanded(flex: 2, child: _builderField("Bairro", false))
      ],
    ),
    SizedBox(height: 10.0),
    _builderField("Complemento", false,
        iconLeft: Icon(Icons.home, color: Colors.white, size: 40)),
    SizedBox(height: 10.0),
    _builderField("CEP", false,
        iconLeft: Icon(Icons.location_on, color: Colors.white, size: 40)),
    SizedBox(height: 10.0),
    Row(
      
      children: <Widget>[//90 pixels de overflow
      Icon(Icons.terrain, color: Colors.white, size: 40) ,
      SizedBox(width: 5.0),
        Expanded(
          flex: 1,
          child: Container(
            width: 20,
            padding: EdgeInsets.only(left: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: DropdownButton(
              underline:
                  Container(), //Criar um metodo iniciar eventos q receb um evento e criar
              value: _currentUf,
              items: _ufs,
              onChanged: (String value) {
                print("$value");
              },
            ),
          ),
        ),
        Expanded(flex: 2, child: _builderField("Estado", false))
      ],
    ),

    SizedBox(height: 10.0),
    _builderField("Cidade", false,
        iconLeft: Icon(Icons.location_city, color: Colors.white, size: 40)),
    SizedBox(height: 10.0),
  ];

  static List<Widget> builderFieldListP4 = [//Contato
  _builderField("Fone 1", false, iconLeft: Icon(Icons.phone_iphone, color: Colors.white, size: 40),  tip: TextInputType.number),
  SizedBox(height: 10.0),
  _builderField("Fone 2",false, iconLeft: Icon(Icons.phone_android, color: Colors.white, size: 40), tip: TextInputType.number),
   SizedBox(height: 10.0),
  _builderField("Email",false, iconLeft: Icon(Icons.email, color: Colors.white, size: 40), tip: TextInputType.emailAddress),
  SizedBox(height: 10.0),//Colocar um bootao para finalizar o cadastroo!
   
   Container(
                  height: 50,
                  width: 100,
                  alignment: Alignment.topCenter,

                  // margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  // width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.centerRight,
                      stops: [0.3, 1], //de acordo com o numero de cores!
                      colors: [Colors.white,Colors.white],
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(360)),
                  ),
                  child: SizedBox.expand(
                    child: FlatButton(
                      textColor: Colors.white,
                      child: Text("Finalizar".toUpperCase(),style: TextStyle(color: Colors.blueGrey[600],fontSize: 12)),
                      // onPressed: () =>
                      //    // Navigator.pushReplacementNamed(context, '/medicoHomePage'), //Mudar
                    ),
                  ),
                ),
  ];

  static List<Widget> builderFieldListP5 = [//Pessoais
  _builderField("CRM", false, iconLeft: Icon(Icons.sim_card, color: Colors.white, size: 40), tip: TextInputType.number),
  SizedBox(height: 10.0),
  _builderField("Area de atuação",false, iconLeft: Icon(Icons.work, color: Colors.white, size: 40), tip: TextInputType.text),
   SizedBox(height: 10.0),
  _builderField("Especialidade",false, iconLeft: Icon(Icons.local_hospital, color: Colors.white, size: 40), tip: TextInputType.text),
  
  ];
   
  static Widget builderCadastroMedico(BuildContext context, int parte) {
    print("Parte "+parte.toString());
    return buiderRetorno(parte,context);
  }

  static Widget buiderRetorno(int parte,BuildContext context){
    if(parte == 0){
      return  builderCadastroMedicoBuilder(
            context, "Sobre a conta", builderFieldListP1);
    }else if(parte == 1){
      return  builderCadastroMedicoBuilder(
            context, "Pessoal", builderFieldListP2);
    }
     else if(parte == 2){
      return  builderCadastroMedicoBuilder(
            context, "Profissional", builderFieldListP5);
    }
    else if(parte == 3){
      return  builderCadastroMedicoBuilder(
            context, "Endereço", builderFieldListP3);
    }
    else if(parte == 4){
      return  builderCadastroMedicoBuilder(
            context, "Contato", builderFieldListP4);
    }
  }
}

Widget builderCadastroMedicoBuilder(
 //chave para modificar tamanho da tela! 
  BuildContext context, String txt, List<Widget> builderField) {

  return Container(
    alignment: Alignment.center,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomRight,
        stops: [0.3, 1], //de acordo com o numero de cores!
        colors: [Color(0xFF6CD8F0), blueLogin1],
      ),
    ),
    child: Container(
      margin: const EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 5.0),
      child: Column(
        children: <Widget>[
          Center(
            child: Container(
              //Logo
              //trocar pela logo!
              margin: const EdgeInsets.only(top: 70),
              alignment: Alignment.center,
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: blueLogin3,
              ),
              child: SizedBox(
                height: 80,
                width: 80,
                child:FlutterLogo(colors: MaterialColor(0xFF880E4F, LoginPage.color)),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Divider(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 5.0),
                Text(
                  txt,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 5.0),
                Expanded(
                    child: Divider(
                  color: Colors.white,
                )),
              ],
            ),
          ),
          SizedBox(
            height: 35,
          ),
          Column(children: builderField), //Campos field
          const SizedBox(height: 20.0),
        ],
      ),
    ),
  );
}

Widget _builderField(String hintTexts, bool psw, {Icon iconLeft, TextInputType tip}) {
  return Row(
    children: <Widget>[
      iconLeft == null ? SizedBox() : iconLeft,
      SizedBox(width: 5.0),
      Expanded(
        flex: 2,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextField(
            keyboardType: tip==null?TextInputType.text:tip,
            style: TextStyle(),
            decoration: InputDecoration(
               
                suffixIcon: GestureDetector(
                  child: Icon(
                    // obscureTextPaciente //if ternario!
                    //     ? Icons.remove_red_eye
                    //     : Icons.panorama_fish_eye,
                    psw ? Icons.remove_red_eye : null,
                    size: 20.0,
                    color: Colors.black,
                  ),
                  // onTap:
                  //     toggleLoginPaciente, //Evento de mostrar ou ocultar a senha!
                ),
                labelStyle: TextStyle(color: Colors.white),
                contentPadding: const EdgeInsets.only(left: 18, top: 18, bottom: 18),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: hintTexts),
          ),
        ),
      ),
    ],
  );
}
