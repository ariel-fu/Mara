import 'dart:io';

import 'package:flutter/material.dart';
import 'package:excel/excel.dart';

class OldHomePage extends StatefulWidget {
  const OldHomePage({Key? key}) : super(key: key);

  @override
  State<OldHomePage> createState() => _OldHomePageState();
}

class _OldHomePageState extends State<OldHomePage> {
  int selectedButtonIndex = 0; // Default value
  bool overrideIndex = false;
  // List<String> languages = [""]
  final languages = ["Kiswahili", "Dholuo", "English"];

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    // Receive selectedButtonIndex as a route argument if available
    final int? routeArgumentIndex =
        ModalRoute.of(context)?.settings.arguments as int?;

    // Update selectedButtonIndex if a valid value is provided from the route
    if (routeArgumentIndex != null &&
        routeArgumentIndex >= 0 &&
        routeArgumentIndex < languages.length &&
        !overrideIndex) {
      selectedButtonIndex = routeArgumentIndex;
    }

    return Scaffold(
      appBar: AppBar(
        leading: Container(), // Remove the back arrow button
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Mara'), // Header with title "Mara"
            // Buttons with translations on the top right
            Row(
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      overrideIndex = true;
                      selectedButtonIndex = 0;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        selectedButtonIndex == 0 ? Colors.grey : null,
                  ),
                  child: Text(
                    languages[0],
                  ),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      overrideIndex = true;
                      selectedButtonIndex = 1;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        selectedButtonIndex == 1 ? Colors.grey : null,
                  ),
                  child: Text(
                    languages[1],
                  ),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      overrideIndex = true;
                      selectedButtonIndex = 2;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        selectedButtonIndex == 2 ? Colors.grey : null,
                  ),
                  child: Text(
                    languages[2],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            // Buttons without translations in the middle of the page
            const SizedBox(height: 80.0),
            ElevatedButton(
              child: const Text('What are my options?'),
              onPressed: () {
                // Navigator.of(context).pushReplacementNamed('/options');
                Navigator.of(context).pushNamed('/options', arguments: selectedButtonIndex);
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
                Navigator.of(context).pushNamed('/bleeding_pattern', arguments: selectedButtonIndex);  // shows the next page
              },
            ),
            const SizedBox(height: 12.0),
            ElevatedButton(
              child: const Text('How long will it last?'),
              onPressed: () {
                Navigator.of(context).pushNamed('/time', arguments: selectedButtonIndex);
              },
            ),
            const SizedBox(height: 12.0),
            ElevatedButton(
              child: const Text('What is my chance of getting pregnant?'),
              onPressed: () {
                Navigator.of(context).pushNamed('/time', arguments: selectedButtonIndex);
              },
            ),
            const SizedBox(height: 12.0),
            ElevatedButton(
              child: const Text('Can I keep it private?'),
              onPressed: () {
                Navigator.of(context).pushNamed('/private', arguments: selectedButtonIndex);
              },
            ),
            const SizedBox(height: 12.0),
            ElevatedButton(
              child: const Text('What if I am ready to have a baby?'),
              onPressed: () {
                Navigator.of(context).pushNamed('/preg_prep', arguments: selectedButtonIndex);
              },
            ),
            const SizedBox(height: 12.0),
            ElevatedButton(
              child: const Text('Quiz'),
              onPressed: () {
                Navigator.of(context).pushNamed('/quiz', arguments: selectedButtonIndex);
              },
            )
          ],
        ),
      ),
    );
  }
}
