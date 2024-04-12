import 'package:flutter/material.dart';
import 'package:mara_app/hiv_page.dart';
import 'package:mara_app/icons/mara_icons_icons.dart';
import 'package:mara_app/video.dart';
import 'bleeding.dart';

class PatternPage extends StatefulWidget {
  const PatternPage({Key? key}) : super(key: key);

  @override
  State<PatternPage> createState() => _PatternPageState();
}

class _PatternPageState extends State<PatternPage> {

  Widget methodContent = Text('method content');
  String videoAsset1 = 'videoAudio/videos/provider/provider1E.mp4';
  String videoTitle1 = 'Video 1 Language Not Selected';
  String videoAsset2 = 'videoAudio/videos/peer/peer1E.mp4';
  String videoTitle2 = 'Video 2 Language Not Selected';

  Widget video1 = VideoWidget(videoAsset: 'videoAudio/videos/provider/provider1E.mp4', title:'Video - A Doctor Explains');
  Widget video2 = VideoWidget(videoAsset: 'videoAudio/videos/peer/peer1E.mp4', title:'Video - A Peer Perspective');
  bool overrideIndex = false;
  // Widget methodContent = updateMethodContent();
  int methodIndex = 2; // Index of the selected icon button, 0 for default
  int languageIndex = 2; // similar indexing for language  

  final double _aspectRatio = 16 / 10;
  final languages = ["Kiswahili", "Dholuo", "English"];

  final content = [
    "method 1",
    "method 2",
    "method 3",
    "method 4",
    "method 5",
    "method 6"
  ];

