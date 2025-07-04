import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mara_app/icons/mara_icons_icons.dart';
import 'home2.dart';
import 'video.dart';
import 'audio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mara_app/design/colors.dart';
import 'session_manager.dart';

class EmergencyPage extends StatefulWidget {
  final String initialLanguage;
  late int contentNum; //content box number

  EmergencyPage({Key? key, required this.initialLanguage}) : super(key: key);

  @override
  _EmergencyPageState createState() => _EmergencyPageState();
}

class _EmergencyPageState extends State<EmergencyPage> {
  int methodIndex = 0; // Index of the selected icon button, 0 for default
  int languageIndex = 2; // similar indexing for language
  final languages = ["Kiswahili", "Dholuo", "English"];
  bool overrideIndex = false;

  final double _aspectRatio = 16 / 10;

  final Map<String, String> titleContentMap = {
    "English": "It's an emergency!",
    "Dholuo": "Mambo 3 unayohitaji kujua kuhusu E-pill (P2)",
    "Kiswahili": "Ni ya dharura!"
  };

  final Map<String, String> subtitleContentMap = {
    "English": "3 things you need to know about the E-pill (P2)",
    "Kiswahili": "Gik moko 3 ma onego ing'e ewi E-pill (P2)",
    "Dholuo": "Gik moko te ma onego ing'e ewi muonyo E-pill [P2]"
  };

  final Map<String, Map<String, String>> _translations = {
    "1": {
      "Kiswahili":
          "E-pill ni chaguo zuri ikiwa unafanya ngono bila kondomu, lakini ni bora kufikiria kama chaguo mbadala, sio kama njia kuu unayotumia kuzuia ujauzito.",
      "Dholuo":
          "E-pill en yo maber tiyo godo ka ibedo e achiel maonge rabo yunga, to ber mondo iti kode kaka yor resruok, ok kaka yori maduong ma itiyo godo e geng'o ich",
      "English":
          "The E-pill is a good option if you have sex without a condom, but it's best to think of it as a backup option, not as the main method you are using to prevent pregnancy."
    },
    "2": {
      "Kiswahili":
          "Muda ni muhimu kwa sababu muda gani unachukua baada ya kufanya ngono hufanya tofauti kubwa katika jinsi inavyofanya kazi vizuri kuzuia mimba. Chukua haraka iwezekanavyo, lakini ndani ya siku 5 za ngono. Watoa huduma wengine watakuambia siku 3. mapema ni bora!",
      "Dholuo":
          "Ng'iyo saa ma imuonye ber nikech mapiyo ma imuonye bang bedo e achiel biro kelo pogruok maduong e kaka otiyo maber e geng'o ich. Muonye mapiyo ahinya  kaka inyalo, to ekind ndalo 5 mar bedo e achiel. Jochiw thieth moko biro nyisi ndalo 3. Mapiyo mogik ber!",
      "English":
          "Timing is important because how soon you take it after sex makes a big difference in how well it works to prevent pregnancy. Take as soon as you can, but within 5 days of sex. Some providers will tell you 3 days. The sooner the better!"
    },
    "3": {
      "Kiswahili":
          "Hakuna kikomo kwa mara ngapi unaweza kumeza kidonge cha E-pill kwa mwezi, lakini kunaweza kusababisha athari kama vile kwa tumbo na mabadiliko ya hedhi yako ambayo yanaweza kuudhi. Pia, ni bei ghali!",
      "Dholuo":
          "Onge giko ne ndalo ma inyalo muonye E-pill e dwe, to nitie nyalruok ni obiro keloni rach motudore gi yath kaka ich makuot kod lokruok e chwer mar rembi mar dwe manyalo wang'o ich. Bende, en gima beche tek!",
      "English":
          "There is no limit to how many times you can take the E-pill in a month, but it will likely cause side effects like upset stomach and changes to your period that might be annoying. Also, it is expensive!"
    },
    "4": {
      "Kiswahili":
          "Je, unajua kwamba unaweza kuanza njia nyingine ya kuzuia mimba kwa wakati mmoja unapotumia E-pill?",
      "Dholuo":
          "Be ing'eyo ni inyalo tiyo gi yore mamoko mag geng'o mako ich sama itiyo gi E-pill?",
      "English":
          "Did you know that you can start another pregnancy prevention method at the same time as you take the E-pill?"
    },
    "5": {
      "Kiswahili":
          "Ikiwa ulifanya ngono bila kinga, E-pill ndiyo hatua bora zaidi ya kwanza, na unaweza kupata sindano, kuanzisha tembe, au kuwekewa kipandikizi mara tu unapotaka baada ya kumeza E-pill - hata siku hiyo hiyo! Ukianza kutumia njia na huna uhakika kama ulipata hedhi, fanya mtihani wa ujauzito takriban wiki 2 baada ya kutumia kidonge cha E, ili tu kuwa na uhakika.",
      "Dholuo":
          "Kapo ni ne inindo gi ng'ato maok iritoi maber, E-pill e okang' mokwongo maber moloyo, kendo inyalo yudo sindan, chako tiyo gi yedhe, kata tiyo gi implant mapiyo kaka idwaro bang' tiyo gi E-pill - ⁠kata mana e odiechieng'no! Kapo ni ichako tiyo gi yorni to ok ing'eyo kabe mano e kinde monego ichak tiyogo, tim nonro mar mako ich bang' jumbe 2 bang' tiyo gi E-pill, mana mondo ibed gadier.",
      "English":
          "If you had unprotected sex, the E-pill is the best first step, and you can get the injection, start pills, or have an implant inserted as soon as you want after taking the E-pill - even the same day! If you start a method and you aren’t sure if you got your period, take a pregnancy test about 2 weeks after the E-pill, just to be sure."
    }
  };

