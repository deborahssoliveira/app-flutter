// ignore_for_file: must_be_immutable
import 'package:camera_camera/camera_camera.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:flutter/material.dart';

import 'preview_camera_page.dart';

class CameraWidget extends StatefulWidget {
   CameraWidget({
    Key? key,
    required this.imagem,
    required this.value,
  }) : super(key: key);

  
  final bool? value;
  File? imagem;
  
  @override
  State<CameraWidget> createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget> {


  showPreview(file, foto) async {
    file = await Get.to(() => PreviewPage(file: file));

    if (file != null) {
      if (foto == 1) setState(() => widget.imagem = file);
      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: widget.value != null
          ? const Icon(Icons.camera_alt_rounded)
          : const Icon(Icons.camera_alt_rounded, color: Color.fromARGB(255, 171, 170, 170)),
      onPressed: () => {
        if (widget.value != null)
          {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      CameraCamera(onFile: (file) => showPreview(file, 1))),
            ),
          }
      },
    );
  }
}
