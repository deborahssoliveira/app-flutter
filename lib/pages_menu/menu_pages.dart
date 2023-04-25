import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app_deborah/myglobal.dart' as global;
import '../pages_ponto_digital/ponto_inicio_page.dart';
import 'widgets/botao_menu_widget.dart';
import 'widgets/drop_menu_widget.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {

  @override
  Widget build(BuildContext context) {
    final altura = MediaQuery.of(context).size.height;
    final largura = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xfff1f6ff),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  height: altura * 0.23,
                  width: largura * 0.98,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 17),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 170,
                              child: SvgPicture.asset('assets/icons/login.svg'),
                            ),
                            const DropMenuWidget(),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 5),
                        child: Row(
                          children: [
                            const CircleAvatar(
                                backgroundImage:
                                    AssetImage("assets/icons/images.png"),
                                radius: 35),
                            SizedBox(
                              width: largura * 0.65,
                              child: ListTile(
                                title: global.nomeComSobrenome != null
                                    ? Text(
                                        'Olá, ${global.nomeComSobrenome}',
                                        style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff363636),
                                        ),
                                      )
                                    : const Text(
                                        'Olá, colaborador!',
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff363636),
                                        ),
                                      ),
                                subtitle: const Text(
                                  'Seja bem vindo!',
                                  style: TextStyle(
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 17),
                          child: Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 20),
                                height: altura * 0.21,
                                width: largura * 0.7,
                                decoration: const BoxDecoration(
                                  color: Color(0xffeeeeee),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                ),
                                child: const Icon(
                                  Icons.image,
                                  size: 50,
                                  color: Color(0xffc9c9c9),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 20),
                                height: altura * 0.21,
                                width: largura * 0.7,
                                decoration: const BoxDecoration(
                                  color: Color(0xffeeeeee),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                                child: const Icon(
                                  Icons.image,
                                  size: 50,
                                  color: Color(0xffc9c9c9),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 20),
                                height: altura * 0.21,
                                width: largura * 0.7,
                                decoration: const BoxDecoration(
                                  color: Color(0xffeeeeee),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                                child: const Icon(
                                  Icons.image,
                                  size: 50,
                                  color: Color(0xffc9c9c9),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 14.5),
                        child: Row(
                          children: const [
                            Text(
                              'Recursos humanos',
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff363636),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 9),
                        child: Row(
                          children: [
                            MenuBtn(
                              text: 'Ponto online',
                              onPress: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const PontoPages()));
                              },
                              svg: 'assets/icons/biometria.svg',
                            )
                          ],
                        ),
                      ),
                      
                      Container(
                        margin: const EdgeInsets.only(top: 14.5),
                        child: Row(
                          children: const [
                            Text(
                              'Frota',
                              style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff363636)),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 9),
                        child: Row(
                          children: [
                            MenuBtn(
                                text: 'Checklist de\nmanutenção\npreventiva',
                                onPress: () {
                                  // Navigator.of(context).push(MaterialPageRoute(
                                      // builder: (context) => FormularioMotorista()));
                                },
                                svg: 'assets/icons/check.svg')
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _onBackPressed() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Deseja sair do aplicativo?',
          style: TextStyle(fontSize: 16),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Não'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Sim'),
          ),
        ],
      ),
    ).then((value) => value ?? false);
  }
}
