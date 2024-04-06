import 'package:flutter/material.dart';
import 'package:mara_app/home.dart';
import 'home.dart';
import 'home2.dart';
import 'launch_screen2.dart';
import 'options_page.dart';
import 'pattern_page.dart';
import 'time_page.dart';
import 'private_page.dart';
import 'ready_to_have_baby.dart';
import 'whatIfPregnant.dart';

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
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mara',
      initialRoute: '/launch',
      routes: {
        '/launch': (BuildContext context) => const LaunchScreen(),
        '/home': (BuildContext context) => const HomePage(), // replace with home2 for march 26 demo
        '/options': (BuildContext context) => const OptionsPage(),
        '/bleeding_pattern': (BuildContext context) => const PatternPage(),
        '/time': (BuildContext context) => const TimePage(),
        '/pregnant': (BuildContext context) => whatIfPreg(),
        '/private': (BuildContext context) => const PrivatePage(),
        '/ready_baby': (BuildContext context) => ReadyPage(),
      },
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
    );
  }
}
