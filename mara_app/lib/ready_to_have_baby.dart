import 'package:flutter/material.dart';
import 'prep_preg.dart';
import 'video.dart';
import 'audio.dart';
import 'package:mara_app/hiv_page.dart';
import 'package:mara_app/icons/mara_icons_icons.dart';
import 'package:mara_app/design/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'session_manager.dart';
import 'model/method_selection_repository.dart';
import 'package:mara_app/recommendation_model.dart';

class ReadyPage extends StatefulWidget {
  @override
  _ReadyPageState createState() => _ReadyPageState();
}

class _ReadyPageState extends State<ReadyPage> {
  Widget methodContent = Text('DUMMY');
  int methodIndex = 0; // Index of the selected icon button, 0 for default
  int languageIndex = 2; // Index for language
  final languages = ["Kiswahili", "Dholuo", "English"];
  bool overrideIndex = false; // Used to override language selection from route
  final methods = MethodSelectionRepository.loadMethods();

  final Map<String, String> titleMap = {
    'Kiswahili': 'Je, itakuaje ikiwa niko tayari kupata mtoto?',
    'Dholuo': 'To ka ayikora mar mako ich to?',
    'English': 'What if I\'m ready to have a baby?'
  };

  final Map<String, String> importantMessage_pregnant_Translations = {
    'Kiswahili':
        'HEY! HII NI MUHIMU! Kutumia njia za kukinga mimba HAKUTA badilisha uwezo wako wa kupata mimba katika siku zijazo!',
    'Dholuo':
        'HEY! MA EN GIMA BER NG\'EYO! Tiyo gi yore mag geng\'o ich OK bi loko nyaloni mar mako ich e ndalo mabiro!',
    'English':
        'HEY! THIS IS IMPORTANT! Using pregnancy prevention methods will NOT change your ability to get pregnant in the future!',
  };

  // 'LEARN MORE about the fertility considerations of each method': {
  //   'Kiswahili': 'JIFUNZE ZAIDI kuhusu masuala ya uzazi ya kila mbinu',
  //   'Dholuo':
  //       'PUONJRI MATUT ewi nyaloni mar mako ich gi yor komo nyuol ka yor komo nyuol.',
  //   'English': 'LEARN MORE about the fertility considerations of each method',
  // },
  final Map<String, String> prep_preg_Translations = {
    'Kiswahili': 'Kujiandaa kwa ujauzito wenye afya',
    'Dholuo': 'Yikruok ne ich man gi ngima',
    'English': 'Preparing for a healthy pregnancy',
  };

  final Map<String, List<String>> heyThis_baby_AudioMap = {
    "English": ['videoAudio/audio/ready_for_baby_audio/heyThis_pregnant_E.mp3'],
    "Kiswahili": [
      'videoAudio/audio/ready_for_baby_audio/heyThis_pregnant_K.mp3'
    ],
    "Dholuo": ['videoAudio/audio/ready_for_baby_audio/heyThis_pregnant_L.mp3'],
  };

  // final Map<String, Map<String, String>> _videos = {
  //   'assets': {
  //     'Kiswahili': 'videoAudio/videos/provider/provider4KS.mp4',
  //     'Dholuo': 'videoAudio/videos/provider/provider4DL.mp4',
  //     'English': 'videoAudio/videos/provider/provider4E.mp4',
  //   },
  //   'titles': {
  //     'Kiswahili': 'Video: Mtoa huduma wa afya anaelezea',
  //     'Dholuo': 'Video: Jachiw thieth lero',
  //     'English': 'Video: a provider explains',
  //   }
  // };

  final Map<String, List<String>> videoContentMap = {
    "Kiswahili": [
      "videoAudio/videos/provider/provider4KS.mp4", // method 1 - condom
      "videoAudio/videos/provider/provider4KS.mp4",
      "videoAudio/videos/provider/provider4KS.mp4",
      "videoAudio/videos/provider/provider4KS.mp4",
      "videoAudio/videos/provider/provider4KS.mp4",
      "videoAudio/videos/provider/provider4KS.mp4",
      "videoAudio/videos/provider/provider4KS.mp4"
    ],
    "Dholuo": [
      "videoAudio/videos/provider/provider4DL.mp4",
      "videoAudio/videos/provider/provider4DL.mp4",
      "videoAudio/videos/provider/provider4DL.mp4",
      "videoAudio/videos/provider/provider4DL.mp4",
      "videoAudio/videos/provider/provider4DL.mp4",
      "videoAudio/videos/provider/provider4DL.mp4",
      "videoAudio/videos/provider/provider4DL.mp4",
    ],
    "English": [
      "videoAudio/videos/provider/provider4E.mp4",
      "videoAudio/videos/provider/provider4E.mp4",
      "videoAudio/videos/provider/provider4E.mp4",
      "videoAudio/videos/provider/provider4E.mp4",
      "videoAudio/videos/provider/provider4E.mp4",
      "videoAudio/videos/provider/provider4E.mp4",
      "videoAudio/videos/provider/provider4E.mp4",
    ],
  };

