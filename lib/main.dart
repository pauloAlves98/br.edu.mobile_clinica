import 'package:flutter/material.dart';
import 'model/Cores.dart';
import 'view/pages/LoginPage.dart';

void main() => runApp(MyApp());
//Falta colocar e nome da clinica e substituir a logo na tela de login!
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clinica Mobile',
      debugShowCheckedModeBanner: false,
      color: primary,
      theme: ThemeData(primaryColor: blueLogin3, accentColor: accent),
      routes: {
        "/": (_) => LoginPage(),
      },
    );
  }
}
