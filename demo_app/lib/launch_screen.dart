import 'package:flutter/material.dart';
import 'main.dart'; // Import your main.dart file

class LaunchScreen extends StatefulWidget {
  final VoidCallback onThemeToggle;
  const LaunchScreen({Key? key, required this.onThemeToggle});
  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  double fontSize = 24;

  void increaseFontSize() {
    setState(() {
      fontSize += 2;
    });
  }

  void decreaseFontSize() {
    setState(() {
      fontSize -= 2;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Cat Care',
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                );
              },
              child: Text('Get Started 😺'),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.2), // 20% margin
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: IconButton(
                    onPressed: () => increaseFontSize(),
                    icon: Icon(Icons.add),
                  ),
                ),
                SizedBox(width: 8), // Add spacing between buttons
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: IconButton(
                    onPressed: () => decreaseFontSize(),
                    icon: Icon(Icons.remove),
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.sunny), 
                    onPressed: widget.onThemeToggle,
                  ),
                ),
              ],
            ),
          ],
        ),
      )
    );
  }
}
