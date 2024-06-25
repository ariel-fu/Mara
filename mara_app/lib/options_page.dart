import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mara_app/audio.dart';

import 'options_image.dart';
import 'short_summaries.dart';
import 'new_liked_methods.dart';
import 'model/method_repository.dart';
import 'providers/provider_liked_methods.dart';
import 'package:mara_app/design/colors.dart';
import 'session_manager.dart';

class OptionsPage extends StatefulWidget {
  const OptionsPage({Key? key}) : super(key: key);

  @override
  State<OptionsPage> createState() => _OptionsPageState();
}

class _OptionsPageState extends State<OptionsPage> {
  int languageIndex = 2; // Index for language
  final languages = ["Kiswahili", "Dholuo", "English"];
  bool overrideIndex = false; // Used to override language selection from route
  int? methodIndex;
  final methods = MethodRepository.loadMethods();
  DateTime? screenEntryTime; // Variable to track screen entry time
  final Map<String, Map<String, String>> _translations = {
    'English': {
      'title': 'What are my options?',
      'likedTitle': 'Your Favorites',
      'learnMore': 'Learn More'
    },
    'Dholuo': {
      'title': 'Yierona gin mage?',
      'likedTitle': 'Ma ihero',
      'learnMore': 'Puonjri matut',
    },
    'Kiswahili': {
      'title': 'Chaguzi zangu ni zipi?',
      'likedTitle': 'Vipendwa vyako',
      'learnMore': 'Jifunze zaidi'
    },
  };

  final Map<String, List<String>> audioContentMap = {
    "English": [
      'videoAudio/audio/options_audio/options_iucd_E.mp3',
      'videoAudio/audio/options_audio/options_pills_E.mp3',
      'videoAudio/audio/options_audio/options_male_condom_E.mp3',
      'videoAudio/audio/options_audio/options_implant_E.mp3',
      'videoAudio/audio/options_audio/options_depo_E.mp3',
      'videoAudio/audio/options_audio/options_female_condom_E.mp3',
      'videoAudio/audio/options_audio/options_epill_E.mp3',
    ],
    "Kiswahili": [
      'videoAudio/audio/options_audio/options_iucd_K.mp3',
      'videoAudio/audio/options_audio/options_pills_K.mp3',
      'videoAudio/audio/options_audio/options_male_condom_K.mp3',
      'videoAudio/audio/options_audio/options_implant_K.mp3',
      'videoAudio/audio/options_audio/options_depo_K.mp3',
      'videoAudio/audio/options_audio/options_female_condom_K.mp3',
      'videoAudio/audio/options_audio/options_epill_K.mp3',
    ],
    "Dholuo": [
      'videoAudio/audio/options_audio/options_iucd_L.mp3',
      'videoAudio/audio/options_audio/options_pills_L.mp3',
      'videoAudio/audio/options_audio/options_male_condom_L.mp3',
      'videoAudio/audio/options_audio/options_implant_L.mp3',
      'videoAudio/audio/options_audio/options_depo_L.mp3',
      'videoAudio/audio/options_audio/options_female_condom_L.mp3',
      'videoAudio/audio/options_audio/options_epill_L.mp3',
    ],
  };

  @override
  void initState() {
    super.initState();
    screenEntryTime = DateTime.now();
    SessionManager.logScreenEntry(
        'QuizPage'); // Log entry time when the screen is initialized
    _loadCurrentLanguage();
    _methodDetailsDataFuture = loadMethodDetails();
  }

  @override
  void dispose() {
    SessionManager.logScreenExit(
        'QuizPage'); // Log exit time and calculate duration when leaving the screen
    super.dispose();
  }

  String _currentLanguage = 'English';

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

  // from recommendation_screen.dart; factor out into app state
  late Future<Map<String, dynamic>> _methodDetailsDataFuture;

  Future<Map<String, dynamic>> loadMethodDetails() async {
    final String jsonString =
        await rootBundle.loadString('assets/methods.json');
    return json.decode(jsonString);
  }

  String _t(String key) {
    String translation = _translations[languages[languageIndex]]?[key] ?? key;
    // print('Key: $key, Language: $languages, Translation: $translation');
    return translation;
  }

  // List<List<String>> languages = List.generate(3, (_) => <String>[]);
  // Change value to set aspect ratio
  final double _aspectRatio = 1.08;

