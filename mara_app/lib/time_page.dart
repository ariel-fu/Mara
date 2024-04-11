import 'package:flutter/material.dart';
import 'package:mara_app/icons/mara_icons_icons.dart';
import 'package:mara_app/hiv_page.dart';

class TimePage extends StatefulWidget {
  const TimePage({Key? key}) : super(key: key);

  @override
  State<TimePage> createState() => _TimePageState();
}

class _TimePageState extends State<TimePage> {
  bool overrideIndex = false;
  // Widget methodContent = updateMethodContent();
  int methodIndex = 2; // Index of the selected icon button, 0 for default
  int languageIndex = 2; // similar indexing for language
  final languages = ["Kiswahili", "Dholuo", "English"];

  final Map<String, String> titleContentMap = {
    "Kiswahili": "Baadhi ya watu wanataka kuweka njia yao ya matumizi ya faragha kutoka kwa washirika, wazazi na wengine. Gonga njia zilizo hapa chini ili kupata maelezo zaidi kuhusu faragha.",
    "Dholuo": "Jomoko dwaroga tiyo gi yore mag komo nyuol e yo mopondo ma joheragi, jonyuol kod jomamoko ok ong'eyo. Mul piny ebwo yore mag komo nyuol mondo ipuonjri matut ewi tiyo kodgi mopondo",
    "English": "Some people want to keep their method use private from partners, parents, and others. Tap on the below methods to learn more about privacy."
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
        title: Center(child: Text('How long does the method work?')),
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
          // SizedBox(height: availableHeight*0.01),
          Container (
              width: boxWidth*0.8,
              child: Padding (
                  padding: const EdgeInsets.only(top: 5.0, bottom: 20.0), // Adjust the padding as needed,
                  child: Text(
                    titleContentMap[languages[languageIndex]]!,
                    softWrap: true, // Wrap text to the next line if needed
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                      fontSize: 18.0
                    ),
                  )
              )

          ),
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
          Flex(
  direction: Axis.vertical,
  children: [
    Container(
      width: boxWidth * 0.9,
      height: boxHeight * 0.2,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(Icons.lightbulb_outline, color: Colors.amber),
          Center(
            child: SizedBox(
              width: boxWidth * 0.75,
              height: boxHeight * 0.5 * 0.3,
              child: Center(
                child: updateMethodContent(),
              ),
            ),
          ),
        ],
      ),
    ),
  ],
),
SizedBox(height: 15.0),
Container(
  width: boxWidth,
  height: boxHeight * 0.5 * 0.6 - 50,
  decoration: BoxDecoration(
    color: Colors.grey.shade200,
    borderRadius: BorderRadius.circular(8.0),
  ),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      ImageIcon(AssetImage('assets/noun_project/important.png')),
      Text(
        "ATTENTION ALL YOUNG WOMEN:  Male and female condoms are the ONLY family planning methods that also prevent HIV and other STIs! | " +
            contentDescriptionMap[languages[languageIndex]]![methodIndex],
      ),
      Text('CLICK BELOW TO LEARN MORE'),
      IconButton(
        icon: const ImageIcon(AssetImage('assets/noun_project/question.png')),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HIVPage()),
          );
        },
      ),
    ],
  ),
),

        ],
      ),  
    );

    Widget buildSecondaryContext() {
    return Text("ATTENTION ALL YOUNG WOMEN:  Male and female condoms are the ONLY family planning methods that also prevent HIV and other STIs! | " + 
      contentDescriptionMap[languages[languageIndex]]![methodIndex]);
  }}

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
}
