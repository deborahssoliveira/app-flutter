import 'package:flutter/material.dart';
import 'package:app_deborah/myglobal.dart' as global;

class PausarJornada extends StatefulWidget {
  const PausarJornada({Key? key});

  @override
  State<PausarJornada> createState() => _PausarJornadaState();
}

void _salvarHoraPausa() {
  String horaAtual = DateTime.now().toString().split(' ')[1].split('.')[0];
  Map<String, String> hora = {"hora": horaAtual};
  global.batidasPonto.add(hora);
}

class _PausarJornadaState extends State<PausarJornada> {
  @override
  Widget build(BuildContext context) {
    final altura = MediaQuery.of(context).size.height;
    return SizedBox(
      width: double.infinity,
      height: altura * 0.07,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          backgroundColor: const Color(0xfff05e06),
        ),
        onPressed: () => opcoesPausa(context),
        child: const Text(
          'Pausar jornada',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  final List<String> _dropdownOptions = [
    '- - - - - - ',
    'Estou saindo para uma reunião',
    'Estou almoçando',
    'Outro motivo',
    "Médico",
  ];

  String? _selectedOption = '- - - - - - ';

  void opcoesPausa(context) {
    final altura = MediaQuery.of(context).size.height;
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      builder: (BuildContext context) {
        return SizedBox(
          height: altura * 0.62,
          child: Padding(
            padding: const EdgeInsets.only(top: 16, left: 24, right: 24),
            child: Column(
              children: [
                const Divider(
                  thickness: 6,
                  indent: 120,
                  endIndent: 120,
                  color: Color(0xffebebeb),
                ),
                const SizedBox(height: 24),
                const ListTile(
                  title: Text(
                    'Precisa fazer\numa pausa?',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'Selecione uma das opções abaixo para continuar',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: Color(0xff696969)),
                  ),
                ),
                const SizedBox(height: 32),
                Container(
                  height: altura * 0.075,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: const Color(0xffeeeeee))),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 10, left: 16, right: 16, bottom: 13),
                    child: DropdownButton<String>(
                      isDense: true,
                      isExpanded: true,
                      iconSize: 45,
                      iconEnabledColor: Colors.black,
                      value: _selectedOption,
                      onChanged: (value) {
                        setState(() {
                          _selectedOption = value;
                        });
                      },
                      underline: const SizedBox(),
                      items: _dropdownOptions.map(
                        (option) {
                          return DropdownMenuItem<String>(
                            value: option,
                            child: Text(
                              option,
                              style: const TextStyle(fontSize: 20),
                            ),
                          );
                        },
                      ).toList(),
                    ),
                  ),
                ),
                const SizedBox(height: 45),
                SizedBox(
                  width: double.infinity,
                  height: altura * 0.07,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: const Color(0xfff05e06),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                    ),
                    onPressed: () {
                      _salvarHoraPausa();
                    },
                    child: const Text(
                      'Confirmar pausa',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Cancelar',
                    style: TextStyle(color: Color(0xff696969), fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