  final Map<String, List<String>> videoTitleMap = {
    "Kiswahili": ["Video: Mtoa huduma wa afya anaelezea"],
    "Dholuo": ["Video: Jachiw thieth lero"],
    "English": ["Video: a provider explains"],
  };

  final Map<String, List<String>> audioContentMap = {
    "English": [
      'videoAudio/audio/ready_for_baby_audio/what_if_condom_E.mp3',
      'videoAudio/audio/ready_for_baby_audio/what_if_condom_E.mp3',
      'videoAudio/audio/ready_for_baby_audio/what_if_pills_E.mp3',
      'videoAudio/audio/ready_for_baby_audio/what_if_depo_E.mp3',
      'videoAudio/audio/ready_for_baby_audio/what_if_implant_E.mp3',
      'videoAudio/audio/ready_for_baby_audio/what_if_iucd_E.mp3',
      'videoAudio/audio/ready_for_baby_audio/what_if_epill_E.mp3',
    ],
    "Kiswahili": [
      'videoAudio/audio/ready_for_baby_audio/what_if_condom_K.mp3',
      'videoAudio/audio/ready_for_baby_audio/what_if_condom_K.mp3',
      'videoAudio/audio/ready_for_baby_audio/what_if_pills_K.mp3',
      'videoAudio/audio/ready_for_baby_audio/what_if_depo_K.mp3',
      'videoAudio/audio/ready_for_baby_audio/what_if_implant_K.mp3',
      'videoAudio/audio/ready_for_baby_audio/what_if_iucd_K.mp3',
      'videoAudio/audio/ready_for_baby_audio/what_if_epill_K.mp3',
    ],
    "Dholuo": [
      'videoAudio/audio/ready_for_baby_audio/what_if_condom_L.mp3',
      'videoAudio/audio/ready_for_baby_audio/what_if_condom_L.mp3',
      'videoAudio/audio/ready_for_baby_audio/what_if_pills_L.mp3',
      'videoAudio/audio/ready_for_baby_audio/what_if_depo_L.mp3',
      'videoAudio/audio/ready_for_baby_audio/what_if_implant_L.mp3',
      'videoAudio/audio/ready_for_baby_audio/what_if_iucd_L.mp3',
      'videoAudio/audio/ready_for_baby_audio/what_if_epill_L.mp3',
    ],
  };

  final Map<String, List<String>> heyThisAudioMap = {
    "English": ['videoAudio/audio/heyThis_HIV_STI_E.mp3'],
    "Kiswahili": ['videoAudio/audio/heyThis_HIV_STI_K.mp3'],
    "Dholuo": ['videoAudio/audio/heyThis_HIV_STI_L.mp3'],
  };

  final Map<String, String> subtitleTranslations = {
    "English":
        "Tap each method to learn more about its fertility consideration.",
    "Kiswahili":
        "Gusa kila njia ili ujifunze zaidi kuhusu mchango wake kwenye uzazi.",
    "Dholuo": "Tuo wuodi matin to ok nang'o chuny gi tim ber."
  };
  final Map<String, String> titleTranslations = {
    "English": "What if I'm ready to have a baby?",
    "Kiswahili": "Je, itakuaje ikiwa niko tayari kupata mtoto?",
    "Dholuo": "To ka ayikora mar mako ich to?"
  };

