import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import '../pages_login/widgets/appbar_widget.dart';
import 'widgets/widgets_calendar/events.dart';

class CalendarioGestor extends StatefulWidget {
  const CalendarioGestor({super.key});

  @override
  State<CalendarioGestor> createState() => _CalendarioGestorState();
}

class _CalendarioGestorState extends State<CalendarioGestor> {
  final TextEditingController _eventController = TextEditingController();

  late Map<DateTime, List<Event>> selectedEvents;

  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  @override
  void initState() {
    selectedEvents = {};
    super.initState();
  }

  List<Event> _getEventsfromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  @override
  void dispose() {
    _eventController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        text: 'Ponto online',
        onPress: () {
          Navigator.of(context).pushNamed('/pontogestor');
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 22, right: 22, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                children: [
                  TableCalendar(
                    focusedDay: selectedDay,
                    firstDay: DateTime(1990),
                    lastDay: DateTime(2050),
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    onDaySelected: (DateTime selectDay, focusDay) {
                      setState(
                        () {
                          selectedDay = selectDay;
                          focusedDay = focusDay;
                        },
                      );
                    },
                    selectedDayPredicate: (DateTime date) {
                      return isSameDay(selectedDay, date);
                    },
                    eventLoader: _getEventsfromDay,
                    locale: 'pt_BR',
                    rowHeight: 65,
                    calendarStyle: CalendarStyle(
                      isTodayHighlighted: true,
                      selectedDecoration: BoxDecoration(
                          color: Colors.blue, shape: BoxShape.circle),
                      selectedTextStyle:
                          TextStyle(color: Colors.white, fontSize: 16),
                      todayDecoration: BoxDecoration(
                          color: Color(0xffF05E06), shape: BoxShape.circle),
                    ),
                    headerStyle: HeaderStyle(
                      titleTextFormatter: _formatMonthYear,
                      formatButtonVisible: false,
                      titleCentered: true,
                      titleTextStyle: TextStyle(fontSize: 19),
                    ),
                  ),
                  ..._getEventsfromDay(selectedDay).map(
                    (Event event) => ListTile(
                      title: Text(event.title),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              FloatingActionButton.extended(
                backgroundColor: Color(0xff005aff),
                onPressed: () => showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Adicionar evento'),
                    content: TextFormField(controller: _eventController),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('Cancelar'),
                      ),
                      TextButton(
                        onPressed: () {
                          if (_eventController.text.isEmpty) {
                          } else {
                            if (selectedEvents[selectedDay] != null) {
                              selectedEvents[selectedDay]
                                  ?.add(Event(title: _eventController.text));
                            } else {
                              selectedEvents[selectedDay] = [
                                Event(title: _eventController.text)
                              ];
                            }
                          }
                          Navigator.pop(context);
                          _eventController.clear();
                          setState(() {});
                          return;
                        },
                        child: Text('Ok'),
                      ),
                    ],
                  ),
                ),
                label: Text(
                  'Evento',
                  style: TextStyle(fontSize: 17),
                ),
                icon: Icon(Icons.add),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatMonthYear(DateTime date, dynamic context) {
    final month = DateFormat.yMMMM('pt_BR').format(date);
    return month.toUpperCase();
  }
}
