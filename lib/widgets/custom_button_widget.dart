import 'package:flutter/material.dart';
import 'package:practice/utils/colors.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const AppButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(20), // Adjust the radius as needed
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(color: colors.buttontextcolor),
      ),
    );
  }
}
