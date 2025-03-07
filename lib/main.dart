import 'package:flutter/material.dart';
import 'package:immo/changeMotDePass.dart';
import 'package:immo/signIn.dart';

import 'signUpPage.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/signup': (context) => SignUpPage(),
        '/changemotdepass': (context) => ChangePasswordPage(),
      },

    );
  }
}

