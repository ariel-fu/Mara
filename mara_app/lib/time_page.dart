import 'dart:io';

import 'package:flutter/material.dart';
import 'package:excel/excel.dart';

class TimePage extends StatefulWidget {
  const TimePage({Key? key}) : super(key: key);

  @override
  State<TimePage> createState() => _TimePageState();
}

class _TimePageState extends State<TimePage> {
  int selectedButtonIndex = 0; // Default value
  bool overrideIndex = false;
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

    // Update selectedButtonIndex if a valid value is provided from the route
    if (routeArgumentIndex != null &&
        routeArgumentIndex >= 0 &&
        routeArgumentIndex < languages.length &&
        !overrideIndex) {
      selectedButtonIndex = routeArgumentIndex;
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Navigator.of(context).pushNamed('/home', arguments: selectedButtonIndex);
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('How long will it last?'), // Header with title
            // Buttons with translations on the top right
            Row(
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      overrideIndex = true;
                      selectedButtonIndex = 0;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        selectedButtonIndex == 0 ? Colors.grey : null,
                  ),
                  child: Text(
                    languages[0].isNotEmpty ? languages[0][0] : '',
                  ),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      overrideIndex = true;
                      selectedButtonIndex = 1;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        selectedButtonIndex == 1 ? Colors.grey : null,
                  ),
                  child: Text(
                    languages[1].isNotEmpty ? languages[1][0] : '',
                  ),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      overrideIndex = true;
                      selectedButtonIndex = 2;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        selectedButtonIndex == 2 ? Colors.grey : null,
                  ),
                  child: Text(
                    languages[2].isNotEmpty ? languages[2][0] : '',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          'Time Page',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