  @override
  Widget build(BuildContext context) {
    _loadCurrentLanguage();
    // Receive selectedButtonIndex as a route argument if available
    final int? routeArgumentIndex =
        ModalRoute.of(context)?.settings.arguments as int?;

    String? methodRef =
        (methodIndex == null) ? null : methods[methodIndex]!.jsonRef;

    // Update selectedButtonIndex if a valid value is provided from the route
    if (routeArgumentIndex != null &&
        routeArgumentIndex >= 0 &&
        routeArgumentIndex < languages.length &&
        !overrideIndex) {
      languageIndex = routeArgumentIndex;
    }

    double containerWidth = MediaQuery.of(context).size.width;
    double containerHeight = MediaQuery.of(context).size.height;
    if (containerHeight / containerWidth > _aspectRatio) {
      containerHeight = containerWidth * _aspectRatio;
    } else {
      containerWidth = containerHeight / _aspectRatio;
    }
    // var selectedButtonIndex = input == null ? input : 0;
    double boxWidth = containerWidth;
    double boxHeight = containerHeight;
    double availableHeight = boxHeight;

    return Scaffold(
        appBar: AppBar(
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
          actions: <Widget>[
            Consumer<Likes>(
              builder: (context, likes, child) => ElevatedButton.icon(
                icon: Icon(Icons.thumb_up, color: Colors.black),
                label: Text(_t('likedTitle'),
                    style: TextStyle(color: Colors.black)),
                // label: Text(methods[methodIndex]!.name, style: TextStyle(color: Colors.black)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LikedMethodsScreen(
                        initialLanguage: languages[languageIndex],
                        translations: _translations,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple[100],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                ),
              ),
            ),
          ],
        ),
        // body: Center(
        //   child: Text(
        //     _t('title'),
        //     style: TextStyle(fontFamily: 'PoetsenOne', color: MaraColors.purple, fontSize: 36.0)
        //   )
        // ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Center(
              child: Text(
            _t('title'),
            style: TextStyle(
                fontFamily: 'PoetsenOne',
                color: MaraColors.purple,
                fontSize: 36.0),
            textAlign: TextAlign.center,
          )),
          OptionsImage(
              containerWidth, containerHeight, methodIndex, updateIndex),
        ]),
        // body
        //body: OptionsImage(containerWidth, containerHeight, methodIndex, updateIndex),
        //OptionsImage(containerWidth, containerHeight, methodIndex, updateIndex),
        bottomSheet: Padding(
          padding: const EdgeInsets.all(12.0),
          // duplicated from recommendation_screen.dart
          child: FutureBuilder<Map<String, dynamic>>(
            future: _methodDetailsDataFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // Data is still loading, show a loading indicator
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                // If we run into an error, display it to the user
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (snapshot.hasData) {
                final Map<String, dynamic> methodDetailsData = snapshot.data!;
                // return Column(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   mainAxisSize: MainAxisSize.min,
                //   children: <Widget>[
                return ConstrainedBox(
                    // width: boxWidth,
                    // height: boxHeight * 0.25,
                    constraints: BoxConstraints(
                        maxHeight: containerHeight * 0.238,
                        maxWidth: containerWidth),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                // IconButton(icon: Icon(Icons.volume_up), onPressed: null),
                                methodIndex == null
                                    ? Text(
                                        "Please select a method to learn more")
                                    : Text(methods[methodIndex]!.name,
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold)),
                              ]),
                          Expanded(
                              //child: Container(
                              //height: containerHeight * 0.6, // Adjust as needed
                              child: RawScrollbar(
                                  thumbColor:
                                      const Color.fromARGB(255, 232, 132, 165),
                                  thumbVisibility: true,
                                  trackVisibility: false,
                                  thickness: 25.0,
                                  radius: Radius.circular(20),
                                  child: LayoutBuilder(
                                      builder: (context, constraint) {
                                    return SingleChildScrollView(
                                        child: ConstrainedBox(
                                            constraints: BoxConstraints(
                                                minHeight:
                                                    constraint.maxHeight),
                                            child: Flex(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                direction: Axis.vertical,
                                                children: [
                                                  Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              getAudio(),
                                                            ]),
                                                        Flexible(
                                                          child:
                                                              methodRef == null
                                                                  ? SizedBox(
                                                                      height:
                                                                          20.0)
                                                                  : Padding(
                                                                      padding: const EdgeInsets
                                                                          .all(
                                                                          15.0),
                                                                      child:
                                                                          Text(
                                                                        methodDetailsData[methodRef]!['options_page']
                                                                            [
                                                                            languages[languageIndex]],
                                                                        style: TextStyle(
                                                                            fontFamily:
                                                                                'Roboto',
                                                                            fontSize:
                                                                                18.0),
                                                                      ),
                                                                    ),
                                                        ),
                                                        if (methodIndex != null)
                                                          getPic(),
                                                      ]),
                                                  // SizedBox(height: 70.0),
                                                  Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        SizedBox(width: 20),
                                                        ElevatedButton(
                                                          onPressed: () => {
                                                            setState(() {
                                                              methodIndex =
                                                                  null;
                                                            })
                                                          },
                                                          child: Text('Clear'),
                                                        ),
                                                        SizedBox(width: 20),
                                                        ElevatedButton(
                                                          onPressed:
                                                              methodIndex ==
                                                                      null
                                                                  ? null
                                                                  : () => {
                                                                        if (methodDetailsData
                                                                            .containsKey(methodRef))
                                                                          {
                                                                            Navigator.push(
                                                                              context,
                                                                              MaterialPageRoute(
                                                                                builder: (context) => MethodDetailsScreen(
                                                                                  methodName: methods[methodIndex]!.name,
                                                                                  methodDetails: methodDetailsData[methodRef],
                                                                                  currentLanguage: languages[languageIndex],
                                                                                  translations: _translations,
                                                                                  // TODO: delete unused parameters
                                                                                  onChangeLanguage: (newLang) {
                                                                                    _changeLanguage(newLang); // Call _changeLanguage from RecommendationScreen
                                                                                  },
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            // methodIndex = null,
                                                                          }
                                                                        else
                                                                          {
                                                                            // Handle the case where method details are not found
                                                                            print('No details found for $methodRef'),
                                                                          }
                                                                      },
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            foregroundColor:
                                                                Colors.black,
                                                            backgroundColor:
                                                                MaraColors
                                                                    .lavender,
                                                          ),
                                                          child: Text(
                                                              'Learn more'),
                                                        ),
                                                        SizedBox(height: 20.0),
                                                      ])
                                                ])));
                                  }))
                              //)
                              )
                          // Row(
                          //   crossAxisAlignment: CrossAxisAlignment.start,
                          //   children: [
                          //     Column(
                          //         crossAxisAlignment: CrossAxisAlignment.center,
                          //         children: [
                          //           getAudio(),
                          //         ]
                          //     ),
                          //     Flexible(
                          //       child: methodRef == null
                          //           ? SizedBox(height: 20.0)
                          //           : Padding(
                          //               padding: const EdgeInsets.all(15.0),
                          //               child: Text(
                          //                   methodDetailsData[methodRef]!['options_page']
                          //                       [languages[languageIndex]],
                          //                   style: TextStyle(
                          //                     fontFamily: 'Roboto', fontSize: 22.0
                          //                   ),
                          //               ),
                          //             ),
                          //     ),
                          //     if (methodIndex != null)
                          //       getPic(),
                          //   ]
                          // ),

                          // // SizedBox(height: 70.0),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          //     SizedBox(width: 20),
                          //     ElevatedButton(
                          //       onPressed: () => {
                          //         setState(() {
                          //           methodIndex = null;
                          //         })
                          //       },
                          //       child: Text('Clear'),
                          //     ),
                          //     SizedBox(width: 20),
                          //     ElevatedButton(
                          //       onPressed: methodIndex == null
                          //           ? null
                          //           : () => {
                          //                 if (methodDetailsData.containsKey(methodRef))
                          //                   {
                          //                     Navigator.push(
                          //                       context,
                          //                       MaterialPageRoute(
                          //                         builder: (context) =>
                          //                             MethodDetailsScreen(
                          //                           methodName:
                          //                               methods[methodIndex]!.name,
                          //                           methodDetails:
                          //                               methodDetailsData[methodRef],
                          //                           currentLanguage:
                          //                               languages[languageIndex],
                          //                           translations: _translations,
                          //                           // TODO: delete unused parameters
                          //                           onChangeLanguage: (newLang) {
                          //                             _changeLanguage(
                          //                                 newLang); // Call _changeLanguage from RecommendationScreen
                          //                           },
                          //                         ),
                          //                       ),
                          //                     ),
                          //                     // methodIndex = null,
                          //                   }
                          //                 else
                          //                   {
                          //                     // Handle the case where method details are not found
                          //                     print('No details found for $methodRef'),
                          //                   }
                          //               },
                          //       style: ElevatedButton.styleFrom(
                          //         foregroundColor: Colors.black,
                          //         backgroundColor: MaraColors.lavender,
                          //       ),
                          //       child: Text('Learn more'),
                          //     ),
                        ],
                      ),
                    ));
                // SizedBox(height: 20.0),
                // ],

                // );
              } else {
                // Otherwise, if no data is present, display a placeholder
                return Center(child: Text('No data available'));
              }
            },
          ),
        ));
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
      languageIndex = language;
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
          //updateMethodContent();
          //video1 = updateVideoContent1();
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.grey : null,
      ),
      child: Text(language),
    );
  }

  void updateIndex(int index) {
    setState(() {
      methodIndex = index;
    });
  }

  void _changeLanguage(String language) {
    setState(() {
      languageIndex = languages.indexOf(language);
    });
  }

  Widget getAudio() {
    if (methodIndex == null) {
      return SizedBox();
    }
    // print(audioContentMap[languages[_languageIndex]]![methodIndex!]);
    return AudioWidget(
        audioAsset: audioContentMap[languages[languageIndex]]![methodIndex!]);
  }

// void navigateToLikedMethodsScreen() {
//   // var likes = context.read<Likes>();
//   Navigator.push(
//     context,
//     MaterialPageRoute(
//       builder: (context) => NewLikedMethodsScreen(
//         // likedMethods: likes.likedMethods,
//         initialLanguage: languages[_languageIndex],
//         translations: _translations,
//       ),
//     ),
//   );
// }
  Widget getPic() {
    String imageNum = "assets/options_images/$methodIndex.png";
    return Image.asset(
      imageNum,
      width: MediaQuery.of(context).size.width * 0.15,
    );
  }
}
