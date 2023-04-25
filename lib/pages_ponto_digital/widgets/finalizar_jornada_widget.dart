import 'package:flutter/material.dart';

class FinalizarJornada extends StatelessWidget {
  const FinalizarJornada({super.key, required this.onPress});

  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onPress,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            'Finalizar jornada',
            style: TextStyle(fontSize: 19, color: Colors.black),
          ),
          SizedBox(width: 10),
          Icon(
            Icons.arrow_forward_ios_sharp,
            size: 25,
            color: Color(0xff232323),
          ),
        ],
      ),
    );
  }
}
