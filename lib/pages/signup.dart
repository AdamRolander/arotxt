import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'Enter a Username'),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Choose a Password'),
              obscureText: false,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // For now, just navigate back to the login page after signing up
                Navigator.pop(context);
              },
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}