import 'package:flutter/material.dart';
import 'package:mara_app/emergency.dart';
import 'package:mara_app/hiv_page.dart';
import 'package:mara_app/home2.dart';
import 'package:mara_app/icons/mara_icons_icons.dart';
import 'package:mara_app/time_page.dart';
import 'package:mara_app/whySomeMethodsBetter.dart';
import 'audio.dart';
import 'package:mara_app/design/colors.dart';

class WhatChance extends StatefulWidget {
  const WhatChance({Key? key}) : super(key: key);

  @override
  State<WhatChance> createState() => _WhatChanceState();
}

class _WhatChanceState extends State<WhatChance> {
  String _currentLanguage = 'English';
  bool overrideIndex = false;
  int methodIndex = 0; // Index of the selected icon button, 0 for default
  int languageIndex = 2; // similar indexing for language
  final languages = ["Kiswahili", "Dholuo", "English"];

  final Map<String, List<String>> importantAudioContentMap = {
    "English": [
      'videoAudio/audio/what_chance_audio/chance_male_condom_E.mp3',
      'videoAudio/audio/what_chance_audio/chance_female_condom_E.mp3',
      'videoAudio/audio/what_chance_audio/chance_pills_E.mp3',
      'videoAudio/audio/what_chance_audio/chance_depo_E.mp3',
      'videoAudio/audio/what_chance_audio/chance_implant_E.mp3',
      'videoAudio/audio/what_chance_audio/chance_iucd_E.mp3',
      'videoAudio/audio/what_chance_audio/chance_epill_E.mp3'
    ],
    "Kiswahili": [
      'videoAudio/audio/what_chance_audio/chance_male_condom_K.mp3',
      'videoAudio/audio/what_chance_audio/chance_female_condom_K.mp3',
      'videoAudio/audio/what_chance_audio/chance_pills_K.mp3',
      'videoAudio/audio/what_chance_audio/chance_depo_K.mp3',
      'videoAudio/audio/what_chance_audio/chance_implant_K.mp3',
      'videoAudio/audio/what_chance_audio/chance_iucd_K.mp3',
      'videoAudio/audio/what_chance_audio/chance_epill_K.mp3'
    ],
    "Dholuo": [
      'videoAudio/audio/what_chance_audio/chance_male_condom_L.mp3',
      'videoAudio/audio/what_chance_audio/chance_female_condom_L.mp3',
      'videoAudio/audio/what_chance_audio/chance_pills_L.mp3',
      'videoAudio/audio/what_chance_audio/chance_depo_L.mp3',
      'videoAudio/audio/what_chance_audio/chance_implant_L.mp3',
      'videoAudio/audio/what_chance_audio/chance_iucd_L.mp3',
      'videoAudio/audio/what_chance_audio/chance_epill_L.mp3'
    ],
  };

  final Map<String, List<String>> heyThisAudioMap = {
    "English": ['videoAudio/audio/heyThis_HIV_STI_E.mp3'],
    "Kiswahili": ['videoAudio/audio/heyThis_HIV_STI_K.mp3'],
    "Dholuo": ['videoAudio/audio/heyThis_HIV_STI_L.mp3'],
  };

  final Map<String, String> titleTranslations = {
    "Kiswahili": "Je, nafasi yangu ya kupata mimba ni ipi?",
    "Dholuo": "Nyalona mar mako ich en ang'o?",
    "English": "What is my chance of getting pregnant?",
  };

  final Map<String, String> whyTranslations = {
    "Kiswahili":
        "KWA NINI baadhi ya mbinu za kupanga uzazi hufanya kazi vizuri zaidi kuliko zingine ili kuzuia mimba?",
    "Dholuo":
        "EN ANG'O MA OMIYO yore moko mag komo nyuol tiyoga maber mohingo moko e geng'o ich?",
    "English":
        "WHY do some methods work better than others to prevent pregnancy?",
  };

  final Map<String, String> importantMessageTranslations = {
    "English":
        "HEY! THIS IS IMPORTANT! Male and female condoms are the ONLY family planning methods that also prevent HIV and other STIs!",
    "Kiswahili":
        "Hey! HII NI MUHIMU! Kondomu za kiume na za kike ndizo njia PEKEE za kupanga uzazi ambazo pia huzuia Virusi Vya Ukimwi na magonjwa mengine ya zinaa!",
    "Dholuo":
        "HEY! MA EN GIMA BER NG'EYO! Rabo yunga mar chuo gi mine e yore komo nyuol KENDE ma bende geng'o kute mag ayaki kod nyae mamoko!"
  };

  final Map<String, String> learnMoreTranslations = {
    "English": "Learn more",
    "Kiswahili": "Jifunze zaidi",
    "Dholuo": "Puonjri matut"
  };

