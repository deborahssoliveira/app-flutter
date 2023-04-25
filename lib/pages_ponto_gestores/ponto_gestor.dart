import 'package:app_deborah/pages_ponto_gestores/widgets/semana_widget.dart';
import 'package:app_deborah/pages_ponto_gestores/widgets/solicitacoes_btn_widget.dart';
import 'package:flutter/material.dart';
import '../pages_login/widgets/appbar_widget.dart';
import '../pages_ponto_digital/widgets/solicitacao_widgets/categorias_widget.dart';
import 'calendario_page.dart';

class PontoGestores extends StatefulWidget {
  const PontoGestores({super.key});

  @override
  State<PontoGestores> createState() => _PontoGestoresState();
}

class _PontoGestoresState extends State<PontoGestores> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        text: 'Ponto online',
        onPress: () {
          Navigator.of(context).pushNamed('/menu');
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Bem vindo, Gestor! \u{1F44B}',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Controle do banco de\nhoras da sua equipe',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Semana',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const CalendarioGestor()));
                    },
                    child: const Text(
                      'Ver mês',
                      style: TextStyle(
                        color: Color(0xff005aff),
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
              const SemanaWidget(),
              const SizedBox(height: 15),
              const Text(
                'Solicitações',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              const SizedBox(height: 5),
              const AbrirSolicitacaoBtn(),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Categorias',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Ver todas',
                      style: TextStyle(
                          color: Color(0xff005aff),
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ),
                ],
              ),
              const CategoriasWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