  final Map<String, List<String>> videoContentMap = {
    "Kiswahili": ["videoAudio/videos/peer/peer3KS.mp4"],
    "Dholuo": ["videoAudio/videos/peer/peer3DL.mp4"],
    "English": ["videoAudio/videos/peer/peer3E.mp4"],
  };

  final Map<String, List<String>> videoTitleMap = {
    "Kiswahili": ["Video: Mwenzio anaelezea"],
    "Dholuo": ["Video: Mbasni lero"],
    "English": ["Video: a peer explains"],
  };

  final Map<String, List<String>> audioContentMap = {
    "English": [
      'videoAudio/audio/what_chance_audio/emergency/emergency_content_1_E.mp3',
      'videoAudio/audio/what_chance_audio/emergency/emergency_content_2_E.mp3',
      'videoAudio/audio/what_chance_audio/emergency/emergency_content_3_E.mp3',
      'videoAudio/audio/what_chance_audio/emergency/emergency_content_4_E.mp3',
    ],
    "Kiswahili": [
      'videoAudio/audio/what_chance_audio/emergency/emergency_content_1_K.mp3',
      'videoAudio/audio/what_chance_audio/emergency/emergency_content_2_K.mp3',
      'videoAudio/audio/what_chance_audio/emergency/emergency_content_3_K.mp3',
      'videoAudio/audio/what_chance_audio/emergency/emergency_content_4_K.mp3',
    ],
    "Dholuo": [
      'videoAudio/audio/what_chance_audio/emergency/emergency_content_1_L.mp3',
      'videoAudio/audio/what_chance_audio/emergency/emergency_content_2_L.mp3',
      'videoAudio/audio/what_chance_audio/emergency/emergency_content_3_L.mp3',
      'videoAudio/audio/what_chance_audio/emergency/emergency_content_4_L.mp3',
    ],
  };

  String _t(String key) {
    return _translations[key]?[_currentLanguage] ?? key;
  }

  String _currentLanguage = 'English';

  @override
  void initState() {
    _loadCurrentLanguage();
    SessionManager.logScreenEntry('EmergencyPage'); // Log entry time
  }

