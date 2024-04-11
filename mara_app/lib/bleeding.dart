import 'package:flutter/material.dart';
import 'package:mara_app/icons/mara_icons_icons.dart';
import 'package:mara_app/video.dart';
import 'pattern_page.dart';

class BleedingPage extends StatefulWidget {
  const BleedingPage({Key? key}) : super(key: key);

  @override
  State<BleedingPage> createState() => _BleedingPageState();
}

class _BleedingPageState extends State<BleedingPage> {
  Widget methodContent = Text('DUMMY');
  Widget video1 = VideoWidget(videoAsset: 'videoAudio/videos/funnyCat.mp4', title:'Video 1 Language Not Selected');

  bool overrideIndex = false;
  // Widget methodContent = updateMethodContent();
  int methodIndex = 2; // Index of the selected icon button, 0 for default
  int languageIndex = 2; // similar indexing for language
  final languages = ["Kiswahili", "Dholuo", "English"];

  final Map<String, List<String>> contentDescriptionMap = {
    "Kiswahili": [
      "Mabadiliko ya hedhi yako ni ya kawaida unapotumia implant, depo, tembe za kila siku, IUCD, au E-pills. Njia hizi zote isipokuwa IUCD zina homoni ndani yake, ambazo zina athari kwenye siku zako za hedhi wakati unatumia mbinu hizo. Mabadiliko haya yatakoma ukiacha kutumia mbinu. IUCD haina homoni, lakini iko ndani ya tumbo la uzazi au uterasi ambayo inaweza kusababisha hedhi nzito au ya uchungu. Mabadiliko haya ya kutokwa na damu hayana uhusiano wowote na uwezo wako wa kupata ujauzito katika siku zijazo.",
      "Mabadiliko ya hedhi yako ni ya kawaida unapotumia implant, depo, tembe za kila siku, IUCD, au E-pills. Njia hizi zote isipokuwa IUCD zina homoni ndani yake, ambazo zina athari kwenye siku zako za hedhi wakati unatumia mbinu hizo. Mabadiliko haya yatakoma ukiacha kutumia mbinu. IUCD haina homoni, lakini iko ndani ya tumbo la uzazi au uterasi ambayo inaweza kusababisha hedhi nzito au ya uchungu. Mabadiliko haya ya kutokwa na damu hayana uhusiano wowote na uwezo wako wa kupata ujauzito katika siku zijazo.",
      "Mabadiliko ya hedhi yako ni ya kawaida unapotumia implant, depo, tembe za kila siku, IUCD, au E-pills. Njia hizi zote isipokuwa IUCD zina homoni ndani yake, ambazo zina athari kwenye siku zako za hedhi wakati unatumia mbinu hizo. Mabadiliko haya yatakoma ukiacha kutumia mbinu. IUCD haina homoni, lakini iko ndani ya tumbo la uzazi au uterasi ambayo inaweza kusababisha hedhi nzito au ya uchungu. Mabadiliko haya ya kutokwa na damu hayana uhusiano wowote na uwezo wako wa kupata ujauzito katika siku zijazo.",
      "Mabadiliko ya hedhi yako ni ya kawaida unapotumia implant, depo, tembe za kila siku, IUCD, au E-pills. Njia hizi zote isipokuwa IUCD zina homoni ndani yake, ambazo zina athari kwenye siku zako za hedhi wakati unatumia mbinu hizo. Mabadiliko haya yatakoma ukiacha kutumia mbinu. IUCD haina homoni, lakini iko ndani ya tumbo la uzazi au uterasi ambayo inaweza kusababisha hedhi nzito au ya uchungu. Mabadiliko haya ya kutokwa na damu hayana uhusiano wowote na uwezo wako wa kupata ujauzito katika siku zijazo.",
      "Mabadiliko ya hedhi yako ni ya kawaida unapotumia implant, depo, tembe za kila siku, IUCD, au E-pills. Njia hizi zote isipokuwa IUCD zina homoni ndani yake, ambazo zina athari kwenye siku zako za hedhi wakati unatumia mbinu hizo. Mabadiliko haya yatakoma ukiacha kutumia mbinu. IUCD haina homoni, lakini iko ndani ya tumbo la uzazi au uterasi ambayo inaweza kusababisha hedhi nzito au ya uchungu. Mabadiliko haya ya kutokwa na damu hayana uhusiano wowote na uwezo wako wa kupata ujauzito katika siku zijazo.",
      "Mabadiliko ya hedhi yako ni ya kawaida unapotumia implant, depo, tembe za kila siku, IUCD, au E-pills. Njia hizi zote isipokuwa IUCD zina homoni ndani yake, ambazo zina athari kwenye siku zako za hedhi wakati unatumia mbinu hizo. Mabadiliko haya yatakoma ukiacha kutumia mbinu. IUCD haina homoni, lakini iko ndani ya tumbo la uzazi au uterasi ambayo inaweza kusababisha hedhi nzito au ya uchungu. Mabadiliko haya ya kutokwa na damu hayana uhusiano wowote na uwezo wako wa kupata ujauzito katika siku zijazo.",
      "Mabadiliko ya hedhi yako ni ya kawaida unapotumia implant, depo, tembe za kila siku, IUCD, au E-pills. Njia hizi zote isipokuwa IUCD zina homoni ndani yake, ambazo zina athari kwenye siku zako za hedhi wakati unatumia mbinu hizo. Mabadiliko haya yatakoma ukiacha kutumia mbinu. IUCD haina homoni, lakini iko ndani ya tumbo la uzazi au uterasi ambayo inaweza kusababisha hedhi nzito au ya uchungu. Mabadiliko haya ya kutokwa na damu hayana uhusiano wowote na uwezo wako wa kupata ujauzito katika siku zijazo.",
    ],
    "Dholuo": [
      "Lokruok e chwer mar remb dwe en gima ni kare ekinde ma itiyo gi Implant, Depo, daily pills, IUCD, kata E-pills. Yoregi te maka mana IUCD nigi homons kuomgi, makelo chachruok e rembi mar dwe ekinde ma itiyo gi yoregi. Lokruokgi biro rumo ka iweyo tiyo gi yoregi. IUCD onge gi homons, to en ei ofuko mar nyuol ma nyalo kelochwer mang'eny kata rem mar dwe. lokruok e chwer mar dwe gi ONGE gi tudruok moro amora gi nyaloni mar mako ich e ndalo mabiro",
      "Lokruok e chwer mar remb dwe en gima ni kare ekinde ma itiyo gi Implant, Depo, daily pills, IUCD, kata E-pills. Yoregi te maka mana IUCD nigi homons kuomgi, makelo chachruok e rembi mar dwe ekinde ma itiyo gi yoregi. Lokruokgi biro rumo ka iweyo tiyo gi yoregi. IUCD onge gi homons, to en ei ofuko mar nyuol ma nyalo kelochwer mang'eny kata rem mar dwe. lokruok e chwer mar dwe gi ONGE gi tudruok moro amora gi nyaloni mar mako ich e ndalo mabiro",
      "Lokruok e chwer mar remb dwe en gima ni kare ekinde ma itiyo gi Implant, Depo, daily pills, IUCD, kata E-pills. Yoregi te maka mana IUCD nigi homons kuomgi, makelo chachruok e rembi mar dwe ekinde ma itiyo gi yoregi. Lokruokgi biro rumo ka iweyo tiyo gi yoregi. IUCD onge gi homons, to en ei ofuko mar nyuol ma nyalo kelochwer mang'eny kata rem mar dwe. lokruok e chwer mar dwe gi ONGE gi tudruok moro amora gi nyaloni mar mako ich e ndalo mabiro",
      "Lokruok e chwer mar remb dwe en gima ni kare ekinde ma itiyo gi Implant, Depo, daily pills, IUCD, kata E-pills. Yoregi te maka mana IUCD nigi homons kuomgi, makelo chachruok e rembi mar dwe ekinde ma itiyo gi yoregi. Lokruokgi biro rumo ka iweyo tiyo gi yoregi. IUCD onge gi homons, to en ei ofuko mar nyuol ma nyalo kelochwer mang'eny kata rem mar dwe. lokruok e chwer mar dwe gi ONGE gi tudruok moro amora gi nyaloni mar mako ich e ndalo mabiro",
      "Lokruok e chwer mar remb dwe en gima ni kare ekinde ma itiyo gi Implant, Depo, daily pills, IUCD, kata E-pills. Yoregi te maka mana IUCD nigi homons kuomgi, makelo chachruok e rembi mar dwe ekinde ma itiyo gi yoregi. Lokruokgi biro rumo ka iweyo tiyo gi yoregi. IUCD onge gi homons, to en ei ofuko mar nyuol ma nyalo kelochwer mang'eny kata rem mar dwe. lokruok e chwer mar dwe gi ONGE gi tudruok moro amora gi nyaloni mar mako ich e ndalo mabiro",
      "Lokruok e chwer mar remb dwe en gima ni kare ekinde ma itiyo gi Implant, Depo, daily pills, IUCD, kata E-pills. Yoregi te maka mana IUCD nigi homons kuomgi, makelo chachruok e rembi mar dwe ekinde ma itiyo gi yoregi. Lokruokgi biro rumo ka iweyo tiyo gi yoregi. IUCD onge gi homons, to en ei ofuko mar nyuol ma nyalo kelochwer mang'eny kata rem mar dwe. lokruok e chwer mar dwe gi ONGE gi tudruok moro amora gi nyaloni mar mako ich e ndalo mabiro",
      "Lokruok e chwer mar remb dwe en gima ni kare ekinde ma itiyo gi Implant, Depo, daily pills, IUCD, kata E-pills. Yoregi te maka mana IUCD nigi homons kuomgi, makelo chachruok e rembi mar dwe ekinde ma itiyo gi yoregi. Lokruokgi biro rumo ka iweyo tiyo gi yoregi. IUCD onge gi homons, to en ei ofuko mar nyuol ma nyalo kelochwer mang'eny kata rem mar dwe. lokruok e chwer mar dwe gi ONGE gi tudruok moro amora gi nyaloni mar mako ich e ndalo mabiro"
    ],
    "English": [
      "Changes to your periods are normal when you are using the implant, depo, daily pills, IUCD, or E-pills. All of these methods except the IUCD have hormones in them, which have effects on your periods while you are using the method. These changes will stop if you stop using the method. The IUCD does not have hormones, but is inside the womb or uterus which can lead to heavier or crampier periods. These bleeding changes have NOTHING to do with your ability to get pregnant in the future.",
      "Changes to your periods are normal when you are using the implant, depo, daily pills, IUCD, or E-pills. All of these methods except the IUCD have hormones in them, which have effects on your periods while you are using the method. These changes will stop if you stop using the method. The IUCD does not have hormones, but is inside the womb or uterus which can lead to heavier or crampier periods. These bleeding changes have NOTHING to do with your ability to get pregnant in the future.",
      "Changes to your periods are normal when you are using the implant, depo, daily pills, IUCD, or E-pills. All of these methods except the IUCD have hormones in them, which have effects on your periods while you are using the method. These changes will stop if you stop using the method. The IUCD does not have hormones, but is inside the womb or uterus which can lead to heavier or crampier periods. These bleeding changes have NOTHING to do with your ability to get pregnant in the future.",
      "Changes to your periods are normal when you are using the implant, depo, daily pills, IUCD, or E-pills. All of these methods except the IUCD have hormones in them, which have effects on your periods while you are using the method. These changes will stop if you stop using the method. The IUCD does not have hormones, but is inside the womb or uterus which can lead to heavier or crampier periods. These bleeding changes have NOTHING to do with your ability to get pregnant in the future.",
      "Changes to your periods are normal when you are using the implant, depo, daily pills, IUCD, or E-pills. All of these methods except the IUCD have hormones in them, which have effects on your periods while you are using the method. These changes will stop if you stop using the method. The IUCD does not have hormones, but is inside the womb or uterus which can lead to heavier or crampier periods. These bleeding changes have NOTHING to do with your ability to get pregnant in the future.",
      "Changes to your periods are normal when you are using the implant, depo, daily pills, IUCD, or E-pills. All of these methods except the IUCD have hormones in them, which have effects on your periods while you are using the method. These changes will stop if you stop using the method. The IUCD does not have hormones, but is inside the womb or uterus which can lead to heavier or crampier periods. These bleeding changes have NOTHING to do with your ability to get pregnant in the future.",
      "Changes to your periods are normal when you are using the implant, depo, daily pills, IUCD, or E-pills. All of these methods except the IUCD have hormones in them, which have effects on your periods while you are using the method. These changes will stop if you stop using the method. The IUCD does not have hormones, but is inside the womb or uterus which can lead to heavier or crampier periods. These bleeding changes have NOTHING to do with your ability to get pregnant in the future."
    ],
  };

//   String videoAsset1 = 'videoAudio/videos/funnyCat.mp4';
//   String videoTitle1 = 'Video 1 Language Not Selected';
//   String videoAsset2 = 'videoAudio/videos/funnyCat2.mp4';
//   String videoTitle2 = 'Video 2 Language Not Selected';

//   final Map<String, Map<String, Map<String, String>>> languageToVideo = {
//   'video1': {
//     '0': { // Language code 0
//       'video': 'videoAudio/videos/chimes.mp4',
//       'text': 'Kiswahili Video #1',
//     },
//     '1': { // Language code 1
//       'video': 'videoAudio/videos/funnyCat.mp4',
//       'text': 'Dholuo Video #1',
//     },
//     '2': { // Language code 2
//       'video': 'videoAudio/videos/funnyCat2.mp4',
//       'text': 'English Video #1',
//     },
//   },
//   'video2': {
//     '0': {
//       'video': 'videoAudio/videos/chimes.mp4',
//       'text': 'Kiswahili Video #2',
//     },
//     '1': {
//       'video': 'videoAudio/videos/funnyCat.mp4',
//       'text': 'Dholuo Video #2',
//     },
//     '2': {
//       'video': 'videoAudio/videos/funnyCat2.mp4',
//       'text': 'English Video #2',
//     },
//   },
// };
  final double _aspectRatio = 16 / 10;

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
        title: Center(child: Text('Bleeding Changes EXPLAINED')),
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
                            //  video1 = getVideoContent1();
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
                            // video1 = getVideoContent1();
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
                            // video1 = getVideoContent1();
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
          // Container (
          //     width: boxWidth*0.8,
          //     child: Padding (
          //         padding: const EdgeInsets.only(top: 5.0, bottom: 20.0), // Adjust the padding as needed,
          //         child: Text(
          //           titleContentMap[languages[languageIndex]]!,
          //           softWrap: true, // Wrap text to the next line if needed
          //           textAlign: TextAlign.center,
          //           style: TextStyle(
          //               color: Colors.black,
          //             fontSize: 18.0
          //           ),
          //         )
          //     )

