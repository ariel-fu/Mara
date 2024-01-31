import 'package:flutter/material.dart';

class FranceDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cats in France'),
      ),
      body: Center(
        child: Text(
          'More information about cats in France.',
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}
