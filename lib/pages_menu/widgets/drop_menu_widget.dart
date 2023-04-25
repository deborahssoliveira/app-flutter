import 'package:flutter/material.dart';
import '../../controllers/controller_login.dart';
import '../../pages_login/login_page.dart';
import '../../pages_perfil/profile_page.dart';

class DropMenuWidget extends StatelessWidget {
  final Color? color;

  const DropMenuWidget({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Icon(
        Icons.more_vert,
        color: color ?? const Color(0xff005aff),
      ),
      onSelected: (item) => onSelected(context, item),
      itemBuilder: (context) => [
        PopupMenuItem<int>(
          value: 1,
          child: Row(
            children: const [
              Icon(Icons.account_box_outlined, color: Colors.black),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Perfil"),
              ),
            ],
          ),
        ),
        PopupMenuItem<int>(
          value: 2,
          child: Row(
            children: const [
              Icon(Icons.logout, color: Colors.black),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Sair"),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 1:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ProfilePage()));
        break;
      case 2:
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Sair do aplicativo"),
            content: const Text("Tem certeza que deseja sair?"),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancelar"),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff005aff)),
                onPressed: () {
                  final controller = UserSecureStorage();
                  controller.signOut();
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const HomePage()),
                    (Route<dynamic> route) => false,
                  );
                },
                child: const Text("Sair"),
              ),
            ],
          ),
        );
        break;
    }
  }
}
