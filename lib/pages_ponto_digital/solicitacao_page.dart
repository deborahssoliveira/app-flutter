import 'package:app_deborah/pages_ponto_digital/widgets/solicitacao_widgets/cod_colaborador_widget.dart';
import 'package:app_deborah/pages_ponto_digital/widgets/solicitacao_widgets/date_picker_widget.dart';
import 'package:app_deborah/pages_ponto_digital/widgets/solicitacao_widgets/hora_picker_widget.dart';
import 'package:app_deborah/pages_ponto_digital/widgets/solicitacao_widgets/justificativa_widget.dart';
import 'package:app_deborah/pages_ponto_digital/widgets/solicitacao_widgets/observacao_widget.dart';
import 'package:app_deborah/pages_ponto_digital/widgets/solicitacao_widgets/prosseguir_solicitacao_widget.dart';
import 'package:app_deborah/pages_ponto_digital/widgets/solicitacao_widgets/upload_arquivos.dart';
import '../pages_login/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../pages_ponto_gestores/gerenciar_solicitacao_page.dart';
import 'widgets/solicitacao_widgets/class_formulario.dart';


class SolicitacaoPage extends StatefulWidget {
  const SolicitacaoPage({super.key});

  @override
  State<SolicitacaoPage> createState() => _SolicitacaoPageState();
}

class _SolicitacaoPageState extends State<SolicitacaoPage> {
  final _formKey = GlobalKey<FormState>();
  late String _codigoColaborador;
  late String _opcao;
  late DateTime _hora;
  late DateTime _data;

  bool isDropdownSelected = false;

  void _salvarFormulario() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      FormularioSolicitacao dados = FormularioSolicitacao(
        codigoColaborador: _codigoColaborador,
        opcao: _opcao,
        data: _data,
        hora: _hora,
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GerenciarSolicitacoes(dados: dados),
        ),
      );
      print('salvou formulario');
    }
  }

  void dropDownSelecionado() {
    setState(() {
      isDropdownSelected = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        text: 'Ponto online',
        onPress: () {
          Navigator.of(context).pushNamed('/ponto');
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Preencha os\ncampos abaixo:',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 25),
              const Text(
                'Código do colaborador:',
                style: TextStyle(fontSize: 17),
              ),
              const SizedBox(height: 10),
              CodigoColaboradorWidget(
                onSaved: (value) {
                  _codigoColaborador = value!;
                },
              ),
              const SizedBox(height: 20),
              JustificativaDropDownWidget(
                dropDownSelecionado: dropDownSelecionado,
                onSaved: (value) {
                  _opcao = value!;
                },
              ),
              const SizedBox(height: 20),
              Visibility(
                visible: isDropdownSelected,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const UploadArquivos(),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DatePickerWidget(
                          onSaved: (value) {
                            _hora = value;
                          },
                        ),
                        HoraPicker(
                          onSaved: (value) {
                            _hora = DateFormat('HH:mm').parse(value!);
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const ObservacaoWidget(),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              ProsseguirBtn(
                onPress: () => _salvarFormulario(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
