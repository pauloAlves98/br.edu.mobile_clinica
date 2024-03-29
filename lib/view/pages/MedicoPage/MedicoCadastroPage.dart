import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:projeto_mobile_clinica/model/Cores.dart';
import 'package:projeto_mobile_clinica/model/utils/ConversaTask.dart';
import 'package:projeto_mobile_clinica/view/pages/ChatPage.dart';
import 'package:projeto_mobile_clinica/view/widgets/CadastroMedicoWidget.dart';

import '../../../model/Cores.dart';

class MedicoCadastroPage extends StatefulWidget {
  @override
  _MedicoCadastroPageState createState() => _MedicoCadastroPageState();
}

class _MedicoCadastroPageState extends State<MedicoCadastroPage> {
  int currentIndex;
  double _altura = 0;
  List<String> introItems = [" P1", "P2", "P3", "P4","P5"]; //4 paginas!
  final SwiperController _controller = SwiperController();
  SobreContaPage sobreContaPage = SobreContaPage();
  EnderecoPage enderecoPage = EnderecoPage();
  ContatoPage contatoPage = ContatoPage();
  PessoalPage pessoalPage = PessoalPage();
  ProfissionalPage profissionalPage = ProfissionalPage();
  @override
  void initState() {
    
    currentIndex = 0;
    _altura = 662 - 662 * 0.10;
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
    super.initState();
  }

