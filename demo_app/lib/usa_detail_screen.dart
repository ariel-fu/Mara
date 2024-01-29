import 'package:flutter/material.dart';

class USADetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cats in USA'),
      ),
      body: Center(
        child: Text(
          'More information about cats in USA.',
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}
