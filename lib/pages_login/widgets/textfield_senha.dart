import 'package:flutter/material.dart';

class SenhaTextWidget extends StatefulWidget {
  const SenhaTextWidget({super.key, required this.onChange});

  final Function onChange;

  @override
  State<SenhaTextWidget> createState() => _SenhaTextWidgetState();
}

class _SenhaTextWidgetState extends State<SenhaTextWidget> {
  bool _obscure = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xffeeeeee)),
          borderRadius: const BorderRadius.all(Radius.circular(8))),
      child: TextField(
        onChanged: (value) => widget.onChange(value),
        obscureText: _obscure,
        obscuringCharacter: '●',
        style: TextStyle(
            fontSize: 17,
            color: _obscure ? const Color(0xffeeeeee) : Colors.black),
        decoration: InputDecoration(
          border: const OutlineInputBorder(borderSide: BorderSide.none),
          filled: true,
          fillColor: const Color.fromARGB(255, 255, 255, 255),
          hintText: "Senha",
          prefixIcon: const Icon(Icons.lock_outline, color: Color(0xff005aff)),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _obscure = !_obscure;
              });
            },
            icon: _obscure
                ? const Icon(
                    Icons.visibility_off_outlined,
                    color: Color(0xffcacaca),
                  )
                : const Icon(
                    Icons.visibility_outlined,
                    color: Color(0xffcacaca),
                  ),
          ),
        ),
      ),
    );
  }
}
