import 'package:flutter/material.dart';
import 'package:projeto_mobile_clinica/model/Cores.dart';
import 'package:projeto_mobile_clinica/model/utils/bubble_indication_painter.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final FocusNode myFocusNodeEmailLogin = FocusNode();
  final FocusNode myFocusNodePasswordLogin = FocusNode();

  final FocusNode myFocusNodePassword = FocusNode();
  final FocusNode myFocusNodeEmail = FocusNode();
  final FocusNode myFocusNodeName = FocusNode();

  TextEditingController loginEmailController = new TextEditingController();
  TextEditingController loginPasswordController = new TextEditingController();

  bool _obscureTextLogin = true;
  bool _obscureTextSignup = true;
  bool _obscureTextSignupConfirm = true;

  TextEditingController signupEmailController = new TextEditingController();
  TextEditingController signupNameController = new TextEditingController();
  TextEditingController signupPasswordController = new TextEditingController();
  TextEditingController signupConfirmPasswordController =
      new TextEditingController();

  PageController _pageController;

  Color left = Colors.black;
  Color right = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: blueLogin,
      key: _scaffoldKey,
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overscroll) {
          overscroll.disallowGlow();
        },
        child: SingleChildScrollView(
          child: Container(
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
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height >= 775.0
                    ? MediaQuery.of(context).size.height
                    : 775.0,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: _buildMenuBar(context),
                    ),
                    
                    Expanded(
                      flex: 2,
                      child: PageView(
                        controller: _pageController,
                        onPageChanged: (i) {
                          if (i == 0) {
                            setState(() {
                              right = Colors.white;
                              left = Colors.black;
                            });
                          } else if (i == 1) {
                            setState(() {
                              right = Colors.black;
                              left = Colors.white;
                            });
                          }
                        },
                        children: <Widget>[
                          _paciente(context),
                          _paciente(context)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _paciente(BuildContext context) {//Login Paciente
   
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Container(//Quadrado branco

            margin: const EdgeInsets.only(top: 30),
            padding: const EdgeInsets.only(top: 80.0, left: 16.0, right: 16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.white,
            ),
            child: Column(
              children: <Widget>[
                Container(height: 100,),
                Row(
                  children: <Widget>[
                    Icon(Icons.person_pin),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: TextField(
                        decoration:
                            InputDecoration(hintText: "Email ou telefone"),
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
                      onPressed: () =>
                          Navigator.pushReplacementNamed(context, '/'), //Mudar
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
                    Navigator.pushNamed(context, 'register');
                  },
                ),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
            Container(
                  //Logo
                  //trocar pela logo!
                  margin: const EdgeInsets.only(top: 70, left: 117 ),
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
                    child: FlutterLogo(),
                    //     'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ae/Star_of_life.svg/1200px-Star_of_life.svg.png'),
                  ),
                  // child: Image.asset(
                  //   logo,
                  //   fit: BoxFit.contain,
                ),
        ],
      ),
    );
  }

  Widget _buildMenuBar(BuildContext context) {
    return Container(
      width: 300.0,
      height: 50.0,
      decoration: BoxDecoration(
        color: blueLogin3,
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
      child: CustomPaint(
        painter: TabIndicationPainter(pageController: _pageController),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: FlatButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: _onSignInButtonPress,
                child: Text(
                  "Paciente",
                  style: TextStyle(
                    color: left,
                    fontSize: 16.0,
                    // fontFamily: "WorkSansSemiBold"
                  ),
                ),
              ),
            ),
            //Container(height: 33.0, width: 1.0, color: Colors.white),
            Expanded(
              child: FlatButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: _onSignUpButtonPress,
                child: Text(
                  "Médico",
                  style: TextStyle(
                      color: right, fontSize: 16.0, fontFamily: "Arial"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    myFocusNodePassword.dispose();
    myFocusNodeEmail.dispose();
    myFocusNodeName.dispose();
    _pageController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    _pageController = PageController();
  }

  void _onSignInButtonPress() {
    _pageController.animateToPage(0,
        duration: Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _onSignUpButtonPress() {
    _pageController?.animateToPage(1,
        duration: Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _toggleLogin() {
    setState(() {
      _obscureTextLogin = !_obscureTextLogin;
    });
  }

  void _toggleSignup() {
    setState(() {
      _obscureTextSignup = !_obscureTextSignup;
    });
  }

  void _toggleSignupConfirm() {
    setState(() {
      _obscureTextSignupConfirm = !_obscureTextSignupConfirm;
    });
  }
}
