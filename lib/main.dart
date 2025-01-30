import 'package:flutter/material.dart';
import 'package:immo/exportroute.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home_screen',
      routes: {
        '/': (context) => const LoginPage(),
        '/signup': (context) => SignUpPage(),
        '/changemotdepass': (context) => const ChangePasswordPage(),
        '/home_screen':(context) => const HomeScreen()
      },

    );
  }
}

