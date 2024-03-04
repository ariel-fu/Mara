import 'dart:io';
import 'package:flutter/material.dart';
import 'package:excel/excel.dart';
import 'video.dart';
import 'audio.dart';

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

    String methodContent = "HELLOOOO";
    
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
                SizedBox(
                  child: IconButton(
                    icon:Image.asset('assets/string-resources/method_1.png'),
                    onPressed: () {setState(() {methodContent = "Method 1!";});},
                  ),
                  width:80,
                  height:80,
                ),
                SizedBox(
                  child: IconButton(
                    icon:Image.asset('assets/string-resources/method_2.png'),
                    onPressed: () {
                      setState(() {
                        methodContent = "Method 1!";
                      });
                    },
                  ),
                  width:80,
                  height:80,
                ),
                SizedBox(
                  child: IconButton(
                    icon:Image.asset('assets/string-resources/method_3.png'),
                    onPressed: () {methodContent = "Method 3!";},
                  ),
                  width:80,
                  height:80,
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(methodContent, style: TextStyle(
                  fontSize: 18.0),
            ),
          ),
        
          // Row(
          //   children: [
          //     Expanded(
          //       child: VideoWidget(videoAsset: "videoAudio/videos/chimes.mp4", title: "Wind Chimes"),
          //     ),
          //     Expanded(
          //       child: VideoWidget(videoAsset: "videoAudio/videos/funnyCat.mp4", title: "Funny Cat"),
          //     ),
          //   ]
          // ),
        ]
      )
    );
  }
}