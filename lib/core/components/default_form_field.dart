import 'package:flutter/material.dart';

Widget defaultFormField({
  required TextEditingController controller,
  TextInputType? type,
  required String validationText,
  Color? color,
  required String label,
  required IconData icon,
}) {
  return TextFormField(
    controller: controller,
    keyboardType: type,
    validator: (value) {
      if (value!.isEmpty) {
        return validationText;
      }
      return null;
    },
    decoration: InputDecoration(
      label: Text(
        label,
        style: TextStyle(
          color: color ?? Colors.redAccent,
        ),
      ),
      prefixIcon: Icon(
        icon,
        color: color ?? Colors.redAccent,
      ),
      prefixIconColor: Colors.redAccent,
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: color ?? Colors.redAccent,
          width: 10.0,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(5.0),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: color ?? Colors.redAccent,
          width: 1.0,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(5.0),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: color ?? Colors.redAccent,
          width: 1.0,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(5.0),
        ),
      ),
    ),
  );
}
