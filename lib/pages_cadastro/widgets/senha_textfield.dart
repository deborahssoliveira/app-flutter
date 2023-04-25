import 'package:flutter/material.dart';

class SenhaTextfield extends StatefulWidget {
  const SenhaTextfield({super.key, required this.onChange, required this.text});

  final Function onChange;
  final String text;

  @override
  State<SenhaTextfield> createState() => _SenhaTextfieldState();
}

class _SenhaTextfieldState extends State<SenhaTextfield> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        onChanged: (value) => widget.onChange(value),
        obscureText: _obscure,
        obscuringCharacter: '●',
        style: TextStyle(
            fontSize: 17,
            color: _obscure ? const Color(0xffeeeeee) : Colors.black),
        decoration: InputDecoration(
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
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          hintText: widget.text,
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 18,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Color(0xffcacaca),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
          ),
        ),
      ),
    );
  }
}
