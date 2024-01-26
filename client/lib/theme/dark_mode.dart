import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
        background: Colors.black,
        primary: Colors.grey.shade800,
        secondary: Colors.deepPurple.shade700,
        inversePrimary: Colors.deepPurple.shade300),
    textTheme: ThemeData.dark().textTheme.apply(bodyColor: Colors.grey[300]),
    disabledColor: Colors.white);