  @override
  void dispose() {
    SessionManager.logScreenExit(
        'EmergencyPage'); // Log exit time and calculate duration
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

  @override
  Widget build(BuildContext context) {
    HomePage2.emergencyVisited = true;
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
          icon: const Icon(Icons.arrow_back, size: 48.0),
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
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.home, size: 48.0),
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();

              var previousScreen =
                  prefs.getString('previousScreen') ?? 'intermediate';
              print("previous screen " + previousScreen);
              (previousScreen == "intermediate")
                  ? Navigator.pushReplacementNamed(
                      context,
                      '/home',
                    )
                  : Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Text(
            titleContentMap[languages[languageIndex]]!,
            style: TextStyle(
                fontFamily: 'PoetsenOne',
                color: MaraColors.purple,
                fontSize: 32.0),
            textAlign: TextAlign.center,
          )),
          Text(
            subtitleContentMap[languages[languageIndex]]!,
            style: TextStyle(
                fontFamily: 'Montserrat',
                color: MaraColors.magentaPurple,
                fontSize: 24.0,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10.0),
          Expanded(
              // child: Container(
              //     //height: containerHeight * 0.6, // Adjust as needed
              //     child: RawScrollbar(
              //       thumbColor: const Color.fromARGB(255, 232, 132, 165),
              //       thumbVisibility: true,
              //       trackVisibility: false,
              //       thickness: 25.0,
              //       radius: Radius.circular(20),
              //       child: LayoutBuilder(builder: (context, constraint) {
              //         return SingleChildScrollView(
              //             child: ConstrainedBox(
              //                 constraints:
              //                     BoxConstraints(minHeight: constraint.maxHeight),
              child: IntrinsicHeight(
            child: Flex(
                crossAxisAlignment: CrossAxisAlignment.center,
                direction: Axis.vertical,
                children: [
                  contentArea('1'),
                  contentArea('2'),
                  contentArea('3'),
                  SizedBox(
                    width: boxWidth * 0.6,
                    height: boxHeight * 0.4 * 0.6,
                    //child: Center(child: video1),
                    //child: VideoWidget(videoAsset: _getAsset(), title: _getTitle())
                    child: Center(
                      child: getVideoContent(),
                    ),
                  ),
                  //place new content next to e-pill image
                  Container(
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        getAudio(audioContentMap, 3),
                        SizedBox(width: 10.0),
                        Expanded(
                          child: Column(children: [
                            Text(
                              _t('4'),
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Colors.black,
                                  fontSize: 19.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              _t('5'),
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Colors.black,
                                  fontSize: 19.0),
                            ),
                          ]),
                        ),
                        Image.asset(
                          'assets/options_images/6.png',
                          width: 180,
                          height: 180,
                          fit: BoxFit.cover,
                        ),
                      ])),
                ]),
          )
              //             )
              //             );
              //   }
              //   ),
              // )
              // )
              )
        ],
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
      _currentLanguage = temp;
    });
  }

  // String _getAsset(String videoKey, String language) {
  //   return languageToVideo[videoKey]?[language]?['video'] ?? 'Asset not found';
  // }

  // String _getTitle(String videoKey, String language) {
  //   return languageToVideo[videoKey]?[language]?['text'] ?? 'Text not found';
  // }

  // Widget updateVideoContent1() {
  //   if (languageIndex == 0) {
  //     videoAsset1 = _getAsset('video1', '0');
  //     videoTitle1 = _getTitle('video1', '0');
  //   } else if (languageIndex == 1) {
  //     videoAsset1 = _getAsset('video1', '1');
  //     videoTitle1 = _getTitle('video1', '1');
  //   } else if (languageIndex == 2) {
  //     videoAsset1 = _getAsset('video1', '2');
  //     videoTitle1 = _getTitle('video1', '2');
  //   }
  //   return VideoWidget(videoAsset: videoAsset1, title: videoTitle1);
  // }

  // Widget languageButton(String language) {
  //   bool isSelected = _currentLanguage == language;
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 8.0),
  //     child: ElevatedButton(
  //       onPressed: () => _changeLanguage(language),
  //       // onPressed: () {
  //       //   setState(() {
  //       //     languageIndex = languageIndex;
  //       //     overrideIndex = true;
  //       //     video1 = updateVideoContent1();
  //       //   });
  //       // },
  //       style: ElevatedButton.styleFrom(
  //         backgroundColor: isSelected ? Colors.grey : null,
  //       ),
  //       child: Text(language),
  //     ),
  //   );
  // }
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

  Widget contentArea(String contentKey) {
    var contentNum = int.parse(contentKey) - 1;
    return Padding(
      // padding: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 10.0),
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
            Text(
              //number
              contentKey,
              style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.white,
                  fontSize: 33.0,
                  fontWeight: FontWeight.bold),
            ),
            getAudio(audioContentMap, contentNum),
            SizedBox(width: 10.0),
            Expanded(
              //content text
              child: Text(
                _t(contentKey),
                style: TextStyle(
                    fontFamily: 'Roboto', color: Colors.white, fontSize: 19.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget updateMethodContent(String contentKey) {
  //   return Text(_t(contentKey),
  //       style: TextStyle(
  //         fontSize: 20.0,
  //         color: Colors.black,
  //       ));
  // }

  // Widget getVideoContent() {
  //   String asset = videoContentMap[languages[languageIndex]]![methodIndex];
  //   String title = videoTitleMap[languages[languageIndex]]![0];
  //   return VideoWidget(videoAsset: asset, title: title);
  // }

  Widget getVideoContent() {
    String asset = videoContentMap[languages[languageIndex]]![methodIndex];
    String title = videoTitleMap[languages[languageIndex]]![0];
    return VideoWidget(videoAsset: asset, title: title);
  }

  Widget getAudio(Map<String, List<String>> audioMap, int contentNum) {
    return AudioWidget(audioAsset: audioMap[_currentLanguage]![contentNum]);
  }
}
