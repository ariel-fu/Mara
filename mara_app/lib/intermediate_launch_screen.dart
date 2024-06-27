import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'audio.dart';
import 'design/colors.dart';
import 'emergency.dart';
import 'session_manager.dart';

class imLaunchScreen extends StatefulWidget {
  const imLaunchScreen({super.key});

  @override
  State<imLaunchScreen> createState() => _imLaunchState();
}

class _imLaunchState extends State<imLaunchScreen> {
  String _currentLanguage = 'English';

  @override
  void initState() {
    super.initState();
    _loadCurrentLanguage();
     SessionManager.logScreenEntry('InterLaunchScreen'); // Log entry time when the screen is initialized
  }

  @override
  void dispose() {
    SessionManager.logScreenExit('InterLaunch'); // Log exit time and calculate duration when leaving the screen
    super.dispose();
  }

  // Load the current language from SharedPreferences
  Future<void> _loadCurrentLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _currentLanguage = prefs.getString('selectedLanguage') ?? 'English';
    });
  }

  Map<String, String> translations = {
    'English':
        "If now isn’t the right time for you to get pregnant, you have lots of options!",
    'Kiswahili':
        "Ikiwa huu sio wakati unaofaa kwako kupata Ujauzito, una chaguzi nyingi!",
    'Dholuo': "Ka ma ok en saa maber kodi mako ich, in gi yiero mang'eny!",
  };

  Map<String, String> translations2 = {
    'English':
        "MARA divas is designed especially for young women to help you get the information you need to make an empowered decision, when you need it.",
    'Kiswahili':
        "Mara divas imeundwa mahsusi kwa ajili ya wanawake vijana ili kukusaidia kapata taarifa unayohitaji ili kufanya uamuzi uliowezeshwa, unapoihitaji. ",
    'Dholuo':
        "Mara divas olos ng'enyne ne mine matindo mondo okonyi yudo weche makare ma idwaro mondo itim yiero makare, ekinde ma idware.",
  };

  Map<String, String> translations3 = {
    'English': "Let's get started!",
    'Kiswahili': "Tuanze!",
    'Dholuo': "Wachaki!",
  };

  Map<String, String> translations4 = {
    'English': "3 things you need to know about the E-pill (P2)",
    'Kiswahili': "Mambo 3 unayohitaji kujua kuhusu E-pill (P2)",
    'Dholuo': "Gik moko 3 ma onego ing'e ewi E-pill (P2)"
  };

  final Map<String, List<String>> textAudioContentMap = {
    "English": [
      'videoAudio/audio/launch_intermediate/intermediate_text_E.mp3',
    ],
    "Kiswahili": [
      'videoAudio/audio/launch_intermediate/intermediate_text_K.mp3',
    ],
    "Dholuo": [
      'videoAudio/audio/launch_intermediate/intermediate_text_L.mp3',
    ],
  };

  // TODO: figure out where the button aduio is supposted to go
  final Map<String, List<String>> buttonAudioContentMap = {
    "English": [
      'videoAudio/audio/launch_intermediate/intermediate_button_E.mp3',
    ],
    "Kiswahili": [
      'videoAudio/audio/launch_intermediate/intermediate_button_K.mp3',
    ],
    "Dholuo": [
      'videoAudio/audio/launch_intermediate/intermediate_button_L.mp3',
    ],
  };

  final Map<String, List<String>> pillButtonAudioContentMap = {
    "English": ['videoAudio/audio/3things_E.mp3'],
    "Kiswahili": ['videoAudio/audio/3things_K.mp3'],
    "Dholuo": ['videoAudio/audio/3things_L.mp3'],
  };

  void _switchLanguage(String language) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedLanguage', language);
    setState(() {
      _currentLanguage = language;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              languageButton('Kiswahili'),
              languageButton('Dholuo'),
              languageButton('English'),
            ],
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.center, // change, to reposition image
            image: AssetImage("assets/intermediate_launchscreen.png"),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 150.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getAudio(textAudioContentMap),
                  Expanded(
                      child: Column(children: [
                    Text(translations[_currentLanguage]!,
                        style: TextStyle(fontFamily: "Montserrat", fontSize: 32.0, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center),
                    SizedBox(height: 50.0),
                    Text(translations2[_currentLanguage]!,
                        style: TextStyle(fontFamily: "Montserrat", fontSize: 24.0),
                        textAlign: TextAlign.center),
                    //contentTextBold(),
                  ]))
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: IntrinsicWidth(
                  child: Row(children: [
                    getAudio(pillButtonAudioContentMap),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EmergencyPage(
                                  initialLanguage: _currentLanguage)),
                        );
                      },
                      child: Text(
                        translations4[_currentLanguage]!,
                        style: TextStyle(fontSize: 22, color: Colors.black)
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MaraColors.lavender,
                        // Button background color
                        foregroundColor: Colors.black,
                      ),
                    )
                  ]),
                ),
              ),
            ),
            SizedBox(height: 500.0),
            Center(
                child: IntrinsicWidth(
              child: Row(children: [
                getAudio(buttonAudioContentMap),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      '/home',
                    );
                  },
                  child: Text(
                    translations3[_currentLanguage]!,
                    style: TextStyle(fontSize: 22, color: Colors.black)
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: MaraColors.lavender,
                    // Button background color
                    foregroundColor: Colors.black,
                  ),
                )
              ]),
            )),
          ],
        ),
      ),
    );
  }

  // originally from quiz screen; factor out
  Widget languageButton(String language) {
    bool isSelected = _currentLanguage == language;
    return ElevatedButton(
      onPressed: () => _switchLanguage(language),
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.grey : null,
        foregroundColor: isSelected
            ? Colors.white
            : null, // Optional: change text color based on selection
      ),
      child: Text(language),
    );
  }

  // Widget contentTextBold() {
  //   var text = RichText(
  //     text: TextSpan(
  //       // Note: Styles for TextSpans must be explicitly defined.
  //       // Child text spans will inherit styles from parent
  //       style: const TextStyle(fontFamily: "Montserrat", fontSize: 24.0),
  //       if (_currentLanguage.contains('English')) {
  //         children: <TextSpan>[
  //           TextSpan(text: 'MARA divas is designed especially for young women to help you '),
  //           TextSpan(text: 'get the information you need ', style: const TextStyle(fontWeight: FontWeight.bold)),
  //           TextSpan(text: 'to make an empowered decision, '),
  //           TextSpan(text: 'when you need it.', style: const TextStyle(fontWeight: FontWeight.bold)),
  //         ],
  //       }
  //       else if (_currentLanguage.contains('Dholuo')) {
  //         children: <TextSpan>[
  //           TextSpan(text: 'textDL '),
  //           TextSpan(text: 'textDL ', style: const TextStyle(fontWeight: FontWeight.bold)),
  //           TextSpan(text: 'textDL '),
  //           TextSpan(text: 'textDL', style: const TextStyle(fontWeight: FontWeight.bold)),
  //         ],
  //       }
  //       else {
  //         children: <TextSpan>[
  //           TextSpan(text: 'textKS '),
  //           TextSpan(text: 'textKS ', style: const TextStyle(fontWeight: FontWeight.bold)),
  //           TextSpan(text: 'textKS, '),
  //           TextSpan(text: 'textKS', style: const TextStyle(fontWeight: FontWeight.bold)),
  //         ],
  //       },
  //     ),
  //   );
  //   return text;
  // }

  Widget getAudio(Map<String, List<String>> audioContentMap) {
    return AudioWidget(audioAsset: audioContentMap[_currentLanguage]![0]);
  }
}
