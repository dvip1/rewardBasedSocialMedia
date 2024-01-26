import 'package:client/pages/base.dart';

// import 'package:client/theme/dark_mode.dart';
// import 'package:client/theme/light_mode.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        // theme: lightTheme,
        // darkTheme: darkTheme,
        home: Wrapper());
  }
}
