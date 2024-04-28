import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'package:provider/provider.dart';

import 'options_image.dart';
import 'short_summaries.dart';
import 'new_liked_methods.dart';
import 'model/method_repository.dart';
import 'providers/provider_liked_methods.dart';
import 'package:mara_app/audio.dart';

class OptionsPage extends StatefulWidget {
  const OptionsPage({Key? key}) : super(key: key);

  @override
  State<OptionsPage> createState() => _OptionsPageState();
}

class _OptionsPageState extends State<OptionsPage> {

  final Map<String, Map<String, String>> _translations = {
    'English': {
      'title': 'What are my options?',
      //'title': "What are my options to prevent pregnancy?",
      'likedTitle': 'Your Favorites',
      'learnMore': 'Learn More'
    },
    'Dholuo': {
      'title': 'Yierona gin mage?',
      'likedTitle': 'Ma ihero',
      'learnMore': 'Puonjri matut',
    },
    'Kiswahili' : {
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

  // String? _selectedMethod;
  int? methodIndex;
  bool overrideIndex = false;
  int _languageIndex = 2; // Default value
  final languages = ["Kiswahili", "Dholuo", "English"];
  final methods = MethodRepository.loadMethods();

  Set<String> _likedMethods = {};
  // from recommendation_screen.dart; factor out into app state
  late Future<Map<String, dynamic>> _methodDetailsDataFuture;

  @override
  void initState() {
    super.initState();
    _methodDetailsDataFuture = loadMethodDetails();
  }

  Future<Map<String, dynamic>> loadMethodDetails() async {
    final String jsonString = await rootBundle.loadString('assets/methods.json');
    return json.decode(jsonString);
  }

  void toggleLikeMethod(String method) {
    setState(() {
      if (_likedMethods.contains(method)) {
        _likedMethods.remove(method);
      } else {
        _likedMethods.add(method);
      }
    });
  }

  String _t(String key) {
    String translation = _translations[languages[_languageIndex]]?[key] ?? key;
    print('Key: $key, Language: $languages, Translation: $translation');
    return translation;
  }

  // List<List<String>> languages = List.generate(3, (_) => <String>[]);
  // Change value to set aspect ratio
  final double _aspectRatio = 16 / 10;

  @override
  Widget build(BuildContext context) {
    // Receive selectedButtonIndex as a route argument if available
    final int? routeArgumentIndex =
    ModalRoute.of(context)?.settings.arguments as int?;

    String? methodRef = (methodIndex == null) ? null : methods[methodIndex]!.jsonRef;

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
        title:  Text(_t('title')),
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
        actions: <Widget>[
          Consumer<Likes>(
            builder: (context, likes, child) =>
                ElevatedButton.icon(
                  icon: Icon(Icons.thumb_up, color: Colors.black),
                  label: Text(_t('likedTitle')),
                  // label: Text(methods[methodIndex]!.name, style: TextStyle(color: Colors.black)),
                  onPressed: () {
                    var likes = context.read<Likes>();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LikedMethodsScreen(
                          likedMethods: likes.likedMethods,
                          initialLanguage: languages[_languageIndex],
                          translations: _translations,
                          // onMethodsChanged: likes.toggleLikedMethod,
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
      // body
      body: OptionsImage(containerWidth, containerHeight, methodIndex, updateIndex),
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
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        // IconButton(icon: Icon(Icons.volume_up), onPressed: null),
                        methodIndex == null ? Text("Tap on a method to learn more!",
                          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                        ) : Text(
                            methods[methodIndex]!.name,
                            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                      ]
                  ),
                  Row (
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column (
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              getAudio(),
                            ]
                        ),
                        Flexible (
                          child: methodRef == null ? SizedBox(height: 20.0) : Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(methodDetailsData[methodRef]!['options_page'][languages[_languageIndex]]),
                          ),
                        )
                      ]
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
                          if (methodDetailsData.containsKey(methodRef)) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MethodDetailsScreen(
                                  methodName: methods[methodIndex]!.name,
                                  methodDetails: methodDetailsData[methodRef],
                                  currentLanguage: languages[_languageIndex],
                                  translations: _translations,  // TODO: delete unused parameters
                                  onChangeLanguage: (newLang) {
                                    _changeLanguage(newLang); // Call _changeLanguage from RecommendationScreen
                                  },
                                ),
                              ),
                            ),
                            // methodIndex = null,
                          } else {
                            // Handle the case where method details are not found
                            print('No details found for $methodRef'),
                          }
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
              );
            } else {
              // Otherwise, if no data is present, display a placeholder
              return Center(child: Text('No data available'));
            }
          },
        ),
      ),
    );
  }

  void updateIndex(int index) {
    setState(() {
      methodIndex = index;
    });
  }

  void _changeLanguage(String language) {
    setState(() {
      _languageIndex = languages.indexOf(language);
    });
  }

  Widget getAudio() {
    if(methodIndex == null) {
      return SizedBox();
    }
    print(audioContentMap[languages[_languageIndex]]![methodIndex!]);
    return AudioWidget(audioAsset: audioContentMap[languages[_languageIndex]]![methodIndex!]);
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

}

