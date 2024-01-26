import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
        background: Colors.grey.shade300,
        primary: Colors.grey.shade200,
        secondary: Colors.amber.shade400,
        inversePrimary: Colors.amber.shade600),
    textTheme: ThemeData.light().textTheme.apply(bodyColor: Colors.grey[800]),
    disabledColor: Colors.black);
