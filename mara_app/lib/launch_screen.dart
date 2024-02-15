import 'package:flutter/material.dart';
import 'package:excel/excel.dart';
import 'dart:io';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  List<List<String>> languages = List.generate(3, (_) => <String>[]);
  int selectedButtonIndex = 0; // Track button states

  @override
  void initState() {
    super.initState();
    loadTranslations();
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

  Future<void> loadTranslations() async {
    await parseExcelFile('assets/string-resources/dummy.xlsx');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedButtonIndex = 0;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: selectedButtonIndex == 0 ? Colors.grey : null,
                  ),
                  child: Text(
                    languages[0].isNotEmpty ? languages[0][0] : '',
                  ),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedButtonIndex = 1;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: selectedButtonIndex == 1 ? Colors.grey : null,
                  ),
                  child: Text(
                    languages[1].isNotEmpty ? languages[1][0] : '',
                  ),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedButtonIndex = 2;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: selectedButtonIndex == 2 ? Colors.grey : null,
                  ),
                  child: Text(
                    languages[2].isNotEmpty ? languages[2][0] : '',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: new Text(languages[selectedButtonIndex][1]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
