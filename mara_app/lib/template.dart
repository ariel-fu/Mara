import 'package:flutter/material.dart';
import 'package:mara_app/icons/mara_icons_icons.dart';
import 'video.dart';

class TemplatePage extends StatefulWidget {
  const TemplatePage({Key? key}) : super(key: key);

  @override
  State<TemplatePage> createState() => _TemplatePageState();
}

class _TemplatePageState extends State<TemplatePage> {
  int methodIndex = 0; // Index of the selected icon button, 0 for default
  bool overrideIndex = false;
  int languageIndex = 2; // similar indexing for language, English as the default
  final languages = ["Kiswahili", "Dholuo", "English"];

  final Map<String, List<String>> iconLabelMap = {
    "Kiswahili": [
      'Condom in Kiswahili',
      "Female Condom in Kiswahili",
      "Birth Control Pills in Kiswahili",
      "Syringe in Kiswahili",
      "Contraceptive Implant in Kiswahili",
      "IUD in Kiswahili",
      "Emergency Contraceptive in Kiswahili"
    ],
    "Dholuo": [
      "Condom in Dholuo",
      "Female Condom in Dholuo",
      "Birth Control Pills in Dholuo",
      "Syringe in Dholuo",
      "Contraceptive Implant in Dholuo",
      "IUD in Dholuo",
      "Emergency Contraceptive in Dholuo"
    ],
    "English": [
      "Condom",
      "Female Condom",
      "Birth Control Pills",
      "Syringe",
      "Contraceptive Implant",
      "IUD",
      "Emergency Contraceptive"
    ],
  };

  final Map<String, List<String>> contentDescriptionMap = {
    "Kiswahili": [
      "method 1 in Kiswahili",
      "method 2 in Kiswahili",
      "method 3 in Kiswahili",
      "method 4 in Kiswahili",
      "method 5 in Kiswahili",
      "method 6 in Kiswahili",
      "method 7 in Kiswahili"
    ],
    "Dholuo": [
      "method 1 in Dholuo",
      "method 2 in Dholuo",
      "method 3 in Dholuo",
      "method 4 in Dholuo",
      "method 5 in Dholuo",
      "method 6 in Dholuo",
      "method 7 in Dholuo"
    ],
    "English": [
      "method 1 in English",
      "method 2 in English",
      "method 3 in English",
      "method 4 in English",
      "method 5 in English",
      "method 6 in English",
      "method 7 in English"
    ],
  };

  String videoAsset1 = 'videoAudio/videos/funnyCat.mp4';
  String videoTitle1 = 'Video 1 Language Not Selected';
  String videoAsset2 = 'videoAudio/videos/funnyCat2.mp4';
  String videoTitle2 = 'Video 2 Language Not Selected';

  final Map<String, Map<String, Map<String, String>>> languageToVideo = {
    'video1': {
      '0': { // Language code 0
        'video': 'videoAudio/videos/chimes.mp4',
        'text': 'Kiswahili Video #1',
      },
      '1': { // Language code 1
        'video': 'videoAudio/videos/funnyCat.mp4',
        'text': 'Dhuluo Video #1',
      },
      '2': { // Language code 2
        'video': 'videoAudio/videos/funnyCat2.mp4',
        'text': 'English Video #1',
      },
    },
    'video2': {
      '0': {
        'video': 'videoAudio/videos/chimes.mp4',
        'text': 'Kiswahili Video #2',
      },
      '1': {
        'video': 'videoAudio/videos/funnyCat.mp4',
        'text': 'Dholuo Video #2',
      },
      '2': {
        'video': 'videoAudio/videos/funnyCat2.mp4',
        'text': 'English Video #2',
      },
    },
  };

  @override
  Widget build(BuildContext context) {
    final int? routeArgumentIndex =
    ModalRoute.of(context)?.settings.arguments as int?;

    // Update languageIndex if a valid value is provided from the route
    if (routeArgumentIndex != null &&
        routeArgumentIndex >= 0 &&
        routeArgumentIndex < languages.length &&
        !overrideIndex) {
      languageIndex = routeArgumentIndex;
    }

    double screenWidth = MediaQuery.of(context).size.width;
    double boxWidth = screenWidth * 0.85;

    double screenHeight = MediaQuery.of(context).size.height;
    double availableHeight = screenHeight;
    double boxHeight = availableHeight * 0.25;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {
            Navigator.of(context).pushNamed('/home');
          },
        ),
        title: Center(child: Text('INSERT TITLE HERE')),
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
          Container(
            alignment: Alignment.center,
            // height: availableHeight * 0.15,
            // width: boxWidth,
            // padding: EdgeInsets.symmetric(horizontal: 0.1*boxWidth),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
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
          // SizedBox(height: 10.0),
          Container(
            height: availableHeight * 0.6, // Adjust as needed
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    width: boxWidth,
                    height: boxHeight,
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
                // SizedBox(height: 10.0),
                Container(
                  width: boxWidth * 0.75,
                  height: availableHeight * 0.25 - 10,
                  color: Colors.green,
                  child: Center(
                    child: buildSecondaryContext(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSecondaryContext() {
    return Text("some text here " +
        contentDescriptionMap[languages[languageIndex]]![methodIndex]);
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
