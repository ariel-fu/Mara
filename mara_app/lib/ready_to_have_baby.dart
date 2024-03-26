import 'package:flutter/material.dart';
import 'learn_more.dart';
import 'prep_preg.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String _currentLanguage = 'English';

  final Map<String, Map<String, String>> _translations = {
    'Family Planning Guide': {
      'Kiswahili': 'Mwongozo wa Mipango ya Familia',
      'Dholuo': 'Tim Mabeyo Mar Dhano Nyithindo',
      'English': 'Family Planning Guide',
    },
    'What if I\'m ready to have a baby?': {
      // Add translations
    },
    
  };

  String _t(String key) {
    return _translations[key]?[_currentLanguage] ?? key;
  }

  void _changeLanguage(String language) {
    setState(() {
      _currentLanguage = language;
    });
  }

    Widget customListTile({required String imagePath, required String header, required String title}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              header,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 16.0), // Increased height for more spacing
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                imagePath,
                width: 200, // Adjust width
                height: 200, // Adjust height
                fit: BoxFit.contain,
              ),
              SizedBox(width: 16.0),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.warning_amber_rounded, color: Colors.amber), // Attention icon
                    SizedBox(width: 8.0),
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(fontSize: 18.0), // Adjusted font size
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget languageButton(String language) {
    bool isSelected = _currentLanguage == language;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: OutlinedButton(
        onPressed: () => _changeLanguage(language),
        child: Text(language),
        style: OutlinedButton.styleFrom(
          backgroundColor: isSelected ? Colors.grey : Colors.white,
          foregroundColor: Colors.black,
          side: BorderSide(color: isSelected ? Colors.black : Colors.grey),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text(_t('Family Planning Guide')),
    ),
    body: ListView(
      children: [
        // Language selection buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: ['Kiswahili', 'Dholuo', 'English']
              .map((language) => languageButton(language))
              .toList(),
        ),
       
        customListTile(
          imagePath: 'assets/preg_woman.png',
          header: _t('What if I\'m ready to have a baby?'),
          title: _t('ATTENTION ALL YOUNG WOMEN: Using family planning methods will NOT change your ability to get pregnant in the future!'),
        ),
        
        ListTile(
          leading: Icon(Icons.play_circle_fill),
          title: Text(_t('Video - a doctor explains')),
          onTap: () {
            // Navigate to video playback screen
          },
        ),
        ListTile(
          leading: Icon(Icons.search),
          title: Text(_t('LEARN MORE about the fertility considerations of each method')),
          onTap: () {
            // Navigate to TemplatePage when this ListTile is tapped
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TemplatePage()),
            );
          },
        ),
        ListTile(
        leading: Icon(Icons.check_circle),
        title: Text(_t('Preparing for a healthy pregnancy')),
        onTap: () {
          Navigator.push(
          context,
          MaterialPageRoute(
          builder: (context) => MyHomePage(initialLanguage: _currentLanguage),
          ),
        );
        },
        ),
      ],
    ),
  );
}
}
