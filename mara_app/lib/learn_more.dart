import 'package:flutter/material.dart';
import 'package:mara_app/icons/mara_icons_icons.dart';

class TemplatePage extends StatefulWidget {
  const TemplatePage({Key? key}) : super(key: key);

  @override
  State<TemplatePage> createState() => _TemplatePageState();
}

@immutable
class IconOrImage {
  final IconData? iconData;
  final String? imagePath;

  const IconOrImage.icon(this.iconData) : imagePath = null;
  const IconOrImage.image(this.imagePath) : iconData = null;
}

class _TemplatePageState extends State<TemplatePage> {
  Widget methodContent = Text('DUMMY');
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

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double boxWidth = screenWidth * 0.85;

    double screenHeight = MediaQuery.of(context).size.height;
    double availableHeight = screenHeight;
    double boxHeight = availableHeight * 0.25;

    return Scaffold(
      appBar: AppBar(
        
        title: Text('What if I\'m ready to have a baby'),
      ),
      body: SingleChildScrollView(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.search, size: 20), // Magnifying glass icon
                  SizedBox(width: 8), // Space between icon and text
                  Text(
                    'Tap each method to learn more about its fertility consideration',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
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

                  // buildIconButton(IconOrImage.image('assets/IUD.png'), 0),
                  // buildIconButton(IconOrImage.image('assets/pills.png'), 1),
                  // buildIconButton(IconOrImage.image('assets/condom.png'), 2),
                  // buildIconButton(IconOrImage.image('assets/implant.png'), 3),
                  // buildIconButton(IconOrImage.image('assets/emergency.png'), 4),
                  // buildIconButton(IconOrImage.image('assets/female_condom.png'), 5),
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
                // SizedBox(height: 10.0),
                Container(
                  width: boxWidth,
                  height: availableHeight * 0.25 - 10,
                  color: Colors.green,
                  child: Center(
                    child: methodContent,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      )
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
  // Check if the methodIndex is within the valid range
  if (methodIndex >= 0 && methodIndex < content.length) {
    methodContent = Text(
      languageIndex != -1
        ? "${languages[languageIndex]} | ${content[methodIndex]}"
        : "No content",
      style: TextStyle(
        fontSize: 20.0,
        color: Colors.white,
      ),
    );
  } else {
    // If methodIndex is not valid, show some default content
    methodContent = Text(
      "Select a method to see details",
      style: TextStyle(
        fontSize: 20.0,
        color: Colors.white,
      ),
    );
  }
}
}