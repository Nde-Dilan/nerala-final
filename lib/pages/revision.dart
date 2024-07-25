import 'package:flutter/material.dart';

class Revision extends StatelessWidget {
  const Revision({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Revision'),
      ),
      body: const Center(
        child: Text(
          'Revision Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}