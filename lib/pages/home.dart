import 'package:flutter/material.dart';
import '../widgets/burger.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Placeholder(),
        ),
        title: Text('AROTXT Home'),
      ),
      endDrawer: const Burger(),
      body: SafeArea(
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