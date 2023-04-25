import 'dart:async';
import 'package:app_deborah/pages_ponto_digital/widgets/finalizar_jornada_widget.dart';
import 'package:app_deborah/pages_ponto_digital/widgets/pausar_jornada_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:app_deborah/myglobal.dart' as global;
import '../class/classe_cronometro.dart';

class CronometroPage extends StatefulWidget {
  const CronometroPage({Key? key}) : super(key: key);

  @override
  State<CronometroPage> createState() => _CronometroPageState();
}

class _CronometroPageState extends State<CronometroPage> {
  final DateTime _dataAtual = DateTime.now();

  late String horaAtual;

  final now = DateTime.now();

  Cronometro cronometro = Cronometro();

  @override
  void initState() {
    super.initState();
    atualizarHora();
    // cronometro.iniciarCronometro();
    cronometro.timer =
        Timer.periodic(const Duration(seconds: 1), (_) => atualizarHora());
  }

  void atualizarHora() {
    setState(() {
      horaAtual = DateFormat('HH:mm:ss').format(DateTime.now());
    });
  }

  @override
  Widget build(BuildContext context) {
    final largura = MediaQuery.of(context).size.width;
    final altura = MediaQuery.of(context).size.height;

    String dataFormatada = DateFormat('dd/MM/yyyy').format(_dataAtual);

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Um dia produtivo e cheio de conquistas pra você, ${global.primeiroNomeFormatado}!',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18),
          ),
          Container(
            margin: const EdgeInsets.only(top: 12),
            decoration: const BoxDecoration(
              color: Color(0xfff1f6ff),
            ),
            height: altura * 0.17,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 41),
              child:
                  // aqui é onde o crônometro aparece na tela
                  Text(
                '${cronometro.horas.toString().padLeft(2, '0')}:'
                '${cronometro.minutos.toString().padLeft(2, '0')}:'
                '${cronometro.segundos.toString().padLeft(2, '0')}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xff005aff),
                  fontSize: 60,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Divider(thickness: 1, color: Color(0xffeeeeee)),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: largura * 0.4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset('assets/icons/calendar.svg', height: 30),
                    const SizedBox(height: 10),
                    Text(
                      dataFormatada,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Color(0xff696969),
                      ),
                    ),
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
                      style: const TextStyle(
                        fontSize: 20,
                        color: Color(0xff696969),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 28),
          const PausarJornada(),
          const SizedBox(height: 13),
          FinalizarJornada(onPress: () {}),
          const SizedBox(height: 42),
          const Text(
            'Histórico da jornada atual',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
          const Divider(thickness: 1, color: Color(0xffeeeeee)),
        ],
      ),
    );
  }
}
