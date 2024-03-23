import 'package:flutter/material.dart';
import 'package:mara_app/icons/mara_icons_icons.dart';
import 'video.dart';

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
        title: Text('What Will Happen To My Period?'),
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
      return languageToVideo[videoKey]?[language]?['video'] ?? 'Asset not found';
  }

  String _getTitle(String videoKey, String language) {
    return languageToVideo[videoKey]?[language]?['text'] ?? 'Text not found';
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






// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter/material.dart' as flutter;
// import 'package:excel/excel.dart';
// import 'video.dart';
// import 'audio.dart';
// import 'icons/mara_icons_icons.dart' show MaraIcons;

// class PatternPage extends StatefulWidget {
//   const PatternPage({Key? key}) : super(key: key);

//   @override
//   State<PatternPage> createState() => _PatternPageState();
// }

// class _PatternPageState extends State<PatternPage> {
//   bool overrideIndex = false;
//   int selectedButtonIndex = 0; // Default value

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

//     String methodContent = "METHOD CONTENT";
    
//     // Update selectedButtonIndex if a valid value is provided from the route
//     if (routeArgumentIndex != null &&
//         routeArgumentIndex >= 0 &&
//         routeArgumentIndex < languages.length &&
//         !overrideIndex) {
//       selectedButtonIndex = routeArgumentIndex;
//     }

//     // var selectedButtonIndex = input == null ? input : 0;
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(Icons.home),
//           onPressed: () {
//             Navigator.of(context).pushNamed('/home', arguments: selectedButtonIndex);
//           },
//         ),
//         title: Text('What will happen to my periods?')
//       ),
//       body: Column(
//         children: [
//           Container(
//             alignment: Alignment.topCenter,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children:[
//                 IconButton(
//                     // icon:Image.asset('assets/string-resources/method_1.png'),
//                     icon:Icon(MaraIcons.condom, size: 50),
//                     onPressed: () {
//                       print("hello!");
//                       setState(() {
//                         methodContent = "Method 1!";
//                       });
//                      },
//                   ),
               
//                 IconButton(
//                     // icon:Image.asset('assets/string-resources/method_2.png'),
//                     icon:Icon(MaraIcons.female_condom, size:50),
//                     onPressed: () {
//                       setState(() {
//                         methodContent = "Method 2!";
//                       });
//                     },
//                 ),
                  
//                IconButton(
//                     // icon:Image.asset('assets/string-resources/method_3.png'),
//                     icon:Icon(MaraIcons.birth_control_pills, size:50),
//                     onPressed: () {
//                       setState(() {
//                         methodContent = "Method 3!";
//                       });
//                     },
//                 ),
                  
//                IconButton(
//                     // icon:Image.asset('assets/string-resources/method_4.png'),
//                     icon:Icon(MaraIcons.syringe, size:50),
//                     onPressed: () {
//                       setState(() {
//                         methodContent = "Method 4!";
//                       });
//                     },
//                 ),
            
//                 IconButton(
//                     icon:Icon(MaraIcons.contraceptive_implant, size:50),
//                     onPressed: () {
//                       setState(() {
//                         methodContent = "Method 5!";
//                       });
//                     },
//                   ),
                
                  
//                 IconButton(
//                     icon:Icon(MaraIcons.iud, size:50),
//                     onPressed: () {
//                       setState(() {
//                         methodContent = "Method 6!";
//                       });
//                     },
//                   ),

//                   IconButton(
//                     // icon:Image.asset('assets/string-resources/method_5.png'),
//                     icon:Icon(MaraIcons.double_pills, size:50),
//                     onPressed: () {
//                       setState(() {
//                         methodContent = "Method 7!";
//                       });
//                     },
//                 ),
//                 ],

//             ),
//           ),
//           // Container(
//           //   alignment:Alignment.center,
//           //   child: AudioWidget(audioAsset: 'purr.mp3'),
//           // ),
//           Container(
//             decoration: BoxDecoration(
//               border: flutter.Border.all(
//                 color: Colors.black,
//                 width: 2.0,
//               ),
//             ),
//             alignment:Alignment.bottomCenter,
//             child: Text(methodContent, style: TextStyle(
//                     fontSize: 18.0)),
//           ),
          
//           Expanded (
//             child: Row(
//               children: [
//                 Expanded(
//                   child: VideoWidget(videoAsset: "videoAudio/videos/chimes.mp4", title: "Wind Chimes"),
//                 ),
//                 Expanded(
//                   child: VideoWidget(videoAsset: "videoAudio/videos/funnyCat.mp4", title: "Funny Cat"),
//                 ),
//                 Expanded(
//                   child: VideoWidget(videoAsset: "videoAudio/videos/funnyCat2.mp4", title: "Cool Cat"),
//                 ),
//               ]
//           ),
//         ),
//         ]
//       )
//     );
//   }
// }