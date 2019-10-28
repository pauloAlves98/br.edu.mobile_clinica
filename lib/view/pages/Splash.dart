import 'dart:async';
import 'package:flutter/material.dart';
import 'package:projeto_mobile_clinica/model/Cores.dart';
import 'package:projeto_mobile_clinica/model/bin/Paciente.dart';

import 'LoginPage.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    return new Timer(new Duration(seconds: 3), navigationPage);
  }

  void navigationPage() async {
    Paciente futureUsuario = await Paciente.getAtivo();
    if (futureUsuario == null) {
      print("Ta nulo Rapaiz");
      Navigator.pushReplacementNamed(context, '/login');
    } else {
      Navigator.pushReplacementNamed(context, '/perfilPage');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: blueLogin3,
        body: Center(
      child: SizedBox.expand(child:FlutterLogo(colors: MaterialColor(0xFF880E4F, LoginPage.color)))
    ));
  }
}
