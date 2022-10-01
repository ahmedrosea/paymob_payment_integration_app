import 'package:flutter/material.dart';

Widget defaultButton({
  required String text,
  required VoidCallback function,
  required Color textColor,
  required Color buttonColor,
  required double buttonHeight,
  required double fontSize,
}) {
  return MaterialButton(
    onPressed: function,
    color: buttonColor,
    minWidth: double.infinity,
    height: buttonHeight,
    child: Text(
      text,
      style: TextStyle(
        color: textColor,
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
