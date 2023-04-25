import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'controllers/controller_login.dart';
import 'routes/app_pages.dart';
import 'routes/app_routes.dart';

final user = UserSecureStorage();

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  var token = user.getToken();

  Locale myLocale = const Locale('pt', 'BR');

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: myLocale,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
         Locale('pt', 'BR'),
      ],
      theme: myTheme,
      debugShowCheckedModeBanner: false,
      title: 'SGM Mobile',
      initialRoute: AppRoutes.LOGIN,
      getPages: AppPages.routes.toList(),
    );
  }

  final myTheme = ThemeData(fontFamily: "Poppins");
}
