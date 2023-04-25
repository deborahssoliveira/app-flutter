import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../controllers/controller_login.dart';
import '../pages_cadastro/cadastro_page.dart';
import '../pages_menu/menu_pages.dart';
import 'widgets/textfield_cpf.dart';
import 'widgets/textfield_senha.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var cpf = "";
  var password = "";
  bool _isLoading = false;

  var controller = ControllerAuth();

  @override
  Widget build(BuildContext context) {
    final largura = MediaQuery.of(context).size.width;
    final altura = MediaQuery.of(context).size.height;

    return Stack(
      alignment: Alignment.center,
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: SizedBox(
              height: altura,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Color(0xfff1f6ff),
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        height: altura * 0.24,
                        width: double.infinity,
                        child: Container(
                          margin: const EdgeInsets.only(
                              top: 33, left: 61, right: 61),
                          child: SvgPicture.asset('assets/icons/login.svg'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 36),
                              width: largura * 1,
                              child: const Text(
                                'Faça o login',
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Color(0xff005aff),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 24),
                              height: altura * 0.22,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CPFWidget(
                                    onChange: (value) {
                                      setState(() {
                                        cpf = value;
                                      });
                                    },
                                  ),
                                  SenhaTextWidget(
                                    onChange: (value) {
                                      setState(() {
                                        password = value;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 15),
                              height: altura * 0.075,
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xff005aff),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8))),
                                onPressed: () async {
                                  if (cpf.isEmpty || password.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'CPF e senha são obrigatórios.'),
                                            backgroundColor: Colors.red));
                                    return;
                                  }
                                  setState(() {
                                    _isLoading = true;
                                  });
                                  var data =
                                      await controller.login(cpf, password);
                                  setState(() {
                                    _isLoading = false;
                                  });
                                  if (data) {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => MenuPage()));
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'CPF ou senha incorretos.'),
                                            backgroundColor: Colors.red));
                                  }
                                },
                                child: const Text(
                                  'Login',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Esqueci a senha',
                                style: TextStyle(
                                  color: Color(0xff838383),
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border:
                          Border.all(width: 1, color: const Color(0xffEEEEEE)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Não tem um cadastro?',
                          style: TextStyle(
                            color: Color(0xff838383),
                            fontSize: 17,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => CadastroPage()));
                          },
                          child: const Text(
                            'Criar conta',
                            style: TextStyle(
                              color: Color(0xff005aff),
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (_isLoading)
          Container(
            color: Colors.grey.withOpacity(0.5),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
      ],
    );
  }
}
