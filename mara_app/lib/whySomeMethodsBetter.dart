import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'video.dart';
import 'audio.dart';
import 'package:mara_app/design/colors.dart';
import 'session_manager.dart';

class WhySomeMethodsBetter extends StatefulWidget {
  //const WhySomeMethodsBetter({Key? key}) : super(key: key);
  final String initialLanguage;

  WhySomeMethodsBetter({Key? key, required this.initialLanguage})
      : super(key: key);

  @override
  //State<WhySomeMethodsBetter> createState() => _WhySomeMethodsBetterState();
  _WhySomeMethodsBetterState createState() => _WhySomeMethodsBetterState();
}

class _WhySomeMethodsBetterState extends State<WhySomeMethodsBetter> {
  bool overrideIndex = false;

  int languageIndex = 2; // similar indexing for language
  final languages = ["Kiswahili", "Dholuo", "English"];
  Widget video1 = VideoWidget(
      videoAsset: 'videoAudio/videos/provider/provider3E.mp4',
      title: 'Video: a provider explains');

  String _currentLanguage = 'English';

  @override
  void initState() {
    super.initState();
    _loadCurrentLanguage();
    SessionManager.logScreenEntry(
        'WhySomeMethodsBetter'); // Log entry time when the screen is initialized
  }

  @override
  void dispose() {
    SessionManager.logScreenExit(
        'WhySomeMethodsBetter'); // Log exit time and calculate duration when leaving the screen
    super.dispose();
  }

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

  final Map<String, String> titleMap = {
    "Kiswahili":
        "KWA NINI baadhi ya mbinu za kupanga uzazi hufanya kazi vizuri zaidi kuliko zingine ili kuzuia mimba?",
    "Dholuo":
        "EN ANG'O MA OMIYO yore moko mag komo nyuol tiyoga maber mohingo moko e geng'o ich?",
    "English":
        "WHY do some methods work better than others to prevent pregnancy?",
  };

  final Map<String, List<String>> contentDescriptionMap = {
    "Kiswahili": [
      "Kadiri unavyopaswa kukumbuka kutumia au kupata njia, ndivyo nafasi zaidi ya makosa au matatizo inavyoongezeka. Hiyo ndiyo sababu kuu kwa nini baadhi ya mbinu kama vile vipandikizi na IUCD hufanya kazi vyema zaidi kuzuia mimba -- kwa sababu zinapokuwa kwenye mwili wako, si lazima ufanye kitu kingine chochote. Mbinu kama vile kondomu unazopaswa kutumia kila wakati unapofanya ngono (na unategemea mwenzi wako kuzitumia) hazifanyi kazi kwa muda ili kuzuia mimba, hasa kwa sababu watumiaji wanaweza kusahau kutumia kondomu au kutokuwa na wakati wanapohitaji. hiyo. Mbinu zote (zaidi ya E-pill) hufanya kazi vizuri sana kuzuia mimba zinapotumiwa kama ilivyoelekezwa."
    ],
    "Dholuo": [
      "Kaka nyalo dwarore ni mondo ipar mar tiyo gi yor komo nyuol kata dhi ome, e kaka nyalo kelo thuolo mang'eny mar makosa kata chandruok. Ma ema omiyo yore moko mag komo nyuol kaka Implant kod IUCD tiyo maber e geng'o ich -- nikech ka oseruakgi e dendi, onge gima nyaka itim machielo. Yore kaka rabo yunga ma nyaka itigodo seche te ma ibedo e achiel [kendo dwarore ni jaherani ema ruake] ok ti ga maber kuom ndalo e geng'o ich, mana nikech jomatiyo kodgi wigi nyalo wil tiyo gi rabo yunga kata bedo maonge kode seche ma gidware. Yore gi te [koweyo E-pill] tiyo maber ahinya w geng'o ich ka oti kodgi kaka dwarore."
    ],
    "English": [
      "The more you have to remember to use or get a method, the more room there is for mistakes or problems. That's the main reason why some methods like the implant and IUCD work better to prevent pregnancy -- because once they are in your body, you don't have to do anything else. Methods like condoms that you have to use every time you have sex (and depend on your partner to use them) do not work as well over time to prevent pregnancy, mainly because users might forget to use a condom or not have one when they need it. All of the methods (other than the E-pill) work very well to prevent pregnancy when used as directed."
    ]
  };

  final Map<String, List<String>> audio_title_ContentMap = {
    "Kiswahili": [
      "videoAudio/audio/what_chance_audio/whySomeMethods/whySomeMethods_title_K_1.mp3"
    ],
    "Dholuo": [
      "videoAudio/audio/what_chance_audio/whySomeMethods/whySomeMethods_title_L_1.mp3"
    ],
    "English": [
      "videoAudio/audio/what_chance_audio/whySomeMethods/whySomeMethods_title_E_1.mp3"
    ],
  };

