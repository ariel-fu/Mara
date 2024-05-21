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
import 'package:mara_app/design/colors.dart';
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

// based on MDC 104 tutorial
final ThemeData _maraTheme = _buildMaraTheme();

ThemeData _buildMaraTheme() {
  final ThemeData base = ThemeData.light(useMaterial3: true,);
  return base.copyWith(
    iconTheme: const IconThemeData(color: MaraColors.magentaPurple),
    // colorScheme: base.colorScheme.copyWith(
    //   primary: kShrinePink100,
    //   onPrimary: kShrineBrown900,
    //   secondary: kShrineBrown900,
    //   error: kShrineErrorRed,
    // ),
    textTheme: _buildMaraTextTheme(base.textTheme),
    // textSelectionTheme: const TextSelectionThemeData(
    //   selectionColor: kShrinePink100,
    // ),
    // appBarTheme: const AppBarTheme(
    //   foregroundColor: kShrineBrown900,
    //   backgroundColor: kShrinePink100,
    // ),
    // inputDecorationTheme: const InputDecorationTheme(
    //   border: CutCornersBorder(),
    //   focusedBorder: CutCornersBorder(
    //     borderSide: BorderSide(
    //       width: 2.0,
    //       color: kShrineBrown900,
    //     ),
    //   ),
    //   floatingLabelStyle: TextStyle(
    //     color: kShrineBrown900,
    //   ),
    // ),
  );
}

TextTheme _buildMaraTextTheme(TextTheme base) {
  return base
      .copyWith(
        headlineSmall: base.headlineSmall!.copyWith(
          fontWeight: FontWeight.w500,
        ),
        titleLarge: base.titleLarge!.copyWith(
          fontSize: 18.0,
        ),
        // bodySmall: base.bodySmall!.copyWith(
        //   fontWeight: FontWeight.w400,
        //   fontSize: 14.0,
        // ),
        // bodyLarge: base.bodyLarge!.copyWith(
        //   fontWeight: FontWeight.w500,
        //   fontSize: 16.0,
        // ),
      )
      .apply(
        fontFamily: 'PoetsenOne',
        displayColor: MaraColors.purple,
        // bodyColor: kShrineBrown900,
      );
}

