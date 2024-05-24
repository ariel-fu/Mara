import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'audio.dart';

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
  }

  // Load the current language from SharedPreferences
  Future<void> _loadCurrentLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _currentLanguage = prefs.getString('selectedLanguage') ?? 'English';
    });
  }

  Map<String, String> translations = {
    'English': "Let's get started!",
    'Kiswahili': "Tuanze!",
    'Dholuo': "Wachaki!",
  };

  Map<String, String> translations2 = {
    'English':
        "If now isn’t the right time for you to get pregnant, you have lots of options! \n \n MARA divas is designed especially for young women to help you get the information you need to make an empowered decision, when you need it.",
    'Kiswahili':
        "Ikiwa huu sio wakati unaofaa kwako kupata Ujauzito, una chaguzi nyingi! \n \n  Kubaini ni chaguo zipi zinazokufaa kunaweza kulemewa, hasa kwa mambo yote unayoweza kusikia - kutoka kwa watu katika maisha yako na vyanzo vingine. \n \n  Programu hii imeundwa mahsusi kwa ajili ya wanawake vijana ili kukusaidia kupata taarifa unayohitaji ili kufanya uamuzi uliowezeshwa, unapoihitaji. pata maelezo zaidi kuhusu chaguo zako. Iwe unajua ni njia gani unayotaka, hujawahi kutumia njia, au tayari unatumia mbinu, unaweza kupitia kila sehemu ya mwongozo huu ili kupata taarifa!",
    'Dholuo':
        "Ka ma ok en saa maber kodi mako ich, in gi yiero mang'eny! \n\n  Temo yiero yo maber kodi nyalo bedo matek ahinya, nikech weche mangeny ma samoro ing'eyo kata isewinjo oko kucha koa kuom jogo mantie e ngimani kod kuonde mamoko. \n\n App ni olos ng'enyne ne mine matindo mondo okonyi yudo weche makare ma idwaro mondo itim yiero makare, ekinde ma idware.                     Kata ka ing'eyo yor komo nyuol ma idwaro, pok ne itiyo gi yor komo nyuol moro amora, kata itiyo gi yor komo nyuol sani, inyalo somo okang ka okang mar app ni mondo iyud puonjruok!",
  };

  Map<String, String> translations3 = {
    'English': "Let's get started!",
    'Kiswahili': "Tuanze!",
    'Dholuo': "Wachaki!",
  };

  final Map<String, List<String>> textAudioContentMap = {
    "English": [
      'videoAudio/audio/launch_intermediate/intermediate_text_E.mp4',
    ],
    "Kiswahili": [
      'videoAudio/audio/launch_intermediate/intermediate_text_L.mp4',
    ],
    "Dholuo": [
      'videoAudio/audio/launch_intermediate/intermediate_text_K.mp4',
    ],
  };

  // TODO: figure out where the button aduio is supposted to go
  final Map<String, List<String>> buttonAudioContentMap = {
    "English": [
      'videoAudio/audio/launch_intermediate/intermediate_button_E.mp4',
    ],
    "Kiswahili": [
      'videoAudio/audio/launch_intermediate/intermediate_button_L.mp4',
    ],
    "Dholuo": [
      'videoAudio/audio/launch_intermediate/intermediate_button_K.mp4',
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
            image: AssetImage("assets/imlaunchscreenimg.png"),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 90.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                translations[_currentLanguage]!,
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 40.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getAudio(textAudioContentMap),
                  Expanded(
                    child: Text(translations2[_currentLanguage]!,
                        style: TextStyle(fontSize: 16.0),
                        textAlign: TextAlign.center),
                  )
                ],
              ),
            ),
            SizedBox(height: 20.0),
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

  Widget getAudio(Map<String, List<String>> audioContentMap) {
    return AudioWidget(audioAsset: audioContentMap[_currentLanguage]![0]);
  }
}
