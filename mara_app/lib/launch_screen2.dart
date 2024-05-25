import 'package:flutter/material.dart';
import 'package:mara_app/intermediate_launch_screen.dart';
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

  @override
  void initState() {
    super.initState();
    _loadCurrentLanguage();
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
        "Divas have choices! The best choice for pregnancy prevention is the option that you feel is right for you.",
    'Kiswahili':
        "Warembo wana chaguo!",
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

  final Map<String, List<String>> textAudioContentMap = {
    "English": [
      'videoAudio/audio/launch_intermediate/launch_text_E.mp4',
    ],
    "Kiswahili": [
      'videoAudio/audio/launch_intermediate/launch_text_L.mp4',
    ],
    "Dholuo": [
      'videoAudio/audio/launch_intermediate/launch_text_K.mp4',
    ],
  };

  // TODO: figure out where the utton audio is supposed to gp
  final Map<String, List<String>> buttonAudioContentMap = {
    "English": [
      'videoAudio/audio/launch_intermediate/launch_button_E.mp4',
    ],
    "Kiswahili": [
      'videoAudio/audio/launch_intermediate/launch_button_L.mp4',
    ],
    "Dholuo": [
      'videoAudio/audio/launch_intermediate/launch_button_K.mp4',
    ],
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
            Row(children: [
              getAudio(buttonAudioContentMap),
              Flexible(
                  child: Text(
                    translations[_currentLanguage]!,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.visible,
                    style: TextStyle(
                      fontFamily: 'PoetsenOne',
                      color: MaraColors.purple,
                      fontSize: 30.0
                    ),
                  )
              )
            ]),
            SizedBox(height:50),
            Row(children: [
              getAudio(buttonAudioContentMap),
              Flexible(
                  child: Text(
                    subtitle_translations[_currentLanguage]!,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.visible,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.black,
                      fontSize: 20.0
                    ),
                  )
              )
            ]),            
            const SizedBox(height: 50),
            IntrinsicWidth(
                child: Row(children: [
              getAudio(buttonAudioContentMap),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => imLaunchScreen()),
                  );
                },
                child: Text(
                  translations2[_currentLanguage]!,
                ),
              )
            ])),
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
