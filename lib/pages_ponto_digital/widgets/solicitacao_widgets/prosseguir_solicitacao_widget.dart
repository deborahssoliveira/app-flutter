import 'package:flutter/material.dart';

class ProsseguirBtn extends StatelessWidget {
  const ProsseguirBtn({super.key, required this.onPress});

  final Function onPress;

  @override
  Widget build(BuildContext context) {
    final altura = MediaQuery.of(context).size.height;

    return Container(
      width: double.infinity,
      height: altura * 0.07,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            backgroundColor: Color(0xff005aff),
            elevation: 0),
        onPressed: () => onPress,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Prosseguir',
              style: TextStyle(fontSize: 22),
            ),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
