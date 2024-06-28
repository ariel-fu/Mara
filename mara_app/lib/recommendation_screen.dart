import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'recommendation_model.dart';
import 'new_liked_methods.dart';
import 'short_summaries.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:mara_app/providers/provider_liked_methods.dart';
import 'package:mara_app/design/colors.dart';
import 'package:provider/provider.dart';

// import 'package:firebase_analytics/firebase_analytics.dart';
import 'thank_you.dart';
import 'session_manager.dart'; // Import the SessionManager

class RecommendationScreen extends StatefulWidget {
  final List<String> recommendations;
  final List<String> introTexts;
  final List<String> outroTexts;
  final String currentLanguage;
  final Function(String) onChangeLanguage;
  final Map<String, Map<String, String>> translations;

  RecommendationScreen({
    Key? key,
    required this.recommendations,
    required this.introTexts,
    required this.outroTexts,
    required this.currentLanguage,
    required this.translations,
    required this.onChangeLanguage,
  }) : super(key: key);

  @override
  State<RecommendationScreen> createState() => _RecommendationScreenState();
}

class _RecommendationScreenState extends State<RecommendationScreen> {
  // late String _currentLanguage;
  late Future<Map<String, dynamic>> _methodDetailsDataFuture;
  final languages = ["Kiswahili", "Dholuo", "English"];
  bool overrideIndex = false;
  int languageIndex = 2; // similar indexing for language
  String _currentLanguage = 'English';

  final double _aspectRatio = 16 / 10;

  // @override
  // void initState() {
  //   super.initState();
  //   // _entryTime = DateTime.now();  // Set entry time when the screen is loaded
  //   SessionManager.logScreenEntry('RecommendationScreen'); // Log screen entry
  //   _loadCurrentLanguage();
  //   _methodDetailsDataFuture = loadMethodDetails();
  // }

  @override
  void initState() {
    super.initState();
    _logScreenEntry();
    _loadCurrentLanguage();
    _methodDetailsDataFuture = loadMethodDetails();
  }

  void _logScreenEntry() {
    DateTime entryTime =
        DateTime.now(); // Set entry time when the screen is loaded
    SessionManager.logScreenEntry('RecommendationScreen'); // Log screen entry
    debugPrint(
        'Screen Entry: RecommendationScreen at ${entryTime.toIso8601String()}'); // debug print
  }

  void _logScreenExit() {
    DateTime exitTime = DateTime.now();
    SessionManager.logScreenExit('RecommendationScreen'); // Log screen exit
    debugPrint(
        'Screen Exit: RecommendationScreen at ${exitTime.toIso8601String()}'); // Print the exit time
  }

  @override
  void dispose() {
    _logScreenExit();
    super.dispose();
  }

  Future<void> _loadCurrentLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _currentLanguage = prefs.getString('selectedLanguage') ?? 'English';
    });
    if (_currentLanguage.contains('English')) {
      languageIndex = 2;
    } else if (_currentLanguage.contains('Dholuo')) {
      languageIndex = 1;
    } else {
      languageIndex = 0;
    }
  }

  void _changeLanguage(String language) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedLanguage', language);
    setState(() {
      _currentLanguage = language;
    });
    widget.onChangeLanguage(language);
  }

  String _t(String key) {
    String translation = widget.translations[_currentLanguage]?[key] ?? key;
    print('Key: $key, Language: $_currentLanguage, Translation: $translation');
    return translation;
  }

  Future<Map<String, dynamic>> loadMethodDetails() async {
    final String jsonString =
        await rootBundle.loadString('assets/methods.json');
    return json.decode(jsonString);
  }

  void toggleLikeMethod(String method) {
    final likes =
        Provider.of<Likes>(context, listen: false); // Get the Likes instance
    String jsonRef = RecommendationModel.getJsonRefFromName(method);
    print('Toggling like for method: $method with jsonRef: $jsonRef');
    likes.toggleLikedMethod(jsonRef); // Toggle the liked state
    print("Liked Methods after toggle: ${likes.likedMethods}");
    setState(() {});
  }

