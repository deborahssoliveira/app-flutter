import 'package:flutter/material.dart';
import '../pages_login/widgets/appbar_widget.dart';
import 'historico_page.dart';
import 'jornada_inicio_page.dart';

class PontoPages extends StatefulWidget {
  const PontoPages({super.key});

  @override
  State<PontoPages> createState() => _PontoPagesState();
}

class _PontoPagesState extends State<PontoPages> {
  final List<Widget> _children = const [
    JornadaWidget(),
    HistoricoWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _children.length,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBarWidget(
          text: "Ponto online",
          onPress: () {
            Navigator.of(context).pushNamed('/menu');
          },
          bottom: const TabBar(
            labelColor: Color(0xff005aff),
            unselectedLabelColor: Colors.grey,
            labelStyle: TextStyle(fontSize: 19),
            tabs: [
              Tab(text: 'Minha jornada'),
              Tab(text: 'Histórico'),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
          child: TabBarView(
            children: _children,
          ),
        ),
      ),
    );
  }
}