          // ),
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
                  // SizedBox(width: 5),
                  buildIconButton(MaraIcons.syringe, "Injection (depo)", 3),
                  // SizedBox(width: 5),
                  buildIconButton(MaraIcons.contraceptive_implant, "Implant", 4),
                  // SizedBox(width: 5),
                  buildIconButton(MaraIcons.iud, "IUCD (coil)", 5),
                  // SizedBox(width: 5),
                  buildIconButton(MaraIcons.double_pills, "Emergency pill (E-pill, P2)", 6),
                  buildIconButton(MaraIcons.birth_control_pills, "Pills (daily pills)", 2),
                ],
              ),
            ),
          ),

          SizedBox(height: 20.0),
          SizedBox(
            height: availableHeight * 0.60, // Adjust as needed
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
                                      child: updateMethodContent(),
                                    )
                                )
                            )
                          ]
                      )
                    // child: Center(
                    //   child: updateMethodContent(),
                    // ),
                  ),
                  // SizedBox(
                  //   width: boxWidth,
                  //   height: availableHeight * 0.5 * 0.6,
                  //   child: Center(
                  //     child: video1,
                  //   ),
                  // ),
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

  // String _getAsset(String videoKey, String language) {
  //     return languageToVideo[videoKey]?[language]?['video'] ?? 'Asset not found';
  // }

  // String _getTitle(String videoKey, String language) {
  //   return languageToVideo[videoKey]?[language]?['text'] ?? 'Text not found';
  // }
    
  // Widget getVideoContent1() {
  //     if (languageIndex == 0) {
  //       videoAsset1 = _getAsset('video1', '0');
  //       videoTitle1 = _getTitle('video1', '0');
  //     } else if (languageIndex == 1) {
  //         videoAsset1 = _getAsset('video1', '1');
  //         videoTitle1 = _getTitle('video1', '1');
  //     } else if (languageIndex == 2) {
  //         videoAsset1 = _getAsset('video1', '2');
  //         videoTitle1 = _getTitle('video1', '2');
  //     }
  //     return VideoWidget(videoAsset: videoAsset1, title: videoTitle1);
  // }

  Widget updateMethodContent() {
    return Text(
      contentDescriptionMap[languages[languageIndex]]![methodIndex],
      style: TextStyle(
        fontSize: 20.0,
        color: Colors.black,
      )
    );
  }
}
