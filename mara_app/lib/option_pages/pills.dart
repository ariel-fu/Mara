import 'package:flutter/material.dart';

class PillInfo extends StatelessWidget {
  const PillInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          // TODO - change icons
          icon: const Icon(Icons.home),
          onPressed: () {
            /* TODO - add navigation directly to options_page
             and hide the dialogue */
            Navigator.of(context).popUntil(ModalRoute.withName('/options'));
          },
        ),
        title: Text('Pills Page')
      ),
      body: Center(
        child: Text(
          'Pill Details Page',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}