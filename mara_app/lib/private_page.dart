import 'package:flutter/material.dart';
import 'package:mara_app/icons/mara_icons_icons.dart';
import 'package:mara_app/hiv_page.dart';
import 'package:mara_app/video.dart';
import 'package:mara_app/audio.dart';
import 'package:mara_app/design/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'session_manager.dart';
import 'model/method_selection_repository.dart';

class PrivatePage extends StatefulWidget {
  const PrivatePage({Key? key}) : super(key: key);

  @override
  State<PrivatePage> createState() => _PrivatePageState();
}

class _PrivatePageState extends State<PrivatePage> {
  bool overrideIndex = false;

  // Widget methodContent = updateMethodContent();
  int methodIndex = 0; // Index of the selected icon button, 0 for default
  int languageIndex = 2; // similar indexing for language
  final languages = ["Kiswahili", "Dholuo", "English"];
  final methods = MethodSelectionRepository.loadMethods();

  final Map<String, List<String>> videoContentMap = {
    "Kiswahili": [
      "videoAudio/videos/peer/peer2KS.mp4", // method 1 - condom
      "videoAudio/videos/peer/peer2KS.mp4",
      "videoAudio/videos/peer/peer2KS.mp4",
      "videoAudio/videos/peer/peer2KS.mp4",
      "videoAudio/videos/peer/peer2KS.mp4",
      "videoAudio/videos/peer/peer2KS.mp4",
      "videoAudio/videos/peer/peer2KS.mp4",
    ],
    "Dholuo": [
      "videoAudio/videos/peer/peer2DL.mp4",
      "videoAudio/videos/peer/peer2DL.mp4",
      "videoAudio/videos/peer/peer2DL.mp4",
      "videoAudio/videos/peer/peer2DL.mp4",
      "videoAudio/videos/peer/peer2DL.mp4",
      "videoAudio/videos/peer/peer2DL.mp4",
      "videoAudio/videos/peer/peer2DL.mp4",
    ],
    "English": [
      "videoAudio/videos/peer/peer2E.mp4",
      "videoAudio/videos/peer/peer2E.mp4",
      "videoAudio/videos/peer/peer2E.mp4",
      "videoAudio/videos/peer/peer2E.mp4",
      "videoAudio/videos/peer/peer2E.mp4",
      "videoAudio/videos/peer/peer2E.mp4",
      "videoAudio/videos/peer/peer2E.mp4",
    ],
  };

  final Map<String, List<String>> videoTitleMap = {
    "Kiswahili": ["Video: Mwenzio anaelezea"],
    "Dholuo": ["Video: Mbasni lero"],
    "English": ["Video: a peer explains"],
  };

  final Map<String, List<String>> audioContentMap = {
    "English": [
      'videoAudio/audio/private_audio/private_male_condom_E.mp3',
      'videoAudio/audio/private_audio/private_female_condom_E.mp3',
      'videoAudio/audio/private_audio/private_pills_E.mp3',
      'videoAudio/audio/private_audio/private_depo_E.mp3',
      'videoAudio/audio/private_audio/private_implant_E.mp3',
      'videoAudio/audio/private_audio/private_iucd_E.mp3',
      'videoAudio/audio/private_audio/private_epill_E.mp3',
    ],
    "Kiswahili": [
      'videoAudio/audio/private_audio/private_male_condom_K.mp3',
      'videoAudio/audio/private_audio/private_female_condom_K.mp3',
      'videoAudio/audio/private_audio/private_pills_K.mp3',
      'videoAudio/audio/private_audio/private_depo_K.mp3',
      'videoAudio/audio/private_audio/private_implant_K.mp3',
      'videoAudio/audio/private_audio/private_iucd_K.mp3',
      'videoAudio/audio/private_audio/private_epill_K.mp3',
    ],
    "Dholuo": [
      'videoAudio/audio/private_audio/private_male_condom_L.mp3',
      'videoAudio/audio/private_audio/private_female_condom_L.mp3',
      'videoAudio/audio/private_audio/private_pills_L.mp3',
      'videoAudio/audio/private_audio/private_depo_L.mp3',
      'videoAudio/audio/private_audio/private_implant_L.mp3',
      'videoAudio/audio/private_audio/private_iucd_L.mp3',
      'videoAudio/audio/private_audio/private_epill_L.mp3',
    ],
  };

