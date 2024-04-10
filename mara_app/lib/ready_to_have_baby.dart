
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
    'HEY! THIS IS IMPORTANT! Male and female condoms are the ONLY family planning methods that also prevent HIV and other STIs!': {
      'Kiswahili': 'Hey! HII NI MUHIMU! Kondomu za kiume na za kike ndizo njia PEKEE za kupanga uzazi ambazo pia huzuia Virusi Vya Ukimwi na magonjwa mengine ya zinaa!', 
      'Dholuo': 'HEY! MA EN GIMA BER NG\'EYO! Rabo yunga mar chuo gi mine e yore komo nyuol KENDE ma bende geng\'o kute mag ayaki kod nyae mamoko!', 
      'English': 'HEY! THIS IS IMPORTANT! Male and female condoms are the ONLY family planning methods that also prevent HIV and other STIs!'
    }

  };

  final Map<String, Map<String, String>> _videos = {
    'assets': {
      'Kiswahili': 'videoAudio/videos/provider/provider4KS.mp4',
      'Dholuo': 'videoAudio/videos/provider/provider4DL.mp4',
      'English': 'videoAudio/videos/provider/provider4E.mp4',
    },
    'titles': {
      'Kiswahili': 'Video - Daktari Aeleza',
      'Dholuo': 'Vidio - Laktar Wuoyo',
      'English': 'Video: A Doctor Explains',
    }
  };

  final double _aspectRatio = 16 / 10;

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
                  //   Image.asset(
                  //   // 'assets/exclamation.png', // Path to your custom icon
                  //   Icon(Icons.warning_amber_rounded, color: Colors.amber),
                  //   width: 24, // Adjust size as needed
                  //   height: 24, // Adjust size as needed
                  //    // You can adjust the color if needed
                  // ),
                  Icon(Icons.warning_amber_rounded, color: Colors.amber),
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

  double containerWidth = MediaQuery.of(context).size.width;
  double containerHeight = MediaQuery.of(context).size.height;
  if (containerHeight / containerWidth > _aspectRatio) {
    containerHeight = containerWidth * _aspectRatio;
  } else {
    containerWidth = containerHeight / _aspectRatio;
  }

  double boxWidth = containerWidth;
  double boxHeight = containerHeight;

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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: ['Kiswahili', 'Dholuo', 'English']
                .map((language) => languageButton(language))
                .toList(),
          ),
          customListTile(
            imagePath: 'assets/preg_woman_new.png',
            header: _t('What if I\'m ready to have a baby?'),
            title: _t('HEY! THIS IS IMPORTANT! Male and female condoms are the ONLY family planning methods that also prevent HIV and other STIs!'),
          ),

          SizedBox(width:boxWidth, height:boxHeight * 0.5 * 0.6, child: VideoWidget(videoAsset: _getAsset(), title: _getTitle())),

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

