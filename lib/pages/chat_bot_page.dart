import 'package:flutter/material.dart';

class Chatbot extends StatelessWidget {
  const Chatbot({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chatbot'),
      ),
      body: const Center(
        child: Text(
          'Chatbot Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}