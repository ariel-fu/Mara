import 'package:flutter/material.dart';
import 'package:mara_app/icons/mara_icons_icons.dart';
import 'video.dart';

class LearnMoreFertility extends StatefulWidget {
  const LearnMoreFertility({Key? key}) : super(key: key);

  @override
  State<LearnMoreFertility> createState() => _LearnMoreFertilityState();
}

class _LearnMoreFertilityState extends State<LearnMoreFertility> {
  Widget methodContent = Text('DUMMY');
  int methodIndex = 0; // Index of the selected icon button, 0 for default
  int languageIndex = 0; // Index for language
  final languages = ["Kiswahili", "Dholuo", "English"];
  bool overrideIndex = false; // Used to override language selection from route

  final Map<String, List<String>> contentDescriptionMap = {
    "Kiswahili": [
      "method 1 in Kiswahili",
      "method 2 in Kiswahili",
      "method 3 in Kiswahili", 
      "method 4 in Kiswahili", 
      "method 5 in Kiswahili", 
      "method 6 in Kiswahili", 
      "method 7 in Kiswahili", 
      
    ],
    "Dholuo": [
      "method 1 in Dholuo",
      "method 2 in Dholuo",
      "method 3 in Dholuo",
      "method 4 in Dholuo",
      "method 5 in Dholuo",
      "method 6 in Dholuo",
      "method 7 in Dholuo",
      // ... other methods in Dholuo
    ],
    "English": [
      "method 1 in English",
      "method 2 in English",
      "method 3 in English",
      "method 4 in English",
      "method 5 in English",
      "method 6 in English",
      "method 7 in English",
      // ... other methods in English
    ],
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
                  languageButton('Kiswahili', 0),
                  languageButton('Dholuo', 1),
                  languageButton('English', 2),
                ],
              ),
            ),
          ),
          SizedBox(height: 20.0),
          buildMethodSelectionRow(boxWidth),
          SizedBox(height: 20.0),
          buildContentArea(boxHeight, boxWidth),
        ],
      ),
    );
  }

  Widget languageButton(String language, int index) {
    bool isSelected = languageIndex == index;
    return ElevatedButton(
      onPressed: () {
        setState(() {
          languageIndex = index;
          overrideIndex = true;
          updateMethodContent();
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.grey : null,
      ),
      child: Text(language),
    );
  }

  Widget buildMethodSelectionRow(double boxWidth) {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height * 0.1,
      width: boxWidth,
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
    );
  }

  Widget buildIconButton(IconData iconData, int index) {
    bool isSelected = index == methodIndex;
    return IconButton(
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
    );
  }

  Widget buildContentArea(double boxHeight, double boxWidth) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
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
            width: boxWidth * 0.75,
            height: MediaQuery.of(context).size.height * 0.25 - 10,
            color: Colors.green,
            child: Center(
              child: Text(
                  contentDescriptionMap[languages[languageIndex]]![methodIndex]),
            ),
          ),
        ],
      ),
    );
  }

  void updateMethodContent() {
    setState(() {
      methodContent = Text(
        contentDescriptionMap[languages[languageIndex]]![methodIndex],
        style: TextStyle(fontSize: 20.0, color: Colors.white),
      );
    });
  }
}