  final Map<String, List<String>> audio_content_ContentMap = {
    "Kiswahili": [
      "videoAudio/audio/what_chance_audio/whySomeMethods/whySomeMethods_content_K.mp3"
    ],
    "Dholuo": [
      "videoAudio/audio/what_chance_audio/whySomeMethods/whySomeMethods_content_L.mp3"
    ],
    "English": [
      "videoAudio/audio/what_chance_audio/whySomeMethods/whySomeMethods_content_E.mp3"
    ],
  };

  final Map<String, List<String>> videoContentMap = {
    "Kiswahili": ["videoAudio/videos/provider/provider3KS.mp4"],
    "Dholuo": ["videoAudio/videos/provider/provider3DL.mp4"],
    "English": ["videoAudio/videos/provider/provider3E.mp4"],
  };

  final Map<String, List<String>> videoTitleMap = {
    "Kiswahili": ["Video: Mtoa huduma wa afya anaelezea"],
    "Dholuo": ["Vidio: Jachiw thieth lero"],
    "English": ["Video: a provider explains"],
  };

  final double _aspectRatio = 16 / 10;

  // String _t(String key) {
  //   return _translations[key]?[_currentLanguage] ?? key;
  // }

  void _changeLanguage(String language) {
    setState(() {
      _currentLanguage = language;
    });
  }