  final Map<String, List<String>> contentDescriptionMap = {
    "Kiswahili": [
      "Kutumia kondomu hakutaathiri hedhi yako hata kidogo!",
      "Kutumia kondomu hakutaathiri hedhi yako hata kidogo!",
      "Unapotumia vidonge vya kila siku, hedhi yako itakuja kila mwezi wakati wa wiki ya mwisho ya vidonge. Unaweza kuanza tembe wakati wowote katika mzunguko wako wa kila mwezi. Vidonge vya kila siku vinaweza kusaidia kupunguza hedhi nzito au yenye uchungu, na sio kawaida kusababisha kutokwa na damu nyingi isiyo ya kawaida.",
      "Kuna uwezekano mkubwa kwamba damu yako ya hedhi kitapungua, na huenda kisije kwa ratiba ya kawaida. Unaweza kuacha kupata hedhi wakati unatumia implant. Hii ni ya kawaida na yenye afya wakati wa kutumia implant, kwa sababu ya jinsi njia hiyo inavyofanya kazi na mwili wako. Ikiwa hedhi yako ni nzito, hii inaweza kuwa jambo zuri.",
      "Kuna uwezekano mkubwa kwamba damu yako ya hedhi kitapungua, na huenda kisije kwa ratiba ya kawaida. Unaweza kuacha kupata hedhi wakati unatumia implant. Hii ni ya kawaida na yenye afya wakati wa kutumia implant, kwa sababu ya jinsi njia hiyo inavyofanya kazi na mwili wako. Ikiwa hedhi yako ni nzito, hii inaweza kuwa jambo zuri.",
      "IUCD, au coil, haitabadilisha muda wa siku zako za hedhi. Inaweza kufanya mtiririko wako wa hedhi kuwa mzito zaidi, na kusababisha mkazo zaidi wakati wa kipindi chako. Hii sio mbaya kwa mwili wako, lakini ikiwa tayari una hedhi nzito au yenye uchungu, inaweza kuwa sio njia bora kwako.",
      "Vidonge vya E-pill vinaweza kuathiri hedhi yako kwa njia tofauti, kulingana na wakati unavinywa katika mzunguko wako wa kila mwezi. Hedhi yako inaweza kuja baadaye kidogo au mapema kuliko kawaida baada ya kumeza E-pills. Ni kawaida kutokwa na damu kidogo au matone ya damu kwenye chupi yako baada ya kumeza vidonge vya E-pill. Hii sio hatari, na itaenda yenyewe! Pima ujauzito ikiwa haupati hedhi yako."
    ],
    "Dholuo": [
      "Tiyo gi rabo yunga ok bi chacho rembi mar dwe kata matin",
      "Tiyo gi rabo yunga ok bi chacho rembi mar dwe kata matin",
      "Ekinde ma itiyo gi pills ma pile ka pile, rembi mar dwe biroga biro dwe ka dwe e wik mogik mar muonyo pills. Inyalo chako muonyo pills e saa asaya e sako ni mar dwe. Pills ma imuonyo pile ka pile nyalo konyo reso remo mar dwe mabiro mang'eny kata remb dwe mabiro gi rem, kendo ok kel ga remb dwe mabiro ekinde ma ok achan.",
      "Rembi mar dwe biro bedo matin, kendo samoro ok bi biro kaka ochan. Inyalo weyo bedo gi remb dwe chutho ekinde ma itiyo gi implant. Ma en gima timore kendo gima ber ekinde ma itiyo gi implant, nikech kaka yor komo nyuol tiyo e dendi. Ka rembi mar dwe biro ga mang'eny, ma nyalo bedo gima ber.",
      "Rembi mar dwe biro bedo matin, kendo samoro ok bi biro kaka ochan. Inyalo weyo bedo gi remb dwe chutho ekinde ma itiyo gi implant. Ma en gima timore kendo gima ber ekinde ma itiyo gi implant, nikech kaka yor komo nyuol tiyo e dendi. Ka rembi mar dwe biro ga mang'eny, ma nyalo bedo gima ber.",
      "IUCD kata koil, ok bi loko kinde ma rembi mar dwe bire. onyalo miyo remb dwe ochwer mang'eny, kendo miyo piny iyi orami ahinya ekinde ma in e dwe. ma ok en gima rach ne dendi, to ka ne in ga gi remb dwe machwer mang'eny kata rem mang'eny ekinde ma in e dwe, ok onyal bedo yo maber mogik ne in.",
      "E-pill nyalo chacho rembi mar dwe mopogore, kaluwore gi kinde ma imuonye e sako ni mar dwe. Rembi mar dwe nyalo biro bang'e matin kata chon matin moloyo kaka obiroga bang muonyo E-pill. en gima kare mondo ibed gi chwer matin kata ton matin mar remo e suruachi bang muonyo E-pills. Ma ok en gima nyalo hinyi, kendo biro rumo kende! Tim pim mar ich ka ok iyudo rembi mar dwe"
    ],
    "English": [
      "Using condoms will not affect your period at all!",
      "Using condoms will not affect your period at all!",
      "When using daily pills, your period will usually come every month during the last week of the pills. You can start the pills at any time in your monthly cycle. Daily pills can help relieve heavy or painful periods, and do not usually cause much irregular bleeding.",
      "Your period will most likely become lighter, and might not come on a usual schedule. You might stop having periods at all while you are using the implant. This is normal and healthy while using the implant, because of the way the method works with your body. If your periods are usually heavy, this might be a good thing.",
      "Your period will most likely become lighter, and might not come on a usual schedule. You might stop having periods at all while you are using the implant. This is normal and healthy while using the implant, because of the way the method works with your body. If your periods are usually heavy, this might be a good thing.",
      "The IUCD, or coil, will not change the timing of when your periods come. It might make your period flow heavier, and cause more cramping during your period. This is not bad for your body, but if you already have very heavy or painful periods, it may not be the best method for you.  ",
      "E-pills might affect your period differently, depending on when you take them in your monthly cycle. Your period might come a bit later or a bit earlier than usual after taking E-pills. It is normal to have some light bleeding or drops of blood in your panties after taking E-pills. This is not dangerous, and will go away on its own! Take a pregnancy test if you do not get your period."
    ],
  };

