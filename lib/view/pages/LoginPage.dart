import 'package:flutter/material.dart';
import 'package:projeto_mobile_clinica/model/Cores.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: blueLogin,
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            stops: [0.3, 1], //de acordo com o numero de cores!
            colors: [blueLogin3, blueLogin1],
          ),
        ),
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(
              top: 10, left: 16.0, right: 16.0, bottom: 10.0),
          child: Stack(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 70),
                padding:
                    const EdgeInsets.only(top: 80.0, left: 16.0, right: 16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.0),
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(Icons.person_pin),
                          const SizedBox(width: 10.0),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                  hintText: "Email ou telefone"),
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
                              obscureText: true,
                              decoration: InputDecoration(
                                  hintText: "Senha",
                                  suffixIcon: GestureDetector(
                                    child: Icon(Icons.remove_red_eye),
                                    onTap: () {},
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
                            colors: [blueLogin3, blueLogin1],
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(360)),
                        ),
                        child: SizedBox.expand(
                          child: FlatButton(
                            textColor: Colors.white,
                            child: Text("Login".toUpperCase()),
                            onPressed: () => Navigator.pushReplacementNamed(
                                context, '/'), //Mudar
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
                          Navigator.pushNamed(context, 'recover');
                        },
                      ),
                      const SizedBox(height: 20.0),
                      Row(
                        children: <Widget>[
                          Expanded(
                              child: Divider(
                            color: blueLogin3,
                          )),
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
                          Navigator.pushNamed(context, 'register');
                        },
                      ),
                      const SizedBox(height: 20.0),
                    ],
                  ),
                ),
              ),
              Container(//trocar pela logo!
                margin: const EdgeInsets.only(top: 20.0, left: 117.0),
                alignment: Alignment.center,
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: blueLogin3,
                  // gradient: LinearGradient(
                  //   begin: Alignment.topLeft,
                  //   end: Alignment.centerRight,
                  //   stops: [0.3, 1], //de acordo com o numero de cores!
                  //   colors: [blueLogin3, blueLogin1],
                  // ),
                  borderRadius: BorderRadius.all(Radius.circular(360)),
                ),
                child: SizedBox(
                  height: 80,
                  width: 80,
                  child: Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/a/ae/Star_of_life.svg/1200px-Star_of_life.svg.png'),
                ),
                // child: Image.asset(
                //   logo,
                //   fit: BoxFit.contain,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
