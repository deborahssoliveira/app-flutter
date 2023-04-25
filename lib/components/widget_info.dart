import 'package:flutter/material.dart';

class InfoWidget extends StatefulWidget {
  const InfoWidget({super.key, required this.text});

  final String text;

  @override
  State<InfoWidget> createState() => _InfoWidgetState();
}

class _InfoWidgetState extends State<InfoWidget> {
  @override
  Widget build(BuildContext context) {
    final altura = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(top: 120, left: 24, bottom: 24, right: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.info,
                  size: 140,
                  color: Color(0xff005aff),
                ),
                const SizedBox(height: 40),
                ListTile(
                  title: const Text(
                    'Enviado!',
                    style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    widget.text,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: altura * 0.08,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    backgroundColor: const Color(0xff005aff)),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/menu');
                },
                child: const Text(
                  'Sair',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
