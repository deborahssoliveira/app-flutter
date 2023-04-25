import 'package:flutter/material.dart';

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  const AppBarWidget({
    Key? key,
    required this.text,
    this.onPress,
    this.bottom,
  });

  final String text;
  final Function? onPress;
  final PreferredSizeWidget? bottom;

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0));
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () => widget.onPress!(),
        icon: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Color(0xff005aff),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      elevation: 0,
      bottom: widget.bottom,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
      ),
      title: Text(
        widget.text,
        style: TextStyle(color: Color(0xff363636), fontSize: 18),
      ),
      centerTitle: true,
    );
  }
}
