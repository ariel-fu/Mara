import 'package:flutter/material.dart';
import 'package:mara_app/icons/mara_icons_icons.dart';

class TemplatePage extends StatefulWidget {
  const TemplatePage({Key? key}) : super(key: key);

  @override
  State<TemplatePage> createState() => _TemplatePageState();
}

class _TemplatePageState extends State<TemplatePage> {
  Widget methodContent = Text('DUMMY');
  int methodIndex = 0; // Index of the selected icon button, 0 for default
  bool overrideIndex = false;
  int languageIndex = 0; // similar ind
  final languages = ["Kiswahili", "Dholuo", "English"];
  final content = [
    "method 1",
    "method 2",
    "method 3",
    "method 4",
    "method 5",
    "method 6"
  ];

  //Video HashMap: specifies video asset and text/title based on language and video
  final Map<String, Map<String, Map<String, String>>> languageToVideo = { 
      'video1': {
        '0': {
          'video': 'chimes.mp4',
          'text': 'Kiswahili Video #1',
        },
        '1': {
          'video': 'funnyCat.mp4',
          'text': 'Dholuo Video #1',
        },
        '2': {
          'video': 'funnyCat2.mp4',
          'text': 'English Video #1',
        },
      },
      'video2': {
        '0': {
          'video': 'chimes.mp4',
          'text': 'Kiswahili Video #2',
        },
        '1': {
          'video': 'funnyCat.mp4',
          'text': 'Dholuo Video #2',
        },
        '2': {
          'video': 'funnyCat2.mp4',
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
        title: Text('Can I keep it private?'),
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
                          overrideIndex = true;
                          updateMethodContent();
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
            height: availableHeight * 0.1,
            width: boxWidth,
            // padding: EdgeInsets.symmetric(horizontal: 0.1*boxWidth),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildIconButton(MaraIcons.condom, 0),
                  buildIconButton(MaraIcons.female_condom, 1),
                  buildIconButton(MaraIcons.birth_control_pills, 2),
                  buildIconButton(MaraIcons.syringe, 3),
                  buildIconButton(MaraIcons.contraceptive_implant, 4),
                  buildIconButton(MaraIcons.iud, 5),
                  buildIconButton(MaraIcons.double_pills, 6),
                  
                ],
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            height: availableHeight * 0.6, // Adjust as needed
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      languageIndex = 0;
                      updateMethodContent();
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: languageIndex == 0 ? Colors.grey : null,
                  ),
                  child: Text('Kiswahili'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      languageIndex = 1;
                      updateMethodContent();
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: languageIndex == 1 ? Colors.grey : null,
                  ),
                  child: Text('Dholuo'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      languageIndex = 2;
                      updateMethodContent();
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: languageIndex == 2 ? Colors.grey : null,
                  ),
                  child: Text('English'),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            alignment: Alignment.center,
            height: availableHeight * 0.1,
            width: boxWidth,
            // padding: EdgeInsets.symmetric(horizontal: 0.1*boxWidth),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildIconButton(MaraIcons.condom, 0),
                  buildIconButton(MaraIcons.female_condom, 1),
                  buildIconButton(MaraIcons.birth_control_pills, 2),
                  buildIconButton(MaraIcons.syringe, 3),
                  buildIconButton(MaraIcons.contraceptive_implant, 4),
                  buildIconButton(MaraIcons.iud, 5),
                  buildIconButton(MaraIcons.double_pills, 6),
                  
                ],
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Container(
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