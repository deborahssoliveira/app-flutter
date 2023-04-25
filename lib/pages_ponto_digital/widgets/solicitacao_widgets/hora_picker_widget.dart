import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

class HoraPicker extends StatefulWidget {
  const HoraPicker({super.key, this.onSaved});

  final Function(String?)? onSaved;

  @override
  State<HoraPicker> createState() => _HoraPickerState();
}

class _HoraPickerState extends State<HoraPicker> {
  DateTime _selectedTime = DateTime.now();
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final altura = MediaQuery.of(context).size.height;
    final largura = MediaQuery.of(context).size.width;

    return Container(
      height: altura * 0.1,
      width: largura * 0.4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hora:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          Material(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            shadowColor: Color(0xffeeeeee),
            elevation: 5,
            child: TextFormField(
              textAlign: TextAlign.center,
              readOnly: true,
              controller: _controller,
              onTap: () {
                DatePicker.showTimePicker(
                  context,
                  showSecondsColumn: false,
                  currentTime: _selectedTime,
                  onConfirm: (time) {
                    setState(() {
                      _selectedTime = time;
                      _controller.text = DateFormat('HH:mm').format(time);
                    });
                    widget.onSaved!(DateFormat('HH:mm').format(time));
                  },
                );
              },
              decoration: InputDecoration(
                hintText: '00:00',
                hintStyle: TextStyle(fontSize: 17),
                focusedBorder:
                    UnderlineInputBorder(borderSide: BorderSide.none),
                enabledBorder:
                    UnderlineInputBorder(borderSide: BorderSide.none),
                suffixIcon: Icon(Icons.schedule),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
