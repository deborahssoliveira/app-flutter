// ignore_for_file: unnecessary_null_comparison
import 'package:app_deborah/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:app_deborah/myglobal.dart' as global;
import 'controllers/controller_login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await tokenExist();
  runApp(const AppWidget());
}

tokenExist() async {
  final user = UserSecureStorage();
  var data = user.getToken();
  var token = await data;
  if (token == null) {
    global.token = "";
    global.user = {};
  } else {
    global.token = token;
    await buscarUser();
  }
}

buscarUser() async {
  final controller = UserSecureStorage();
  var data = controller.getUser();
  var user = await data;
  if (user != null) {
    global.user = user;
  } else {
    global.user = "";
  }
}
