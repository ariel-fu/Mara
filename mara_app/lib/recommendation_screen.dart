import 'package:flutter/material.dart';
import 'recommendation_model.dart';
import 'liked_methods.dart';
import 'short_summaries.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
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
  _RecommendationScreenState createState() => _RecommendationScreenState();
}

class _RecommendationScreenState extends State<RecommendationScreen> {
  late String _currentLanguage;
  Set<String> likedMethods = Set<String>(); // Store liked methods
  late Future<Map<String, dynamic>> _methodDetailsDataFuture;
  @override
  void initState() {
    super.initState();
    _currentLanguage = widget.currentLanguage;
    _methodDetailsDataFuture = loadMethodDetails();
  }

  void _changeLanguage(String language) {
    setState(() {
      _currentLanguage = language;
    });
    widget.onChangeLanguage(language);
  }

  // String _t(String key) {
  //   return widget.translations[_currentLanguage]?[key] ?? key;
  // }

  String _t(String key) {
  String translation = widget.translations[_currentLanguage]?[key] ?? key;
  print('Key: $key, Language: $_currentLanguage, Translation: $translation');
  return translation;
}

  Future<Map<String, dynamic>> loadMethodDetails() async {
    final String jsonString = await rootBundle.loadString('assets/methods.json');
    return json.decode(jsonString);
  }

  void toggleLikeMethod(String method) {
    setState(() {
      if (likedMethods.contains(method)) {
        likedMethods.remove(method);
      } else {
        likedMethods.add(method);
      }
    });
  }


@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      leading: IconButton(
          icon: Icon(Icons.arrow_back), 
          onPressed: () => Navigator.of(context).pop(), 
        ),
      title: Text(_t('title1')), // Use _t method for translation

actions: <Widget>[
  ElevatedButton.icon(
    icon: Icon(Icons.thumb_up, color: Colors.black),
    label: Text('Liked Methods', style: TextStyle(color: Colors.black)),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    languageButton('Kiswahili'),
                    languageButton('Dholuo'),
                    languageButton('English'),
                  ],
                ),
                _buildTitleBox(),
                SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.recommendations.length,
                    itemBuilder: (context, index) {
                      List<String> individualRecommendations = widget.recommendations[index].split(', ');

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              widget.introTexts.length > index ? _t(widget.introTexts[index]) : '',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                                          Image.asset(
                                            RecommendationModel.getImageForRecommendation(trimmedRec), 
                                            width: 100, 
                                            height: 100
                                          ),
                                          Positioned(
                                            top: -9,
                                            right: -9,
                                            child: IconButton(
                                              icon: Icon(
                                                likedMethods.contains(trimmedRec) ? Icons.thumb_up : Icons.thumb_up_off_alt,
                                                color: likedMethods.contains(trimmedRec) ? Colors.brown[900] : Colors.black,
                                              ),
                                              onPressed: () => toggleLikeMethod(trimmedRec),
                                            ),
                                          ),
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
                                    default:
                                      methodKey = trimmedRec.toLowerCase();
                                }

                                if (methodDetailsData.containsKey(methodKey)) {

Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => MethodDetailsScreen(
      methodName: trimmedRec,
      methodDetails: methodDetailsData[methodKey],
      currentLanguage: _currentLanguage,
      translations: widget.translations,
      onChangeLanguage: (newLang) {
        _changeLanguage(newLang); // Call _changeLanguage from RecommendationScreen
      },
    ),
  ),
);
                                } else {
                                  // Handle the case where method details are not found
                                  print('No details found for $trimmedRec');
                                }
                        },
                              child: Text('Learn More'),
                            ),


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
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Icon(Icons.lightbulb_outline, color: Colors.amber),
                                  SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      widget.outroTexts.length > index ? _t(widget.outroTexts[index]) : '',
                                      style: TextStyle(fontSize: 16),
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
                ),
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



Widget languageButton(String language) {
  bool isSelected = _currentLanguage == language;
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: ElevatedButton(
      onPressed: () => _changeLanguage(language),
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.grey : null, // Grey if selected
      ),
      child: Text(language),
    ),
  );
}

Widget _buildTitleBox() {
  return Container(
    padding: EdgeInsets.all(10.0),
    margin: EdgeInsets.only(top: 20.0),
    decoration: BoxDecoration(
      color: Colors.grey.shade200,
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: Text(
      'Here are some recommendations of methods that might be right for you',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
  );
 }




void navigateToLikedMethodsScreen() {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => LikedMethodsScreen(
        likedMethods: likedMethods,
        initialLanguage: _currentLanguage, 
        translations: widget.translations,
        onMethodsChanged: (updatedMethods) {
          setState(() {
            likedMethods = updatedMethods;
          });
        },

      ),
    ),
  );
}

}
