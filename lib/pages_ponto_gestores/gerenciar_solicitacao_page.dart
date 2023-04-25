import 'package:flutter/material.dart';
import '../pages_login/widgets/appbar_widget.dart';
import '../pages_ponto_digital/widgets/solicitacao_widgets/class_formulario.dart';

class GerenciarSolicitacoes extends StatefulWidget {
  const GerenciarSolicitacoes({Key? key, this.dados}) : super(key: key);

  final FormularioSolicitacao? dados;

  @override
  State<GerenciarSolicitacoes> createState() => _GerenciarSolicitacoesState();
}

class _GerenciarSolicitacoesState extends State<GerenciarSolicitacoes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        text: 'Ponto online',
        onPress: () {
          Navigator.of(context).pushNamed('pontogestor');
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Gerencie suas solicitações',
                style: TextStyle(fontSize: 19),
              ),
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: const BoxDecoration(
                      color: Color(0xffeeeeee),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xffF2EFEF),
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset: Offset(0, 1),
                        ),
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Colaborador:',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            'Matrícula: ${widget.dados?.codigoColaborador}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          Text(
                            'Solicitação: ${widget.dados?.opcao}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          Expanded(
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'Autorizar',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