  final Map<String, List<String>> subtitleAudioMap = {
    "English": ['videoAudio/audio/private_audio/private_subtitle_E.mp3'],
    "Kiswahili": ['videoAudio/audio/private_audio/private_subtitle_K.mp3'],
    "Dholuo": ['videoAudio/audio/private_audio/private_subtitle_L.mp3'],
  };

  final Map<String, List<String>> heyThisAudioMap = {
    "English": ['videoAudio/audio/heyThis_HIV_STI_E.mp3'],
    "Kiswahili": ['videoAudio/audio/heyThis_HIV_STI_K.mp3'],
    "Dholuo": ['videoAudio/audio/heyThis_HIV_STI_L.mp3'],
  };

  final Map<String, String> titleMap = {
    "Kiswahili": "Je, ninaweza kuiweka kwa usiri?",
    "Dholuo": "Bende anyalo kete mopondo?",
    "English": "Can I keep it private?"
  };

  final Map<String, String> subtitleTranslations = {
    "Kiswahili":
        "Baadhi ya watu wanataka kuweka njia yao ya matumizi ya faragha kutoka kwa washirika, wazazi na wengine. Gonga njia zilizo hapa chini ili kupata maelezo zaidi kuhusu faragha.",
    "Dholuo":
        "Jomoko dwaroga tiyo gi yore mag komo nyuol e yo mopondo ma joheragi, jonyuol kod jomamoko ok ong'eyo. Mul piny ebwo yore mag komo nyuol mondo ipuonjri matut ewi tiyo kodgi mopondo",
    "English":
        "Some people want to keep their method use private from partners, parents, and others. Tap on the below methods to learn more about privacy."
  };

  final Map<String, String> importantMessageTranslations = {
    "Kiswahili":
        "Hey! HII NI MUHIMU! Kondomu za kiume na za kike ndizo njia PEKEE za kukinga mimba ambazo pia huzuia Virusi Vya Ukimwi na magonjwa mengine ya zinaa!",
    "Dholuo":
        "HEY! MA EN GIMA BER NG'EYO! Rabo yunga mar chuo gi mine e yore geng'o ich KENDE ma bende geng'o kute mag ayaki kod nyae mamoko!",
    "English":
        "HEY! THIS IS IMPORTANT! Male and female condoms are the ONLY pregnancy prevention methods that also prevent HIV and other STIs!",
  };

  final Map<String, String> learnMoreTranslations = {
    "English": "Learn more",
    "Kiswahili": "Jifunze zaidi",
    "Dholuo": "Puonjri matut"
  };

