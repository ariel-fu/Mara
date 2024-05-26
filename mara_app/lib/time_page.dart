import 'package:flutter/material.dart';
import 'package:mara_app/bleeding.dart';
import 'package:mara_app/icons/mara_icons_icons.dart';
import 'package:mara_app/hiv_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'audio.dart';
import 'package:mara_app/design/colors.dart';

class TimePage extends StatefulWidget {
  const TimePage({Key? key}) : super(key: key);

  @override
  State<TimePage> createState() => _TimePageState();
}

class _TimePageState extends State<TimePage> {
  bool overrideIndex = false;
  // Widget methodContent = updateMethodContent();
  int methodIndex = 0; // Index of the selected icon button, 0 for default
  int languageIndex = 2; // similar indexing for language
  final languages = ["Kiswahili", "Dholuo", "English"];

  String _currentLanguage = 'English';
  @override
  void initState() {
    super.initState();
    _loadCurrentLanguage();
  }

  Future<void> _loadCurrentLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _currentLanguage = prefs.getString('selectedLanguage') ?? 'English';
    });
    if (_currentLanguage.contains('English')) {
      languageIndex= 2;
    } else if (_currentLanguage.contains('Dholuo')) {
      languageIndex = 1;
    } else {
      languageIndex = 0;
    }
  }

  final Map<String, List<String>> audioContentMap = {
    "English": [
      'videoAudio/audio/how_long_audio/how_long_condom_E.mp3',
      'videoAudio/audio/how_long_audio/how_long_condom_E.mp3',
      'videoAudio/audio/how_long_audio/how_long_pills_E.mp3',
      'videoAudio/audio/how_long_audio/how_long_depo_E.mp3',
      'videoAudio/audio/how_long_audio/how_long_implant_E.mp3',
      'videoAudio/audio/how_long_audio/how_long_iucd_E.mp3',
      'videoAudio/audio/how_long_audio/how_long_epill_E.mp3',
    ],
    "Kiswahili": [
      'videoAudio/audio/how_long_audio/how_long_condom_K.mp3',
      'videoAudio/audio/how_long_audio/how_long_condom_K.mp3',
      'videoAudio/audio/how_long_audio/how_long_pills_K.mp3',
      'videoAudio/audio/how_long_audio/how_long_depo_K.mp3',
      'videoAudio/audio/how_long_audio/how_long_implant_K.mp3',
      'videoAudio/audio/how_long_audio/how_long_iucd_K.mp3',
      'videoAudio/audio/how_long_audio/how_long_epill_K.mp3',
    ],
    "Dholuo": [
      'videoAudio/audio/how_long_audio/how_long_condom_L.mp3',
      'videoAudio/audio/how_long_audio/how_long_condom_L.mp3',
      'videoAudio/audio/how_long_audio/how_long_pills_L.mp3',
      'videoAudio/audio/how_long_audio/how_long_depo_L.mp3',
      'videoAudio/audio/how_long_audio/how_long_implant_L.mp3',
      'videoAudio/audio/how_long_audio/how_long_iucd_L.mp3',
      'videoAudio/audio/how_long_audio/how_long_epill_L.mp3',
    ],
  };

  final Map<String, List<String>> heyThisAudioMap = {
    "English": [
      'videoAudio/audio/heyThis_HIV_STI_E.mp3'
    ],
    "Kiswahili": [
      'videoAudio/audio/heyThis_HIV_STI_K.mp3'
    ],
    "Dholuo": [
      'videoAudio/audio/heyThis_HIV_STI_L.mp3'
    ],
  };

  // final Map<String, String> subtitleTranslations = {
  //   "Kiswahili": "Baadhi ya watu wanataka kuweka njia yao ya matumizi ya faragha kutoka kwa washirika, wazazi na wengine. Gonga njia zilizo hapa chini ili kupata maelezo zaidi kuhusu faragha.",
  //   "Dholuo": "Jomoko dwaroga tiyo gi yore mag komo nyuol e yo mopondo ma joheragi, jonyuol kod jomamoko ok ong'eyo. Mul piny ebwo yore mag komo nyuol mondo ipuonjri matut ewi tiyo kodgi mopondo",
  //   "English": "Some people want to keep their method use private from partners, parents, and others. Tap on the below methods to learn more about privacy."
  // };

  final Map<String, String> titleTranslations = {
  "English": "How long does the method work?", 
  "Kiswahili": "Mbinu hiyo inafanya kazi kwa muda gani?", 
  "Dholuo": "Yor ni tiyo kuom kinde marom nade?"
  };

  final Map<String, String>  whyTranslations = {
    "Kiswahili": "KWA NINI?",
    "Dholuo": "NANG'O?",
    "English": "WHY?",
  };

  final Map<String, List<String>> contentDescriptionMap = {
    "Kiswahili": [
      "Ili kuzuia mimba, unahitaji kutumia kondomu kila mara unapofanya ngono. Inaweza kuwa changamoto sana kutabiri siku zako salama, kwa hivyo kondomu zinahitajika kutumika kila wakati unapojamiiana ili kufanya kazi vizuri.",
      "Ili kuzuia mimba, unahitaji kutumia kondomu kila mara unapofanya ngono. Inaweza kuwa changamoto sana kutabiri siku zako salama, kwa hivyo kondomu zinahitajika kutumika kila wakati unapojamiiana ili kufanya kazi vizuri.",
      "Vidonge vya kila siku vinahitaji kuchukuliwa kila siku ili kuzuia mimba. Ukikosa vidonge, mwili wako unaweza kutoa yai, na unaweza kupata mimba. Inaweza kusaidia kumeza kidonge chako cha kila siku kama sehemu ya utaratibu, kama vile kabla ya kulala, au kabla ya kuanza siku yako asubuhi.",
      "Sindano (depo) hudumu kwa miezi 3. Ikiwa umechelewa kwa zaidi ya wiki 2 kwa picha yako inayofuata, unaweza kupata mimba, kwa hivyo ni vizuri kukaa kwenye ratiba ikiwa unataka kuzuia mimba!",
      "Implant hudumu kwa miaka 3 (Nexplanon) au miaka 5 (Jadelle), kulingana na aina gani unayopata. Ikiwa hupendi au unataka kupata mimba, unaweza kuiondoa wakati wowote unapotaka - huna kusubiri miaka 3-5! Kipandikizi kinaweza kuwa njia nzuri hata kwa mwaka mmoja au miwili tu.",
      "IUCD (coil) inafanya kazi hadi miaka 12! Watu wengi hawaihifadhi kwa muda mrefu hivyo, na wanaweza kuitumia kwa mwaka mmoja au miwili. Unaweza kuondoa IUCD wakati wowote unapotaka, ikiwa hupendi au unataka kupata mimba.",
      "E-pill (P2) haifanyi kazi kwa muda fulani, lakini inakusudiwa kupunguza uwezekano wa kupata mimba baada ya kufanya ngono. Usifikiri kwamba bado itafanya kazi ikiwa utafanya ngono tena siku moja au mbili baada ya kumeza E-pill...ni bora kutumia njia tofauti kama njia yako ya kawaida!"
    ],
    "Dholuo": [
      "Mondo igeng ich, dwarore ni mondo iti gi rabo yunga kinde duto ma ibedo e achiel. Onyalo bedo gima pek ng'eyo kinde ma ionge thuolo mar mako ich, koro rabo yunga onego tigodo kinde duto ma ibedo e achiel mondo oti maber.",
      "Mondo igeng ich, dwarore ni mondo iti gi rabo yunga kinde duto ma ibedo e achiel. Onyalo bedo gima pek ng'eyo kinde ma ionge thuolo mar mako ich, koro rabo yunga onego tigodo kinde duto ma ibedo e achiel mondo oti maber.",
      "Pills ma pile ka pile onego muony pile ka pile mondo ogeng ich. Ka ok imuonyo pills, dendi nyalo golo tong, kendo inyalo mako ich. Nyalo bedo gima konyo ka imuonyo pills pile ka pile kaka gino ma iketo e chenro, kaka kapok idhi e kitanda, kata kapok ichako odiechiengi gokinyi.",
      "Sindan [Depo] bet e del kuom dweche 3. Ka ileo gi jumbe 2 yudo sindan machielo, inyalo mako ich, koro ber mondo irit tarik mochiki e dok e sindan ka idwaro geng'o ich!",
      "Implant budho kuom higni 3 [Nexplanon] kata higni 5 [Jadelle], kaluwore e kido ma oketni. ka ok ihere kata idwaro mako ich, inyalo dhi mondo ogolni godo saa asaya ma idwaro - ok ochuno ni nyaka irit higni 3-5! Implant nyalo bedo yo maber ahinya kata mana e higa kata higni ariyo.",
      "IUCD [koil] tiyo nyaka higni 12! Ng'eny ji ok weye kanyo mang'eny kamano, kendo nyalo mana tiyo kode kuom higa kata higni ariyo. Inyalo golo IUCD saa asaya ma idwaro, ka ok idware kata idwaro mako ich.",
      "E-pill [P2] ok ti kuom kinde moko, to en mar duoko chien nyaloni mar mako ich bang bedo e achiel. Kik ipar ni podi odhi tiyo ka ibedo e achiel kendo odiechieng achiel kata ariyo bang muonyo E-pill... Ber mondo iti gi yo machielo kaka yori mapile mar geng'o ich!"
    ],
    "English": [
      "To prevent pregnancy, you need to use a condom every time you have sex. It can be very challenging to predict your safe days, so condoms need to be used every time you have sex in order to work well.",
      "To prevent pregnancy, you need to use a condom every time you have sex. It can be very challenging to predict your safe days, so condoms need to be used every time you have sex in order to work well.",
      "Daily pills need to be taken every day to prevent pregnancy. If you miss pills, your body might release an egg, and you could get pregnant. It can be helpful to take your daily pill as part of a routine, like right before you go to bed, or before you start your day in the morning.",
      "The injection (depo) lasts for 3 months. If you are more than 2 weeks late for your next shot, you can get pregnant, so it is good to stay on schedule if you want to prevent pregnancy!",
      "The implant lasts for 3 years (Nexplanon) or 5 years (Jadelle), depending on which type you get. If you don't like it or you want to get pregnant, you can have it removed whenever you want - you don't have to wait 3-5 years! The implant can be a great method even just for a year or two.",
      "The IUCD (coil) works for up to 12 years! Many people don't keep it in that long, and might just use it for a year or two. You can have the IUCD removed whenever you want, if you don't like it or want to get pregnant.",
      "The E-pill (P2) does not work for a particular length of time, but is meant to reduce the chance of pregnancy after having sex. Don't assume it is still going to work if you have sex again a day or two after taking the E-pill...it is better to use a different method as your regular method!"
    ],
  };

  final Map<String, String> importantMessageTranslations = {
  "English": "HEY! THIS IS IMPORTANT! Male and female condoms are the ONLY family planning methods that also prevent HIV and other STIs!",
  "Kiswahili": "Hey! HII NI MUHIMU! Kondomu za kiume na za kike ndizo njia PEKEE za kupanga uzazi ambazo pia huzuia Virusi Vya Ukimwi na magonjwa mengine ya zinaa!",
  "Dholuo": "HEY! MA EN GIMA BER NG'EYO! Rabo yunga mar chuo gi mine e yore komo nyuol KENDE ma bende geng'o kute mag ayaki kod nyae mamoko!"
  };

  final Map<String, String> learnMoreTranslations = {
  "English": "Learn more",
  "Kiswahili": "Jifunze zaidi",
  "Dholuo": "Puonjri matut"
  };



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
                children: languages.map((language) => languageButton(language)).toList(),
              ),
            ),
            methodSelectionRow(),
            SizedBox(height: 20.0),
            contentArea(),
            SizedBox(height: 20.0),
            additionalTextSection(),
          ],
        ),
      ),
    );
  }