// Widget _endSessionButton() {
//   return Padding(
//     padding: const EdgeInsets.symmetric(vertical: 20.0),
//     child: ElevatedButton(
//       onPressed: () async {
//         await SessionManager.endCurrentSession(); // End session and export data
//         Navigator.of(context).pushReplacement(
//           MaterialPageRoute(builder: (context) => ThankYouScreen()),
//         );
//       },
//       style: ElevatedButton.styleFrom(
//         backgroundColor: MaraColors.magentaPurple,
//         foregroundColor: Colors.white,
//         textStyle: TextStyle(
//           fontSize: 18,
//           fontWeight: FontWeight.bold, // Bold font
//         ),
//       ),
//       child: const Text(
//         "END SESSION",
//         style: TextStyle(
//           fontSize: 20,
//           letterSpacing: 2,
//         ),
//       ),
//     ),
//   );
// }

  Widget _endSessionButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: ElevatedButton(
        onPressed: () async {
          await SessionManager
              .endCurrentSession(); // THIS WILL TRIGGER EXPRT DATA
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => ThankYouScreen()),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: MaraColors.magentaPurple,
          foregroundColor: Colors.white,
          textStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold, // Bold font
          ),
        ),
        child: const Text(
          "END SESSION",
          style: TextStyle(
            fontSize: 20,
            letterSpacing: 2,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: PreferredSize(
          preferredSize: Size.fromHeight(availableHeight * 0.05),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                languageButton('Kiswahili', 0),
                SizedBox(width: 40),
                languageButton('Dholuo', 1),
                SizedBox(width: 40),
                languageButton('English', 2),
              ],
            ),
          ),
        ),
        // title: Text(_t('title1'),
        //   style: TextStyle(
        //                 fontFamily: 'PoetsenOne',
        //                 color: MaraColors.purple,
        //                 fontSize: 36.0)

        // ), // Use _t method for translation
        // centerTitle: true,

        actions: <Widget>[
          ElevatedButton.icon(
            icon: Icon(Icons.thumb_up, color: Colors.black),
            label:
                Text(_t('likedTitle'), style: TextStyle(color: Colors.black)),
            onPressed: navigateToLikedMethodsScreen,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple[100],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            ),
          ),
        ],
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _methodDetailsDataFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Data is still loading, show a loading indicator
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // If we run into an error, display it to the user
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            // Data is loaded, build the UI accordingly
            final Map<String, dynamic> methodDetailsData = snapshot.data!;
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     languageButton('Kiswahili'),
                  //     languageButton('Dholuo'),
                  //     languageButton('English'),
                  //   ],
                  // ),
                  Center(
                    child: Text(
                      _t('title1'),
                      style: TextStyle(
                          fontFamily: 'PoetsenOne',
                          color: MaraColors.purple,
                          fontSize: 36.0),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  _buildTitleBox(),
                  SizedBox(height: 20),
                  Expanded(
                      child: Container(
                          //height: containerHeight * 0.6, // Adjust as needed
                          child: RawScrollbar(
                    thumbColor: const Color.fromARGB(255, 232, 132, 165),
                    thumbVisibility: true,
                    trackVisibility: false,
                    thickness: 15.0,
                    radius: Radius.circular(20),
                    child: ListView.builder(
                      itemCount: widget.recommendations.length,
                      itemBuilder: (context, index) {
                        List<String> individualRecommendations =
                            widget.recommendations[index].split(', ');
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              // padding: const EdgeInsets.all(8.0),
                              padding: EdgeInsets.only(right: 20.0, left: 20.0, top: 10.0, bottom:10.0),
                              child: Text(
                                widget.introTexts.length > index
                                    ? _t(widget.introTexts[index])
                                    : '',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: individualRecommendations.map((rec) {
                                  String trimmedRec = rec.trim();
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Icon(
                                                RecommendationModel
                                                    .getIconForRecommendation(
                                                        RecommendationModel
                                                            .getJsonRefFromName(
                                                                trimmedRec)),
                                                size: 80,
                                                color:
                                                    MaraColors.magentaPurple),
                                          ],
                                        ),
                                        Text(
                                          _t(trimmedRec),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            String methodKey;
                                            // Convert the recommendation name to the corresponding JSON key
                                            switch (trimmedRec.toLowerCase()) {
                                              // case 'condoms':
                                              //   methodKey = 'male_condom'; // or 'female_condom' based on context
                                              //   break;
                                              case 'emergency pill':
                                                methodKey =
                                                    'emergency'; // This should match the exact key in your JSON data
                                                break;
                                              default:
                                                methodKey =
                                                    trimmedRec.toLowerCase();
                                            }

                                            if (methodDetailsData
                                                .containsKey(methodKey)) {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      MethodDetailsScreen(
                                                    methodName:
                                                        RecommendationModel
                                                            .getJsonRefFromName(
                                                                trimmedRec),
                                                    methodDetails:
                                                        methodDetailsData[
                                                            methodKey],
                                                    currentLanguage:
                                                        _currentLanguage,
                                                    translations:
                                                        widget.translations,
                                                    onChangeLanguage:
                                                        (newLang) {
                                                      _changeLanguage(
                                                          newLang); // Call _changeLanguage from RecommendationScreen
                                                    },
                                                  ),
                                                ),
                                              );
                                            } else {
                                              // Handle the case where method details are not found
                                              print(
                                                  'No details found for $trimmedRec');
                                            }
                                          },
                                          style: ElevatedButton.styleFrom(
                                            foregroundColor: Colors.black,
                                            backgroundColor:
                                                MaraColors.lavender,
                                          ),
                                          child: Text('Learn More'),
                                        ),
                                        Consumer<Likes>(
                                            builder: (context, likes, child) {
                                          return ElevatedButton.icon(
                                            icon: Icon(
                                              likes.likedMethods.contains(
                                                      RecommendationModel
                                                          .getJsonRefFromName(
                                                              trimmedRec))
                                                  ? Icons.thumb_up
                                                  : Icons.thumb_up_off_alt,
                                              color: likes.likedMethods.contains(
                                                      RecommendationModel
                                                          .getJsonRefFromName(
                                                              trimmedRec))
                                                  ? Colors.brown[900]
                                                  : Colors.black,
                                            ),
                                            label: Text("Favorite it!"),
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  Colors.deepPurple[100],
                                              foregroundColor: Colors.black,
                                            ),
                                            onPressed: () =>
                                                toggleLikeMethod(trimmedRec),
                                          );
                                        }),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  color: MaraColors.purple,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Icon(Icons.lightbulb_outline,
                                        color: Colors.amber),
                                    SizedBox(width: 8),
                                    Expanded(
                                      child: Text(
                                        widget.outroTexts.length > index
                                            ? _t(widget.outroTexts[index])
                                            : '',
                                        style: TextStyle(
                                            fontFamily: 'Roboto',
                                            color: Colors.white,
                                            fontSize: 18.0),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Divider(),
                          ],
                        );
                      },
                    ),
                  ))),
                  _endSessionButton(),
                ],
              ),
            );
          } else {
            // Otherwise, if no data is present, display a placeholder
            return Center(child: Text('No data available'));
          }
        },
      ),
    );
  }

  void _switchLanguage(int language) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String temp;
    if (language == 0) {
      temp = 'Kiswahili';
    } else if (language == 1) {
      temp = 'Dholuo';
    } else {
      temp = 'English';
    }
    await prefs.setString('selectedLanguage', temp);
    setState(() {
      _currentLanguage = temp;
    });
  }

  Widget languageButton(String language, int index) {
    bool isSelected = languages[languageIndex] == language;

    return ElevatedButton(
      onPressed: () {
        _switchLanguage(index);
        setState(() {
          languageIndex = index;
          overrideIndex = true;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.grey : null,
      ),
      child: Text(language),
    );
  }

// Widget languageButton(String language) {
//   bool isSelected = _currentLanguage == language;
//   return Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 8.0),
//     child: ElevatedButton(
//       onPressed: () => _changeLanguage(language),
//       style: ElevatedButton.styleFrom(
//         backgroundColor: isSelected ? Colors.grey : null, // Grey if selected
//       ),
//       child: Text(language),
//     ),
//   );
// }

  Widget _buildTitleBox() {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.only(top: 20.0),
      // decoration: BoxDecoration(
      //   color: Colors.grey.shade200,
      //   borderRadius: BorderRadius.circular(8.0),
      // ),
      child: Text(_t('recommendationTitle'),
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: 'Montserrat',
              color: MaraColors.magentaPurple,
              fontSize: 27.0)),
    );
  }

  void navigateToLikedMethodsScreen() {
    // Access the liked methods from the provider

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LikedMethodsScreen(
          initialLanguage: _currentLanguage,
          translations: widget.translations,
        ),
      ),
    );
  }
}
