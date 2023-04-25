import 'package:flutter/material.dart';

class ItemDropCustom extends StatelessWidget {
  final String text;

  const ItemDropCustom({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        text,
        style: TextStyle(fontSize: 16, color: Colors.grey),
      ),
    );
  }
}