  final Map<String, List<String>> contentDescriptionMap = {
    "Kiswahili": [
      "Ni wazi...hutaweza kuweka matumizi ya kondomu kuwa siri kutoka kwa mpenzi wako wakati yeye ndiye anayevaa kondomu! Hata unapotaka kutumia kondomu, inaweza kuwa vigumu ikiwa mpenzi wako hataki. Unaweza kuweka njia hii kuwa ya faragha kutoka kwa watu wengine, isipokuwa waipate nyumbani kwako au kwenye mkoba wako.",
      "Kondomu za kike labda zitatambuliwa na mpenzi wako, kwa kuwa zinaonekana kwa nje, mara nyingi unaweza kuzihisi wakati wa ngono, na zinaweza kutoa sauti wakati wa ngono. Unaweza kuweka njia hii kuwa ya faragha kutoka kwa watu wengine, isipokuwa waipate nyumbani kwako au kwenye mkoba wako.",
      "Inawezekana kuweka tembe za kila siku kuwa za faragha kutoka kwa watu ambao hawakai na wewe, lakini mpenzi au mtu mwingine anaweza kuzipata nyumbani kwako au kwenye mkoba wako. Unahitaji kumeza kidonge kila siku, kwa hivyo ukienda shule ya bweni au kusafiri mahali pengine unahitaji kuja na vidonge.",
      "Sindano (depo) ni moja ya njia za kibinafsi, kwani mara tu unapochomwa, hakuna mtu anayeweza kuona au kujua njia hiyo iko kwenye mwili wako na hauitaji kupeleka chochote nyumbani. Utahitaji kupata sindano kila baada ya miezi 3 kwenye kliniki au duka la dawa, ambayo inaweza kuwa ngumu kuelezea kwa wengine.",
      "Baadhi ya watu wanaona kuwa Implant ni cha faragha sana, lakini inawezekana kwamba wenzi au wengine wanaweza kuhisi Implant wakati wa kugusa mkono wako wa juu, au wanaweza kuona bandeji au kovu dogo baada ya kuwekewa.",
      "IUCD (coil) ni mojawapo ya njia za faragha, kwani huwezi kuiona au kujua iko baada ya kuwekwa kwenye tumbo la uzazi au uterasi. Ni nyuzi tu ziko nje ya tumbo la uzazi, na zimefichwa ndani ya uke. Washirika wengi hawawezi kuhisi nyuzi ikiwa hawajui IUCD iko. Wapenzi wengine wanaweza kulalamika kwa kubana au kuchomwa wakati wa ngono.",
      "E-pill ni rahisi kuweka faragha, isipokuwa kwa ukweli kwamba una kwenda na kununua. Unaweza kuinywa mara tu baada ya kuinunua na hakuna mtu anayeweza kujua kuwa umeitumia, kwa kuwa ni kidonge kimoja au mbili zilizochukuliwa kwa wakati mmoja na hakuna chochote unachopaswa kuleta nyumbani."
    ],
    "Dholuo": [
      "En gima ong'ere... ok obi nyalo tiyo gi rabo yunga e yo mopondo majaherani ok ong'eyo nikech en ema orwako rabo yunga! Kata ka idwaro tiyo gi rabo yunga, nyalo bedo matek ka jaherano ok dwar. Inyalo tiyo gi rabo yunga ma ji ok ong'eyo, mak mana ka giyude ei odi kata ei kibetini.",
      "Kondom mar joma mine ibiro ne gi jaherani, nikech gin gik ma inyalone gioko, inyako winjonjgi ekinde terruok, kendo ginyalo goyo koko ekinde terruok. Inyalo tiyo gi yorni e yo ma opondo ma jok ma moko ok ong'eyo, mak mana ka ng'ato oyudogi e odi kata e kibetini.",
      "En gima nyalore mondo iti gi pills ma pile ka pile mopondo ma joma ok odak kodi ok ng'e, to jaherani kata ng'at machielo nyalo yudogi ei ot kata e kibetini. Dwarore ni imuony pill achiel pile ka pile, koro ka idhi e boarding school kata idhi e wuoth kamachielo nyaka iting pills.",
      "Sindan [Depo] en achiel kuom yore mag komo nyuol ma opondo, nikech kosechuoyi, onge ng'ama nyalo nene kata ng'eyo ni yath nitie e dendi kendo onge gima dwarore ni idhi godo dala. Biro dwarore ni ochuoyi sindan ban dweche 3 ka dweche 3 e klinik kata e od yath, ma nyako bedoni matek lero ne jomoko. ",
      "Jomoko nenoga ni Implant en yor komo nyuol ma opondo, to en gima nyalore ni johera kata jomoko nyalo winjo implant ka gimulo malo mar badi, kata nyalo neno bandej kata mbala matin bang koseket implant.",
      "IUCD [koil] en achiel kuom yore mag komo nyuol mopondo, nikech ok inyal nene kata ng'eyo ni en tie bang ka osesoye e ofuko mar nyuol. Mana tonde ema ni oko mar ofuko nyuol, kendo gipondo ei duong miyo. Ng'eny johera ok nyal winjo tonde ka gikia ni IUCD nitie eiye kanyo, Johera moko nyalo winjo ka nitie dhuno kata chuopo ekinde ma ubedo e achiel.",
      "E-pill yot mondo iti godo e yo mopondo, makmana e adiera ni nyaka idhi ing'iewe. Inyalo muonye bang nyiewe sano sano kendo onge ng'ama nyalo ng'eyo ni ne itiyo kode, nikech en adila achiel kata ariyo ma imuonyo dichiel kanyakla kendo onge gima nyaka iting' idhi godo dala."
    ],
    "English": [
      "Obviously...you won't be able to keep condom use private from your partner when he is the one who wears the condom! Even when you want to use a condom, it can be difficult if your partner doesn't want to. You can keep this method private from others, unless they find one at your home or in your purse.",
      "Female condoms will probably be noticed by your partner, since they are visible on the outside, you can often feel them during sex, and they can make a sound during sex. You can keep this method private from others, unless they find one at your home or in your purse.  ",
      "It is possible to keep daily pills private from people who do not stay with you, but a partner or someone else could find them at your home or in your purse. You need to take a pill every day, so if you go boarding school or travel somewhere else you need to bring pills with you. ",
      "The injection (depo) is one of the most private methods, as once you are injected, no one can see or know the method is in your body and you do not need to take anything home. You will need to get an injection every 3 months at a clinic or pharmacy though, which could be hard to explain to others. ",
      "Some people find the implant very private, but it is possible that partners or others could feel the implant when touching your upper arm, or could see the bandage or small scar after the implant is placed. ",
      "The IUCD (coil) is one of the most private methods, as you cannot see it or know it is there after it is placed in the womb or uterus. Only the strings are outside of the womb, and they are hidden inside the vagina. Most partners cannot feel the strings if they do not know the IUCD is there. Some partners might complain of pinching or poking during sex. ",
      "The E-pill is easy to keep private, except for the fact that you have to go and buy it. You can take it right after you buy it and no one can know that you used it, since it is one or two pills taken at the same time and there is nothing you have to bring home."
    ],
  };

