import 'package:flutter/material.dart';
import 'package:masked_text/masked_text.dart';
import 'package:projeto_mobile_clinica/WebService/EnderecoUrls.dart';
import 'package:projeto_mobile_clinica/WebService/WebService.dart';
import 'package:projeto_mobile_clinica/model/Cores.dart';
import 'package:projeto_mobile_clinica/model/bin/Contato.dart';
import 'package:projeto_mobile_clinica/model/bin/Endereco.dart';
import 'package:projeto_mobile_clinica/model/bin/Medico.dart';
import 'package:projeto_mobile_clinica/model/bin/Medico.dart';
import 'package:projeto_mobile_clinica/view/pages/LoginPage.dart';

class CadastroMedicoWidget {
  static Medico medico = new Medico();

  static List<DropdownMenuItem<String>> ufs = [
    new DropdownMenuItem(value: "AC", child: new Text("AC")),
    new DropdownMenuItem(value: "AL", child: new Text("AL")),
    new DropdownMenuItem(value: "AP", child: new Text("AP")),
    new DropdownMenuItem(value: "AM", child: new Text("AM")),
    new DropdownMenuItem(value: "BA", child: new Text("BA")),
    new DropdownMenuItem(value: "CE", child: new Text("CE")),
    new DropdownMenuItem(value: "DF", child: new Text("DF")),
    new DropdownMenuItem(value: "ES", child: new Text("ES")),
    new DropdownMenuItem(value: "GO", child: new Text("GO")),
    new DropdownMenuItem(value: "MA", child: new Text("MA")),
    new DropdownMenuItem(value: "MT", child: new Text("MT")),
    new DropdownMenuItem(value: "MS", child: new Text("MS")),
    new DropdownMenuItem(value: "MG", child: new Text("MG")),
    new DropdownMenuItem(value: "PA", child: new Text("PA")),
    new DropdownMenuItem(value: "PB", child: new Text("PB")),
    new DropdownMenuItem(value: "PR", child: new Text("PR")),
    new DropdownMenuItem(value: "PE", child: new Text("PE")),
    new DropdownMenuItem(value: "PI", child: new Text("PI")),
    new DropdownMenuItem(value: "RJ", child: new Text("RJ")),
    new DropdownMenuItem(value: "RN", child: new Text("RN")),
    new DropdownMenuItem(value: "RS", child: new Text("RS")),
    new DropdownMenuItem(value: "RO", child: new Text("RO")),
    new DropdownMenuItem(value: "RR", child: new Text("RR")),
    new DropdownMenuItem(value: "SC", child: new Text("SC")),
    new DropdownMenuItem(value: "SP", child: new Text("SP")),
    new DropdownMenuItem(value: "SE", child: new Text("SE")),
    new DropdownMenuItem(value: "TO", child: new Text("TO")),
  ];
  static String _currentUf = ufs[0].value;
}

