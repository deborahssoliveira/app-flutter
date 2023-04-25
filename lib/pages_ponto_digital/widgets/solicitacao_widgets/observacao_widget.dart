import 'package:flutter/material.dart';

class ObservacaoWidget extends StatefulWidget {
  const ObservacaoWidget({super.key, this.onSaved});

  final Function(String?)? onSaved;

  @override
  State<ObservacaoWidget> createState() => _ObservacaoWidgetState();
}

class _ObservacaoWidgetState extends State<ObservacaoWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Observação',
              style: TextStyle(fontSize: 17),
            ),
            Text(
              '(opcional)',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 219, 217, 217),
                spreadRadius: 0,
                blurRadius: 4,
                offset: Offset(0, 0),
              ),
            ],
          ),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: 'Digite...',
              hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
              border: OutlineInputBorder(borderSide: BorderSide.none),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'O campo não pode ser vazio.';
              }
              return null;
            },
            onSaved: widget.onSaved,
          ),
        ),
      ],
    );
  }
}
