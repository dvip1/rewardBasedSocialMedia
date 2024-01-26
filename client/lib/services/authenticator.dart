import 'package:client/pages/base.dart';
import 'package:client/pages/homepage.dart';
import 'package:client/pages/signin_page.dart';
import 'package:client/services/shared_pref.dart';
import 'package:flutter/material.dart';

class Authenticator extends StatelessWidget {
  const Authenticator({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: SharedPref.getToken(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          Center(
            child: Text(snapshot.error.toString()),
          );
        } else if (snapshot.data != null) {
          return const Wrapper();
        }
        return const SignInPage();
      },
    );
  }
}
