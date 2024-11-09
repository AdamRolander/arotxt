import 'package:flutter/material.dart';
import 'pages/login.dart';
import 'pages/home.dart';
import 'pages/signup.dart';
import 'pages/about.dart';
import 'pages/feedback.dart';

void main() {
  runApp(const AROTXT());
}

class AROTXT extends StatelessWidget {
  const AROTXT({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AROTXT',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/signup': (context) => SignupPage(),
        '/about': (context) => AboutPage(),
        '/feedback': (context) => FeedbackPage(),
      },
    );
  }
}
