import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'home.dart';

import 'package:mara_app/quiz_screen.dart';
import 'home2.dart';
import 'launch_screen2.dart';
import 'options_page.dart';
import 'pattern_page.dart';
import 'time_page.dart';
import 'private_page.dart';
import 'ready_to_have_baby.dart';
import 'learn_more.dart';
import 'package:mara_app/providers/provider_liked_methods.dart';


void main() {
  runApp(
    ChangeNotifierProvider<Likes>(
      create: (_) => Likes(),
      child: MaraApp()
    ),
  );
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
        '/home': (BuildContext context) => const HomePage2(), // home2 is the latest version
        '/options': (BuildContext context) => const OptionsPage(),
        '/bleeding_pattern': (BuildContext context) => const PatternPage(),
        '/time': (BuildContext context) => const TimePage(),
        '/private': (BuildContext context) => const PrivatePage(),
        '/ready_baby': (BuildContext context) => ReadyPage(),
        '/quiz': (BuildContext context) => QuizScreen(),
        '/learnmore': (BuildContext context) => const LearnMoreFertility(),
      },
      debugShowCheckedModeBanner: false,  // remove if install works
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
    );
  }
}
