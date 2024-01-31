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
  bool isDarkMode = false;

  void toggleDarkMode() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

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
      appBar: AppBar(actions: [
            IconButton(icon: Icon(Icons.sunny), onPressed: widget.onThemeToggle,),
      ],),
      backgroundColor: isDarkMode ? Color.fromARGB(255, 54, 54, 54) : Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Cat Care',
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Color.fromARGB(255, 220, 220, 220) : Colors.black,
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
              style: ElevatedButton.styleFrom(
                primary: isDarkMode ? Color.fromARGB(255, 255, 255, 255) : Color.fromARGB(255, 200, 230, 255),
              ),
              child: Text('Get Started 😺'),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.2), // 20% margin
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: isDarkMode ? Colors.grey[800] : Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: IconButton(
                    onPressed: () => increaseFontSize(),
                    icon: Icon(Icons.add),
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                SizedBox(width: 8), // Add spacing between buttons
                Container(
                  decoration: BoxDecoration(
                    color: isDarkMode ? Colors.grey[800] : Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: IconButton(
                    onPressed: () => decreaseFontSize(),
                    icon: Icon(Icons.remove),
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  decoration: BoxDecoration(
                    color: isDarkMode ? Colors.grey[800] : Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: IconButton(
                    onPressed: () => toggleDarkMode(),
                    icon: Icon(Icons.brightness_4),
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
