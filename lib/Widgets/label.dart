import 'package:flutter/material.dart';

/*
TODO:
Font: ?
FontWeight: ?
FontSize: ?
*/

Widget label(String label) {
  return Padding(
    padding: const EdgeInsets.only(
      left: 20,
      top: 20,
      bottom: 10,
    ),
    child: Text(
      label,
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
