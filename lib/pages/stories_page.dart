import 'package:flutter/material.dart';

class Stories extends StatelessWidget {
  const Stories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stories'),
      ),
      body: const Center(
        child: Text(
          'Stories Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}