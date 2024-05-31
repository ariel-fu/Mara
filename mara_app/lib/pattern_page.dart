import 'package:flutter/material.dart';
import 'package:mara_app/icons/mara_icons_icons.dart';
import 'package:mara_app/video.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'bleeding.dart';
import 'package:mara_app/hiv_page.dart';
import 'package:mara_app/audio.dart';
import 'package:mara_app/design/colors.dart';

class PatternPage extends StatefulWidget {
  const PatternPage({Key? key}) : super(key: key);

  @override
  State<PatternPage> createState() => _PatternPageState();
}

class _PatternPageState extends State<PatternPage> {
  //Widget methodContent = Text('method content');
  // Widget methodContent = updateMethodContent();
  int methodIndex = 0; // Index of the selected icon button, 0 for default
  int languageIndex = 2; // similar indexing for language
  bool overrideIndex = false;

  // String videoAsset1 = 'videoAudio/videos/provider/provider1E.mp4';
  // String videoTitle1 = 'Video 1 Language Not Selected';
  // String videoAsset2 = 'videoAudio/videos/peer/peer1E.mp4';
  // String videoTitle2 = 'Video 2 Language Not Selected';

  // Widget video1 = VideoWidget(
  //     videoAsset: 'videoAudio/videos/provider/provider1E.mp4',
  //     title: 'Video: a provider explains');
  // Widget video2 = VideoWidget(
  //     videoAsset: 'videoAudio/videos/peer/peer1E.mp4',
  //     title: 'Video: a peer explains');

  // late String videoAsset1;
  // late String videoTitle1;
  // late String videoAsset2;
  // late String videoTitle2;
  // late Widget video1 = VideoWidget(videoAsset: videoAsset1, title: videoTitle1);
  // late Widget video2 = VideoWidget(videoAsset: videoAsset2, title: videoTitle2);

  @override
  void initState() {
    super.initState();
    _loadCurrentLanguage();
  }

  String _currentLanguage = 'English';

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


  final double _aspectRatio = 16 / 10;
  final languages = ["Kiswahili", "Dholuo", "English"];

  final Map<String, List<String>> audioContentMap = {
    "English": [
      'videoAudio/audio/period_audio/period_condom_E.mp3',
      'videoAudio/audio/period_audio/period_condom_E.mp3',
      'videoAudio/audio/period_audio/period_pills_E.mp3',
      'videoAudio/audio/period_audio/period_depo_E.mp3',
      'videoAudio/audio/period_audio/period_implant_E.mp3',
      'videoAudio/audio/period_audio/period_iucd_E.mp3',
      'videoAudio/audio/period_audio/period_epill_E.mp3',
    ],
    "Kiswahili": [
      'videoAudio/audio/period_audio/period_condom_K.mp3',
      'videoAudio/audio/period_audio/period_condom_K.mp3',
      'videoAudio/audio/period_audio/period_pills_K.mp3',
      'videoAudio/audio/period_audio/period_depo_K.mp3',
      'videoAudio/audio/period_audio/period_implant_K.mp3',
      'videoAudio/audio/period_audio/period_iucd_K.mp3',
      'videoAudio/audio/period_audio/period_epill_K.mp3',
    ],
    "Dholuo": [
      'videoAudio/audio/period_audio/period_condom_L.mp3',
      'videoAudio/audio/period_audio/period_condom_L.mp3',
      'videoAudio/audio/period_audio/period_pills_L.mp3',
      'videoAudio/audio/period_audio/period_depo_L.mp3',
      'videoAudio/audio/period_audio/period_implant_L.mp3',
      'videoAudio/audio/period_audio/period_iucd_L.mp3',
      'videoAudio/audio/period_audio/period_epill_L.mp3',
    ],
  };

  final Map<String, List<String>> heyThisAudioMap = {
    "English": ['videoAudio/audio/heyThis_HIV_STI_E.mp3'],
    "Kiswahili": ['videoAudio/audio/heyThis_HIV_STI_K.mp3'],
    "Dholuo": ['videoAudio/audio/heyThis_HIV_STI_L.mp3'],
  };

