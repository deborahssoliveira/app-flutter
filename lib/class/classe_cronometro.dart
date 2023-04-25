import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class Cronometro {
  int segundos = 0;
  int minutos = 0;
  int horas = 0;
  Timer? timer;

  Cronometro() {
    carregarEstado();
  }

  Future<void> salvarEstado() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setInt('horas', horas);
  await prefs.setInt('minutos', minutos);
  await prefs.setInt('segundos', segundos);
}

Future<void> carregarEstado() async {
  final prefs = await SharedPreferences.getInstance();
  horas = prefs.getInt('horas') ?? 0;
  minutos = prefs.getInt('minutos') ?? 0;
  segundos = prefs.getInt('segundos') ?? 0;
}



  void iniciarCronometro() {
    timer ??= Timer.periodic(const Duration(seconds: 1), (Timer t) {
      segundos++;
      if (segundos == 60) {
        segundos = 0;
        minutos++;
      }
      if (minutos == 60) {
        minutos = 0;
        horas++;
      }
      salvarEstado();
    });
  }
}
