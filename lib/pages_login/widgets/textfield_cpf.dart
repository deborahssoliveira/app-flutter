import 'package:flutter/material.dart';

class CPFWidget extends StatefulWidget {
  const CPFWidget({super.key, required this.onChange});

  final Function onChange;

  @override
  State<CPFWidget> createState() => _CPFWidgetState();
}

class _CPFWidgetState extends State<CPFWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffeeeeee)),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: TextField(
        onChanged: (value) => widget.onChange(value),
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          border: OutlineInputBorder(borderSide: BorderSide.none),
          filled: true,
          fillColor: Color.fromARGB(255, 255, 255, 255),
          hintText: "CPF",
          hintStyle: TextStyle(fontSize: 17),
          prefixIcon: Icon(
            Icons.person_outline,
            color: Color(0xff005aff),
          ),
        ),
      ),
    );
  }
}
