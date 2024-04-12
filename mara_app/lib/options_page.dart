import 'package:flutter/material.dart';
import 'option_pages/pills.dart';
import 'options_image.dart';
import 'model/method_repository.dart';

class OptionsPage extends StatefulWidget {
  const OptionsPage({Key? key}) : super(key: key);

  @override
  State<OptionsPage> createState() => _OptionsPageState();
}

class _OptionsPageState extends State<OptionsPage> {
  // String? _selectedMethod;
  int? methodIndex;
  bool overrideIndex = false;
  int _languageIndex = 2; // Default value
  final languages = ["Kiswahili", "Dholuo", "English"];
  final methods = MethodRepository.loadMethods();

  // List<List<String>> languages = List.generate(3, (_) => <String>[]);
  // Change value to set aspect ratio
  final double _aspectRatio = 16 / 10;

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
      _languageIndex = routeArgumentIndex;
    }

    double containerWidth = MediaQuery.of(context).size.width * 0.8;
    double containerHeight = MediaQuery.of(context).size.height * 0.8;
    if (containerHeight / containerWidth > _aspectRatio) {
      containerHeight = containerWidth * _aspectRatio;
    } else {
      containerWidth = containerHeight / _aspectRatio;
    }
    // var selectedButtonIndex = input == null ? input : 0;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('What are my options?')),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(containerHeight * 0.05),
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
                            _languageIndex = 0;
                            overrideIndex = true;
                            // updateMethodContent();
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _languageIndex == 0 ? Colors.grey : null,
                          foregroundColor: _languageIndex == 0 ? Colors.white : null,
                        ),
                        child: Text('Kiswahili'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0), // Adjust the padding as needed
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _languageIndex = 1;
                            overrideIndex = true;
                            // updateMethodContent();
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _languageIndex == 1 ? Colors.grey : null,
                          foregroundColor: _languageIndex == 1 ? Colors.white : null,
                        ),
                        child: Text('Dholuo'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0), // Adjust the padding as needed
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _languageIndex = 2;
                            overrideIndex = true;
                            // updateMethodContent();
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _languageIndex == 2 ? Colors.grey : null,
                          foregroundColor: _languageIndex == 2 ? Colors.white : null,
                        ),
                        child: Text('English'),
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ),
      // body
      body: OptionsImage(containerWidth, containerHeight, methodIndex, updateIndex),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // IconButton(icon: Icon(Icons.volume_up), onPressed: null),
                methodIndex == null ? Text("Please select a method to learn more") : Text(methods[methodIndex]!.name,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
              ]
            ),
            methodIndex == null ? SizedBox(height: 20.0) : Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(methods[methodIndex]!.description),
            ),
            // SizedBox(height: 70.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => {
                    setState(() {
                      methodIndex = null;
                    })
                  },
                  child: Text('Clear'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: methodIndex == null ? null : () => {
                    methodIndex = null,
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PillInfo()),
                    )
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.green,
                  ),
                  child: Text('Learn more'),
                ),
              ],
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }

  void updateIndex(int index) {
    setState(() {
      methodIndex = index;
      // _updateMethodContent();
    });
  }

}

