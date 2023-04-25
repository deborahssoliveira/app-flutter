// ignore_for_file: unused_field
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

class ContasBotao extends StatefulWidget {
  const ContasBotao({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  State<ContasBotao> createState() => _ContasBotaoState();
}

class _ContasBotaoState extends State<ContasBotao> {
  List<File> _selectedFiles = [];
  bool _exclusaoHabilitada = false;
  List<int> _selectedIndexes = [];

  @override
  Widget build(BuildContext context) {
    final altura = MediaQuery.of(context).size.height;

    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: const Color(0xfff2efef),
        alignment: Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: SvgPicture.asset(
            "assets/icons/Lixeira.svg",
            height: 20,
          ),
        ),
      ),
      direction: DismissDirection.endToStart,
      resizeDuration: null,
      dismissThresholds: const {DismissDirection.endToStart: 0.5},
      onDismissed: (direction) => _abrirModal(direction),
      child: SizedBox(
        height: altura * 0.075,
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xffffeee4),
            elevation: 0,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12))),
          ),
          onPressed: () {
            _showPicker(context);
          },
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.text,
                    style: const TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  SvgPicture.asset('assets/icons/upload.svg'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showPicker(context) {
    final altura = MediaQuery.of(context).size.height;
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      )),
      builder: (BuildContext context) {
        return SizedBox(
          height: altura * 0.3,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            child: Column(
              children: <Widget>[
                const Icon(Icons.drag_handle, size: 30),
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  decoration: const BoxDecoration(
                      color: Color(0xfff5f5f5),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: ListTile(
                    title: const Text(
                      'Tirar foto',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    onTap: _getCamera,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  decoration: const BoxDecoration(
                      color: Color(0xfff5f5f5),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: ListTile(
                    title: const Text(
                      'Procurar arquivos',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    onTap: _getGaleria,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _abrirModal(DismissDirection direction) {
    final altura = MediaQuery.of(context).size.height;
    if (direction == DismissDirection.endToStart) {
      showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        )),
        builder: (BuildContext context) {
          return SizedBox(
            height: altura * 0.7,
            child: Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: _selectedFiles.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8),
                    itemBuilder: (context, index) {
                      bool _isSelected = false;
                      if (_selectedIndexes.contains(index)) {
                        _isSelected = true;
                      }
                      return Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _isSelected = !_isSelected;
                                if (_isSelected) {
                                  _selectedIndexes.add(index);
                                } else {
                                  _selectedIndexes.remove(index);
                                }
                                _exclusaoHabilitada =
                                    _selectedIndexes.isNotEmpty;
                              });
                            },
                            child: Image.file(_selectedFiles[index],
                                fit: BoxFit.cover),
                          ),
                          if (_isSelected)
                            Positioned(
                              top: 8,
                              right: 8,
                              child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color.fromARGB(255, 0, 0, 0)),
                                child: Icon(Icons.circle,
                                    size: 20, color: Colors.black),
                              ),
                            ),
                        ],
                      );
                    },
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff005aff),
                  ),
                  onPressed: _exclusaoHabilitada
                      ? () {
                          setState(() {
                            for (int i = _selectedIndexes.length - 1;
                                i >= 0;
                                i--) {
                              _selectedFiles.removeAt(_selectedIndexes[i]);
                            }
                            _selectedIndexes.clear();
                            _exclusaoHabilitada = false;
                          });
                          Navigator.of(context).pop();
                        }
                      : null,
                  child: const Text('Excluir'),
                ),
              ],
            ),
          );
        },
      );
    }
  }

  File? _image;
  File? _documento;

  void _getCamera() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _selectedFiles.add(File(pickedFile.path));
      });
    }
    Navigator.pop(context);
  }

  void _getGaleria() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );
    if (result != null) {
      setState(() {
        _selectedFiles.addAll(result.paths.map((path) => File(path!)));
      });
    }
    Navigator.pop(context);
  }
}
