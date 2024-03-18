import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as flutter;
import 'package:excel/excel.dart';
import 'video.dart';
import 'audio.dart';
import 'icons/mara_icons_icons.dart' show MaraIcons;

class PatternPage extends StatefulWidget {
  const PatternPage({Key? key}) : super(key: key);

  @override
  State<PatternPage> createState() => _PatternPageState();
}

class _PatternPageState extends State<PatternPage> {
  bool overrideIndex = false;
  int selectedButtonIndex = 0; // Default value

  List<List<String>> languages = List.generate(3, (_) => <String>[]);

  @override
  void initState() {
    super.initState();
    loadTranslations();
  }

  Future<void> loadTranslations() async {
    await parseExcelFile('assets/string-resources/dummy.xlsx');
  }

  Future<void> parseExcelFile(String filePath) async {
    var bytes = File(filePath).readAsBytesSync();
    var excel = Excel.decodeBytes(bytes);

    List<List<String>> arrays = List.generate(3, (_) => <String>[]);

    for (var table in excel.tables.keys) {
      for (var row in excel.tables[table]!.rows) {
        for (int i = 0; i < row.length; i++) {
          CellValue? val = row[i]?.value;
          if (val != null) {
            arrays[i].add(val.toString());
          }
        }
      }
    }

    setState(() {
      languages = arrays;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Receive selectedButtonIndex as a route argument if available
    final int? routeArgumentIndex =
        ModalRoute.of(context)?.settings.arguments as int?;

    String methodContent = "METHOD CONTENT";
    
    // Update selectedButtonIndex if a valid value is provided from the route
    if (routeArgumentIndex != null &&
        routeArgumentIndex >= 0 &&
        routeArgumentIndex < languages.length &&
        !overrideIndex) {
      selectedButtonIndex = routeArgumentIndex;
    }

    // var selectedButtonIndex = input == null ? input : 0;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {
            Navigator.of(context).pushNamed('/home', arguments: selectedButtonIndex);
          },
        ),
        title: Text('What will happen to my periods?')
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.topCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:[
                IconButton(
                    // icon:Image.asset('assets/string-resources/method_1.png'),
                    icon:Icon(MaraIcons.condom, size: 50),
                    onPressed: () {
                      print("hello!");
                      setState(() {
                        methodContent = "Method 1!";
                      });
                     },
                  ),
               
                IconButton(
                    // icon:Image.asset('assets/string-resources/method_2.png'),
                    icon:Icon(MaraIcons.female_condom, size:50),
                    onPressed: () {
                      setState(() {
                        methodContent = "Method 2!";
                      });
                    },
                ),
                  
               IconButton(
                    // icon:Image.asset('assets/string-resources/method_3.png'),
                    icon:Icon(MaraIcons.birth_control_pills, size:50),
                    onPressed: () {
                      setState(() {
                        methodContent = "Method 3!";
                      });
                    },
                ),
                  
               IconButton(
                    // icon:Image.asset('assets/string-resources/method_4.png'),
                    icon:Icon(MaraIcons.syringe, size:50),
                    onPressed: () {
                      setState(() {
                        methodContent = "Method 4!";
                      });
                    },
                ),
            
                IconButton(
                    icon:Icon(MaraIcons.contraceptive_implant, size:50),
                    onPressed: () {
                      setState(() {
                        methodContent = "Method 5!";
                      });
                    },
                  ),
                
                  
                IconButton(
                    icon:Icon(MaraIcons.iud, size:50),
                    onPressed: () {
                      setState(() {
                        methodContent = "Method 6!";
                      });
                    },
                  ),

                  IconButton(
                    // icon:Image.asset('assets/string-resources/method_5.png'),
                    icon:Icon(MaraIcons.double_pills, size:50),
                    onPressed: () {
                      setState(() {
                        methodContent = "Method 7!";
                      });
                    },
                ),
                ],

            ),
          ),
          // Container(
          //   alignment:Alignment.center,
          //   child: AudioWidget(audioAsset: 'purr.mp3'),
          // ),
          Container(
            decoration: BoxDecoration(
              border: flutter.Border.all(
                color: Colors.black,
                width: 2.0,
              ),
            ),
            alignment:Alignment.bottomCenter,
            child: Text(methodContent, style: TextStyle(
                    fontSize: 18.0)),
          ),
          
          Expanded (
            child: Row(
              children: [
                Expanded(
                  child: VideoWidget(videoAsset: "videoAudio/videos/chimes.mp4", title: "Wind Chimes"),
                ),
                Expanded(
                  child: VideoWidget(videoAsset: "videoAudio/videos/funnyCat.mp4", title: "Funny Cat"),
                ),
                Expanded(
                  child: VideoWidget(videoAsset: "videoAudio/videos/funnyCat2.mp4", title: "Cool Cat"),
                ),
              ]
          ),
        ),
        ]
      )
    );
  }
}