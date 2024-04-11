import 'package:flutter/material.dart';
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
      "method 1 - condom in Kiswahili",
      "method 2 - female condom in Kiswahili",
      "method 3 - birth control pills in Kiswahili",
      "method 4 - syringe in Kiswahili",
      "method 5 - contraceptive implant in Kiswahili",
      "method 6 - iud in Kiswahili",
      "method 7 - double pills in Kiswahili"
    ],
    "Dholuo": [
      "method 1 - condom in Dholuo",
      "method 2 - female condom in Dholuo",
      "method 3 - birth control pills in Dholuo",
      "method 4 - syringe in Dholuo",
      "method 5 - contraceptive implant in Dholuo",
      "method 6 - iud in Dholuo",
      "method 7 - double pills in Dholuo"
    ],
    "English": [
       "method 1 - condom in English",
      "method 2 - female condom in English",
      "method 3 - birth control pills in English",
      "method 4 - syringe in English",
      "method 5 - contraceptive implant in English",
      "method 6 - iud in English",
      "method 7 - double pills in English"
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
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {
            Navigator.of(context).pushNamed('/home');
          },
        ),
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
                                        IconButton(
                                        icon: const ImageIcon(AssetImage('assets/noun_project/question.png')),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => BleedingPage()),
                                          );
                                        },
                                      ),
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
