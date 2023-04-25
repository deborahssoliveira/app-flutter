import 'dart:async';
import 'package:flutter/material.dart';
import 'package:app_deborah/myglobal.dart' as global;
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'cronometro_jornada.dart';
import 'widgets/solicitacao_button_widget.dart';

class JornadaWidget extends StatefulWidget {
  const JornadaWidget({super.key});

  @override
  State<JornadaWidget> createState() => _JornadaWidgetState();
}

class _JornadaWidgetState extends State<JornadaWidget> {
  final DateTime _dataAtual = DateTime.now();

  late Timer timer;
  late String horaAtual;

  @override
  void initState() {
    super.initState();
    atualizarHora();
    timer = Timer.periodic(const Duration(seconds: 1), (_) => atualizarHora());
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void atualizarHora() {
    setState(() {
      horaAtual = DateFormat('HH:mm:ss').format(DateTime.now());
    });
  }

  bool jornadaIniciada = false; // change the screen

  @override
  Widget build(BuildContext context) {
    String dataFormatada = DateFormat('dd/MM/yyyy').format(_dataAtual);

    final altura = MediaQuery.of(context).size.height;
    final largura = MediaQuery.of(context).size.width;

    return jornadaIniciada == false
        ? Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                'Olá, ${global.primeiroNomeFormatado}! \u{1F44B}',
                style: const TextStyle(fontSize: 22),
              ),
              const SizedBox(height: 40),
              RichText(
                text: const TextSpan(
                  style: TextStyle(fontFamily: "Poppins"),
                  children: [
                    TextSpan(
                      text: 'Inicie sua jornada no\nbotão abaixo.',
                      style: TextStyle(fontSize: 22, color: Colors.black),
                    ),
                    TextSpan(
                      text: ' Tenha um\nexcelente dia!',
                      style: TextStyle(
                          fontSize: 22,
                          color: Color(0xff005aff),
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 70),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: largura * 0.4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset('assets/icons/calendar.svg',
                            height: 30),
                        const SizedBox(height: 10),
                        Text(
                          dataFormatada,
                          style: const TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: largura * 0.3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset('assets/icons/clock.svg', height: 30),
                        const SizedBox(height: 10),
                        Text(
                          horaAtual,
                          style: const TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 50),
              SizedBox(
                width: double.infinity,
                height: altura * 0.08,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff005aff),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      jornadaIniciada = true;
                    });
                  },
                  child: Row(
                    children: [
                      const SizedBox(width: 40),
                      SvgPicture.asset(
                        'assets/icons/biometria.svg',
                        color: const Color(0xffffffff),
                      ),
                      const SizedBox(width: 15),
                      const Text(
                        'Iniciar jornada',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const SolicitacaoButton(),
            ],
          )
        : const CronometroPage();
  }
}