  final Map<String, List<String>> contentDescriptionMap = {
    "Kiswahili": [
      "Takriban wanawake 21 kati ya 100 wanaotumia kondomu za kike kwa mwaka mmoja watapata mimba.",
      "Takriban wanawake 13 kati ya 100 wanaotumia kondomu za kiume kwa mwaka mmoja watapata mimba.",
      "Takriban wanawake 7 kati ya 100 wanaotumia vidonge vya kila siku kwa mwaka watakuwa wajawazito.",
      "Takriban wanawake 4 kati ya 100 wanaotumia sindano (depo) kwa mwaka watakuwa wajawazito.",
      "Chini ya mwanamke 1 kati ya 100 wanaotumia implant kwa mwaka mmoja watapata ujauzito.",
      "Chini ya mwanamke 1 kati ya 100 wanaotumia IUCD (coil) kwa mwaka mmoja watapata mimba.",
      "Jinsi E-pill inavyofanya kazi vizuri ili kuzuia mimba inategemea mambo mengi - ni muda gani unachukua baada ya ngono, na muda wa mzunguko wako wa kila mwezi. E-pill haijaundwa kutumiwa kama njia yako ya kawaida ya kila siku, na haifanyi kazi vizuri ikiwa unafanya ngono mara kwa mara.",
    ],
    "Dholuo": [
      "Madirom mine 21 kuom 100 matiyo gi kondoms mar mine e higa biro mako ich.",
      "Madirom mine 13 kuom 100 matiyo gi kondoms mar chuo e higa biro mako ich.",
      "Madirom mine 7 kuom 100 matiyo gi pills mapile ka pile e higa biro mako ich",
      "madirom mine 4 kuom 100 matiyo gi sindan [Depo] e higa biro mako ich.",
      "Matin ne miyo 1 kuom 100 matiyo gi Implant e higa biro mako ich.",
      "Matin ne miyo 1 kuom 100 matiyo gi IUCD [koil] e higa biro mako ich.",
      "Kaka E-pill tiyo maber e geng'o ich luwore gi gik mang'eny - kaka imuonye mapiyo marom nade bang bedo e achiel, kod kinde ma intie e sako ni mar dwe. E-pill ok olosi mondo oti godo kaka yori mapile mar geng'o ich kendo ok oti maber ka ibedo e achiel monuoyore ding'eny.",
    ],
    "English": [
      "About 21 out of 100 women using female condoms for a year will become pregnant.",
      "About 13 out of 100 women using male condoms for a year will become pregnant.",
      "About 7 out of 100 women using daily pills for a year will become pregnant.",
      "About 4 out of 100 women using the injection (depo) for a year will become pregnant.",
      "Fewer than 1 in 100 women using the implant for a year will become pregnant.",
      "Fewer than 1 in 100 women using the IUCD (coil) for a year will become pregnant.",
      "How well the E-pill works to prevent pregnancy depends on a lot of things - how soon you take it after sex, and the timing in your monthly cycle. The E-pill is not designed to be used as your regular daily method, and it is does not work well if you are having sex frequently."
    ],
  };

  final Map<String, String> EpillText = {
    "Kiswahili": "Mambo 3 unayohitaji kujua kuhusu E-pill (P2)",
    "Dholuo": "Gik moko 3 ma onego ing'e ewi E-pill (P2)",
    "English": "3 things you need to know about the E-pill (P2)",
  };

