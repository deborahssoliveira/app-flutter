import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SucessWidget extends StatefulWidget {
  const SucessWidget(
      {super.key,
      required this.subtitle,
      required this.nomeBotao,
      required this.onPress});

  final String subtitle;
  final String nomeBotao;
  final Function onPress;

  @override
  State<SucessWidget> createState() => _SucessWidgetState();
}

class _SucessWidgetState extends State<SucessWidget> {
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
                SvgPicture.asset("assets/icons/Frame.svg",
                    height: altura * 0.15),
                const SizedBox(height: 40),
                ListTile(
                  title: const Text(
                    'Sucesso!',
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    widget.subtitle,
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
                onPressed: () => widget.onPress(),
                child: Text(
                  widget.nomeBotao,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