  //Video HashMap: specifies video asset and text/title based on language and video
  final Map<String, Map<String, Map<String, String>>> languageToVideo = {
  'video1': {
    '0': { // Language code 0
      'video': 'videoAudio/videos/provider/provider1KS.mp4',
      'text': 'Video - Daktari Aeleza',
    },
    '1': { // Language code 1
      'video': 'videoAudio/videos/provider/provider1DL.mp4',
      'text': 'Vidio - Laktar Wuoyo',
    },
    '2': { // Language code 2
      'video': 'videoAudio/videos/provider/provider1E.mp4',
      'text': 'Video - A Doctor Explains',
    },
  },
  'video2': {
    '0': {
      'video': 'videoAudio/videos/peer/peer1KS.mp4',
      'text': 'Video - Mtazamo wa Rika',
    },
    '1': {
      'video': 'videoAudio/videos/peer/peer1DL.mp4',
      'text': 'Vidio - Kaka Jowetegi Neno Gik Moko',
    },
    '2': {
      'video': 'videoAudio/videos/peer/peer1E.mp4',
      'text': 'Video - A Peer Perspective',
    },
  },
};

final Map<String, String> whyButton = {
    "Kiswahili": "KWA NINI?",
    "Dholuo": "NANG'O?",
    "English": "WHY?"
};

final Map<String, String> heyThis = {
    "Kiswahili": "Hey! HII NI MUHIMU! Kondomu za kiume na za kike ndizo njia PEKEE za kupanga uzazi ambazo pia huzuia Virusi Vya Ukimwi na magonjwa mengine ya zinaa!",
    "Dholuo": "HEY! MA EN GIMA BER NG'EYO! Rabo yunga mar chuo gi mine e yore komo nyuol KENDE ma bende geng'o kute mag ayaki kod nyae mamoko!",
    "English": "HEY! THIS IS IMPORTANT! Male and female condoms are the ONLY family planning methods that also prevent HIV and other STIs!"
};

