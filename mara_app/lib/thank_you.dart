import 'package:flutter/material.dart';
import 'launch_screen2.dart';
import 'package:mara_app/design/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mara_app/design/colors.dart';

class ThankYouScreen extends StatefulWidget {
  const ThankYouScreen({Key? key}) : super(key: key);

  @override
  State<ThankYouScreen> createState() => _ThankYouScreenState();
}

class _ThankYouScreenState extends State<ThankYouScreen> {
  bool overrideIndex = false;

// class ThankYouScreen extends StatelessWidget {
  int languageIndex = 2;
  final languages = ["Kiswahili", "Dholuo", "English"];

  String _currentLanguage = 'English';
  @override
  void initState() {
    super.initState();
    _loadCurrentLanguage();
  }

  Future<void> _loadCurrentLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _currentLanguage = prefs.getString('selectedLanguage') ?? 'English';
    });
    if (_currentLanguage.contains('English')) {
      languageIndex= 2;
    } else if (_currentLanguage.contains('Dholuo')) {
      languageIndex = 1;
    } else {
      languageIndex = 0;
    }
  }

  final Map<String, String> titleTranslations = {
    "English": "Thank you for using Mara Divas app!", 
    "Kiswahili": "ks", 
    "Dholuo": "dl"
  };

  final Map<String, String> buttonTranslations = {
    "English": "Start New Session", 
    "Kiswahili": "ks", 
    "Dholuo": "dl"
  };

  @override
  Widget build(BuildContext context) {
    _loadCurrentLanguage();
    final double containerWidth = MediaQuery.of(context).size.width;
    final double containerHeight = MediaQuery.of(context).size.height;
    double boxWidth = containerWidth;
    double boxHeight = containerHeight;
    double availableHeight = boxHeight;

    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false, // Remove the back button
      //   title: Text('Thank You!'),
      // ),
      appBar: AppBar(
        centerTitle: true,
        title: PreferredSize(
          preferredSize: Size.fromHeight(availableHeight * 0.05),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                languageButton('Kiswahili', 0),
                SizedBox(width: 40),
                languageButton('Dholuo', 1),
                SizedBox(width: 40),
                languageButton('English', 2),
              ],
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              titleTranslations[languages[languageIndex]] ?? "Title not found",
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil('/launch', (Route<dynamic> route) => false);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: MaraColors.magentaPurple,
              ),
              child: Text(
                buttonTranslations[languages[languageIndex]] ?? "Title not found",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _switchLanguage(int language) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String temp;
    if (language == 0) {
      temp = 'Kiswahili';
    } else if (language == 1) {
      temp = 'Dholuo';
    } else {
      temp = 'English';
    }
    await prefs.setString('selectedLanguage', temp);
    setState(() {
      languageIndex = language;
    });
  }

  Widget languageButton(String language, int index) {
    bool isSelected = languages[languageIndex] == language;

    return ElevatedButton(
      onPressed: () {
        _switchLanguage(index);
        setState(() {
          languageIndex = index;
          overrideIndex = true;
          //updateMethodContent();
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.grey : null,
      ),
      child: Text(language),
    );
  }
}