  final double _aspectRatio = 16 / 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back),
        //   onPressed: () => Navigator.of(context).pop(),
        // ),
        title: Center(
          child: Text(
            titleTranslations[languages[languageIndex]] ?? "Title not found",
            style: TextStyle(fontFamily: 'PoetsenOne', color: MaraColors.purple, fontSize: 36.0)
          )
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: languages
                    .map((language) => languageButton(language))
                    .toList(),
              ),
            ),
            methodSelectionRow(),
            SizedBox(height: 20.0),
            contentArea(),
            Center(
              child: getPic(),
            ),
            additionalTextSection(),
            // Container(
            //   width: boxWidth,
            //   height: availableHeight * 0.25,
            //   decoration: BoxDecoration(
            //       color: Color.fromARGB(0, 255, 255, 255),
            //       borderRadius: BorderRadius.circular(1.0),
            //     ),
            //   child: Center(
            //     child: getPic(),
            //   ),
            // ),
            // additionalTextSection(),
          ],
          //),
        ),
      ),
    );
  }

  Widget contentArea() {
    return Padding(
      padding: EdgeInsets.all(10.0),
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.lightbulb_outline, color: Colors.amber, size: 24.0),
                getAudio(importantAudioContentMap, methodIndex),
              ],
            ),
            SizedBox(width: 10.0),
            Flexible(
              child: Text(
                contentDescriptionMap[languages[languageIndex]]![methodIndex],
                 style: TextStyle(fontFamily: 'Roboto', color: Colors.white, fontSize: 19.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget languageButton(String language) {
    bool isSelected = languages[languageIndex] == language;
    return ElevatedButton(
      onPressed: () {
        setState(() {
          languageIndex = languages.indexOf(language);
          overrideIndex = true;
          updateMethodContent();
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.grey : null,
      ),
      child: Text(language),
    );
  }

  Widget additionalTextSection() {
    return Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(children: [
          if (methodIndex == 0 || methodIndex == 1)
            Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //ImageIcon(AssetImage('assets/misc-icons/important.png'), size: 24.0, color: Colors.black),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // ImageIcon(AssetImage('assets/misc-icons/important.png'),
                      //     size: 24.0, color: Colors.black),
                      getAudio(heyThisAudioMap, 0),
                    ],
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ImageIcon(AssetImage('assets/misc-icons/important.png'),
                            size: 50.0, color: Colors.black),
                        Flexible(
                          child: Text(
                          importantMessageTranslations[languages[languageIndex]] ??
                              "Important message not found",
                          style: TextStyle(
                              fontFamily: 'Roboto', fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                        )
                      ]
                    )
                  ),
                ],
              ),
            ),
          //SizedBox(height: 20),
          if (methodIndex == 0 || methodIndex == 1)
            TextButton.icon(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple[100],
                  // Button background color
                  foregroundColor: Colors.black),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HIVPage()),
                );
              },
              icon: ImageIcon(AssetImage('assets/misc-icons/question.png'),
                  color: Colors.black),
              label: Text(
                  learnMoreTranslations[languages[languageIndex]] ??
                      "Translation Not Found",
                  style: TextStyle(color: Colors.black)),
            ),
          SizedBox(height: 50),
          if (methodIndex != 6)
            TextButton.icon(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple[100],
                  // Button background color
                  foregroundColor: Colors.black),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => WhySomeMethodsBetter(
                          initialLanguage: _currentLanguage)),
                );
              },
              icon: ImageIcon(AssetImage('assets/misc-icons/question.png'),
                  color: Colors.black),
              label: Text(
                  whyTranslations[languages[languageIndex]] ??
                      "Translation Not Found",
                  style: TextStyle(color: Colors.black)),
            ),

          if (methodIndex == 6)
            TextButton.icon(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple[100],
                  // Button background color
                  foregroundColor: Colors.black),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          EmergencyPage(initialLanguage: _currentLanguage)),
                );
              },
              icon: ImageIcon(AssetImage('assets/misc-icons/question.png'),
                  color: Colors.black),
              label: Text(
                  EpillText[languages[languageIndex]] ??
                      "Translation Not Found",
                  style: TextStyle(color: Colors.black)),
            ),
        ]));
  }

  void WhyDoPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              WhySomeMethodsBetter(initialLanguage: _currentLanguage)),
    );
  }

  Widget getPic() {
    String imageNum =
        "assets/method_efficiency_pics/efficacy_Page_$methodIndex.jpg";
    return Image.asset( 
      imageNum,
      width: MediaQuery.of(context).size.width * 0.8,
    );
  }

  Widget buildIconButton(IconData iconData, String caption, int index) {
    bool isSelected = index == methodIndex;

    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(
                iconData,
                size: isSelected ? 60 : 60,
                color: isSelected ? MaraColors.magentaPurple : Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  methodIndex = index;
                  //updateText();
                  updateMethodContent();
                });
              },
              color: isSelected ? Colors.black : Colors.transparent,
              iconSize: isSelected ? 60 : 60,
              padding: EdgeInsets.all(10),
              splashRadius: 40,
              splashColor: Colors.grey.withOpacity(0.5),
              highlightColor: Colors.transparent,
            ),
            SizedBox(height: 5),
            Container(
                width: 100,
                child: Text(
                  caption,
                  softWrap: true, // Wrap text to the next line if needed
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: isSelected ? Colors.black : Colors.grey,
                  ),
                ))
          ],
        ),
      ],
    );
  }

  Widget updateMethodContent() {
    return Text(contentDescriptionMap[languages[languageIndex]]![methodIndex],
        style: TextStyle(
          fontSize: 18.0,
          color: Colors.black,
        ));
  }

  Widget methodSelectionRow() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildIconButton(MaraIcons.condom, "Condom", 0),
          buildIconButton(MaraIcons.female_condom, "Female Condom", 1),
          buildIconButton(
              MaraIcons.birth_control_pills, "Pills (daily pills)", 2),
          buildIconButton(MaraIcons.syringe, "Injection (depo)", 3),
          buildIconButton(MaraIcons.contraceptive_implant, "Implant", 4),
          buildIconButton(MaraIcons.iud, "IUCD (coil)", 5),
          buildIconButton(
              MaraIcons.double_pills, "Emergency pill (E-pill, P2)", 6),
        ],
      ),
    );
  }

  Widget getAudio(Map<String, List<String>> audioMap, int index) {
    return AudioWidget(audioAsset: audioMap[languages[languageIndex]]![index]);
  }
}
