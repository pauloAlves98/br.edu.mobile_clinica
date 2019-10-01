import 'package:flutter/material.dart';
import 'package:projeto_mobile_clinica/model/Cores.dart';
import 'package:projeto_mobile_clinica/view/pages/LoginPage.dart';

class LoginMedicoWidget {
  
  static Widget buildLoginMedico(
      BuildContext context,
      medicoEmailField,
      medicoCrmField,
      medicoPasswordField,
      myFocusNodePassword,
      obscureTextMedico,
      toggleLoginMedico) {
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
                Container(
                  height: 100,
                ),
                Row(
                  //Email
                  children: <Widget>[
                    Icon(Icons.person_pin),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: TextField(
                        controller: medicoEmailField,
                        decoration: InputDecoration(hintText: "Login"),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                Row(
                  children: <Widget>[
                    Icon(Icons.sim_card),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: TextField(
                        controller: medicoCrmField,
                        keyboardType: TextInputType.number,
                        // obscureText: true,
                        decoration: InputDecoration(
                          hintText: "CRM",
                          // suffixIcon: GestureDetector(
                          //   // child: Icon(Icons.remove_red_eye),
                          //   onTap: () {},
                          // )
                        ),
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
                        controller: medicoPasswordField,
                        focusNode: myFocusNodePassword,
                        obscureText: obscureTextMedico,
                        decoration: InputDecoration(
                            hintText: "Senha",
                            suffixIcon: GestureDetector(
                              child: Icon(
                                obscureTextMedico
                                    ? Icons.remove_red_eye
                                    : Icons.panorama_fish_eye,
                                size: 20,
                                color: Colors.black,
                              ),
                              onTap: toggleLoginMedico,
                            )),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30.0),
                Container(
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
                      onPressed: () =>
                          Navigator.pushNamed(context, '/medicoHomePage'), //Mudar
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
                    Navigator.pushNamed(context, '/medicoCadastroPage');
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
                    Navigator.pushNamed(context, '/medicoCadastroPage');
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
                // gradient: LinearGradient(
                //   begin: Alignment.topLeft,
                //   end: Alignment.centerRight,
                //   stops: [0.3, 1], //de acordo com o numero de cores!
                //   colors: [blueLogin3, blueLogin1],
                // ),
                // borderRadius: BorderRadius.all(Radius.circular(360)),
              ),
              child: SizedBox(
                height: 80,
                width: 80,
                child: FlutterLogo(colors: MaterialColor(0xFF880E4F, LoginPage.color)),
                //     'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ae/Star_of_life.svg/1200px-Star_of_life.svg.png'),
              ),
              // child: Image.asset(
              //   logo,
              //   fit: BoxFit.contain,
            ),
          ),
          Center(
            child: Container(
              //Logo
              //trocar pela logo!
              margin: const EdgeInsets.only(top: 180),
              alignment: Alignment.center,
              child: Text(" "),
            ),
          )
        ],
      ),
    );
  }
}
