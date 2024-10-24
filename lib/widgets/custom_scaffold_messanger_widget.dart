import 'package:flutter/material.dart';

class Customscaffoldmessanger {
  static final GlobalKey<ScaffoldMessengerState> scaffoldmessangerkey =
      GlobalKey<ScaffoldMessengerState>();
  static showmessage(String message, {Color? color}) {
    scaffoldmessangerkey.currentState!.showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: color,
    ));
  }
}
