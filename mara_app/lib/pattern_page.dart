import 'package:flutter/material.dart';

class PatternPage extends StatelessWidget {
  const PatternPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Bleeding Pattern')
      ),
      body: Center(
        child: Text(
          'Bleeding Pattern Page',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}