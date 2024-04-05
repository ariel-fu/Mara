
import 'package:flutter/material.dart';
import 'prep_preg.dart';
import 'video.dart';
import 'audio.dart';
import 'learn_more.dart';

class ReadyPage extends StatefulWidget {
  @override
  _ReadyPageState createState() => _ReadyPageState();
}

class _ReadyPageState extends State<ReadyPage> {
  String _currentLanguage = 'English';
  final List<String> languages = ["Kiswahili", "Dholuo", "English"];
  final Map<String, Map<String, String>> _translations = {
    'Family Planning Guide': {
      'Kiswahili': 'Mwongozo wa Mipango ya Familia',
      'Dholuo': 'Tim Mabeyo Mar Dhano Nyithindo',
      'English': 'Family Planning Guide',
    },
    'What if I\'m ready to have a baby?': {
      'Kiswahili': 'Kama niko tayari kupata mtoto?',
      'Dholuo': 'Ango nyithindo mabeyo manyalo wuonwa?',
      'English': 'What if I\'m ready to have a baby?',
    },
    // Add other translations as needed
  };

  final Map<String, Map<String, String>> _videos = {
    'assets': {
      'Kiswahili': 'videoAudio/videos/funnyCat.mp4',
      'Dholuo': 'videoAudio/videos/funnyCat2.mp4',
      'English': 'videoAudio/videos/chimes.mp4',
    },
    'titles': {
      'Kiswahili': 'Video: A Doctor Explains [KISWAHILI]',
      'Dholuo': 'Video: A Doctor Explains [DHOLUO]',
      'English': 'Video: A Doctor Explains [ENGLISH]',
    }
  };

  String _t(String key) {
    return _translations[key]?[_currentLanguage] ?? key;
  }

  String _getAsset() {
    return _videos['assets']?[_currentLanguage] ?? 'Asset not found';
  }

  String _getTitle() {
    return _videos['titles']?[_currentLanguage] ?? 'Title not found';
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
      child: ElevatedButton(
        onPressed: () => _changeLanguage(language),
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Colors.grey : null,
        ),
        child: Text(language),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {
            Navigator.of(context).pushNamed('/home');
          },
        ),
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
          SizedBox(
            width: 50,
            height: 120,
            child: VideoWidget(videoAsset: _getAsset(), title: _getTitle())
          ),

ListTile(
  leading: Icon(Icons.search),
  title: Text(_t('LEARN MORE about the fertility considerations of each method')),
  onTap: () {
    int languageIndex = languages.indexOf(_currentLanguage);
    Navigator.pushNamed(
      context,
      '/learnmore',
      arguments: languageIndex
    );
  },
),
// Navigator.pushNamed(
//   context,
//   '/learnmore',
//   arguments: languages.indexOf(_currentLanguage),
// );

          ListTile(
            leading: Icon(Icons.check_circle),
            title: Text(_t('Preparing for a healthy pregnancy')),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PrepPage(initialLanguage: _currentLanguage),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