  final Map<String, String> titleTranslations = {
    "Kiswahili": "Nini kitafanyikia hedhi zangu",
    "Dholuo": "En ang'o mabiro timore ne remba mar dwe?",
    "English": "What will happen to my period?",
  };

  final Map<String, String> whyTranslations = {
    "Kiswahili": "KWA NINI?",
    "Dholuo": "NANG'O?",
    "English": "WHY?",
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
      "Kutumia kondomu hakutaathiri hedhi yako hata kidogo!",
      "Kutumia kondomu hakutaathiri hedhi yako hata kidogo!",
      "Unapotumia vidonge vya kila siku, hedhi yako itakuja kila mwezi wakati wa wiki ya mwisho ya vidonge. Unaweza kuanza tembe wakati wowote katika mzunguko wako wa kila mwezi. Vidonge vya kila siku vinaweza kusaidia kupunguza hedhi nzito au yenye uchungu, na sio kawaida kusababisha kutokwa na damu nyingi isiyo ya kawaida.",
      "Kuna uwezekano mkubwa kwamba damu yako ya hedhi kitapungua, na huenda kisije kwa ratiba ya kawaida. Unaweza kuacha kupata hedhi wakati unatumia depo. Hii ni kawaida na yenye afya wakati wa kutumia depo, kwa sababu ya jinsi njia inavyofanya kazi na mwili wako. Ikiwa hedhi yako ni nzito, hii inaweza kuwa jambo zuri.",
      "Kuna uwezekano mkubwa kwamba damu yako ya hedhi kitapungua, na huenda kisije kwa ratiba ya kawaida. Unaweza kuacha kupata hedhi wakati unatumia implant. Hii ni ya kawaida na yenye afya wakati wa kutumia implant, kwa sababu ya jinsi njia hiyo inavyofanya kazi na mwili wako. Ikiwa hedhi yako ni nzito, hii inaweza kuwa jambo zuri.",
      "IUCD, au coil, haitabadilisha muda wa siku zako za hedhi. Inaweza kufanya mtiririko wako wa hedhi kuwa mzito zaidi, na kusababisha mkazo zaidi wakati wa kipindi chako. Hii sio mbaya kwa mwili wako, lakini ikiwa tayari una hedhi nzito au yenye uchungu, inaweza kuwa sio njia bora kwako.",
      "Vidonge vya E-pill vinaweza kuathiri hedhi yako kwa njia tofauti, kulingana na wakati unavinywa katika mzunguko wako wa kila mwezi. Hedhi yako inaweza kuja baadaye kidogo au mapema kuliko kawaida baada ya kumeza E-pills. Ni kawaida kutokwa na damu kidogo au matone ya damu kwenye chupi yako baada ya kumeza vidonge vya E-pill. Hii sio hatari, na itaenda yenyewe! Pima ujauzito ikiwa haupati hedhi yako."
    ],
    "Dholuo": [
      "Tiyo gi rabo yunga ok bi chacho rembi mar dwe kata matin",
      "Tiyo gi rabo yunga ok bi chacho rembi mar dwe kata matin",
      "Ekinde ma itiyo gi pills ma pile ka pile, rembi mar dwe biroga biro dwe ka dwe e wik mogik mar muonyo pills. Inyalo chako muonyo pills e saa asaya e sako ni mar dwe. Pills ma imuonyo pile ka pile nyalo konyo reso remo mar dwe mabiro mang'eny kata remb dwe mabiro gi rem, kendo ok kel ga remb dwe mabiro ekinde ma ok achan.",
      "Rembi mar dwe biro bedo matin, kendo samoro ok bi biro kaka ochan. Inyalo weyo bedo gi remb dwe chutho ekinde ma itiyo gi Depo. Ma en gima timore kendo gima ber ekinde ma itiyo gi Depo, nikech kaka yor komo nyuol tiyo e dendi. Ka rembi mar dwe biro ga mang'eny, ma nyalo bedo gima ber.",
      "Rembi mar dwe biro bedo matin, kendo samoro ok bi biro kaka ochan. Inyalo weyo bedo gi remb dwe chutho ekinde ma itiyo gi implant. Ma en gima timore kendo gima ber ekinde ma itiyo gi implant, nikech kaka yor komo nyuol tiyo e dendi. Ka rembi mar dwe biro ga mang'eny, ma nyalo bedo gima ber.",
      "IUCD kata koil, ok bi loko kinde ma rembi mar dwe bire. onyalo miyo remb dwe ochwer mang'eny, kendo miyo piny iyi orami ahinya ekinde ma in e dwe. ma ok en gima rach ne dendi, to ka ne in ga gi remb dwe machwer mang'eny kata rem mang'eny ekinde ma in e dwe, ok onyal bedo yo maber mogik ne in.",
      "E-pill nyalo chacho rembi mar dwe mopogore, kaluwore gi kinde ma imuonye e sako ni mar dwe. Rembi mar dwe nyalo biro bang'e matin kata chon matin moloyo kaka obiroga bang muonyo E-pill. en gima kare mondo ibed gi chwer matin kata ton matin mar remo e suruachi bang muonyo E-pills. Ma ok en gima nyalo hinyi, kendo biro rumo kende! Tim pim mar ich ka ok iyudo rembi mar dwe"
    ],
    "English": [
      "Using condoms will not affect your period at all!",
      "Using condoms will not affect your period at all!",
      "When using daily pills, your period will usually come every month during the last week of the pills. You can start the pills at any time in your monthly cycle. Daily pills can help relieve heavy or painful periods, and do not usually cause much irregular bleeding.",
      "Your period will most likely become lighter, and might not come on a usual schedule. You might stop having periods at all while you are using depo. This is normal and healthy while using depo, because of the way the method works with your body. If your periods are usually heavy, this might be a good thing.",
      "Your period will most likely become lighter, and might not come on a usual schedule. You might stop having periods at all while you are using the implant. This is normal and healthy while using the implant, because of the way the method works with your body. If your periods are usually heavy, this might be a good thing.",
      "The IUCD, or coil, will not change the timing of when your periods come. It might make your period flow heavier, and cause more cramping during your period. This is not bad for your body, but if you already have very heavy or painful periods, it may not be the best method for you.  ",
      "E-pills might affect your period differently, depending on when you take them in your monthly cycle. Your period might come a bit later or a bit earlier than usual after taking E-pills. It is normal to have some light bleeding or drops of blood in your panties after taking E-pills. This is not dangerous, and will go away on its own! Take a pregnancy test if you do not get your period."
    ],
  };

  // //Video HashMap: specifies video asset and text/title based on language and video
  final Map<String, List<String>> video_provider_ContentMap = {
      "Kiswahili": [
        'videoAudio/videos/provider/provider1KS.mp4',
        'videoAudio/videos/provider/provider1KS.mp4',
        'videoAudio/videos/provider/provider1KS.mp4',
        'videoAudio/videos/provider/provider1KS.mp4',
        'videoAudio/videos/provider/provider1KS.mp4',
        'videoAudio/videos/provider/provider1KS.mp4',
        'videoAudio/videos/provider/provider1KS.mp4',
      ],
      "Dholuo": [
        'videoAudio/videos/provider/provider1DL.mp4',
        'videoAudio/videos/provider/provider1DL.mp4',
        'videoAudio/videos/provider/provider1DL.mp4',
        'videoAudio/videos/provider/provider1DL.mp4',
        'videoAudio/videos/provider/provider1DL.mp4',
        'videoAudio/videos/provider/provider1DL.mp4',
        'videoAudio/videos/provider/provider1DL.mp4',
      ],
      "English": [
        'videoAudio/videos/provider/provider1E.mp4',
        'videoAudio/videos/provider/provider1E.mp4',
        'videoAudio/videos/provider/provider1E.mp4',
        'videoAudio/videos/provider/provider1E.mp4',
        'videoAudio/videos/provider/provider1E.mp4',
        'videoAudio/videos/provider/provider1E.mp4',
        'videoAudio/videos/provider/provider1E.mp4',
      ],
  };

  final Map<String, List<String>> video_peer_ContentMap = {
      "Kiswahili": [
        'videoAudio/videos/provider/peer1KS.mp4',
        'videoAudio/videos/provider/peer1KS.mp4',
        'videoAudio/videos/provider/peer1KS.mp4',
        'videoAudio/videos/provider/peer1KS.mp4',
        'videoAudio/videos/provider/peer1KS.mp4',
        'videoAudio/videos/provider/peer1KS.mp4',
        'videoAudio/videos/provider/peer1KS.mp4',
      ],
      "Dholuo": [
        'videoAudio/videos/provider/peer1DL.mp4',
        'videoAudio/videos/provider/peer1DL.mp4',
        'videoAudio/videos/provider/peer1DL.mp4',
        'videoAudio/videos/provider/peer1DL.mp4',
        'videoAudio/videos/provider/peer1DL.mp4',
        'videoAudio/videos/provider/peer1DL.mp4',
        'videoAudio/videos/provider/peer1DL.mp4',
      ],
      "English": [
        'videoAudio/videos/provider/peer1E.mp4',
        'videoAudio/videos/provider/peer1E.mp4',
        'videoAudio/videos/provider/peer1E.mp4',
        'videoAudio/videos/provider/peer1E.mp4',
        'videoAudio/videos/provider/peer1E.mp4',
        'videoAudio/videos/provider/peer1E.mp4',
        'videoAudio/videos/provider/peer1E.mp4',
      ],
  };

  final Map<String, List<String>> video_provider_TitleMap = {
    "Kiswahili": ["Video: Jachiw thieth lero"],
    "Dholuo": ["Video: Mtoa huduma wa afya anaelezea"],
    "English": ["Video: a provider explains"],
  };

  final Map<String, List<String>> video_peer_TitleMap = {
    "Kiswahili": ["Video: Mwenzio anaelezea"],
    "Dholuo": ["Video: Mbasni lero"],
    "English": ["Video: a peer explains"],
  };


  // final Map<String, Map<String, Map<String, String>>> languageToVideo = {
  //   'video1': {
  //     '0': {
  //       // Language code 0
  //       'video': 'videoAudio/videos/provider/provider1KS.mp4',
  //       'text': 'Video: Jachiw thieth lero',
  //     },
  //     '1': {
  //       // Language code 1
  //       'video': 'videoAudio/videos/provider/provider1DL.mp4',
  //       'text': 'Video: Mtoa huduma wa afya anaelezea',
  //     },
  //     '2': {
  //       // Language code 2
  //       'video': 'videoAudio/videos/provider/provider1E.mp4',
  //       'text': 'Video: a provider explains',
  //     },
  //   },
  //   'video2': {
  //     '0': {
  //       'video': 'videoAudio/videos/peer/peer1KS.mp4',
  //       'text': 'Video: Mwenzio anaelezeaa',
  //     },
  //     '1': {
  //       'video': 'videoAudio/videos/peer/peer1DL.mp4',
  //       'text': 'Video: Mbasni lero',
  //     },
  //     '2': {
  //       'video': 'videoAudio/videos/peer/peer1E.mp4',
  //       'text': 'Video: a peer explains',
  //     },
  //   },
  // };

  @override
  Widget build(BuildContext context) {
    _loadCurrentLanguage();
    final double containerWidth = MediaQuery.of(context).size.width;
    final double containerHeight = MediaQuery.of(context).size.height;
    double boxWidth = containerWidth;
    double boxHeight = containerHeight;
    double availableHeight = boxHeight;

    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
              titleTranslations[languages[languageIndex]] ?? "Title not found",
              style: TextStyle(fontFamily: 'PoetsenOne', color: MaraColors.purple, fontSize: 36.0)
            )
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(availableHeight * 0.05),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                languageButton('Kiswahili', 0),
                languageButton('Dholuo', 1),
                languageButton('English', 2),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: availableHeight * 0.01),
          methodSelectionRow(),
          SizedBox(height: 15.0),
          contentArea(),         
          Row( //video
            children: [
              SizedBox(width: 15.0),
              SizedBox(
                width: boxWidth / 2 - 25,
                height: boxHeight * 0.5 * 0.6,
                // child: Center(
                //   child: video1
                // )
                child: Center(
                  child: getVideoContent(video_provider_ContentMap, video_provider_TitleMap)
                )
              ),
              SizedBox(width: 10.0),
              SizedBox(
                width: boxWidth / 2 - 25,
                height: boxHeight * 0.5 * 0.6,
                // child: Center(
                //   child: video2
                // )
                child: Center(
                  child: getVideoContent(video_peer_ContentMap, video_peer_TitleMap)
                )

              ),
            ]
          ),
          additionalTextSection(),
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
              size: 60,
              color: isSelected ? MaraColors.magentaPurple : Colors.grey,
            ),
            onPressed: () {
              setState(() {
                methodIndex = index;
                //updateMethodContent();
                // video1 = updateVideoContent1();
                // video2 = updateVideoContent2();
                // video1 = getVideoContent(video_provider_ContentMap, video_provider_TitleMap);
                // video2 = getVideoContent(video_peer_ContentMap, video_peer_TitleMap);
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
          // video1 = updateVideoContent1();
          // video2 = updateVideoContent2();
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

  // Widget videoSection(double width, double height) {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //     children: [
  //       Container(
  //         width: width * 0.45, // Half the container width minus some margin
  //         height: height,
  //         child: video1,
  //       ),
  //       Container(
  //         width: width * 0.45, // Half the container width minus some margin
  //         height: height,
  //         child: video2,
  //       ),
  //     ],
  //   );
  // }

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
                      // ImageIcon(AssetImage('assets/misc-icons/important.png'),
                      //     size: 50.0, color: Colors.black),
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
                              fontFamily: 'Roboto', fontSize: 20.0, fontWeight: FontWeight.bold),
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
              icon: ImageIcon(AssetImage('assets/misc-icons/question.png'),
                  color: Colors.black),
              label: Text(
                  learnMoreTranslations[languages[languageIndex]] ??
                      "Learn more",
                  style: TextStyle(fontSize: 20.0, color: Colors.black)
                ),
              style: TextButton.styleFrom(
                backgroundColor: MaraColors.lavender,
                // Button background color
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HIVPage()),
                );
              },
            ),
          // Additional button section for other methods
          if (methodIndex != 0 && methodIndex != 1)
            TextButton.icon(
              icon: ImageIcon(AssetImage('assets/misc-icons/question.png'),
                  color: Colors.black),
              label: Text(
                whyTranslations[languages[languageIndex]] ?? "WHY?",
                style: TextStyle(fontSize: 20.0, color: Colors.black),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BleedingPage()),
                );
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.deepPurple[100],
              ),
            ),
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
                //color: Colors.grey.shade200,
                color: MaraColors.purple,
                borderRadius: BorderRadius.circular(10),
                //border: Border.all(color: Colors.grey),
                border:Border.all(color: Colors.grey)
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
                      style: TextStyle(fontFamily: 'Roboto', color: Colors.white, fontSize: 22.0),
                    ),
                  ),
                ],
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

  // String _getAsset(String videoKey, String language) {
  //   String asset =
  //       languageToVideo[videoKey]?[language]?['video'] ?? 'Asset not found';
  //   print('Asset for $videoKey in $language: $asset');
  //   return asset;
  // }

  // String _getTitle(String videoKey, String language) {
  //   String title =
  //       languageToVideo[videoKey]?[language]?['text'] ?? 'Text not found';
  //   print('Title for $videoKey in $language: $title');
  //   return title;
  // }

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

  // Widget updateVideoContent2() {
  //   if (languageIndex == 0) {
  //     videoAsset2 = _getAsset('video2', '0');
  //     videoTitle2 = _getTitle('video2', '0');
  //   } else if (languageIndex == 1) {
  //     videoAsset2 = _getAsset('video2', '1');
  //     videoTitle2 = _getTitle('video2', '1');
  //   } else if (languageIndex == 2) {
  //     videoAsset2 = _getAsset('video2', '2');
  //     videoTitle2 = _getTitle('video2', '2');
  //   }
  //   return VideoWidget(videoAsset: videoAsset2, title: videoTitle2);
  // }

  Widget getVideoContent(Map<String, List<String>> videoContentMap, Map<String, List<String>> videoTitleMap) {
    String asset = videoContentMap[languages[languageIndex]]![methodIndex];
    String title = videoTitleMap[languages[languageIndex]]![0];
    return VideoWidget(videoAsset: asset, title: title);
  }

  Widget getAudio(Map<String, List<String>> audioMap, int audioIndex) {
    return AudioWidget(
        audioAsset: audioMap[languages[languageIndex]]![audioIndex]);
  }
}
