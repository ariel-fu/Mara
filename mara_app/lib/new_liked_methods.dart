import 'package:flutter/material.dart';
import 'package:mara_app/providers/provider_liked_methods.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'short_summaries.dart';
import 'recommendation_model.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:mara_app/design/colors.dart';

class LikedMethodsScreen extends StatefulWidget {
  final String initialLanguage; // renamed from currentLanguage for clarity
  final Map<String, Map<String, String>> translations;

  LikedMethodsScreen({
    Key? key,
    required this.initialLanguage,
    required this.translations,
  }) : super(key: key);


  @override
  State<LikedMethodsScreen> createState() => _LikedMethodsScreenState();
}

class _LikedMethodsScreenState extends State<LikedMethodsScreen> {
  final languages = ["Kiswahili", "Dholuo", "English"];
  bool overrideIndex = false;
  int languageIndex = 2; // similar indexing for language
  String _currentLanguage = 'English';
  late Future<Map<String, dynamic>> _methodDetailsFuture;

  final Map<String, Map<String, String>> _likedTranslations = {
    'English': {
      'noneLiked': 'No favorite methods yet! Visit "What are my options?" to favorite a method.',
      // 'summaryPage': 'Summary Page',
    },
    'Dholuo': {
      'noneLiked': 'Onge yor geng\'o ich mihero podi! Lim "Yierona gin mage? mondo ikete kaka mihero ',
      // 'summaryPage': 'Oboke ma lero weche e yo machuok',
    },
    'Kiswahili': {
      'noneLiked': 'Bado hakuna mbinu unazopenda! Tembelea “Chaguzi zangu ni zipi? kupenda mbinu.',
      // 'summaryPage': 'Ukurasa wa muhtasari',
    },
  };

  @override
  void initState() {
    super.initState();
    _loadCurrentLanguage();
    _methodDetailsFuture = loadMethodDetails();
  }

  // Future<void> _loadCurrentLanguage() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     currentLanguage = prefs.getString('selectedLanguage') ?? 'English';
  //   });
  // }
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

  Future<Map<String, dynamic>> loadMethodDetails() async {
    final String jsonString = await rootBundle.loadString('assets/methods.json');
    return json.decode(jsonString);
  }

  String _t2(String key) {
    return widget.translations[_currentLanguage]?[key] ?? key;
  }

  String _t(String key) {
    return _likedTranslations[_currentLanguage]?[key] ?? key;
  }

  void _changeLanguage(String language) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedLanguage', language);
    if (language != _currentLanguage) {
      setState(() {
        _currentLanguage = language;
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    final double containerWidth = MediaQuery.of(context).size.width;
    final double containerHeight = MediaQuery.of(context).size.height;
    double boxWidth = containerWidth;
    double boxHeight = containerHeight;
    double availableHeight = boxHeight;

    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back), 
      //     onPressed: () => Navigator.of(context).pop(), 
      //   ),
      //   title: Center(child: Text(_t2('likedTitle'))), // or use _t2('liked_methods') for translations
      // ),
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back), 
          onPressed: () => Navigator.of(context).pop(), 
        ),
        title: PreferredSize(
          preferredSize: Size.fromHeight(availableHeight * 0.05),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                _languageButton('Kiswahili'),
                SizedBox(width: 40),
                _languageButton('Dholuo'),
                SizedBox(width: 40),
                _languageButton('English'),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 8.0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     children: <Widget>[
          //       _languageButton('Kiswahili'),
          //       _languageButton('Dholuo'),
          //       _languageButton('English'),
          //     ],
          //   ),
          // ),
          Center(
            child: Text(
              _t2('likedTitle'),
              style: TextStyle(fontFamily: 'PoetsenOne', color: MaraColors.purple, fontSize: 36.0),
              textAlign: TextAlign.center,
            )
          ),
          Consumer<Likes>(
            builder: (context, likes, child) {
              return Expanded(
                child: likes.likedMethods.isNotEmpty
                  ? ListView.builder(
                  itemCount: likes.likedMethods.length,
                  itemBuilder: (context, index) {
                      String method = likes.likedMethods.elementAt(index);
                      // Convert the method name to the corresponding JSON key
                      String methodKey;
                      switch (method.toLowerCase()) {
                // Add any specific mappings here
                default:
                    methodKey = method.toLowerCase();
                      }
              
                      return ListTile(
              minVerticalPadding: 20,
                leading: Icon(
                    RecommendationModel.getIconForRecommendation(method),
                    size: 50,
                ),
                title: Text(RecommendationModel.getTitleFromJsonRef(method)),
                trailing: Wrap(
                    spacing: 8, // Space between two widgets
                    children: <Widget>[
                        ElevatedButton(
                            onPressed: () async {
                                final methodDetails = await _methodDetailsFuture;
                                if (methodDetails[methodKey] != null) {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => MethodDetailsScreen(
                                                methodName: method,
                                                methodDetails: methodDetails[methodKey],
                                                currentLanguage: _currentLanguage,
                                                translations: _likedTranslations,
                                                onChangeLanguage: (newLang) {
                                                    setState(() {
                                                        _currentLanguage = newLang;
                                                    });
                                                    // Optionally, handle other actions needed on language change
                                                },
                                            ),
                                        ),
                                    );
                                }
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.black,
                              backgroundColor: MaraColors.lavender,
                            ),
                            child: Text(
                              _t2('learnMore'),
                            ),
                        ),
                        IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              // add index out of bounds check
                              likes.removeMethod(likes.likedMethods.elementAt(index));
                            }
                        ),
                    ],
                ),
                      );
                  },
              )
              
                  : Center(
                      child: Text(
                        _t('noneLiked'), // or use _t2('no_liked_methods') for translations
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
              );
            },
          ),
        ],
      ),
    );
  }



Widget _languageButton(String language) {
    bool isSelected = _currentLanguage == language; // Use the local currentLanguage
    return ElevatedButton(
      onPressed: () {
        if (!isSelected) {
          _changeLanguage(language); // Call the local _changeLanguage method
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.grey : null,
      ),
      child: Text(language),
    );
  }
}
