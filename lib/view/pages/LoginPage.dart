import 'package:flutter/material.dart';
import 'package:projeto_mobile_clinica/model/Cores.dart';
import 'package:projeto_mobile_clinica/model/utils/bubble_indication_painter.dart';
import 'package:flutter/services.dart';
import 'package:projeto_mobile_clinica/view/widgets/LoginMedicoWidget.dart';
import 'package:projeto_mobile_clinica/view/widgets/LoginPacienteWidget.dart';

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

  TextEditingController _pacienteEmailField = new TextEditingController();
  TextEditingController _pacientePasswordField = new TextEditingController();

  bool _obscureTextPaciente = true;
  bool _obscureTextMedico = true;
  bool _obscureTextMedicoConfirm = true;

  TextEditingController _medicoEmailField = new TextEditingController();
  TextEditingController _medicoCrmField = new TextEditingController();
  TextEditingController _medicoPasswordField = new TextEditingController();

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
                colors: [Color(0xFF6CD8F0), blueLogin1],
              ),
            ),
            child: Container(
              //Container para centralizar
              alignment: Alignment.center,
              margin: const EdgeInsets.only(
                  top: 30, left: 20, right: 20, bottom: 10.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height >= 520
                    ? MediaQuery.of(context).size.height
                    : 520,
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
                          LoginPacienteWidget.buildLoginPaciente(context,_pacienteEmailField,_pacientePasswordField,myFocusNodePassword,
                          _obscureTextPaciente,_toggleLoginPaciente),
                          LoginMedicoWidget.buildLoginMedico(context,_medicoEmailField,_medicoCrmField,_medicoPasswordField,myFocusNodePassword,
                          _obscureTextMedico,_toggleLoginMedico)
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

  void _loginMedicoPressed() {}

  void _onSignInButtonPress() {
    _pageController.animateToPage(0,
        duration: Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _onSignUpButtonPress() {
    _pageController?.animateToPage(1,
        duration: Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _toggleLoginPaciente() {
    setState(() {
      _obscureTextPaciente = !_obscureTextPaciente;
    });
  }

  void _toggleLoginMedico() {
    setState(() {
      _obscureTextMedico = !_obscureTextMedico;
    });
  }

  void _toggleSignupConfirm() {
    setState(() {
      _obscureTextMedicoConfirm = !_obscureTextMedicoConfirm;
    });
  }
}
