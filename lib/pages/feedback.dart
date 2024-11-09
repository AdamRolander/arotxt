import 'package:flutter/material.dart';

class FeedbackPage extends StatelessWidget {
  const FeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Feedback Center"),
      ),
      body: const Center(
        child: Text("This is the Feedback section."),
      ),
    );
  }
}