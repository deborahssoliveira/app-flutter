import 'package:flutter/material.dart';

import '../../solicitacao_page.dart';

class DataTableWidget extends StatefulWidget {
  const DataTableWidget({super.key});

  @override
  State<DataTableWidget> createState() => _DataTableWidgetState();
}

class _DataTableWidgetState extends State<DataTableWidget> {
  // for example
  List<Map<String, String>> rows = [
    {
      'data': '17/03',
      'entrada': '08:00:00',
      'pausa': '12:00:00',
      'retorno': '--:--:--',
      'saida': '18:00:00'
    },
    {
      'data': '16/03',
      'entrada': '07:30:00',
      'pausa': '11:30:00',
      'retorno': '12:30:00',
      'saida': '17:30:00'
    },
    {
      'data': '15/03',
      'entrada': '--:--:--',
      'pausa': '12:15:00',
      'retorno': '13:15:00',
      'saida': '18:15:00'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columnSpacing: 25,
      headingTextStyle: const TextStyle(color: Colors.black, fontSize: 17),
      dataTextStyle: const TextStyle(color: Colors.black, fontSize: 15),
      columns: const [
         DataColumn(label: Text('Data')),
         DataColumn(label: Text('Entrada')),
         DataColumn(label: Text('Pausa')),
         DataColumn(label: Text('Retorno')),
         DataColumn(label: Text('Saída')),
      ],
      rows: rows.map((data) {
        int rowIndex = rows.indexOf(data);
        return DataRow(cells: [
          DataCell(InkWell(
              child: Text(data['data']!),
              onTap: () => editarCell(rowIndex, 'data'))),
          DataCell(InkWell(
              child: Text(data['entrada']!),
              onTap: () => editarCell(rowIndex, 'entrada'))),
          DataCell(InkWell(
              child: Text(data['pausa']!),
              onTap: () => editarCell(rowIndex, 'pausa'))),
          DataCell(InkWell(
              child: Text(data['retorno']!),
              onTap: () => editarCell(rowIndex, 'retorno'))),
          DataCell(InkWell(
              child: Text(data['saida']!),
              onTap: () => editarCell(rowIndex, 'saida'))),
        ]);
      }).toList(),
    );
  }

  void editarCell(int rowIndex, String column) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          titleTextStyle: const TextStyle(fontSize: 18, color: Colors.black),
          contentTextStyle:
              TextStyle(fontSize: 18, color: Colors.grey.shade700),
          title: const Text(
            'Justificar',
            textAlign: TextAlign.center,
          ),
          content: const Text(
              'Ausência de batida\nAbra uma solicitação\npara seu gestor.'),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Cancelar',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SolicitacaoPage()));
                  },
                  child: const Text(
                    'Continuar',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
