import 'package:flutter/material.dart';

class CodigoColaboradorWidget extends StatefulWidget {
  final void Function(String?)? onSaved;

  const CodigoColaboradorWidget({Key? key, required this.onSaved})
      : super(key: key);

  @override
  State<CodigoColaboradorWidget> createState() =>
      _CodigoColaboradorWidgetState();
}

class _CodigoColaboradorWidgetState extends State<CodigoColaboradorWidget> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final altura = MediaQuery.of(context).size.height;
    return Container(
      height: altura * 0.07,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 219, 217, 217),
            spreadRadius: 0,
            blurRadius: 4,
            offset: Offset(0, 0),
          ),
        ],
        color: Colors.white,
      ),
      child: TextFormField(
        controller: _controller,
        decoration: InputDecoration(
          hintText: 'Digite...',
          hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffeeeeee),
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Color(0xffeeeeee),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'O campo não pode ser vazio.';
          }
          return null;
        },
        onSaved: widget.onSaved,
      ),
    );
  }
}
