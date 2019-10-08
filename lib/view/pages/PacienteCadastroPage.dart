import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:projeto_mobile_clinica/model/Cores.dart';
import 'package:projeto_mobile_clinica/view/widgets/CadastroPacienteWidget.dart';

class PacienteCadastroPage extends StatefulWidget {
  @override
  _PacienteCadastroPageState createState() => _PacienteCadastroPageState();
}

class _PacienteCadastroPageState extends State<PacienteCadastroPage> {
  int currentIndex;
  double _altura = 0;
  List<String> introItems = [" P1", "P2", "P3", "P4"]; //4 paginas!
  final SwiperController _controller = SwiperController();

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
                   _modificaAltura(index);
                  setState(() {
                    print("A exceção 1");
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
                autoplayDisableOnInteraction: false,
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
    //   _altura = 662 - 662 * 0.20 + 15;
    // } else if (index == 2) {
    //   _altura = 662 - 662 * 0.10 + 90; //90 pegado do overflow
    // } else if (index == 3) {
    //   _altura = 662 - 662 * 0.20 + 19.5;
    // }
    // print(" ltura aggr:" + _altura.toString());
  }

  Widget _buildPage(BuildContext context, int index) {
    return CadastroPacienteWidget.builderCadastroPaciente(context, index);
  }
}
