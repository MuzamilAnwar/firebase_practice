import 'package:flutter/material.dart';
import 'package:practice/utils/colors.dart';

// ignore: must_be_immutable
class Customappbarwidget extends StatelessWidget
    implements PreferredSizeWidget {
  String text = '';
  Color bgcolore;
  List<Widget>? actions;
  Customappbarwidget({super.key, required this.text, required this.bgcolore});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: bgcolore,
      title: Text(
        text,
        style: const TextStyle(color: colors.appbartextcolor),
      ),
      actions: actions,
    );
  }
}
