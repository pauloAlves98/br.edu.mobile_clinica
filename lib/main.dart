import 'package:flutter/material.dart';
import 'package:projeto_mobile_clinica/view/pages/AgendarConsulta.dart';
import 'package:projeto_mobile_clinica/view/pages/PacienteHomePage.dart';
import 'package:projeto_mobile_clinica/view/pages/PerfilPage.dart';
import 'model/Cores.dart';
import 'view/pages/LoginPage.dart';
import 'view/pages/MedicoPage/ConsultaMedicoPage.dart';
import 'view/pages/MedicoPage/GerenciaConsultaMedicoPage.dart';
import 'view/pages/MedicoPage/GerenciaLaudoMedicoPage.dart';
import 'view/pages/MedicoPage/MedicoCadastroPage.dart';
import 'view/pages/MedicoPage/MedicoHomePage.dart';
import 'view/pages/PacienteCadastroPage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:projeto_mobile_clinica/view/pages/ConversaPrivadaPage.dart';
import 'package:projeto_mobile_clinica/view/pages/VizualisarEditarConsultaPage.dart';

void main() {
   initializeDateFormatting().then((_) => runApp(MyApp()));}
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
        "/pacienteCadastroPage": (_) => PacienteCadastroPage(),
        "/medicoCadastroPage": (_) => MedicoCadastroPage(),
        "/pacienteHomePage": (_) => PacienteHomePage(),
        "/agendarConsulta": (_) => AgendarConsultaPage(),
        "/medicoHomePage": (_) => MedicoHomePage(),
        "/gerenciaLaudoMedicoPage": (_) => GerenciaLaudoMedicoPage(),
         "/gerenciaConsultaMedicoPage": (_) => GerenciaConsultaMedicoPage(),
        "/consultaMedicoPage": (_) => ConsultaMedicoPage(),
        "/perfilPage": (_) => PerfilPage(),    
        "/conversaPrivada": (_) => ConversaPrivadaPage(),
        "/vizualisarEditarConsulta":(_)=>VizualisarEditarConsultaPage(),
        },
    );
  }
}

