import 'package:flutter/material.dart';
import 'launch_screen2.dart';
import 'package:mara_app/design/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:mara_app/design/colors.dart';

class ThankYouScreen extends StatefulWidget {
  const ThankYouScreen({Key? key}) : super(key: key);

  @override
  State<ThankYouScreen> createState() => _ThankYouScreenState();
}

class _ThankYouScreenState extends State<ThankYouScreen> {
  int languageIndex = 2; // similar indexing for language
  bool overrideIndex = false;

  @override
  void initState() {
    super.initState();
    _loadCurrentLanguage();
  }

  String _currentLanguage = 'English';

  Future<void> _loadCurrentLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _currentLanguage = prefs.getString('selectedLanguage') ?? 'English';
    });
    if (_currentLanguage.contains('English')) {
      languageIndex = 2;
    } else if (_currentLanguage.contains('Dholuo')) {
      languageIndex = 1;
    } else {
      languageIndex = 0;
    }
  }

  final double _aspectRatio = 16 / 10;
  final languages = ["Kiswahili", "Dholuo", "English"];

  final Map<String, Map<String, String>> _translations = {
    'English': {
      'thankYou': "Thank you for using Mara Divas app!",
      'button': "Start New Session",
    },
    'Dholuo': {
      'thankYou': "DL Thank you for using Mara Divas app!",
      'button': "DL Start New Session",
    },
    'Kiswahili': {
      'thankYou': "KS Thank you for using Mara Divas app!",
      'button': "KS Start New Session",
    },
  };

  String _t(String key) {
    return _translations[_currentLanguage]?[key] ?? key;
  }

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
      //   // title: Text('Thank You!'),
      // ),
      appBar: AppBar(
        automaticallyImplyLeading: false, 
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
              _t('thankYou'),
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
                _t('button'),
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
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.grey : null,
      ),
      child: Text(language),
    );
  }
}
