// ignore_for_file: unused_field

import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class UploadArquivos extends StatefulWidget {
  const UploadArquivos({super.key});

  @override
  State<UploadArquivos> createState() => _UploadArquivosState();
}

class _UploadArquivosState extends State<UploadArquivos> {
  Color _buttonColor = Color(0xffcacaca);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 200,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: _buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
        onPressed: () => _getGaleria(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.attach_file),
            Text(
              'Upload arquivos',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  File? _documento;
  Future<void> _getGaleria() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowMultiple: false,
    );
    if (result != null) {
      setState(() {
        _documento = File(result.files.single.path!);
        _buttonColor = Colors.green;
      });
    }
  }
}