Widget languageButton(String language) {
    asyncmethod(language);
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

  void asyncmethod(String language) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedLanguage', language);
  }

  Widget additionalTextSection() {
  return Padding(
    padding: EdgeInsets.all(10.0),
    child: Column(
      children: [
        // Only display this section for certain method indices
        if (methodIndex == 0 || methodIndex == 1)
          Padding(
            padding: EdgeInsets.only(bottom: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //ImageIcon(AssetImage('assets/misc-icons/important.png'), size: 24.0, color: Colors.black),
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
        // Button for learning more, only shown for condoms
        if (methodIndex == 0 || methodIndex == 1)
          TextButton.icon(
            icon: ImageIcon(AssetImage('assets/misc-icons/question.png'), color: Colors.black),
            label: Text(
              learnMoreTranslations[languages[languageIndex]] ?? "Learn more",
              style: TextStyle(color: Colors.black)
            ),
            style: TextButton.styleFrom(
              backgroundColor: MaraColors.lavendar, // Button background color
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
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

Widget methodSelectionRow() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildIconButton(MaraIcons.condom, "Condom", 0),
          buildIconButton(MaraIcons.female_condom, "Female Condom", 1),
          buildIconButton(MaraIcons.birth_control_pills, "Pills (daily pills)", 2),
          buildIconButton(MaraIcons.syringe, "Injection (depo)", 3),
          buildIconButton(MaraIcons.contraceptive_implant, "Implant", 4),
          buildIconButton(MaraIcons.iud, "IUCD (coil)", 5),
          buildIconButton(MaraIcons.double_pills, "Emergency pill (E-pill, P2)", 6),
        ],
      ),
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
            Container (
                width: 100,
                child: Text(
                  caption,
                  softWrap: true, 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: isSelected ? Colors.black : Colors.grey,
                  ),
                )
            )
          ],
        ),
      ],
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
                style: TextStyle(fontFamily: 'Roboto', color: Colors.white, fontSize: 19.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget updateMethodContent() {
    return Text(
      contentDescriptionMap[languages[languageIndex]]![methodIndex],
      style: TextStyle(
        fontSize: 20.0,
        color: Colors.black,
      )
    );
  }

  Widget getAudio(Map<String, List<String>> audioMap, int audioIndex) {
    return AudioWidget(audioAsset: audioMap[languages[languageIndex]]![audioIndex]);
  }
}