  @override
  Widget build(BuildContext context) {
    final int? routeArgumentIndex =
        ModalRoute.of(context)?.settings.arguments as int?;

    // Update languageIndex if a valid value is provided from the route
    if (routeArgumentIndex != null &&
        routeArgumentIndex >= 0 &&
        routeArgumentIndex < languages.length &&
        !overrideIndex) {
      languageIndex = routeArgumentIndex;
    }

    double containerWidth = MediaQuery.of(context).size.width;
    double containerHeight = MediaQuery.of(context).size.height;
    if (containerHeight / containerWidth > _aspectRatio) {
      containerHeight = containerWidth * _aspectRatio;
    } else {
      containerWidth = containerHeight / _aspectRatio;
    }
    double boxWidth = containerWidth;
    double boxHeight = containerHeight;
    double availableHeight = boxHeight;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          titleArea(),
          SizedBox(height: 15.0),
          contentArea(),
          SizedBox(
            width: boxWidth * 0.8,
            height: availableHeight * 0.5 * 0.6,
            child: Center(
              child: getVideoContent(),
            ),
          ),
        ],
      ),
      // body: Column(
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: [
      //     Center(
      //       child: Text(
      //         titleMap[languages[languageIndex]]!,
      //         style: TextStyle(fontFamily: 'PoetsenOne', color: MaraColors.purple, fontSize: 30.0),
      //         textAlign: TextAlign.center,
      //       ),
      //     ),
      //     Container(
      //         height: containerHeight * 0.1,
      //         child: Container(
      //           padding: EdgeInsets.symmetric(vertical: 8.0),
      //           child: Row(
      //             // children: ['Kiswahili', 'Dholuo', 'English']
      //             //     .map((language) => languageButton(language))
      //             //     .toList(),
      //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //             children: [
      //               ElevatedButton(
      //                 onPressed: () {
      //                   setState(() {
      //                     languageIndex = 0;
      //                     _currentLanguage = 'Kiswahili';
      //                     overrideIndex = true;
      //                     // updateMethodContent('content1');
      //                     video1 = updateVideoContent();
      //                   });
      //                 },
      //                 style: ElevatedButton.styleFrom(
      //                   backgroundColor:
      //                   languageIndex == 0 ? Colors.grey : null,
      //                 ),
      //                 child: Text('Kiswahili'),
      //               ),
      //               ElevatedButton(
      //                 onPressed: () {
      //                   setState(() {
      //                     languageIndex = 1;
      //                     _currentLanguage = 'Dholuo';
      //                     overrideIndex = true;
      //                     // updateMethodContent('content2');
      //                     video1 = updateVideoContent();
      //                   });
      //                 },
      //                 style: ElevatedButton.styleFrom(
      //                   backgroundColor:
      //                   languageIndex == 1 ? Colors.grey : null,
      //                 ),
      //                 child: Text('Dholuo'),
      //               ),
      //               ElevatedButton(
      //                 onPressed: () {
      //                   setState(() {
      //                     languageIndex = 2;
      //                     _currentLanguage = 'English';
      //                     overrideIndex = true;
      //                     // updateMethodContent('content3');
      //                     video1 = updateVideoContent();
      //                   });
      //                 },
      //                 style: ElevatedButton.styleFrom(
      //                   backgroundColor:
      //                   languageIndex == 2 ? Colors.grey : null,
      //                 ),
      //                 child: Text('English'),
      //               ),
      //             ],
      //           ),
      //         )),
      //     SizedBox(height: 20.0),
      //     Container (
      //       //height: containerHeight * 0.6, // Adjust as needed
      //       child: Flex(
      //         crossAxisAlignment: CrossAxisAlignment.center,
      //         direction: Axis.vertical,
      //         children: [
      //           contentArea(),
      //           SizedBox(
      //             width: boxWidth,
      //             height: boxHeight * 0.5 * 0.6,
      //             child: Center(child:video1),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
    );
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

  // Widget languageButton(String language) {
  //   asyncmethod(language);
  //   bool isSelected = _currentLanguage == language;
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 8.0),
  //     child: ElevatedButton(
  //       onPressed: () => _changeLanguage(language),
  //       style: ElevatedButton.styleFrom(
  //         backgroundColor: isSelected ? Colors.grey : null,
  //       ),
  //       child: Text(language),
  //     ),
  //   );
  // }

  // void asyncmethod(String language) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('selectedLanguage', language);
  // }

  // Widget contentBox(String contentKey) {
  //   return Padding(
  //     padding: const EdgeInsets.all(10.0),
  //     child: Container(
  //       padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
  //       decoration: BoxDecoration(
  //         color: Colors.grey.shade200,
  //         borderRadius: BorderRadius.circular(10),
  //         border: Border.all(color: Colors.grey),
  //       ),
  //       child: Row(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Icon(Icons.lightbulb_outline, color: Colors.amber, size: 24.0),
  //           SizedBox(width: 10.0),
  //           Expanded(
  //             child: Text(
  //               _t(contentKey),
  //               style: TextStyle(fontSize: 16.0),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget titleArea() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                getAudio(audio_title_ContentMap, 0),
              ]),
              SizedBox(width: 10.0),
              Flexible(
                child: Text(
                  titleMap[languages[languageIndex]] ?? "No title found",
                  style: TextStyle(
                      fontFamily: 'PoetsenOne',
                      color: MaraColors.purple,
                      fontSize: 30.0),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget contentArea() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          decoration: BoxDecoration(
            color: MaraColors.purple,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Icon(Icons.lightbulb_outline, color: Colors.amber, size: 24.0),
                getAudio(audio_content_ContentMap, 0),
              ]),
              SizedBox(width: 10.0),
              Flexible(
                child: Text(
                  contentDescriptionMap[languages[languageIndex]]![0],
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      color: Colors.white,
                      fontSize: 19.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget updateMethodContent() {
  //   return Text(contentDescriptionMap[languages[languageIndex]]![methodIndex],
  //       style: TextStyle(
  //         fontSize: 20.0,
  //         color: Colors.black,
  //       ));
  // }

  // String _getAsset(String videoKey, String language) {
  //     return languageToVideo[videoKey]?[language]?['video'] ?? 'Asset not found';
  // }

  // String _getTitle(String videoKey, String language) {
  //   return languageToVideo[videoKey]?[language]?['text'] ?? 'Text not found';
  // }

  // Widget getVideoContent() {
  //   String asset = videoContentMap[languages[languageIndex]]![0];
  //   String title = videoTitleMap[languages[languageIndex]]![0];
  //   return VideoWidget(videoAsset: asset, title: title);
  // }
  Widget getVideoContent() {
    String asset = videoContentMap[languages[languageIndex]]![0];
    String title = videoTitleMap[languages[languageIndex]]![0];
    return VideoWidget(videoAsset: asset, title: title);
  }

  // Widget updateVideoContent() {
  //   String videoAsset1 = "";
  //   String videoTitle1 = "";
  //     if (languageIndex == 0) {
  //       videoAsset1 = _getAsset('video1', '0');
  //       videoTitle1 = _getTitle('video1', '0');
  //     } else if (languageIndex == 1) {
  //         videoAsset1 = _getAsset('video1', '1');
  //         videoTitle1 = _getTitle('video1', '1');
  //     } else if (languageIndex == 2) {
  //         videoAsset1 = _getAsset('video1', '2');
  //         videoTitle1 = _getTitle('video1', '2');
  //     }
  //     return VideoWidget(videoAsset: videoAsset1, title: videoTitle1);
  // }

  Widget getAudio(Map<String, List<String>> audioMap, int audioIndex) {
    return AudioWidget(
        audioAsset: audioMap[languages[languageIndex]]![audioIndex]);
  }
}
