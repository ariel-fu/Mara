import 'package:flutter/material.dart';
import 'package:mara_app/icons/mara_icons_icons.dart';
import 'video.dart';

class TimePage extends StatefulWidget {
  const TimePage({Key? key}) : super(key: key);

  @override
  State<TimePage> createState() => _TimePageState();
}

class _TimePageState extends State<TimePage> {
  Widget methodContent = Text('How Long Will It Last?');
  String videoAsset1 = 'funnyCat.mp4';
  String videoTitle1 = 'Video 1 Language Not Selected';
  String videoAsset2 = 'funnyCat2.mp4';
  String videoTitle2 = 'Video 2 Language Not Selected';

  int methodIndex = -1; // Index of the selected icon button, -1 for none
  int languageIndex = -1; // similar indexing for language
  final languages = ["Kiswahili", "Dholuo", "English"];
  final content = [
    "method 1",
    "method 2",
    "method 3",
    "method 4",
    "method 5",
    "method 6"
  ];

  //HashMap: specifies video asset and text/title based on language and video
  final Map<String, Map<String, Map<String, String>>> languageToVideo = { 
      'video1': {
        '0': {
          'video': 'chimes.mp4',
          'text': 'English Video #1',
        },
        '1': {
          'video': 'funnyCat.mp4',
          'text': 'Kiswahili Video #1',
        },
        '2': {
          'video': 'funnyCat2.mp4',
          'text': 'Luo Video #1',
        },
      },
      'video2': {
        '0': {
          'video': 'chimes.mp4',
          'text': 'English Video #2',
        },
        '1': {
          'video': 'funnyCat.mp4',
          'text': 'Kiswahili Video #2',
        },
        '2': {
          'video': 'funnyCat2.mp4',
          'text': 'Luo Video #2',
        },
      },
  };

  @override
  Widget build(BuildContext context) {
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
        title: Text('How Long Will It Last?'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              height: availableHeight * 0.1,
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
                          updateVideoContent();
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
                          updateVideoContent();
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
                          updateVideoContent();
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
            height: availableHeight * 0.1,
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
            height: availableHeight * 0.6, // Adjust as needed
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: boxWidth,
                  height: boxHeight,
                  color: Colors.blue,
                  child: Center(
                    child: methodContent,
                  ),
                ),
                Container(
                      width: boxWidth,
                      height: availableHeight * 0.25 - 10,
                      color: Colors.green,
                      child: Center(
                        child: Text('ATTENTION ALL YOUNG WOMEN:  Male and female condoms are the ONLY family planning methods that also prevent HIV and other STIs!'), 
                      ),
                ),
                
                // Row(
                //   children: [
                //     Container(
                //       width: boxWidth,
                //       height: availableHeight * 0.25 - 10,
                //       color: Colors.green,
                //       child: Center(
                //         child: VideoWidget(videoAsset: videoAsset1, title:videoTitle1), 
                //       ),
                //     ),
                //     Container(
                //       width: boxWidth,
                //       height: availableHeight * 0.25 - 10,
                //       color: Colors.green,
                //       child: Center(
                //         child: VideoWidget(videoAsset: videoAsset2, title:videoTitle2), 
                //       ),
                //     ),
                //   ]
                // ),
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
      languageIndex != -1
          ? (languages[languageIndex] + " | " + content[methodIndex])
          : "no content",
      style: TextStyle(
        fontSize: 20.0,
        color: Colors.white,
      ),
    );
  }

  String _getAsset(String videoKey, String language) {
    return (languageToVideo[videoKey]?[language] ?? 'video').toString();
  }

  String _getTitle(String videoKey, String language) {
      return (languageToVideo[videoKey]?[language] ?? 'text').toString();
  }

  void updateVideoContent() {
      if (languageIndex == 0) {
        videoAsset1 = _getAsset('video1', '0');
        videoTitle1 = _getTitle('video1', '0');
        videoAsset2 = _getAsset('video2', '0');
        videoTitle2 = _getTitle('video2', '0');
      } else if (languageIndex == 1) {
          videoAsset1 = _getAsset('video1', '1');
          videoTitle1 = _getTitle('video1', '1');
          videoAsset2 = _getAsset('video2', '1');
          videoTitle2 = _getTitle('video2', '1');
      } else if (languageIndex == 2) {
          videoAsset1 = _getAsset('video1', '2');
          videoTitle1 = _getTitle('video1', '2');
          videoAsset2 = _getAsset('video2', '2');
          videoTitle2 = _getTitle('video2', '2');
      }
  }
}