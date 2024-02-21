import 'package:flutter/material.dart';
// import 'home.dart';
import 'home.dart';
import 'launch_screen2.dart';
import 'options_page.dart';
import 'pattern_page.dart';
import 'time_page.dart';

void main() {
  runApp(MaraApp());
}

class MaraApp extends StatefulWidget {
  const MaraApp({super.key});

  @override
  State<MaraApp> createState() => _MaraAppState();
}

class _MaraAppState extends State<MaraApp> {
  bool _isDarkMode = false;

  // void _toggleTheme() {
  //   setState(() {
  //     _isDarkMode = !_isDarkMode;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mara',
      initialRoute: '/launch',
      routes: {
        '/launch': (BuildContext context) => const LaunchScreen(),
        '/': (BuildContext context) => const HomePage(),
        '/options': (BuildContext context) => const OptionsPage(),
        '/bleeding_pattern': (BuildContext context) => const PatternPage(),
        '/time': (BuildContext context) => const TimePage(),
      },
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
    );
  }
}