  _afterLayout(_) {
    print("CHAMOUUUUUUUUU");
    // if(currentIndex==0){
    //   gk = _key1;
    // }else
    //   gk = _key2;
    //   final RenderBox renderBoxRed = gk.currentContext.findRenderObject ();
    //   Size positionRed  = renderBoxRed.size;
    //   print("H "+positionRed.height.toString());
    //_modificaAltura(currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    _altura = MediaQuery.of(context).size.height; 
    return Scaffold(
      //resizeToAvoidBottomPadding: false,
      backgroundColor: blueLogin1,
      bottomNavigationBar: BottomAppBar(
        color: blueLogin1,
        child:  Row(
           // Botoes de avançar e voltar!
            children: <Widget>[
              const SizedBox(width: 10.0),
              if (!_isFirstPage())
                IconButton(
                  color: Colors.white,
                  icon: Icon(
                    Icons.arrow_back,
                    size: 30.0,
                  ),
                  onPressed: () {
                    _controller.previous();
                    _modificaAltura(currentIndex - 1);
                  },
                ),
              if (!_isFirstPage()) Spacer(),
              IconButton(
                color: Colors.white,
                icon: Icon(
                  _isLastPage() ? Icons.check_circle : Icons.close,
                  size: 30.0,
                ),
                onPressed: () => Navigator.pushReplacementNamed(context, '/'),
              ),
              if (!_isLastPage()) Spacer(),
              if (!_isLastPage())
                IconButton(
                  color: Colors.white,
                  icon: Icon(
                    Icons.arrow_forward,
                    size: 30.0,
                  ),
                  onPressed: () {
                    _controller.next();
                    _modificaAltura(currentIndex + 1);
                  },
                ),
            ],
          ),
      ),
      body: Column(
        children: <Widget>[
          
          Expanded(
            child: Swiper(
                //scrollDirection: Axis.vertical,
                controller: _controller,
                itemCount: introItems.length,
                autoplay: false,
                autoplayDelay: 5000,
                index: currentIndex,
                onIndexChanged: (index) {
                 setState(() {
                  print("A exceção 1");
                  int parte = index;
                  print("Parte:"+parte.toString());
                  print("Current "+currentIndex.toString());
                  if(currentIndex>=parte){//caso seja voltando
                    currentIndex = index;
                    sobreContaPage.preencherCampos();
                    enderecoPage.preencherCampos();
                    pessoalPage.preencherCampos();
                    contatoPage.preencherCampos();
                    profissionalPage.preencherCampos();
                    return;
                  }
                  if (parte == 1) {
                    if(!sobreContaPage.validarCampos())
                      
                      currentIndex = index > 0 ? index - 1 : 0;//NA IDA!
                    else
                    currentIndex = index;
                  } 
                  else if (parte == 3) {
                     if(!profissionalPage.validarCampos())
                       currentIndex = index > 0 ? index - 1 : 0;
                     else
                     currentIndex = index;
                    // builderCadastroPacienteBuilder(
                    //     context, "Pessoal", builderFieldListP2);
                  }
                  else if (parte == 2) {
                     if(!pessoalPage.validarCampos())
                 
                       currentIndex = index > 0 ? index - 1 : 0;
                     else
                     currentIndex = index;
                    // builderCadastroPacienteBuilder(
                    //     context, "Pessoal", builderFieldListP2);
                  } else if (parte == 4 ) {
                    if(!enderecoPage.validarCampos())
                      currentIndex = index > 0 ? index - 1 : 0;
                    else
                    currentIndex = index;
                    // builderCadastroPacienteBuilder(
                    //     context, "Endereço", builderFieldListP3);
                  }else
                    currentIndex = index;
                  _modificaAltura(currentIndex);
                  print("A exceção 2");
                });

                },
                itemBuilder: (context, index) {
                  print("Contexto sizes:" +
                      MediaQuery.of(context).size.height.toString());
                  print("Contexto sizes:" + index.toString());

                  // _modificaAltura(index);
                  Widget pagina = _buildPage(context, index);

                  //         _altura = MediaQuery.of(context).size.height -
                  // MediaQuery.of(context).size.height * (0.1);
                  return SingleChildScrollView(child: pagina,);
                  //pagina;
                },
                pagination: SwiperPagination(
                  builder: DotSwiperPaginationBuilder(
                      activeColor: Colors.white,
                      color: Colors.white,
                      size: 5.0,
                      activeSize: 12.0),
                ),
                loop: false,
                autoplayDisableOnInteraction: true,
              ),),
          

          // Row(
          //   children: <Widget>[
          //     const SizedBox(width: 20.0),
          //     Expanded(
          //       child: RaisedButton(
          //         child: Text("login".toUpperCase()),
          //         onPressed: (){
          //           Navigator.pushNamed(context, "login");
          //         },
          //       ),
          //     ),
          //     const SizedBox(width: 20.0),
          //     Expanded(
          //       child: RaisedButton(
          //         child: Text("create account".toUpperCase()),
          //         onPressed: () => Navigator.pushReplacementNamed(context, 'register'),
          //       ),
          //     ),
          //     const SizedBox(width: 20.0),
          //   ],
          // ),
          SizedBox(height: 5.0),
         
          //const SizedBox(height: 20.0),
        ],
      ),
    );
  }

  bool _isLastPage() => currentIndex == introItems.length - 1;
  bool _isFirstPage() => currentIndex == 0;

  void _modificaAltura(int index) {
    // if (index == 0) {
    //   print("No 0");
    //   _altura = 662 - 662 * 0.10;
    // } else if (index == 1) {
    //   print("No 1");
    //   _altura = 662 - 662 * 0.20+15;
    // } else if (index == 3) {
    //   _altura = 662 - 662 * 0.10 + 90; //90 pegado do overflow
    // } else if (index == 4) {
    //   _altura = 662 - 662 * 0.20 + 19.5;
    // }else if (index == 2) {
    //   _altura = 662 - 662 * 0.20;
    // }
    // print(" ltura aggr:" + _altura.toString());
  }

  Widget _buildPage(BuildContext context, int index) {//index é o nº da pagina atual
    int parte = index;
    if(parte == 0){
      return sobreContaPage;
    }else if(parte == 1){
      return  pessoalPage;
    }
     else if(parte == 2){
      return  profissionalPage;
    }
    else if(parte == 3){
      return  enderecoPage;
    }
    else if(parte == 4){
      return  contatoPage;
    }
  }
}
