import 'package:flutter/material.dart';
import '../widgets/burger.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Placeholder(),
        ),
        title: const Text('AROTXT Home'),
      ),
      endDrawer: const Burger(),
      body: const SafeArea(
        child: Center(
          child: Text(
            'Welcome to the Home Page!',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}