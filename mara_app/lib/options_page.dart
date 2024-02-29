import 'dart:io';

import 'package:flutter/material.dart';
import 'package:excel/excel.dart';
import 'option_pages/pills.dart';


class OptionsPage extends StatefulWidget {
  const OptionsPage({Key? key}) : super(key: key);

  @override
  State<OptionsPage> createState() => _OptionsPageState();
}

class _OptionsPageState extends State<OptionsPage> {
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
            Navigator.of(context).pushReplacementNamed('/home', arguments: selectedButtonIndex);
          },
        ),
        title: const Text('Options'),
        actions: [
          // Buttons with translations on the top right
          ElevatedButton(
            onPressed: () {
              setState(() {
                overrideIndex = true;
                selectedButtonIndex = 0;
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: selectedButtonIndex == 0 ? Colors.grey : null,
            ),
            child: Text(
              languages.isNotEmpty && languages[0].isNotEmpty ? languages[0][0] : '',
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
              backgroundColor: selectedButtonIndex == 1 ? Colors.grey : null,
            ),
            child: Text(
              languages.isNotEmpty && languages[1].isNotEmpty ? languages[1][0] : '',
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
              backgroundColor: selectedButtonIndex == 2 ? Colors.grey : null,
            ),
            child: Text(
              languages.isNotEmpty && languages[2].isNotEmpty ? languages[2][0] : '',
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 300,
                left: 104,
                child: IconButtonExample(),
              ),
              // Positioned(
              //   top: 200,
              //   left: 200,
              //   child: IconButton(
              //     onPressed: () {},
              //     icon: Icon(Icons.emoji_food_beverage),  // replace with image
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}

/* TODO - rename and convert to a custom placeable widget,
perhaps based on align
Move 'x' to the top right
*/
class IconButtonExample extends StatelessWidget {
  const IconButtonExample({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('AlertDialog Title'),
          content: const Text('AlertDialog description'),
          actions: <Widget>[
            TextButton(
              // onPressed: () => Navigator.pop(context, 'Next'),
              // TODO - pop the dialog here, or pop it from each subpage
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PillInfo()),
              ),
              child: const Text('Learn More'),
            ),
            IconButton(
              onPressed: () => Navigator.pop(context, 'Close'),
              icon: Icon(Icons.close),
            ),
          ],
        ),
      ),
      icon: Icon(Icons.house),  // replace with image
    );
  }
}

