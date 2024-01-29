import 'package:flutter/material.dart';

class BrazilDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cats in Brazil'),
      ),
      body: Center(
        child: Text(
          'More information about cats in Brazil.',
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}