  final Map<String, String> importantMessage_hiv_sti_Translations = {
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
      "Kondomu haina athari kwenye mwili wako zaidi ya kuzuia mbegu za mpenzi wako kuingia ndani ya mwili wako. Ikiwa unatumia kondomu na uko tayari kupata mtoto, unaweza kuacha tu kuzitumia. Kumbuka, hata hivyo, kwamba ukiacha kutumia kondomu huwezi kulindwa dhidi ya Virusi Vya Ukimwi au magonjwa mengine ya zinaa.",
      "Kondomu haina athari kwenye mwili wako zaidi ya kuzuia mbegu za mpenzi wako kuingia ndani ya mwili wako. Ikiwa unatumia kondomu na uko tayari kupata mtoto, unaweza kuacha tu kuzitumia. Kumbuka, hata hivyo, kwamba ukiacha kutumia kondomu huwezi kulindwa dhidi ya Virusi Vya Ukimwi au magonjwa mengine ya zinaa.",
      "Siku chache baada ya kuacha dawa za kila siku, mwili wako utarudi kwenye kiwango chako cha kawaida cha uzazi. Hata kama hujawahi kupata mimba, au ikiwa unatumia vidonge kwa miaka mingi, haitakuwa vigumu zaidi kupata mimba baadaye kwa kutumia vidonge.",
      "Kutumia sindano (depo) sio hatari kwa uwezo wako wa baadaye wa kupata mimba - hata kama hujawahi kupata mimba, au hedhi zako zitakoma. Ikiwa unataka kupata mjamzito, acha kupata sindano na uiruhusu kuzima. Watu wengi hurudi kwenye uwezo wao wa kushika mimba mara tu baada ya kudungwa sindano inayofuata, lakini kwa baadhi ya watu huchukua muda mrefu zaidi, hadi takriban miezi 6. Ikiwa unataka kupata mimba katika miezi 6 ijayo, njia tofauti inaweza kuwa chaguo bora kwako.",
      "Siku chache baada ya implant kuondolewa, mwili wako utarudi kwenye kiwango chako cha kawaida cha uzazi. Hii ni kweli ikiwa umewahi kupata ujauzito au kuzaliwa. Kwa hiyo, unapokuwa tayari kwa mimba, unaweza tu kuondoa implant!",
      "Unaweza kupata mimba mara moja baada ya kuondolewa kwa IUCD (coil)! Kwa hivyo ni sawa kutumia IUCD hadi utakapotaka kupata ujauzito. IUCD haina homoni ndani yake, hivyo mara tu inapoondolewa, ni vizuri kwenda!",
      "E-pill ni ya muda mfupi sana. Hata ukiichukua sana, haitakufanya ushindwe kupata mimba katika siku zijazo. E-pill haidhuru mwili wako kwa njia yoyote, lakini pia haifanyi kazi vizuri kuzuia mimba kwa matumizi ya kawaida.",
    ],
    "Dholuo": [
      "Rabo yunga onge gi rach moro amora e dendi kopogore gi geng'o pi nyodo mar jaherani donjo ei dendi. Ka itiyo gi rabo yunga kendo iyikori mar yudo nyathi, inyalo mana weyo tiyo kodgi. Ng'e gi pachi ni, ka iweyo tiyo gi rabo yunga ok ibi bedo ni igeng'ori kuom yudo kute mag ayaki kata nyae mamoko. ",
      "Rabo yunga onge gi rach moro amora e dendi kopogore gi geng'o pi nyodo mar jaherani donjo ei dendi. Ka itiyo gi rabo yunga kendo iyikori mar yudo nyathi, inyalo mana weyo tiyo kodgi. Ng'e gi pachi ni, ka iweyo tiyo gi rabo yunga ok ibi bedo ni igeng'ori kuom yudo kute mag ayaki kata nyae mamoko. ",
      "Ndalo machuok bang weyo muonyo pills mapile ka pile, dendi biro dok e nyaloni mar mako ich mapile. Kata ka pok ne imakoga ich, kata ka isetiyo gi pills kuom higni mang'eny, ok bi bedo matek mako ich e ndalo mabiro ka itiyo gi pills. ",
      "Tiyo gi sindan [Depo] ok kel hinyruok e nyaloni mar mako ich e ndalo mabiro - kata ka pok ne imako ich, kata remo mar dwe ochung. ka idwaro mako ich, we dhi e sindan aeto irit orum e dendi. Ng'eny ji dok e nyalogi mar mako ich ndalo matin kapok oromo chieng gi mar dok e sindan machielo, to ne joma moko nyalo kao thuolo malach, kata nyaka dweche 6. Ka idwaro mako ich e dweche 6 mabiro, yo machielo mar geng'o ich nyalo bedo yiero maber ne in. ",
      "Ndalo machuok bang golo IUCD, dendi biro dok kaka ne entie e thuolo mar mako ich. Ma en adier kata bed ni ne pok imako ich kata nyuol. Koro ka iseyikori mar mako ich, inyalo mana dhi mondo ogolni Implant.",
      "Inyalo mako ich mapiyo bang ka igolo IUCD [koil]! Koro en gima ni kare tiyo gi IUCD nyaka kinde ma idwaro make ich. IUCD onge gi homons kuome, koro bang ka isegole, to in mana kare dhi nyime!",
      "E-pill en yath matiyo e kinde matin. Kata ka imuonyo mang'eny, ok obi miyo ibed ni ok inyal mako ich e ndalo mabiro. E-pill ok keth dendi e yo moro amora, to bende ok oti maber e gengo ich ka itiyo kode anuoya.",
    ],
    "English": [
      "Condoms have no effect on your body other than to block your partner's sperm from going inside your body. If you use condoms and are ready to have a baby, you can just stop using them. Keep in mind, though, that if you stop using condoms you won't be protected from HIV or other STIs. ",
      "Condoms have no effect on your body other than to block your partner's sperm from going inside your body. If you use condoms and are ready to have a baby, you can just stop using them. Keep in mind, though, that if you stop using condoms you won't be protected from HIV or other STIs.",
      "A few days after stopping daily pills, your body will return to your normal level of fertility. Even if you have never had a pregnancy, or if use pills for many years, it will not be more difficult to get pregnant later using pills.",
      "Using the injection (depo) is not harmful to your future ability to get pregnant - even if you have never had a pregnancy, or your periods stop. If you want to get pregnant, stop getting the injection and let it wear off. Most people return to their normal fertility soon after the next injection was due, but for some people it takes longer, up to about 6 months. If you want to get pregnant in the next 6 months, a different method might be a better choice for you.",
      "A few days after having the implant removed, your body will return to your normal level of fertility. This it true whether or not you have ever had a pregnancy or a birth. So, when you are ready for a pregnancy, you can just have the implant removed! ",
      "You can get pregnant right away after having an IUCD (coil) removed! So it's OK to use the IUCD until you want to have a pregnancy. The IUCD has no hormones in it, so once it is removed, you are good to go!",
      "The E-pill is very short-acting. Even if you take it a lot, it won't make you less able to get pregnant in the future. The E-pill doesn't damage your body in any way, but also does not work well to prevent pregnancy with regular use. ",
    ],
  };

  final double _aspectRatio = 16 / 10;

  // String _t(String key) {
  //   return _translations[key]?[_currentLanguage] ?? key;
  // }

  // String _getAsset() {
  //   return videoContentMap['assets']?[_currentLanguage] ?? 'Asset not found';
  // }

  // String _getTitle() {
  //   return videoTitleMap['titles']?[_currentLanguage] ?? 'Title not found';
  // }

  // void _changeLanguage(String language) {
  //   setState(() {
  //     _currentLanguage = language;
  //   });
  // }
  String _currentLanguage = 'English';

  @override
  void initState() {
    _loadCurrentLanguage();
    SessionManager.logScreenEntry(
        'ReadytoHaveBabyPage'); // Log entry time when the screen is initialized
  }

  @override
  void dispose() {
    SessionManager.logScreenExit(
        'ReadytoHaveBabyPage'); // Log exit time and calculate duration when leaving the screen
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
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Center(
              child: Text(
            titleMap[languages[languageIndex]] ?? "Title not found",
            style: TextStyle(
                fontFamily: 'PoetsenOne',
                color: MaraColors.purple,
                fontSize: 36.0),
            textAlign: TextAlign.center,
          )),
          customListTile(
            imagePath: 'assets/ready_to_have_baby_pregnant.png',
            title: importantMessage_pregnant_Translations[
                    languages[languageIndex]] ??
                "Important message not found",
          ),
          // SizedBox(height: 5.0),
          methodSelectionRow(),
          SizedBox(height: 15.0),
          Expanded(
              // child:
              //height: containerHeight * 0.6, // Adjust as needed
              // RawScrollbar(
              //   thumbColor: const Color.fromARGB(255, 232, 132, 165),
              //   thumbVisibility: true,
              //   trackVisibility: false,
              //   thickness: 25.0,
              //   radius: Radius.circular(20),
              //   child: LayoutBuilder(
              //     builder: (context, constraint) {
              //       return SingleChildScrollView(
              //           child: ConstrainedBox(
              //               constraints:
              //                   BoxConstraints(minHeight: constraint.maxHeight),
              child: IntrinsicHeight(
                  child: Flex(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      direction: Axis.vertical,
                      children: [
                contentArea(),
                additionalTextSection(),
                SizedBox(
                  width: boxWidth * 0.6,
                  height: boxHeight * 0.4 * 0.6,
                  child: Center(
                    child: getVideoContent(),
                  ),
                ),
                prep_preg_Button(),
              ]))
              //             )
              //         );
              //       }
              //     )
              // ),
              // contentArea(),
              // additionalTextSection(),
              // SizedBox(
              //     width: boxWidth * 0.8,
              //     height: availableHeight * 0.6 * 0.5,
              //     child: Center(
              //       child: getVideoContent(),
              //     ),
              // ),
              // prep_preg_Button(),
              )
        ]));
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
                // updateMethodContent();
                SessionManager.logEvent(
                    "ReadytoHaveBabyPage-MethodSelected", RecommendationModel.getJsonRefFromName_page(methods[methodIndex]!.name));
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
          // updateMethodContent();
          //video1 = updateVideoContent1();
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.grey : null,
      ),
      child: Text(language),
    );
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

  Widget subtitleSection() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        subtitleTranslations[languages[languageIndex]] ??
            "Translation not found",
        style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget additionalTextSection() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: [
          // Only display this section for certain method indices
          if (methodIndex == 0 || methodIndex == 1)
            // Padding(
            // padding: EdgeInsets.only(bottom: 10.0),
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
                          importantMessage_hiv_sti_Translations[
                                  languages[languageIndex]] ??
                              "Important message not found",
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 16.0,
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
                      "Learn More",
                  style: TextStyle(fontSize: 20.0, color: Colors.black)),
              style: ElevatedButton.styleFrom(
                backgroundColor: MaraColors.lavender,
                // Button background color
                foregroundColor: Colors.black,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HIVPage(),
                  ),
                );
              },
            ),
          SizedBox(height: 10)

          // ElevatedButton.icon(
          //   icon: ImageIcon(AssetImage('assets/misc-icons/question.png'),
          //       color: Colors.black,
          //       size:45
          //       ),
          //   label: Text(
          //       learnMoreTranslations[languages[languageIndex]] ??
          //           "Learn more",
          //       style: TextStyle(fontSize: 20.0, color: Colors.black)
          //     ),
          //   style: ElevatedButton.styleFrom(
          //     backgroundColor: MaraColors.lavender,
          //     // Button background color
          //     padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          //   ),
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => HIVPage()),
          //     );
          //   },
          // ),
        ],
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
                getAudio(audioContentMap, methodIndex),
              ],
            ),
            SizedBox(width: 10.0),
            Flexible(
              child: Text(
                contentDescriptionMap[languages[languageIndex]]![methodIndex],
                style: TextStyle(
                    fontFamily: 'Roboto', color: Colors.white, fontSize: 19.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void updateMethodContent() {
    methodContent = Text(
      contentDescriptionMap[languages[languageIndex]]![methodIndex],
      style: TextStyle(fontSize: 20.0, color: Colors.white),
    );
  }

  Widget customListTile(
      {required String imagePath,
      //required String header,
      required String title}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 3.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 5.0), // Increased height for more spacing
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                imagePath,
                width: 170, // Adjust width
                height: 170, // Adjust height
                fit: BoxFit.contain,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  subtitleSection(),
                  SizedBox(height: 15.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          getAudio(heyThis_baby_AudioMap, 0),
                        ],
                      ),
                      SizedBox(width: 8.0),
                      Expanded(
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                            ImageIcon(
                                AssetImage('assets/misc-icons/important.png'),
                                size: 50.0,
                                color: Colors.black),
                            Flexible(
                              child: Text(
                                title,
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ])),
                    ],
                  ),
                ],
              )),
            ],
          ),
        ],
      ),
    );
  }

  Widget prep_preg_Button() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ElevatedButton.icon(
        icon: ImageIcon(AssetImage('assets/misc-icons/check_mark.png'),
            color: Colors.black, size: 45),
        label: Text(
          prep_preg_Translations[languages[languageIndex]] ?? "Label not found",
          style: TextStyle(fontSize: 22.0),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: MaraColors.lavender,
          // Button background color
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
    );
  }

  // Widget getVideoContent() {
  //   String asset = videoContentMap[languages[languageIndex]]![methodIndex];
  //   String title = videoTitleMap[languages[languageIndex]]![0];
  //   return VideoWidget(videoAsset: asset, title: title);
  // }

  Widget getVideoContent() {
    String asset = videoContentMap[languages[languageIndex]]![methodIndex];
    String title = videoTitleMap[languages[languageIndex]]![0];
    return VideoWidget(
      videoAsset: asset,
      title: title,
    );
  }

  void handleVideoStart(String videoName) {
    SessionManager.logVideoStart(videoName, DateTime.now());
  }

  void handleVideoEnd(int duration) {
    String videoName = videoContentMap[languages[languageIndex]]![methodIndex];
    SessionManager.logVideoStop(videoName, DateTime.now(), duration);
  }

  Widget getAudio(Map<String, List<String>> audioMap, int audioIndex) {
    return AudioWidget(audioAsset: audioMap[_currentLanguage]![audioIndex]);
  }
}
