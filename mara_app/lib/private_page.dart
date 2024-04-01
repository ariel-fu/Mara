import 'package:flutter/material.dart';
import 'package:mara_app/icons/mara_icons_icons.dart';
import 'package:mara_app/video.dart';

class PrivatePage extends StatefulWidget {
  const PrivatePage({Key? key}) : super(key: key);

  @override
  State<PrivatePage> createState() => _PrivatePageState();
}

class _PrivatePageState extends State<PrivatePage> {
  bool overrideIndex = false;
  Widget methodContent = Text('DUMMY');
  int methodIndex = 0; // Index of the selected icon button, 0 for default
  int languageIndex = 0; // similar indexing for language
  final languages = ["Kiswahili", "Dholuo", "English"];

  final Map<String, List<String>> videoContentMap = {
    "Kiswahili": [
      "videoAudio/videos/funnyCat.mp4", // method 1 - condom
      "videoAudio/videos/funnyCat.mp4", // method 2 - female condom
      "videoAudio/videos/funnyCat.mp4", // method 3 - birth control pills
      "videoAudio/videos/funnyCat.mp4", // method 4 - syringe
      "videoAudio/videos/funnyCat.mp4", // method 5 - contraceptive implant
      "videoAudio/videos/funnyCat.mp4", // method 6 - iud
      "videoAudio/videos/funnyCat.mp4"  // method 7 - double pills
    ],
    "Dholuo": [
      "videoAudio/videos/chimes.mp4", // method 1 - condom
      "videoAudio/videos/chimes.mp4", // method 2 - female condom
      "videoAudio/videos/chimes.mp4", // method 3 - birth control pills
      "videoAudio/videos/chimes.mp4", // method 4 - syringe
      "videoAudio/videos/chimes.mp4", // method 5 - contraceptive implant
      "videoAudio/videos/chimes.mp4", // method 6 - iud
      "videoAudio/videos/chimes.mp4"  // method 7 - double pills
    ],
    "English": [
      "videoAudio/videos/funnyCat2.mp4", // method 1 - condom
      "videoAudio/videos/funnyCat2.mp4", // method 2 - female condom
      "videoAudio/videos/funnyCat2.mp4", // method 3 - birth control pills
      "videoAudio/videos/funnyCat2.mp4", // method 4 - syringe
      "videoAudio/videos/funnyCat2.mp4", // method 5 - contraceptive implant
      "videoAudio/videos/funnyCat2.mp4", // method 6 - iud
      "videoAudio/videos/funnyCat2.mp4"  // method 7 - double pills
    ],
  };

  final Map<String, List<String>> videoTitleMap = {
    "Kiswahili": [
      "title 1 - condom in Kiswahili",
      "title 2 - female condom in Kiswahili",
      "title 3 - birth control pills in Kiswahili",
      "title 4 - syringe in Kiswahili",
      "title 5 - contraceptive implant in Kiswahili",
      "title 6 - iud in Kiswahili",
      "title 7 - double pills in Kiswahili"
    ],
    "Dholuo": [
      "title 1 - condom in Dholuo",
      "title 2 - female condom in Dholuo",
      "title 3 - birth control pills in Dholuo",
      "title 4 - syringe in Dholuo",
      "title 5 - contraceptive implant in Dholuo",
      "title 6 - iud in Dholuo",
      "title 7 - double pills in Dholuo"
    ],
    "English": [
      "title 1 - condom in English",
      "title 2 - female condom in English",
      "title 3 - birth control pills in English",
      "title 4 - syringe in English",
      "title 5 - contraceptive implant in English",
      "title 6 - iud in English",
      "title 7 - double pills in English"
    ],
  };

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
  final double _aspectRatio = 16 / 10;

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

    double containerWidth = MediaQuery.of(context).size.width;
    double containerHeight = MediaQuery.of(context).size.height;
    if (containerHeight / containerWidth > _aspectRatio) {
      containerHeight = containerWidth * _aspectRatio;
    } else {
      containerWidth = containerHeight / _aspectRatio;
    }

    double boxWidth = containerWidth;
    double boxHeight = containerHeight;
    // double screenWidth = MediaQuery.of(context).size.width;
    // double boxWidth = screenWidth * 0.85;
    //
    // double screenHeight = MediaQuery.of(context).size.height;
    double availableHeight = boxHeight;
    // double boxHeight = availableHeight * 0.25;
    
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
          SizedBox(
              height: availableHeight*0.1,
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
              )),
          // SizedBox(height: availableHeight*0.01),
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
          SizedBox(height: 15.0),
          SizedBox(
            height: availableHeight * 0.70, // Adjust as needed
                child: Flex(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                direction: Axis.vertical,
                children: [
                  Container(
                    width: boxWidth,
                    height: availableHeight * 0.6 * 0.5,
                    color: Colors.blue,
                    child: Center(
                      child: methodContent,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  SizedBox(
                    width: boxWidth,
                    height: availableHeight * 0.6 * 0.5 - 6.5,
                    child: Center(
                      child: getVideoContent(),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget getVideoContent() {
    String asset = videoContentMap[languages[languageIndex]]![methodIndex];
    String title = videoTitleMap[languages[languageIndex]]![methodIndex];
    return VideoWidget(videoAsset: asset, title: title);
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
}
