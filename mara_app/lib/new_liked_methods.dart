import 'package:flutter/material.dart';
import 'package:mara_app/providers/provider_liked_methods.dart';
import 'package:provider/provider.dart';
import 'new_short_summaries.dart';
import 'recommendation_model.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

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
  late String currentLanguage;
  late Future<Map<String, dynamic>> _methodDetailsFuture;

  final Map<String, Map<String, String>> _likedTranslations = {
    'English': {
      'noneLiked': 'No liked methods yet! Visit "What are my options?" to start adding some.',
      'summaryPage': 'Summary Page',
    },
    'Dholuo': {
      'noneLiked': 'Hakuna',
      'summaryPage': 'Oboke ma lero weche e yo machuok',
    },
    'Kiswahili': {
      'noneLiked': 'Onge',
      'summaryPage': 'Ukurasa wa muhtasari',
    },
  };

  @override
  void initState() {
    super.initState();
    currentLanguage = widget.initialLanguage;
    _methodDetailsFuture = loadMethodDetails();
  }

  Future<Map<String, dynamic>> loadMethodDetails() async {
    final String jsonString = await rootBundle.loadString('assets/methods.json');
    return json.decode(jsonString);
  }

  String _t2(String key) {
    return widget.translations[currentLanguage]?[key] ?? key;
  }

  String _t(String key) {
    return _likedTranslations[currentLanguage]?[key] ?? key;
  }

  void _changeLanguage(String language) {
    if (language != currentLanguage) {
      setState(() {
        currentLanguage = language;
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back), 
          onPressed: () => Navigator.of(context).pop(), 
        ),
        title: Center(child: Text(_t2('likedTitle'))), // or use _t2('liked_methods') for translations
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _languageButton('Kiswahili'),
                _languageButton('Dholuo'),
                _languageButton('English'),
              ],
            ),
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
                                                currentLanguage: currentLanguage,
                                                translations: _likedTranslations,
                                                onChangeLanguage: (newLang) {
                                                    setState(() {
                                                        currentLanguage = newLang;
                                                    });
                                                    // Optionally, handle other actions needed on language change
                                                },
                                            ),
                                        ),
                                    );
                                }
                            },
                            child: Text(_t2('learnMore')),
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
    bool isSelected = currentLanguage == language; // Use the local currentLanguage
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
