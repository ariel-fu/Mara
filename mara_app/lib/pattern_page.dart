import 'package:flutter/material.dart';
import 'package:mara_app/icons/mara_icons_icons.dart';
import 'video.dart';
import 'bleeding.dart';

class PatternPage extends StatefulWidget {
  const PatternPage({Key? key}) : super(key: key);

  @override
  State<PatternPage> createState() => _PatternPageState();
}

class _PatternPageState extends State<PatternPage> {
  Widget methodContent = Text('method content');
  String videoAsset1 = 'videoAudio/videos/funnyCat.mp4';
  String videoTitle1 = 'Video 1 Language Not Selected';
  String videoAsset2 = 'videoAudio/videos/funnyCat2.mp4';
  String videoTitle2 = 'Video 2 Language Not Selected';

  Widget video1 = VideoWidget(videoAsset: 'videoAudio/videos/provider/provider1E.mp4', title:'Video - A Doctor Explains');
  Widget video2 = VideoWidget(videoAsset: 'videoAudio/videos/peer/peer1E.mp4', title:'Video - A Peer Perspective');
  
  int methodIndex = -1; // Index of the selected icon button, -1 for none
  int languageIndex = -1; // similar indexing for language
  final double _aspectRatio = 16/10;
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
          icon: const Icon(Icons.home),
          onPressed: () {
            Navigator.of(context).pushNamed('/home');
          },
        ),
        title: Text('What Will Happen To My Period?'),
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
                          updateMethodContent();
                          video1 = updateVideoContent1();
                          video2 = updateVideoContent2();
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
                          updateMethodContent();
                          video1 = updateVideoContent1();
                          video2 = updateVideoContent2();
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
                          updateMethodContent();
                          video1 = updateVideoContent1();
                          video2 = updateVideoContent2();
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
            height: containerHeight * 0.1,
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildIconButton(MaraIcons.iud, 0),
                  buildIconButton(MaraIcons.birth_control_pills, 1),
                  buildIconButton(MaraIcons.condom, 2),
                  buildIconButton(MaraIcons.contraceptive_implant, 3),
                  buildIconButton(MaraIcons.syringe, 4),
                  buildIconButton(MaraIcons.female_condom, 5),
                ],
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Container (
            height: containerHeight * 0.6, // Adjust as needed
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment:CrossAxisAlignment.center,
              children: [
                Container(
                  width: boxWidth,
                  height: boxHeight * 0.6 * 0.5,
                  color: Colors.blue,
                  child: Center(
                    child: methodContent,
                  ),
                ),

                Container(
                      width: boxWidth,
                      height: boxHeight / 0.25 - 500,
                      color: Colors.green,
                      child: Expanded(child:Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment:CrossAxisAlignment.end,
                        
                        children: [
                          Expanded(// Adjust the aspect ratio as needed
                              child: VideoWidget(videoAsset: videoAsset1, title: videoTitle1),
                          ),
                          Expanded(
                              child: VideoWidget(videoAsset: videoAsset2, title: videoTitle2),
                          ),
                        ],
                      ),),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildIconButton(IconData iconData, int index) {
    bool isSelected = index == methodIndex;

    return Stack(
      alignment: Alignment.center,
      children: [
        IconButton(
          icon: Icon(
            iconData,
            size: isSelected ? 100 : 60,
            color: isSelected ? Colors.black : Colors.grey,
          ),
          onPressed: () {
            setState(() {
              methodIndex = index;
              updateMethodContent();
            });
          },
          color: isSelected ? Colors.black : Colors.transparent,
          iconSize: isSelected ? 100 : 60,
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
      return languageToVideo[videoKey]?[language]?['video'] ?? 'Asset not found';
  }

  String _getTitle(String videoKey, String language) {
    return languageToVideo[videoKey]?[language]?['text'] ?? 'Text not found';
    return languageToVideo[videoKey]?[language]?['text'] ?? 'Text not found';
  }
    
  void updateVideoContent() {
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
