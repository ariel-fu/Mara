import 'package:flutter/material.dart';
import 'package:mara_app/participantID.dart';
import 'package:provider/provider.dart';
import 'package:permission_handler/permission_handler.dart';

// import 'home.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'thank_you.dart';
import 'package:mara_app/quiz_screen.dart';
import 'home2.dart';
import 'launch_screen2.dart';
import 'options_page.dart';
import 'pattern_page.dart';
import 'time_page.dart';
import 'private_page.dart';
import 'ready_to_have_baby.dart';

//import 'learn_more.dart';
import 'package:mara_app/design/colors.dart';
import 'package:mara_app/providers/provider_liked_methods.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'session_manager.dart';

Future<void> requestPermissions() async {
  // var status = await Permission.storage.status;
  // if (!status.isGranted) {
  //   await Permission.storage.request();
  // }

  // CHANGES: this is what is making app settings to open when the app first runs. User can then enable access to all files manually.
  final status = await Permission.manageExternalStorage.request();
  if (status.isDenied || status.isPermanentlyDenied || status.isRestricted) {
    print("Permission denied");

    // await openAppSettings();
  }
  print(status);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  await requestPermissions(); // Request storage permissions
  runApp(
    ChangeNotifierProvider<Likes>(
      create: (_) => Likes(),
      child: MaraApp(),
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
      initialRoute: '/participantID',
      routes: {
        '/launch': (BuildContext context) => const LaunchScreen(),
        '/home': (BuildContext context) => const HomePage2(),
        // home2 is the latest version
        '/options': (BuildContext context) => const OptionsPage(),
        '/bleeding_pattern': (BuildContext context) => const PatternPage(),
        '/time': (BuildContext context) => const TimePage(),
        '/private': (BuildContext context) => const PrivatePage(),
        '/ready_baby': (BuildContext context) => ReadyPage(),
        '/quiz': (BuildContext context) => QuizScreen(),
        //'/learnmore': (BuildContext context) => const LearnMoreFertility(),
        '/thank_you': (BuildContext context) => ThankYouScreen(),
        '/participantID': (BuildContext context) => ParticipantIDScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
