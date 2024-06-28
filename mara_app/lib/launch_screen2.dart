import 'package:flutter/material.dart';
import 'package:mara_app/intermediate_launch_screen.dart';
import 'package:mara_app/session_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'audio.dart';
import 'package:mara_app/design/colors.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({super.key});

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  String _currentLanguage = 'English';
  DateTime? screenEntryTime;

  @override
  void initState() {
    super.initState();
    screenEntryTime = DateTime.now();
    _loadCurrentLanguage();
    SessionManager.startNewSession(); // Start a new session
    SessionManager.logScreenEntry(
        'LaunchPage');
 // Log entry time when the screen is initialized
  }

  @override
  void dispose() {
    SessionManager.logScreenExit(
        'LaunchPage'); // Log exit time and calculate duration when leaving the screen
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
    'English': "Divas have choices!",
    'Kiswahili': "Warembo wana chaguo!",
    'Dholuo': "Nyibeyo nigi yiero!",
  };

  Map<String, String> subtitle_translations = {
    'English':
        "The best choice for pregnancy prevention is the option that you feel is right for you.",
    'Kiswahili':
        "Chaguo bora zaidi la kupanga uzazi ni chaguo ambalo unahisi linakufaa.",
    'Dholuo': "Yor komo nyuol maber mogik en ma ineno ka ber kodi.",
  };

  Map<String, String> translations2 = {
    'English': "Learn more about your options!",
    'Kiswahili': "Pata maelezo zaidi kuhusu chaguo zako!",
    'Dholuo': "Puonjri matut ewi yiero ma in godo!",
  };

  Map<String, String> translations3 = {
    'English':
        "MARA Divas was inspired the My Birth Control contraceptive decision support tool developed by the Person-Centered Reproductive Health Program at UCSF.",
    'Kiswahili':
        "MARA Divas was inspired the My Birth Control contraceptive decision support tool developed by the Person-Centered Reproductive Health Program at UCSF.",
    'Dholuo':
        "MARA Divas was inspired the My Birth Control contraceptive decision support tool developed by the Person-Centered Reproductive Health Program at UCSF.!",
  };

  // Map<String, TextSpan> translations3 = {
  //   'English': TextSpan(
  //     text: "MARA Divas was inspired the "
  //   ),
  //   "MARA Divas was inspired the My Birth Control contraceptive decision support tool developed by the Person-Centered Reproductive Health Program at UCSF.",
  //   'Kiswahili': "MARA Divas was inspired the My Birth Control contraceptive decision support tool developed by the Person-Centered Reproductive Health Program at UCSF.",
  //   'Dholuo': "MARA Divas was inspired the My Birth Control contraceptive decision support tool developed by the Person-Centered Reproductive Health Program at UCSF.!",
  // };

  final Map<String, List<String>> textAudioContentMap = {
    "English": [
      'videoAudio/audio/launch_intermediate/launch_text_E.mp3',
    ],
    "Kiswahili": [
      'videoAudio/audio/launch_intermediate/launch_text_K.mp3',
    ],
    "Dholuo": [
      'videoAudio/audio/launch_intermediate/launch_text_L.mp3',
    ],
  };

  // TODO: figure out where the utton audio is supposed to gp
  final Map<String, List<String>> buttonAudioContentMap = {
    "English": [
      'videoAudio/audio/launch_intermediate/launch_button_E.mp3',
    ],
    "Kiswahili": [
      'videoAudio/audio/launch_intermediate/launch_button_K.mp3',
    ],
    "Dholuo": [
      'videoAudio/audio/launch_intermediate/launch_button_L.mp3',
    ],
  };

  final double _aspectRatio = 16 / 10;

  void _switchLanguage(String language) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedLanguage', language);
    setState(() {
      _currentLanguage = language;
    });
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
    double availableHeight = boxHeight;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: PreferredSize(
          preferredSize: Size.fromHeight(availableHeight * 0.05),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                languageButton('Kiswahili'),
                SizedBox(width: 40),
                languageButton('Dholuo'),
                SizedBox(width: 40),
                languageButton('English'),
              ],
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Image.asset(
                'assets/mara_divas.png',
                width: MediaQuery.of(context).size.width * 0.5,
              ),
            ),
            // Row(children: [
            IntrinsicWidth(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          getAudio(textAudioContentMap),
                          Expanded(
                              child: Column(children: [
                            Text(translations[_currentLanguage]!,
                                style: TextStyle(
                                    fontFamily: 'PoetsenOne',
                                    color: MaraColors.purple,
                                    fontSize: 30.0),
                                overflow: TextOverflow.visible,
                                textAlign: TextAlign.center),
                            SizedBox(height: 25.0),
                            Text(subtitle_translations[_currentLanguage]!,
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Colors.black,
                                    fontSize: 20.0),
                                overflow: TextOverflow.visible,
                                textAlign: TextAlign.center),
                          ]))
                        ],
                      ),
                    ),
                  ]),
            ),

            const SizedBox(height: 80),
            IntrinsicWidth(
                child: Row(children: [
              getAudio(buttonAudioContentMap),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => imLaunchScreen()),
                  );
                },
                style: TextButton.styleFrom(
                  backgroundColor: MaraColors.lavender,
                  // Button background color
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                ),
                child: Text(translations2[_currentLanguage]!,
                    style: TextStyle(fontSize: 22, color: Colors.black)),
              )
            ])),

            const SizedBox(height: 80),
            IntrinsicWidth(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              child: Column(children: [
                            SizedBox(height: 25.0),
                            Text(translations3[_currentLanguage]!,
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Colors.black,
                                    fontSize: 15),
                                overflow: TextOverflow.visible,
                                textAlign: TextAlign.center),
                          ]))
                        ],
                      ),
                    ),
                  ]),
            ),
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

  Widget getAudio(Map<String, List<String>> audioContentMap) {
    return AudioWidget(audioAsset: audioContentMap[_currentLanguage]![0]);
  }
}