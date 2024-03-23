import 'package:flutter/material.dart';
import 'package:mara_app/icons/mara_icons_icons.dart';
import 'video.dart';

class TimePage extends StatefulWidget {
  const TimePage({Key? key}) : super(key: key);

  @override
  State<TimePage> createState() => _TimePageState();
}

class _TimePageState extends State<TimePage> {
  Widget methodContent = Text('DUMMY');
  // TODO - replace the language/content with a hashmap?
  int methodIndex = -1; // Index of the selected icon button, -1 for none
  int languageIndex = -1; // similar indexing for language
  final languages = ["Kiswahili", "Dholuo", "English"];
  final content = [
    //could replace content string with a VideoWidget
    //but the asset of the video widget would change based on 
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
            padding: EdgeInsets.symmetric(horizontal: 50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildIconButton(MaraIcons.iud, 0),
                buildIconButton(MaraIcons.birth_control_pills, 1),
                buildIconButton(MaraIcons.condom, 2),
                buildIconButton(
                    MaraIcons.contraceptive_implant, 3),
                buildIconButton(MaraIcons.syringe, 4),
                buildIconButton(MaraIcons.female_condom, 5),
              ],
            ),
          ),
          SizedBox(height: 16.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: boxWidth,
                height: boxHeight,
                color: Colors.blue,
                child: Center(
                  // TODO - this methodContent is the first text/video/audio content associated with the method
                  child: methodContent,
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                width: boxWidth,
                height: boxHeight,
                color: Colors.green,
                child: Center(
                  // TODO - this methodContent is the second text/video/audio content associated with the method
                  child: methodContent,
                ),
              ),
              Container(
                alignment: Alignment.center,
                //ATTENTION ALL YOUNG WOMEN:  Male and female condoms are the ONLY family planning methods that also prevent HIV and other STIs!
                child: Text(
                  'ATTENTION ALL YOUNG WOMEN: Male and female condoms are the ONLY family planning methods that also prevent HIV and other STIs!'),
              ),
            ],
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
          iconSize: isSelected ? 100 : 60,
          padding: EdgeInsets.all(10),
          splashRadius: 40,
          splashColor: Colors.grey.withOpacity(0.5),
          highlightColor: Colors.transparent,
        ),
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
}




// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:excel/excel.dart';

// class TimePage extends StatefulWidget {
//   const TimePage({Key? key}) : super(key: key);

//   @override
//   State<TimePage> createState() => _TimePageState();
// }

// class _TimePageState extends State<TimePage> {
//   int selectedButtonIndex = 0; // Default value
//   bool overrideIndex = false;
//   List<List<String>> languages = List.generate(3, (_) => <String>[]);

//   @override
//   void initState() {
//     super.initState();
//     loadTranslations();
//   }

//   Future<void> loadTranslations() async {
//     await parseExcelFile('assets/string-resources/dummy.xlsx');
//   }

//   Future<void> parseExcelFile(String filePath) async {
//     var bytes = File(filePath).readAsBytesSync();
//     var excel = Excel.decodeBytes(bytes);

//     List<List<String>> arrays = List.generate(3, (_) => <String>[]);

//     for (var table in excel.tables.keys) {
//       for (var row in excel.tables[table]!.rows) {
//         for (int i = 0; i < row.length; i++) {
//           CellValue? val = row[i]?.value;
//           if (val != null) {
//             arrays[i].add(val.toString());
//           }
//         }
//       }
//     }

//     setState(() {
//       languages = arrays;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Receive selectedButtonIndex as a route argument if available
//     final int? routeArgumentIndex =
//         ModalRoute.of(context)?.settings.arguments as int?;

//     // Update selectedButtonIndex if a valid value is provided from the route
//     if (routeArgumentIndex != null &&
//         routeArgumentIndex >= 0 &&
//         routeArgumentIndex < languages.length &&
//         !overrideIndex) {
//       selectedButtonIndex = routeArgumentIndex;
//     }

//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(Icons.menu),
//           onPressed: () {
//             Navigator.of(context).pushNamed('/home', arguments: selectedButtonIndex);
//           },
//         ),
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text('How long will it last?'), // Header with title
//             // Buttons with translations on the top right
//             Row(
//               children: <Widget>[
//                 ElevatedButton(
//                   onPressed: () {
//                     setState(() {
//                       overrideIndex = true;
//                       selectedButtonIndex = 0;
//                     });
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor:
//                         selectedButtonIndex == 0 ? Colors.grey : null,
//                   ),
//                   child: Text(
//                     languages[0].isNotEmpty ? languages[0][0] : '',
//                   ),
//                 ),
//                 const SizedBox(width: 20),
//                 ElevatedButton(
//                   onPressed: () {
//                     setState(() {
//                       overrideIndex = true;
//                       selectedButtonIndex = 1;
//                     });
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor:
//                         selectedButtonIndex == 1 ? Colors.grey : null,
//                   ),
//                   child: Text(
//                     languages[1].isNotEmpty ? languages[1][0] : '',
//                   ),
//                 ),
//                 const SizedBox(width: 20),
//                 ElevatedButton(
//                   onPressed: () {
//                     setState(() {
//                       overrideIndex = true;
//                       selectedButtonIndex = 2;
//                     });
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor:
//                         selectedButtonIndex == 2 ? Colors.grey : null,
//                   ),
//                   child: Text(
//                     languages[2].isNotEmpty ? languages[2][0] : '',
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//       body: Center(
//         child: Text(
//           'Time Page',
//           style: TextStyle(
//             fontSize: 30,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   }
// }
