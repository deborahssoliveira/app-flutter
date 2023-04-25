import 'package:flutter/material.dart';

import 'items_drop.dart';

class JustificativaDropDownWidget extends StatefulWidget {
  const JustificativaDropDownWidget(
      {super.key, required this.dropDownSelecionado, required this.onSaved});

  final VoidCallback dropDownSelecionado;
  final void Function(String?)? onSaved;

  @override
  State<JustificativaDropDownWidget> createState() =>
      _JustificativaDropDownWidgetState();
}

class _JustificativaDropDownWidgetState
    extends State<JustificativaDropDownWidget> {
  String? _selectedOption;

  @override
  Widget build(BuildContext context) {
    final altura = MediaQuery.of(context).size.height;

    return Container(
      height: altura * 0.06,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        boxShadow: const [
          BoxShadow(
              color: Color.fromARGB(255, 219, 217, 217),
              spreadRadius: 0,
              blurRadius: 4,
              offset: Offset(0, 0)),
        ],
        border: Border.all(color: const Color(0xffeeeeee)),
      ),
      child: DropdownButton(
        value: _selectedOption,
        underline: Container(),
        isExpanded: true,
        style: const TextStyle(fontSize: 16, color: Color.fromARGB(255, 85, 84, 84)),
        hint: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children:  const [
               Text('Selecione uma opção'),
            ],
          ),
        ),
        iconSize: 40,
        items: const [
          DropdownMenuItem(
            value: 'Opção 1',
            child: ItemDropCustom(text: 'Home Office'),
          ),
          DropdownMenuItem(
            value: 'Opção 2',
            child: ItemDropCustom(text: 'Compensação'),
          ),
          DropdownMenuItem(
            value: 'Opção 3',
            child: ItemDropCustom(text: 'Atestado'),
          ),
          DropdownMenuItem(
            value: 'Opção 4',
            child: ItemDropCustom(text: 'Hora extra'),
          ),
          DropdownMenuItem(
            value: 'Opção 5',
            child: ItemDropCustom(text: 'Outros'),
          ),
        ],
        onChanged: (value) {
          widget.dropDownSelecionado();
          setState(() {
            _selectedOption = value;
          });
          widget.onSaved!(value);
        },
      ),
    );
  }
}
