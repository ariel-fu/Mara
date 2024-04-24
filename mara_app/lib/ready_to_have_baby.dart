
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
    // 'Family Planning Guide': {
    //   'Kiswahili': 'Mwongozo wa Mipango ya Familia',
    //   'Dholuo': 'Tim Mabeyo Mar Dhano Nyithindo',
    //   'English': 'Family Planning Guide',
    // },
    'What if I\'m ready to have a baby?': {
      'Kiswahili': 'Kama niko tayari kupata mtoto?',
      'Dholuo': 'Ango nyithindo mabeyo manyalo wuonwa?',
      'English': 'What if I\'m ready to have a baby?',
    },
    'HEY! THIS IS IMPORTANT!': {
      'Kiswahili': 'HEY! HII NI MUHIMU! Kutumia njia za upangaji uzazi HAKUTAbadilisha uwezo wako wa kupata mimba katika siku zijazo!', 
      'Dholuo': 'HEY! MA EN GIMA BER NG\'EYO! Tiyo gi yore mag komo nyuol OK bi loko nyaloni mar mako ich e ndalo mabiro!', 
      'English': 'HEY! THIS IS IMPORTANT! Using family planning methods will NOT change your ability to get pregnant in the future!',
    }, 
    'LEARN MORE about the fertility considerations of each method': {
      'Kiswahili': 'JIFUNZE ZAIDI kuhusu masuala ya uzazi ya kila mbinu', 
      'Dholuo': 'PUONJRI MATUT ewi nyaloni mar mako ich gi yor komo nyuol ka yor komo nyuol.', 
      'English': 'LEARN MORE about the fertility considerations of each method', 
    }, 
    'Preparing for a health pregnancy': {
      'Kiswahili': 'Kujiandaa kwa ujauzito wenye afya', 
      'Dholuo': 'Yikruok ne ich man gi ngima', 
      'English': 'Preparing for a healthy pregnancy',
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
                    ImageIcon(AssetImage('assets/misc-icons/important.png'), color: Colors.black),
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
      // leading: IconButton(
      //     icon: const Icon(Icons.home),
      //     onPressed: () {
      //       Navigator.of(context).pushNamed('/home');
      //     },
      //   ),
        //title: Text(_t('Family Planning Guide')),
      ),
      body: Column(
      children: [
        // Language selection buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: languages.map((language) => languageButton(language)).toList(),
        ),
        // Make the rest of the page scrollable
        Flexible(
          child: ListView(
            children: [
              customListTile(
                imagePath: 'assets/preg_woman_new.png',
                header: _t('What if I\'m ready to have a baby?'),
                title: _t('HEY! THIS IS IMPORTANT!'),
              ),
              
          SizedBox(width:boxWidth, height:boxHeight * 0.5 * 0.6, child: VideoWidget(videoAsset: _getAsset(), title: _getTitle())),
          
         Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ElevatedButton.icon(
            icon: ImageIcon(AssetImage('assets/misc-icons/question.png'), color: Colors.black),
            label: Text(_t('LEARN MORE about the fertility considerations of each method')), // The label (text)
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple[100], // Button background color
              foregroundColor: Colors.black 
            ),
            onPressed: () {
              int languageIndex = languages.indexOf(_currentLanguage);
              Navigator.pushNamed(
                context,
                '/learnmore',
                arguments: languageIndex
              );
            },
          ),
        ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ElevatedButton.icon(
            icon: ImageIcon(AssetImage('assets/misc-icons/check_mark.png'), color: Colors.black),
            label: Text(_t('Preparing for a health pregnancy')), 
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple[100], // Button background color
              foregroundColor: Colors.black, 
            ),
    
            onPressed: () {
              Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PrepPage(initialLanguage: _currentLanguage),
              ),
            );
            },
    
          ),
        ),
          
      ]),
        ), 
      ]),
  );
    
  }
}

