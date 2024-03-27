import 'package:flutter/material.dart';
import 'short_summaries.dart';
import 'recommendation_model.dart';
import 'short_summaries.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
class LikedMethodsScreen extends StatefulWidget {
  final Set<String> likedMethods;
  final String initialLanguage; // renamed from currentLanguage for clarity
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

  void _navigateToSummary(String method) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ShortSummariesScreen(methodName: method),
      ),
    );
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text("Liked Methods"), 
    ),
    body: widget.likedMethods.isNotEmpty
        ? ListView(
            children: widget.likedMethods.map((method) {
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
                      onPressed: () => _navigateToSummary(method),
                      child: Text('Learn More'),
                      style: ElevatedButton.styleFrom(
                        
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _handleMethodRemoval(method),
                    ),
                  ],
                ),
              );
            }).toList(),
          )
        : Center(
            child: Text(
              'No liked methods', 
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
  );
}
}
