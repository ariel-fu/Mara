import 'package:flutter/material.dart';

class WhySomeMethodsBetter extends StatefulWidget {
  const WhySomeMethodsBetter({Key? key}) : super(key: key);

  @override
  State<WhySomeMethodsBetter> createState() => _WhySomeMethodsBetterState();
}
class _WhySomeMethodsBetterState extends State<WhySomeMethodsBetter> {
  bool overrideIndex = false;
  int methodIndex = 0; // Index of the selected icon button, 0 for default
  int languageIndex = 2; // similar indexing for language
  final languages = ["Kiswahili", "Dholuo", "English"];

  final Map<String, String> whyDo = {
    "Kiswahili": "KWA NINI baadhi ya mbinu za kupanga uzazi hufanya kazi vizuri zaidi kuliko zingine ili kuzuia mimba?",
    "Dholuo": "EN ANG'O MA OMIYO yore moko mag komo nyuol tiyoga maber mohingo moko e geng'o ich?",
    "English": "WHY do some methods work better than others to prevent pregnancy?",
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
    final double _aspectRatio = 16 / 10;

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
        title: Center(child: Text(whyDo[languages[languageIndex]]!)),
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
                            //updateText();
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
                            //updateText();
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
                            //updateText();
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
        ),
      ),
      body: 
      Center(
        child: Column (
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
              Image.asset(
                  'assets/chance_of_preg/search.png',
                  width: 40,
                  height: 40,
                ),
                Text(
                whyDo[languages[languageIndex]]!, 
                textAlign: TextAlign.center,// Your text
                style: TextStyle(
                  fontSize: 16, // Adjust the font size as you need
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                   // Adjust the color as you need
                ),
              ),
              SizedBox(height:50),
              Divider(),
              SizedBox(height:80),
              Text(
                "The Video will go here.", 
                textAlign: TextAlign.center,// Your text
                style: TextStyle(
                  fontSize: 16, // Adjust the font size as you need
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                   // Adjust the color as you need
                ),
              ),
              SizedBox(height:80),
              Divider(),
              SizedBox(height:60),
               Text(
                "Bottom content", 
                textAlign: TextAlign.center,// Your text
                style: TextStyle(
                  fontSize: 16, // Adjust the font size as you need
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                   // Adjust the color as you need
                ),
              ),
          ],
        ),
      ),
    );

  }
}