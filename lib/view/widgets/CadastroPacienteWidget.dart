import 'package:flutter/material.dart';
import 'package:projeto_mobile_clinica/WebService/EnderecoUrls.dart';
import 'package:projeto_mobile_clinica/WebService/WebService.dart';
import 'package:projeto_mobile_clinica/model/Cores.dart';
import 'package:projeto_mobile_clinica/model/bin/Contato.dart';
import 'package:projeto_mobile_clinica/model/bin/Endereco.dart';
import 'package:projeto_mobile_clinica/model/bin/Paciente.dart';
import 'package:projeto_mobile_clinica/view/pages/LoginPage.dart';

class CadastroPacienteWidget {
  static Paciente paciente = new Paciente();
  static List<DropdownMenuItem<String>> ufs = [
    new DropdownMenuItem(value: "PE", child: new Text("PE")),
    new DropdownMenuItem(value: "PB", child: new Text("PB"))
  ];
  static String currentUf = ufs[0].value;
}

Widget builderCadastroPacienteBuilder(
    //chave para modificar tamanho da tela!
    BuildContext context,
    String txt,
    List<Widget> builderField) {
  return Container(
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
      margin: const EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 5.0),
      child: Column(
        children: <Widget>[
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
                child: FlutterLogo(
                    colors: MaterialColor(0xFF880E4F, LoginPage.color)),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Divider(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 5.0),
                Text(
                  txt,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 5.0),
                Expanded(
                    child: Divider(
                  color: Colors.white,
                )),
              ],
            ),
          ),
          SizedBox(
            height: 35,
          ),
          Column(children: builderField), //Campos field
          const SizedBox(height: 20.0),
        ],
      ),
    ),
  );
}

Widget _builderField(String hintTexts, bool psw,
    {Icon iconLeft, TextInputType tip, TextEditingController fieldC,TextEditingController fieldComparator}) {
  return Row(
    children: <Widget>[
      iconLeft == null ? SizedBox() : iconLeft,
      SizedBox(width: 5.0),
      Expanded(
        flex: 2,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextFormField(
            controller: fieldC,
            validator: (value) {
              value = value.trim();
              //print(fieldComparator.text.toString()+"Field");
              
              if (fieldComparator!=null && hintTexts=="Confirme a senha" && fieldComparator.text.trim() != value) {
                return "As senhas devem ser iguais";
              }
              if (hintTexts=="CPF" && value.length<11) {
                return "CPF Invalido!";
              }
              if (value.isEmpty) {
                return "Campo Obrigatório";
              }
              return null;
            },
            keyboardType: tip == null ? TextInputType.text : tip,
            style: TextStyle(),
            decoration: InputDecoration(
                suffixIcon: GestureDetector(
                  child: Icon(
                    // obscureTextPaciente //if ternario!
                    //     ? Icons.remove_red_eye
                    //     : Icons.panorama_fish_eye,
                    psw ? Icons.remove_red_eye : null,
                    size: 20.0,
                    color: Colors.black,
                  ),
                  // onTap:
                  //     toggleLoginPaciente, //Evento de mostrar ou ocultar a senha!
                ),
                labelStyle: TextStyle(color: Colors.white),
                contentPadding:
                    const EdgeInsets.only(left: 18, top: 18, bottom: 18),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: hintTexts),
          ),
        ),
      ),
    ],
  );
}

class SobreContaPage extends StatefulWidget {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController controladorSenha = TextEditingController();
  TextEditingController controladorLogin = TextEditingController();
  TextEditingController controladorNome= TextEditingController();
  TextEditingController controladorConfirmeSenha = TextEditingController();
  
  void preencherCampos(){
    controladorNome.text = CadastroPacienteWidget.paciente.nome;
    controladorLogin.text = CadastroPacienteWidget.paciente.nome_usuario;
    controladorSenha.text= CadastroPacienteWidget.paciente.senha;
    controladorConfirmeSenha.text = CadastroPacienteWidget.paciente.senha;
  }

  bool validarCampos(){
    print("Vai validar");
    if(formKey.currentState.validate()){
      print("Validou");
      CadastroPacienteWidget.paciente.nome = controladorNome.text;
      CadastroPacienteWidget.paciente.nome_usuario =  controladorLogin.text;
      CadastroPacienteWidget.paciente.senha = controladorSenha.text.trim();
      return true;
    }
    return false;
  }
  @override
  _SobreContaPageState createState() => _SobreContaPageState();
}