Widget builderCadastroMedicoBuilder(
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
    {Icon iconLeft,
    TextInputType tip,
    TextEditingController fieldC,
    TextEditingController fieldComparator}) {
  return Row(
    children: <Widget>[
      iconLeft == null ? SizedBox() : iconLeft,
      SizedBox(width: 5.0),
      Expanded(
        flex: 1,
        child: Container(
          decoration: BoxDecoration(
            color:
                hintTexts != "Data de nascimento" ? Colors.white : Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: hintTexts == "Data de nascimento"
              ? new MaskedTextField(
                  maskedTextFieldController: fieldC,
                  escapeCharacter: '#',
                  mask: "##/##/####",
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                  inputDecoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        child: Icon(
                          // obscureTextMedico //if ternario!
                          //     ? Icons.remove_red_eye
                          //     : Icons.panorama_fish_eye,
                          psw ? Icons.remove_red_eye : null,
                          size: 20.0,
                          color: Colors.black,
                        ),
                        // onTap:
                        //     toggleLoginMedico, //Evento de mostrar ou ocultar a senha!
                      ),
                      labelStyle: TextStyle(color: Colors.white),
                      contentPadding:
                          const EdgeInsets.only(left: 18, top: 18, bottom: 18),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: hintTexts),
                )
              : TextFormField(
                  controller: fieldC,
                  validator: (value) {
                    value = value.trim();
                    //print(fieldComparator.text.toString()+"Field");
                    //valida logins identicos.
                    if (fieldComparator != null &&
                        hintTexts == "Confirme a senha" &&
                        fieldComparator.text.trim() != value) {
                      return "As senhas devem ser iguais";
                    }
                    if (hintTexts == "CPF" && value.length != 11) {
                      
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
                          // obscureTextMedico //if ternario!
                          //     ? Icons.remove_red_eye
                          //     : Icons.panorama_fish_eye,
                          psw ? Icons.remove_red_eye : null,
                          size: 20.0,
                          color: Colors.black,
                        ),
                        // onTap:
                        //     toggleLoginMedico, //Evento de mostrar ou ocultar a senha!
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
  TextEditingController controladorNome = TextEditingController();
  TextEditingController controladorConfirmeSenha = TextEditingController();

  void preencherCampos() {
    controladorNome.text = CadastroMedicoWidget.medico.nome;
    controladorLogin.text = CadastroMedicoWidget.medico.nome_usuario;
    controladorSenha.text = CadastroMedicoWidget.medico.senha;
    controladorConfirmeSenha.text = CadastroMedicoWidget.medico.senha;
  }

  bool validarCampos() {
    print("Vai validar");
    if (formKey.currentState.validate()) {
      print("Validou");
      CadastroMedicoWidget.medico.nome = controladorNome.text;
      CadastroMedicoWidget.medico.nome_usuario = controladorLogin.text;
      CadastroMedicoWidget.medico.senha = controladorSenha.text.trim();
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
          iconLeft: Icon(Icons.email, color: Colors.white, size: 40),
          fieldC: widget.controladorLogin),
      SizedBox(height: 10.0),
      _builderField("Nome", false,
          iconLeft: Icon(Icons.people, color: Colors.white, size: 40),
          fieldC: widget.controladorNome),
      const SizedBox(height: 10.0),
      _builderField("Senha", true,
          iconLeft: Icon(Icons.lock, color: Colors.white, size: 40),
          fieldC: widget.controladorSenha),
      const SizedBox(height: 10.0),
      _builderField("Confirme a senha", true,
          iconLeft: Icon(Icons.lock, color: Colors.white, size: 40),
          fieldC: widget.controladorConfirmeSenha,
          fieldComparator: widget.controladorSenha),
    ];
    return Form(
      key: widget.formKey,
      child: builderCadastroMedicoBuilder(
          context, "Sobre a conta", builderFieldListSobre),
    );
  }
}

class PessoalPage extends StatefulWidget {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController controladorRg = TextEditingController();
  TextEditingController controladorCpf = TextEditingController();
  TextEditingController controladorNascimento = TextEditingController();

  void preencherCampos() {
    controladorRg.text = CadastroMedicoWidget.medico.rg;
    controladorCpf.text = CadastroMedicoWidget.medico.cpf;
    controladorNascimento.text = "1234";
    // controladorNascimento.text = CadastroMedicoWidget.medico.data_nascimento;
  }

  bool validarCampos() {
    print("Vai validar");
    if (formKey.currentState.validate()) {
      print("Validou");
      CadastroMedicoWidget.medico.rg = controladorRg.text;
      CadastroMedicoWidget.medico.cpf = controladorCpf.text;
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
          tip: TextInputType.number,
          fieldC: widget.controladorRg),
      SizedBox(height: 10.0),
      _builderField("CPF", false,
          iconLeft: Icon(Icons.perm_identity, color: Colors.white, size: 40),
          tip: TextInputType.number,
          fieldC: widget.controladorCpf),
      SizedBox(height: 10.0),
      _builderField("Data de nascimento", false,
          iconLeft: Icon(Icons.date_range, color: Colors.white, size: 40),
          tip: TextInputType.number,
          fieldC: widget.controladorNascimento),
    ];
    return Form(
      key: widget.formKey,
      child: builderCadastroMedicoBuilder(
          context, "Pessoal", builderFieldListPessoal),
    );
  }
}

class ProfissionalPage extends StatefulWidget {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController controladorCrm = TextEditingController();
  TextEditingController controladorArea = TextEditingController();
  TextEditingController controladorEspecialidade = TextEditingController();

  void preencherCampos() {
    if (CadastroMedicoWidget.medico.id_endereco == null) return;
    controladorCrm.text = CadastroMedicoWidget.medico.crm.toString();
    controladorArea.text = CadastroMedicoWidget.medico.area;
    controladorEspecialidade.text = CadastroMedicoWidget.medico.especialidade;
    // controladorNascimento.text = CadastroMedicoWidget.medico.data_nascimento;
  }

  bool validarCampos() {
    print("Vai validar");
    if (formKey.currentState.validate()) {
      print("Validou");
      CadastroMedicoWidget.medico.crm = int.parse(controladorCrm.text);
      CadastroMedicoWidget.medico.area = controladorArea.text;
      CadastroMedicoWidget.medico.especialidade = controladorEspecialidade.text;

      return true;
    }
    return false;
  }

  @override
  _ProfissionalPageState createState() => _ProfissionalPageState();
}

class _ProfissionalPageState extends State<ProfissionalPage> {
  bool flagErro = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> builderFieldListPro = [
      //Pessoais
      _builderField("CRM", false,
          iconLeft: Icon(Icons.sim_card, color: Colors.white, size: 40),
          tip: TextInputType.number,
          fieldC: widget.controladorCrm),
      SizedBox(height: 10.0),
      _builderField("Area de atuação", false,
          iconLeft: Icon(Icons.work, color: Colors.white, size: 40),
          tip: TextInputType.text,
          fieldC: widget.controladorArea),
      SizedBox(height: 10.0),
      _builderField("Especialidade", false,
          iconLeft: Icon(Icons.local_hospital, color: Colors.white, size: 40),
          tip: TextInputType.text,
          fieldC: widget.controladorEspecialidade),
    ];
    return Form(
      key: widget.formKey,
      child: builderCadastroMedicoBuilder(
          context, "Profissional", builderFieldListPro),
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

  void preencherCampos() {
    if (CadastroMedicoWidget.medico.id_endereco == null) return;
    controladorRua.text = CadastroMedicoWidget.medico.id_endereco.rua;
    controladorCidade.text = CadastroMedicoWidget.medico.id_endereco.cidade;
    controladorBairro.text = CadastroMedicoWidget.medico.id_endereco.bairro;
    controladorComplemento.text =
        CadastroMedicoWidget.medico.id_endereco.complemento;
    controladorCep.text = CadastroMedicoWidget.medico.id_endereco.cep;
    controladorEstado.text = CadastroMedicoWidget.medico.id_endereco.estado;
    controladorN.text =
        CadastroMedicoWidget.medico.id_endereco.numero.toString();
    CadastroMedicoWidget.medico.id_endereco.uf =
        CadastroMedicoWidget._currentUf;
    // controladorNascimento.text = CadastroMedicoWidget.medico.data_nascimento;
  }

  bool validarCampos() {
    print("Vai validar");
    if (formKey.currentState.validate()) {
      print("Validou");
      Endereco end = new Endereco();
      end.rua = controladorRua.text;
      end.cidade = controladorCidade.text;
      end.estado = controladorEstado.text;
      end.numero = 1234;
      end.bairro = controladorBairro.text;
      end.complemento = controladorComplemento.text;
      end.cep = controladorCep.text;
      end.numero = int.parse(controladorN.text);
      end.uf = CadastroMedicoWidget._currentUf;
      CadastroMedicoWidget.medico.id_endereco = end;
      return true;
    }
    return false;
  }

  @override
  _EnderecoPageState createState() => _EnderecoPageState();
}

class _EnderecoPageState extends State<EnderecoPage> {
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
          iconLeft: Icon(Icons.streetview, color: Colors.white, size: 40),
          fieldC: widget.controladorRua),
      SizedBox(height: 10.0),
      Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: _builderField("Nº", false,
                tip: TextInputType.number,
                iconLeft: Icon(Icons.format_list_numbered_rtl,
                    color: Colors.white, size: 40),
                fieldC: widget.controladorN),
          ),
          Expanded(
              flex: 2,
              child: _builderField("Bairro", false,
                  fieldC: widget.controladorBairro))
        ],
      ),
      SizedBox(height: 10.0),
      _builderField("Complemento", false,
          iconLeft: Icon(Icons.home, color: Colors.white, size: 40),
          fieldC: widget.controladorComplemento),
      SizedBox(height: 10.0),
      _builderField("CEP", false,
          iconLeft: Icon(Icons.location_on, color: Colors.white, size: 40),
          fieldC: widget.controladorCep),
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
                value: CadastroMedicoWidget._currentUf,
                items: CadastroMedicoWidget.ufs,
                onChanged: (String value) {
                  setState(() {
                    CadastroMedicoWidget._currentUf = value;
                  });
                },
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: _builderField("Estado", false,
                  fieldC: widget.controladorEstado))
        ],
      ),
      SizedBox(height: 10.0),
      _builderField("Cidade", false,
          iconLeft: Icon(Icons.location_city, color: Colors.white, size: 40),
          fieldC: widget.controladorCidade),
      SizedBox(height: 10.0),
    ];
    return Form(
      key: widget.formKey,
      child: builderCadastroMedicoBuilder(
          context, "Endereco", builderFieldListEnd),
    );
  }
}

