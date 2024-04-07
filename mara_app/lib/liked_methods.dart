import 'package:flutter/material.dart';
import 'short_summaries.dart';
import 'recommendation_model.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
class LikedMethodsScreen extends StatefulWidget {
  final Set<String> likedMethods;
  final String initialLanguage; 
  final Map<String, Map<String, String>> translations;
  final Function(Set<String>) onMethodsChanged;

  LikedMethodsScreen({
    Key? key,
    required this.likedMethods,
    required this.initialLanguage,
    required this.translations,
    required this.onMethodsChanged,
  }) : super(key: key);


  @override
  _LikedMethodsScreenState createState() => _LikedMethodsScreenState();
}

class _LikedMethodsScreenState extends State<LikedMethodsScreen> {
  late String currentLanguage;
  late Future<Map<String, dynamic>> _methodDetailsFuture;
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

  String _t(String key) {
    return widget.translations[currentLanguage]?[key] ?? key;
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
        title: Text(_t("Liked Methods")), // or use _t('liked_methods') for translations
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
          Expanded(
            child: widget.likedMethods.isNotEmpty
              ? ListView.builder(
    itemCount: widget.likedMethods.length,
    itemBuilder: (context, index) {
        String method = widget.likedMethods.elementAt(index);
        // Convert the method name to the corresponding JSON key
        String methodKey;
        switch (method.toLowerCase()) {
            // Add any specific mappings here
            default:
                methodKey = method.toLowerCase();
        }

        return ListTile(
            leading: Image.asset(
                RecommendationModel.getImageForRecommendation(method),
                width: 50,
                height: 50,
            ),
            title: Text(_t(method)),
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
                                            translations: widget.translations,
                                            onChangeLanguage: (newLang) {
                                                setState(() {
                                                    currentLanguage = newLang;
                                                });
                                                
                                            },
                                        ),
                                    ),
                                );
                            }
                        },
                        child: Text('Learn More'),
                    ),
                    IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _handleMethodRemoval(method),
                    ),
                ],
            ),
        );
    },
)

              : Center(
                  child: Text(
                    'No liked methods', // or use _t('no_liked_methods') for translations
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
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

  void _handleMethodRemoval(String method) {
    setState(() {
      widget.likedMethods.remove(method);
    });
    widget.onMethodsChanged(widget.likedMethods);
  }

  void _navigateToSummary(String method) async {
  final methodDetails = await _methodDetailsFuture;
  print("Method Details for $method: ${methodDetails[method]}");
  if (methodDetails[method] != null) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MethodDetailsScreen(
          methodName: method,
          methodDetails: methodDetails[method],
          currentLanguage: currentLanguage,
          translations: widget.translations,
          onChangeLanguage: (newLang) {
            setState(() {
              currentLanguage = newLang;
            });
          },
        ),
      ),
    );
  }
}
}