class _SobreContaPageState extends State<SobreContaPage> {
  bool flagErro = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> builderFieldListSobre = [
    //sobre a conta
    _builderField("Login", false,
        iconLeft: Icon(Icons.email, color: Colors.white, size: 40), fieldC: widget.controladorLogin),
    SizedBox(height: 10.0),
    _builderField("Nome", false,
        iconLeft: Icon(Icons.people, color: Colors.white, size: 40),fieldC: widget.controladorNome),
    const SizedBox(height: 10.0),
    _builderField("Senha", true,
        iconLeft: Icon(Icons.lock, color: Colors.white, size: 40),fieldC: widget.controladorSenha),
    const SizedBox(height: 10.0),
    _builderField("Confirme a senha", true,
        iconLeft: Icon(Icons.lock, color: Colors.white, size: 40),fieldC: widget.controladorConfirmeSenha,fieldComparator: widget.controladorSenha),
  ];
    return Form(
      key: widget.formKey,
      child: builderCadastroPacienteBuilder(
          context, "Sobre a conta", builderFieldListSobre),
    );
  }
}

class PessoalPage extends StatefulWidget {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController controladorRg = TextEditingController();
  TextEditingController controladorCpf = TextEditingController();
  TextEditingController controladorNascimento = TextEditingController();
  
  void preencherCampos(){
    controladorRg.text = CadastroPacienteWidget.paciente.rg;
    controladorCpf.text = CadastroPacienteWidget.paciente.cpf;
    controladorNascimento.text ="1234";
   // controladorNascimento.text = CadastroPacienteWidget.paciente.data_nascimento;
  }

  bool validarCampos(){
    print("Vai validar");
    if(formKey.currentState.validate()){
      print("Validou");
      CadastroPacienteWidget.paciente.rg = controladorRg.text;
      CadastroPacienteWidget.paciente.cpf =  controladorCpf.text;
      return true;
    }
    return false;
  }
  @override
  _PessoalPageState createState() => _PessoalPageState();
}

class _PessoalPageState extends State<PessoalPage> {
  bool flagErro = false;

  
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> builderFieldListPessoal = [
    //Pessoais
    _builderField("RG", false,
        iconLeft: Icon(Icons.perm_identity, color: Colors.white, size: 40),
        tip: TextInputType.number,fieldC: widget.controladorRg),
    SizedBox(height: 10.0),
    _builderField("CPF", false,
        iconLeft: Icon(Icons.perm_identity, color: Colors.white, size: 40),
        tip: TextInputType.number,fieldC: widget.controladorCpf),
    SizedBox(height: 10.0),
    _builderField("Data de nascimento", false,
        iconLeft: Icon(Icons.date_range, color: Colors.white, size: 40),
        tip: TextInputType.number, fieldC: widget.controladorNascimento),
  ];
    return Form(
      key: widget.formKey,
      child: builderCadastroPacienteBuilder(
          context, "Pessoal", builderFieldListPessoal),
    );
  }
}

class EnderecoPage extends StatefulWidget {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController controladorRua = TextEditingController();
  TextEditingController controladorCidade = TextEditingController();
  TextEditingController controladorN = TextEditingController();
  TextEditingController controladorBairro = TextEditingController();
  TextEditingController controladorComplemento = TextEditingController();
  TextEditingController controladorCep = TextEditingController();
  TextEditingController controladorEstado = TextEditingController();

  void preencherCampos(){
    if(CadastroPacienteWidget.paciente.endereco==null)
    return;
    controladorRua.text = CadastroPacienteWidget.paciente.endereco.rua;
    controladorCidade.text = CadastroPacienteWidget.paciente.endereco.cidade;
    controladorN.text ="1234";
    controladorBairro.text = CadastroPacienteWidget.paciente.endereco.bairro;
    controladorComplemento.text = CadastroPacienteWidget.paciente.endereco.complemento;
    controladorCep.text = CadastroPacienteWidget.paciente.endereco.cep;
   // controladorNascimento.text = CadastroPacienteWidget.paciente.data_nascimento;
  }

  bool validarCampos(){
    print("Vai validar");
    if(formKey.currentState.validate()){
      print("Validou");
      Endereco end = new Endereco();
      end.rua = controladorRua.text;
      end.cidade =  controladorCidade.text ;
      end.numero=1234; 
      end.bairro = controladorBairro.text;
      end.complemento =controladorComplemento.text;
      end.cep = controladorCep.text;
      CadastroPacienteWidget.paciente.endereco = end;
      return true;
    }
    return false;
  }
  @override
  _EnderecoPageState createState() => _EnderecoPageState();
}