  @override
  Widget build(BuildContext context) {
    final int? routeArgumentIndex =
    ModalRoute.of(context)?.settings.arguments as int?;

    // Update languageIndex if a valid value is provided from the route
    // if (routeArgumentIndex != null &&
    //     routeArgumentIndex >= 0 &&
    //     routeArgumentIndex < languages.length &&
    //     !overrideIndex) {
    //   languageIndex = routeArgumentIndex;
    // }

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
        // leading: IconButton(
        //   icon: const Icon(Icons.home),
        //   onPressed: () {
        //     Navigator.of(context).pushNamed('/home');
        //   },
        // ),
        title: Center(child: Text('What will happen to my period?')),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(availableHeight * 0.05),
          child: Container(
            // height: availableHeight * 0.1,
              child: Container(
                // padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2.0), // Adjust the padding as needed
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            languageIndex = 0;
                            overrideIndex = true;
                            updateMethodContent();
                            video1 = updateVideoContent1();
                            video2 = updateVideoContent2();
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: languageIndex == 0 ? Colors.grey : null,
                        ),
                        child: Text('Kiswahili'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0), // Adjust the padding as needed
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            languageIndex = 1;
                            overrideIndex = true;
                            updateMethodContent();
                            video1 = updateVideoContent1();
                            video2 = updateVideoContent2();
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: languageIndex == 1 ? Colors.grey : null,
                        ),
                        child: Text('Dholuo'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0), // Adjust the padding as needed
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            languageIndex = 2;
                            overrideIndex = true;
                            updateMethodContent();
                            video1 = updateVideoContent1();
                            video2 = updateVideoContent2();
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: languageIndex == 2 ? Colors.grey : null,
                        ),
                        child: Text('English'),
                      ),
                    ),
                  ],
                ),
              )),
          // preferredSize: Size.fromHeight(75),
        ),
        // actions: <Widget>[
        //
        // ]
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // SizedBox(height: availableHeight*0.01),
          Container(
            alignment: Alignment.center,
            // height: availableHeight * 0.15,
            // width: boxWidth,
            // padding: EdgeInsets.symmetric(horizontal: 0.1*boxWidth),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildIconButton(MaraIcons.condom, "Condom", 0),
                  // SizedBox(width: 5),
                  buildIconButton(MaraIcons.female_condom, "Female Condom", 1),
                  // SizedBox(width: 5),
                  buildIconButton(MaraIcons.birth_control_pills, "Pills (daily pills)", 2),
                  // SizedBox(width: 5),
                  buildIconButton(MaraIcons.syringe, "Injection (depo)", 3),
                  // SizedBox(width: 5),
                  buildIconButton(MaraIcons.contraceptive_implant, "Implant", 4),
                  // SizedBox(width: 5),
                  buildIconButton(MaraIcons.iud, "IUCD (coil)", 5),
                  // SizedBox(width: 5),
                  buildIconButton(MaraIcons.double_pills, "Emergency pill (E-pill, P2)", 6),
                ],
              ),
            ),
          ),

          SizedBox(height: 15.0),
          SizedBox(
            height: availableHeight * 0.70, // Adjust as needed
                child: Flex(
                crossAxisAlignment: CrossAxisAlignment.center,
                direction: Axis.vertical,
                children: [
                  Container(
                      width: boxWidth,
                      height: boxHeight*0.5*0.6,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Icon(Icons.lightbulb_outline, color: Colors.amber),
                            Center(
                                child: Container(
                                  width: boxWidth * 0.9,
                                    // height: availableHeight * 0.6 * 0.5,
                                    child: Center(
                                      child: Column(children:[
                                        updateMethodContent(),
                                        if (methodIndex == 0 || methodIndex == 1)
                                        TextButton(
                                          onPressed: () { 
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => HIVPage())
                                            );
                                          }, 
                                          child:
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: <Widget>[
                                                Image.asset(
                                                  'assets/misc-icons/important.png',
                                                  width: 40,
                                                  height: 40,
                                                ),
                                                SizedBox(width: 8),
                                                Text(
                                                  heyThis[languages[languageIndex]]!,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12.0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                        ),
                                        if (methodIndex == 2 || methodIndex == 3 || methodIndex == 4 || methodIndex == 5 || methodIndex == 6 || methodIndex == 7)
                                        TextButton(
                                          onPressed: () { 
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => BleedingPage())
                                            );
                                          }, 
                                          child:
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: <Widget>[
                                                Image.asset(
                                                  'assets/misc-icons/question.png',
                                                  width: 40,
                                                  height: 40,
                                                ),
                                                SizedBox(width: 8),
                                                Text(
                                                  whyButton[languages[languageIndex]]!,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12.0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                        )
                                      //   IconButton(
                                      //   icon: const ImageIcon(AssetImage('assets/misc-icons/question.png')),
                                      //   onPressed: () {
                                      //     Navigator.push(
                                      //       context,
                                      //       MaterialPageRoute(builder: (context) => BleedingPage()),
                                      //     );
                                      //   },
                                      // ),
                                      ], 
                                    )
                                )
                            )
                            )
                          ]
                          
                      )
                    // child: Center(
                    //   child: updateMethodContent(),
                    // ),
                  ),
                  Row(children: [
                  SizedBox(width:15.0),
                  SizedBox(
                    width:boxWidth / 2,
                    height: boxHeight * 0.5 * 0.6,
                    child: Center(child: video1),
                  ),
                  SizedBox(width:10.0),
                  SizedBox(
                    width:boxWidth / 2 - 8,
                    height: boxHeight * 0.5 * 0.6,
                    child: Center(child: video2),
                  ),
                ],),
                ],
              ),
            ),
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
                color: isSelected ? Colors.black : Colors.grey,
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
                  softWrap: true, // Wrap text to the next line if needed
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

  Widget updateMethodContent() {
    return Text(
      contentDescriptionMap[languages[languageIndex]]![methodIndex],
      style: TextStyle(
        fontSize: 20.0,
        color: Colors.black,
      )
    );
  }

  String _getAsset(String videoKey, String language) {
      return languageToVideo[videoKey]?[language]?['video'] ?? 'Asset not found';
  }

  String _getTitle(String videoKey, String language) {
    return languageToVideo[videoKey]?[language]?['text'] ?? 'Text not found';
  }

  Widget updateVideoContent1() {
      if (languageIndex == 0) {
        videoAsset1 = _getAsset('video1', '0');
        videoTitle1 = _getTitle('video1', '0');
      } else if (languageIndex == 1) {
          videoAsset1 = _getAsset('video1', '1');
          videoTitle1 = _getTitle('video1', '1');
      } else if (languageIndex == 2) {
          videoAsset1 = _getAsset('video1', '2');
          videoTitle1 = _getTitle('video1', '2');
      }
      return VideoWidget(videoAsset: videoAsset1, title: videoTitle1);
  }

  Widget updateVideoContent2() {
    if (languageIndex == 0) {
        videoAsset2 = _getAsset('video2', '0');
        videoTitle2 = _getTitle('video2', '0');
      } else if (languageIndex == 1) {
          videoAsset2 = _getAsset('video2', '1');
          videoTitle2 = _getTitle('video2', '1');
      } else if (languageIndex == 2) {
          videoAsset2 = _getAsset('video2', '2');
          videoTitle2 = _getTitle('video2', '2');
      }
      return VideoWidget(videoAsset: videoAsset2, title: videoTitle2);
  }
}
