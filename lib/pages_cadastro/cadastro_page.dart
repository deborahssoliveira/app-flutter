import 'package:flutter/material.dart';
import '../components/sucess_widget.dart';
import '../controllers/controller_cadastro.dart';
import '../pages_login/login_page.dart';
import '../pages_login/widgets/appbar_widget.dart';
import 'widgets/senha_textfield.dart';
import 'widgets/textfield_widget.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({Key? key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  String? cpf;
  String? email;
  String? password;
  String? confirmPassword;
  String? error;

  final controller = ControllerCadastro();

  @override
  Widget build(BuildContext context) {
    final altura = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBarWidget(
        text: 'Nova conta',
        onPress: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const HomePage()));
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: double.infinity,
                child: const Text(
                  'Para começar, preencha\nos campos abaixo!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 25),
              TextfieldWidget(
                onChange: (value) {
                  setState(() {
                    email = value.toString();
                  });
                },
                text: 'E-mail',
              ),
              const SizedBox(height: 15),
              TextfieldWidget(
                onChange: (value) {
                  setState(() {
                    cpf = value.toString();
                  });
                },
                text: 'CPF',
              ),
              const SizedBox(height: 15),
              SenhaTextfield(
                onChange: (value) {
                  setState(() {
                    password = value.toString();
                  });
                },
                text: 'Senha',
              ),
              const SizedBox(height: 15),
              SenhaTextfield(
                onChange: (value) {
                  setState(() {
                    confirmPassword = value.toString();
                  });
                },
                text: 'Confirme sua senha',
              ),
              if (error != null) Text(error!),
              Container(
                margin: const EdgeInsets.only(top: 60),
                height: altura * 0.075,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      backgroundColor: const Color(0xff005aff)),
                  onPressed: () {
                    camposPreenchidos(cpf, email, password, confirmPassword);
                  },
                  child: const Text(
                    'Criar conta',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  camposPreenchidos(String? cpf, String? email, String? password,
      String? confirmPassword) async {
    if (cpf != null &&
        email != null &&
        password != null &&
        confirmPassword != null &&
        cpf.isNotEmpty &&
        email.isNotEmpty &&
        password.isNotEmpty &&
        confirmPassword.isNotEmpty) {
      email = email.trim();
      cpf = cpf.trim();
      password = password.trim();
      confirmPassword = confirmPassword.trim();

      await controller.cadastro(cpf, email, password, confirmPassword);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => SucessWidget(
              subtitle:
                  'O seu cadastro foi realizado com sucesso e você já pode acessar o SGM.',
              nomeBotao: 'Acessar',
              onPress: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => const HomePage()));
              }),
        ),
      );
    } else {
      setState(() {
        error = "Preencha todos os campos.";
      });
    }
  }
}
