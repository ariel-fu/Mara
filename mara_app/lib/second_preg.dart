import 'package:flutter/material.dart';
import 'package:mara_app/icons/mara_icons_icons.dart';
import 'video.dart';

class SecondPreg extends StatefulWidget {
  const SecondPreg({Key? key}) : super(key: key);

  @override
  State<SecondPreg> createState() => _SecondPregState();
}

class _SecondPregState extends State<SecondPreg> {
  Widget methodContent = Text('DUMMY');
  Widget video1 = VideoWidget(videoAsset: 'videoAudio/videos/funnyCat.mp4', title:'Video 1 Language Not Selected');
  int methodIndex = 0; // Index of the selected icon button, 0 for default
  int languageIndex = 0; // similar indexing for language
  final languages = ["Kiswahili", "Dholuo", "English"];
  bool overrideIndex = false;

  final double _aspectRatio = 16 / 10;

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
      'video': 'videoAudio/videos/provider/provider3KS.mp4',
      'text': 'Video - Daktari Aeleza',
    },
    '1': { // Language code 1
      'video': 'videoAudio/videos/provider/provider3DL.mp4',
      'text': 'Vidio - Laktar Wuoyo',
    },
    '2': { // Language code 2
      'video': 'videoAudio/videos/provider/provider3E.mp4',
      'text': 'Video - A Doctor Explains',
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

    // double screenWidth = MediaQuery.of(context).size.width;
    // double boxWidth = screenWidth * 0.85;

    // double screenHeight = MediaQuery.of(context).size.height;
    // double availableHeight = screenHeight;
    // double boxHeight = availableHeight * 0.25;

  double containerWidth = MediaQuery.of(context).size.width;
  double containerHeight = MediaQuery.of(context).size.height;
  if (containerHeight / containerWidth > _aspectRatio) {
    containerHeight = containerWidth * _aspectRatio;
  } else {
    containerWidth = containerHeight / _aspectRatio;
  }
  double boxWidth = containerWidth;
  double boxHeight = containerHeight;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushNamed('/pregnant');
          },
        ),
        title: Text('Comparing methods to prevent pregnancy'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              height: containerHeight * 0.1,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          languageIndex = 0;
                          overrideIndex = true;
                          updateMethodContent();
                          video1 = updateVideoContent1();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                        languageIndex == 0 ? Colors.grey : null,
                      ),
                      child: Text('Kiswahili'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          languageIndex = 1;
                          overrideIndex = true;
                          updateMethodContent();
                          video1 = updateVideoContent1();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                        languageIndex == 1 ? Colors.grey : null,
                      ),
                      child: Text('Dholuo'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          languageIndex = 2;
                          overrideIndex = true;
                          updateMethodContent();
                          video1 = updateVideoContent1();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                        languageIndex == 2 ? Colors.grey : null,
                      ),
                      child: Text('English'),
                    ),
                  ],
                ),
              )),
          SizedBox(height: 20.0),
          Container(
            alignment: Alignment.center,
            height: containerHeight * 0.1,
            width: boxWidth,
            // padding: EdgeInsets.symmetric(horizontal: 0.1*boxWidth),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildIconButton(MaraIcons.syringe, 3),
                  buildIconButton(MaraIcons.contraceptive_implant, 4),
                  buildIconButton(MaraIcons.iud, 5),
                  buildIconButton(MaraIcons.double_pills, 6),
                  buildIconButton(MaraIcons.birth_control_pills, 2),
                ],
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Container (
            height: containerHeight * 0.6, // Adjust as needed
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                      width: boxWidth,
                      height: boxHeight * 0.5 * 0.6,
                      child: Center(child:video1),
               ),                    
                Container(
                  width: boxWidth,
                  height: boxHeight * 0.25,
                  color: Colors.blue,
                  child: Center(
                    child: methodContent,
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

  Widget buildIconButton(IconData iconData, int index) {
    bool isSelected = index == methodIndex;

    return Stack(
      alignment: Alignment.center,
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
      ],
    );
  }

  void updateMethodContent() {
    methodContent = Text(
        contentDescriptionMap[languages[languageIndex]]![methodIndex],
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.white,
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
}
