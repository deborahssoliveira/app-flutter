import 'package:app_deborah/pages_ponto_digital/widgets/historico_widgets/data_table_widget.dart';
import 'package:flutter/material.dart';

class HistoricoWidget extends StatefulWidget {
  const HistoricoWidget({super.key});

  @override
  State<HistoricoWidget> createState() => _HistoricoWidgetState();
}

class _HistoricoWidgetState extends State<HistoricoWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
           Text(
            'Acompanhe seu histórico',
            style: TextStyle(fontSize: 20),
          ),
           Text(
            'Se houver ausência de batida, clique para justificar',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTableWidget(),
          ),
        ],
      ),
    );
  }
}
