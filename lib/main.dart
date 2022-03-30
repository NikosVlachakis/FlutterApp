import 'package:flutter/material.dart';
import 'package:my_barber/home.dart';
import 'package:my_barber/login.dart';
import 'package:my_barber/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyBarber',
      initialRoute: '/loginRoute',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/loginRoute': (context) => const LoginScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/homeRoute': (context) => const MyHomePage(),
        '/profileRoute': (context) => const ProfileScreen(),
      },
    );
  }
}
