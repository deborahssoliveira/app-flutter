// ignore_for_file: unused_local_variable
import 'package:flutter/material.dart';
import '../solicitacao_page.dart';

class SolicitacaoButton extends StatefulWidget {
  const SolicitacaoButton({super.key});

  @override
  State<SolicitacaoButton> createState() => _SolicitacaoButtonState();
}

class _SolicitacaoButtonState extends State<SolicitacaoButton> {
  @override
  Widget build(BuildContext context) {
    final altura = MediaQuery.of(context).size.height;
    final largura = MediaQuery.of(context).size.width;

    return Center(
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => SolicitacaoPage()));
          },
          child: Container(
            height: altura * 0.08,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: const Color(0xffeeeeee),
              ),
            ),
            child: Row(
              children: [
                Container(
                  height: altura * 0.08,
                  width: largura * 0.16,
                  decoration: BoxDecoration(
                    color: const Color(0xffeeeeee),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(Icons.description),
                ),
                const SizedBox(width: 15),
                const Expanded(
                  child: Text(
                    'Abrir solicitação',
                    style: TextStyle(fontSize: 19),
                  ),
                ),
                const Icon(Icons.arrow_forward_ios_sharp),
                const SizedBox(width: 25),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
