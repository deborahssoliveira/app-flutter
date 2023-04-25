// ignore_for_file: unused_field
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:app_deborah/myglobal.dart' as global;

import '../pages_login/widgets/appbar_widget.dart';
import '../pages_menu/menu_pages.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final altura = MediaQuery.of(context).size.height;
    final largura = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBarWidget(
          text: 'Editar perfil',
          onPress: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => MenuPage()));
          }),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Stack(
                children: [
                  Container(
                    height: altura * 0.2,
                    width: largura * 0.35,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 206, 206, 206)),
                    child: Center(
                      child: _image == null
                          ? const Text(
                              'Nenhuma imagem\nselecionada',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 15),
                            )
                          : CircleAvatar(
                              backgroundImage: FileImage(_image!), radius: 200),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: altura * 0.05,
                      width: largura * 0.09,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 4, color: Colors.white),
                          color: Colors.blue),
                      child: InkWell(
                        onTap: () {
                          _showPicker(context);
                        },
                        child: const Icon(Icons.edit, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: Text(
                global.nomeComSobrenome,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                color: const Color(0xffeeeeee),
                child: const Text(
                  'Informações do perfil',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 112, 109, 109),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  ListTile(
                    title: const Text('Cargo:',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Seu cargo de atuação na Medeiros'),
                        const SizedBox(height: 10),
                        Text(
                          '${global.user.funcao}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: const BoxDecoration(color: Color(0xffeeeeee)),
                    child: ListTile(
                      title: const Text(
                        'Nome:',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Será exibido apenas no SGM.'),
                          const SizedBox(height: 10),
                          Text(
                            global.nomeComSobrenome,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ListTile(
                    title: const Text(
                      'Email:',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Altere seu email.'),
                        const SizedBox(height: 10),
                        Text(
                          '${global.user.email}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: const BoxDecoration(color: Color(0xffeeeeee)),
                    child: ListTile(
                      title: const Text(
                        'Senha:',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Altere sua senha.'),
                          SizedBox(height: 10),
                          Text(
                            '*****',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
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
          topRight: Radius.circular(20)
        )
      ),
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
                    borderRadius: BorderRadius.all(
                      Radius.circular(12)
                    )
                  ),
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
                    borderRadius: BorderRadius.all(
                      Radius.circular(12)
                    )
                  ),
                  child: ListTile(
                    title: const Text(
                      'Procurar arquivos',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
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

  File? _image;
  File? _documento;

  Future<void> _getCamera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  Future<void> _getGaleria() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowMultiple: false,
    );
    if (result != null) {
      setState(() {
        _documento = File(result.files.single.path!);
      });
    }
  }
}