class _EnderecoPageState extends State<EnderecoPage > {
  bool flagErro = false;
 
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> builderFieldListEnd = [
    //End
    //Endereco
    _builderField("Rua", false,
        iconLeft: Icon(Icons.streetview, color: Colors.white, size: 40), fieldC: widget.controladorRua),
    SizedBox(height: 10.0),
    Row(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: _builderField("Nº", false,
              tip: TextInputType.number,
              iconLeft: Icon(Icons.format_list_numbered_rtl,
                  color: Colors.white, size: 40), fieldC: widget.controladorN),
        ),
        Expanded(flex: 2, child: _builderField("Bairro", false, fieldC: widget.controladorBairro))
      ],
    ),
    SizedBox(height: 10.0),
    _builderField("Complemento", false,
        iconLeft: Icon(Icons.home, color: Colors.white, size: 40), fieldC: widget.controladorComplemento),
    SizedBox(height: 10.0),
    _builderField("CEP", false,
        iconLeft: Icon(Icons.location_on, color: Colors.white, size: 40), fieldC: widget.controladorCep),
    SizedBox(height: 10.0),
    Row(
      children: <Widget>[
        //90 pixels de overflow
        Icon(Icons.terrain, color: Colors.white, size: 40),
        SizedBox(width: 5.0),
        Expanded(
          flex: 1,
          child: Container(
            width: 20,
            padding: EdgeInsets.only(left: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: DropdownButton(
              underline:
                  Container(), //Criar um metodo iniciareventos q receb um evento e criar
              value: CadastroPacienteWidget.currentUf,
              items: CadastroPacienteWidget.ufs,
              onChanged: (String value) {
                print("AA");
              },
            ),
          ),
        ),
        Expanded(flex: 2, child: _builderField("Estado", false, fieldC: widget.controladorEstado))
      ],
    ),
    SizedBox(height: 10.0),
    _builderField("Cidade", false,
        iconLeft: Icon(Icons.location_city, color: Colors.white, size: 40), fieldC: widget.controladorCidade),
    SizedBox(height: 10.0),
  ];
    return Form(
      key: widget.formKey,
      child: builderCadastroPacienteBuilder(
          context, "Endereco", builderFieldListEnd),
    );
  }
}

class ContatoPage extends StatefulWidget {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController controladorFone1 = TextEditingController();
  TextEditingController controladorFone2 = TextEditingController();
  TextEditingController controladorEmail = TextEditingController();
   void preencherCampos(){
     if(CadastroPacienteWidget.paciente.contato==null)
    return;
    controladorFone1.text = CadastroPacienteWidget.paciente.contato.fone1;
    controladorFone2.text = CadastroPacienteWidget.paciente.contato.fone2;
    controladorEmail.text = CadastroPacienteWidget.paciente.contato.email;
  }

  bool validarCampos(){
    print("Vai validar");
    if(formKey.currentState.validate()){
      print("Validou");
      Contato contato = Contato();
      contato.fone1 = controladorFone1.text;
      contato.fone2 = controladorFone2.text;
      contato.email = controladorEmail.text;
      return true;
    }
    return false;
  }
  @override
  _ContatoPageState createState() => _ContatoPageState();
}

class _ContatoPageState extends State<ContatoPage> {
  bool flagErro = false;
  void inserir(Paciente p) async {
    print("Iserir");
    bool l = await WebService.classeSaveEdit(p, EnderecoUrls.PACIENTE_SAVE_EDIT);
    print("Passou paciente");
    print(l);
    // if(p!=null){
    //   print("Nome: "+p.nome_usuario);
    //   Navigator.pushNamed(context, '/pacienteHomePage'); //Mudar
    // }else{
    //   print("Não Achou!");
    // }
  }
  
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> builderFieldListContato = [
    //Contato
    _builderField("Fone 1", false,
        iconLeft: Icon(Icons.phone_iphone, color: Colors.white, size: 40),
        tip: TextInputType.number,fieldC: widget.controladorFone1),
    SizedBox(height: 10.0),
    _builderField("Fone 2", false,
        iconLeft: Icon(Icons.phone_android, color: Colors.white, size: 40),
        tip: TextInputType.number,fieldC: widget.controladorFone2),
    SizedBox(height: 10.0),
    _builderField("Email", false,
        iconLeft: Icon(Icons.email, color: Colors.white, size: 40),
        tip: TextInputType.emailAddress,fieldC: widget.controladorEmail),
    SizedBox(height: 10.0), //Colocar um bootao para finalizar o cadastroo!
    Container(
      height: 50,
      width: 100,
      alignment: Alignment.topCenter,

      // margin: const EdgeInsets.symmetric(horizontal: 16.0),
      // width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.centerRight,
          stops: [0.3, 1], //de acordo com o numero de cores!
          colors: [Colors.white, Colors.white],
        ),
        borderRadius: BorderRadius.all(Radius.circular(360)),
      ),
      child: SizedBox.expand(
        child: FlatButton(
            textColor: Colors.white,
            child: Text("Finalizar".toUpperCase(),
                style: TextStyle(color: Colors.blueGrey[600], fontSize: 12)),
            onPressed: () async {
              // await WebService.contatoCadastro('email', '123456789', '123456789');
              if(CadastroPacienteWidget.paciente!=null)
              print("Não eh  nulo");
               inserir(CadastroPacienteWidget.paciente);
               print("Passou inserir");
            }
            //    // Navigator.pushReplacementNamed(context, '/medicoHomePage'), //Mudar
            ),
      ),
    ),
  ];
  
    return Form(
      key: widget.formKey,
      child: builderCadastroPacienteBuilder(
          context, "ContatoPessoal", builderFieldListContato),
    );
  }
}

