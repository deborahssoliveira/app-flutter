import 'package:flutter/material.dart';
import '../pages_login/widgets/appbar_widget.dart';
import '../pages_menu/menu_pages.dart';
import 'widgets/botao_contas.dart';

class ContasPage extends StatefulWidget {
  const ContasPage({super.key});

  @override
  State<ContasPage> createState() => _ContasPageState();
}

class _ContasPageState extends State<ContasPage> {
  bool isEnable = false;

  @override
  Widget build(BuildContext context) {
    final altura = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBarWidget(
        text: 'Prestação de contas',
        onPress: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const MenuPage()));
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 5, top: 24),
              child: Text(
                'Envie seus\ncomprovantes através\ndas opções abaixo:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const ContasBotao(text: 'Hospedagem'),
            const ContasBotao(text: 'Café da manhã'),
            const ContasBotao(text: 'Almoço'),
            const ContasBotao(text: 'Jantar'),
            const ContasBotao(text: 'Outros'),
            Container(
              margin: const EdgeInsets.only(bottom: 150, top: 20),
              height: altura * 0.07,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: isEnable == true
                      ? const Color(0xff005aff)
                      : const Color(0xffcacaca),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  'Finalizar',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
