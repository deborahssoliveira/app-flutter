import 'package:flutter/material.dart';

import '../gerenciar_solicitacao_page.dart';

class AbrirSolicitacaoBtn extends StatefulWidget {
  const AbrirSolicitacaoBtn({super.key});

  @override
  State<AbrirSolicitacaoBtn> createState() => _AbrirSolicitacaoBtnState();
}

class _AbrirSolicitacaoBtnState extends State<AbrirSolicitacaoBtn> {
  @override
  Widget build(BuildContext context) {
    final altura = MediaQuery.of(context).size.height;
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Color(0xffF2EFEF),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 1),
          ),
        ],
      ),
      height: altura * 0.16,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              'Gerencie as solicitações\nem aberto da sua equipe.',
              style: TextStyle(fontSize: 18.5),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => GerenciarSolicitacoes()));
              },
              child: const Text(
                'Prosseguir   >',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
