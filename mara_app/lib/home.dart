import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Mara')),
      // body: Center(
      //   child: Text('..'),
      // ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            const SizedBox(height: 80.0),
            ElevatedButton(
              child: const Text('What are my options?'),
              onPressed: () {
                // Navigator.of(context).pushReplacementNamed('/options');
                Navigator.of(context).pushNamed('/options');
                // Navigator.pop(context);  // shows the next page
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                disabledForegroundColor: Colors.grey,
              ),
            ),
            const SizedBox(height: 12.0),
            ElevatedButton(
              child: const Text('What will happen to my period?'),
              onPressed: () {
                Navigator.of(context).pushNamed('/bleeding_pattern');  // shows the next page
              },
            ),
            const SizedBox(height: 12.0),
            ElevatedButton(
              child: const Text('How long will it last?'),
              onPressed: () {
                Navigator.of(context).pushNamed('/time');
              },
            ),
            const SizedBox(height: 12.0),
            ElevatedButton(
              child: const Text('What is my chance of getting pregnant?'),
              onPressed: () {
                Navigator.of(context).pushNamed('/time');
              },
            ),
            const SizedBox(height: 12.0),
            ElevatedButton(
              child: const Text('Can I keep it private?'),
              onPressed: () {
                Navigator.of(context).pushNamed('/time');
              },
            ),
            const SizedBox(height: 12.0),
            ElevatedButton(
              child: const Text('What if I am ready to have a baby?'),
              onPressed: () {
                Navigator.of(context).pushNamed('/time');
              },
            ),
          ],
        ),
      ),
    );
  }
}