  List<Map<String, dynamic>> iconButtons = [
    {'icon': MaraIcons.condom, 'label': "Condom", 'index': 0},
    {'icon': MaraIcons.female_condom, 'label': "Female Condom", 'index': 1},
    {
      'icon': MaraIcons.birth_control_pills,
      'label': "Pills (daily pills)",
      'index': 2
    },
    {'icon': MaraIcons.syringe, 'label': "Injection (depo)", 'index': 3},
    {'icon': MaraIcons.contraceptive_implant, 'label': "Implant", 'index': 4},
    {'icon': MaraIcons.iud, 'label': "IUCD (coil)", 'index': 5},
    {
      'icon': MaraIcons.double_pills,
      'label': "Emergency pill (E-pill, P2)",
      'index': 6
    }
  ];
  final double _aspectRatio = 16 / 10;

  String _currentLanguage = 'English';

  @override
  void initState() {
    _loadCurrentLanguage();
    SessionManager.logScreenEntry(
        'PrivatePage'); // Log entry time when the screen is initialized
  }

  @override
  void dispose() {
    SessionManager.logScreenExit(
        'PrivatePage'); // Log exit time and calculate duration when leaving the screen
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
    final int? routeArgumentIndex =
        ModalRoute.of(context)?.settings.arguments as int?;

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
          // child: SingleChildScrollView(
          //     child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
                child: Text(
              titleMap[languages[languageIndex]] ?? "Title not found",
              style: TextStyle(
                  fontFamily: 'PoetsenOne',
                  color: MaraColors.purple,
                  fontSize: 36.0),
              textAlign: TextAlign.center,
            )),
            SizedBox(height: availableHeight * 0.01),
            subtitleSection(),
            SizedBox(height: 15.0),
            methodSelectionRow(),
            SizedBox(height: 15.0),
            contentArea(),
            SizedBox(
              width: boxWidth * 0.8,
              height: availableHeight * 0.5 * 0.6,
              child: Center(
                child: getVideoContent(),
              ),
            ),
            additionalTextSection(),
          ],
        )
        // )
        // ),
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

  // Widget methodSelectionRow() {
  //   return SingleChildScrollView(
  //     scrollDirection: Axis.horizontal,
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //       children: buildIconButtons(),
  //     ),
  //   );
  // }

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

  Widget buildIconButton(IconData iconData, String caption, int index) {
    bool isSelected = index == methodIndex;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Column(
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
                SessionManager.logEvent("PrivatePage-Method$methodIndex",
                    methods[methodIndex]!.name);
                print(
                    "PrivatePage-Method$methodIndex ${methods[methodIndex]!.name}");
              });
            },
            splashRadius: 40,
            splashColor: Colors.grey.withOpacity(0.5),
            highlightColor: Colors.transparent,
          ),
          SizedBox(height: 5),
          Container(
            width: 100,
            child: Text(
              caption,
              softWrap: true,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isSelected ? Colors.black : Colors.grey,
              ),
            ),
          ),
        ],
      ),
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
          //updateMethodContent();
          //video1 = updateVideoContent1();
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.grey : null,
      ),
      child: Text(language),
    );
  }

  Widget subtitleSection() {
    return Container(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
          child: Row(
            children: [
              getAudio(subtitleAudioMap, 0),
              Expanded(
                child: Text(
                  subtitleTranslations[languages[languageIndex]] ??
                      "Translation not found",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ));
  }

  Widget additionalTextSection() {
    return Padding(
      padding: EdgeInsets.only(right: 10.0),
      child: Column(
        children: [
          // Only display this section for certain method indices
          if (methodIndex == 0 || methodIndex == 1)
            // Padding(
            //   padding: EdgeInsets.only(bottom: 10.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
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
                      SizedBox(width: 10),
                      Flexible(
                        child: Text(
                          importantMessageTranslations[
                                  languages[languageIndex]] ??
                              "Important message not found",
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ])),
              ],
            ),
          // ),
          // Button for learning more, only shown for condoms
          if (methodIndex == 0 || methodIndex == 1)
            ElevatedButton.icon(
              icon: ImageIcon(AssetImage('assets/misc-icons/question.png'),
                  color: Colors.black, size: 45),
              label: Text(
                  learnMoreTranslations[languages[languageIndex]] ??
                      "Learn more",
                  style: TextStyle(fontSize: 20.0, color: Colors.black)),
              style: ElevatedButton.styleFrom(
                backgroundColor: MaraColors.lavender,
                // Button background color
                foregroundColor: Colors.black,
                //padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HIVPage()),
                );
              },
            ),
        ],
      ),
    );
  }

  Widget contentArea() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        // Add SingleChildScrollView here
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
                getAudio(audioContentMap, methodIndex),
              ]),
              SizedBox(width: 10.0),
              Flexible(
                child: Text(
                  contentDescriptionMap[languages[languageIndex]]![methodIndex],
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      color: Colors.white,
                      fontSize: 22.0),
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
  //         fontSize: 22.0,
  //         color: Colors.black,
  //       ));
  // }

  Widget getVideoContent() {
    String asset = videoContentMap[languages[languageIndex]]![methodIndex];
    String title = videoTitleMap[languages[languageIndex]]![0];
    return VideoWidget(videoAsset: asset, title: title);
  }

  Widget getAudio(Map<String, List<String>> audioMap, int audioIndex) {
    return AudioWidget(
        audioAsset: audioMap[languages[languageIndex]]![audioIndex]);
  }
}
