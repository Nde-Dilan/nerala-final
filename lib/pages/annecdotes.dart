import 'package:flutter/material.dart';

class Annecdotes extends StatelessWidget {
  const Annecdotes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Annecdotes'),
      ),
      body: const Center(
        child: Text(
          'Annecdotes Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}