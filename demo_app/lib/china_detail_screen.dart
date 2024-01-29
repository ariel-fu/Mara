import 'package:flutter/material.dart';

class ChinaDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cats in China'),
      ),
      body: Center(
        child: Text(
          'More information about cats in China.',
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}
