import 'package:flutter/material.dart';
import 'package:projeto_mobile_clinica/WebService/EnderecoUrls.dart';
import 'package:projeto_mobile_clinica/WebService/WebService.dart';
import 'package:projeto_mobile_clinica/model/Cores.dart';
import 'package:projeto_mobile_clinica/model/bin/Contato.dart';
import 'package:projeto_mobile_clinica/model/bin/Paciente.dart';
import 'package:projeto_mobile_clinica/view/pages/LoginPage.dart';

class LoginPacienteWidget {
  
  
  static Widget buildLoginPaciente(//Metodo!
    BuildContext context,
    TextEditingController pacienteEmailField,
    TextEditingController  pacientePasswordField,
    myFocusNodePassword,
    obscureTextPaciente,
    toggleLoginPaciente
  ) {
    bool flagErro = false;
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    //Login Paciente
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Container(
            //Quadrado branco,
            margin: const EdgeInsets.only(top: 30),
            padding: const EdgeInsets.only(top: 80.0, left: 16.0, right: 16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.white,
            ),
            child: Column(
              children: <Widget>[
                //Espaço até chegar no primeiro campo field!
                Container(
                  height: 100,
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.email),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: TextFormField(
                        controller: pacienteEmailField,
                        
                        decoration: InputDecoration(
    //                       contentPadding: const EdgeInsets.all(20),
    // border: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(30),
    // ),
                          hintText: "Login"),
                        //  validator: (value) {
                        //   value = value.trim();
                        //   if (value.isEmpty) {
                        //     return "CAMPO OBIRGATÓRIO";
                        //   }
                        //   if (flagErro) {
                        //     return "login ou senha inválido";
                        //   }
                        //   return null;
                        // },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                Row(
                  children: <Widget>[
                    Icon(Icons.lock),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: TextField(
                        controller: pacientePasswordField,
                        focusNode: myFocusNodePassword,
                        obscureText: obscureTextPaciente,
                        decoration: InputDecoration(
                          hintText: "Senha",
                          suffixIcon: GestureDetector(
                            child: Icon(
                              obscureTextPaciente //if ternario!
                                  ? Icons.remove_red_eye
                                  : Icons.panorama_fish_eye,
                              size: 20.0,
                              color: Colors.black,
                            ),
                            onTap:
                                toggleLoginPaciente, //Evento de mostrar ou ocultar a senha!
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30.0),
                Container(
                  //Botão Login
                  height: 60,
                  alignment: Alignment.topCenter,
                  // margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  // width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.centerRight,
                      stops: [0.3, 1], //de acordo com o numero de cores!
                      colors: [Color(0xFF6CD8F0), blueLogin1],
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(360)),
                  ),
                  child: SizedBox.expand(
                    child: FlatButton(
                      textColor: Colors.white,
                      child: Text("Login".toUpperCase()),
                      onPressed: () { 
                        String login = pacienteEmailField.text;
                        String senha = pacientePasswordField.text;
                        _logar(login,senha,context); 
                      },
                         
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                GestureDetector(
                  child: Text(
                    "Esqueceu a senha?".toUpperCase(),
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w600),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/pacienteCadastroPage');
                  },
                ),
                const SizedBox(height: 20.0),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Divider(
                        color: blueLogin3,
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Text(
                      "Ainda não possui cadastro?",
                      style: TextStyle(fontSize: 12.0),
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                        child: Divider(
                      color: blueLogin1,
                    )),
                  ],
                ),
                const SizedBox(height: 20.0),
                GestureDetector(
                  //so pr pegar o metodo tap
                  child: Text(
                    "Crie sua conta".toUpperCase(),
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w600),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/pacienteCadastroPage');
                  },
                ),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
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
                child: FlutterLogo(colors: MaterialColor(0xFF880E4F, LoginPage.color)),
              ),
            ),
          ),
          Center(
            child: Container(
              //Para o texto abaixo da logo.
              //Logo
              //trocar pela logo!
              margin: const EdgeInsets.only(top: 180),
              alignment: Alignment.center,
              child: Text(
                " ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  static _logar(login, senha, context) async {
    print("Login:"+login.toString());
    print("senha:"+senha.toString());

    //Paciente p = await WebService.getPacienteLoginSenha(login, senha);
    Contato c = Contato();
    c.email="12221@gmail.com";
    c.fone1="1222";
    c.fone2="199";
    await WebService.classeSaveEdit(c, EnderecoUrls.CONTATO_SAVE_EDIT);
    print("Passou contato");
    // if(p!=null){
    //   print("Nome: "+p.nome_usuario);
    //   Navigator.pushNamed(context, '/pacienteHomePage'); //Mudar
    // }else{
    //   print("Não Achou!");
    // }
  }
}