class ContatoPage extends StatefulWidget {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController controladorFone1 = TextEditingController();
  TextEditingController controladorFone2 = TextEditingController();
  TextEditingController controladorEmail = TextEditingController();
  void preencherCampos() {
    if (CadastroMedicoWidget.medico.id_contato == null) return;
    controladorFone1.text = CadastroMedicoWidget.medico.id_contato.fone1;
    controladorFone2.text = CadastroMedicoWidget.medico.id_contato.fone2;
    controladorEmail.text = CadastroMedicoWidget.medico.id_contato.email;
  }

  bool validarCampos() {
    print("Vai validar");
    if (formKey.currentState.validate()) {
      print("Validou");
      Contato contato = Contato();
      contato.fone1 = controladorFone1.text;
      contato.fone2 = controladorFone2.text;
      contato.email = controladorEmail.text;
      CadastroMedicoWidget.medico.id_contato = contato;
      print("COntatooooo" + contato.fone2);
      return true;
    }
    return false;
  }

  @override
  _ContatoPageState createState() => _ContatoPageState();
}

class _ContatoPageState extends State<ContatoPage> {
  bool flagErro = false;
  Future<bool> inserir(Medico p) async {
    print("Iserir");
    bool l = await WebService.medicoSaveEdit(p, EnderecoUrls.MEDICO_SAVE_EDIT);
    print("Passou Medico");
    print(l);
    return l;
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
          tip: TextInputType.number,
          fieldC: widget.controladorFone1),
      SizedBox(height: 10.0),
      _builderField("Fone 2", false,
          iconLeft: Icon(Icons.phone_android, color: Colors.white, size: 40),
          tip: TextInputType.number,
          fieldC: widget.controladorFone2),
      SizedBox(height: 10.0),
      _builderField("Email", false,
          iconLeft: Icon(Icons.email, color: Colors.white, size: 40),
          tip: TextInputType.emailAddress,
          fieldC: widget.controladorEmail),
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
                if (CadastroMedicoWidget.medico != null) if (widget
                    .validarCampos()) {
                  bool l = await inserir(CadastroMedicoWidget.medico);
                  if (l) {
                    print("Navega");
                    Navigator.pushReplacementNamed(context, '/login');
                    CadastroMedicoWidget.medico = new Medico();
                  }
                }
                print("Passou inserir");
              }
              //    // Navigator.pushReplacementNamed(context, '/medicoHomePage'), //Mudar
              ),
        ),
      ),
    ];
    return Form(
      key: widget.formKey,
      child: builderCadastroMedicoBuilder(
          context, "Contato Pessoal", builderFieldListContato),
    );
  }
}
