import 'package:flutter/material.dart';
import 'recommendation_model.dart';
import 'liked_methods.dart';
import 'short_summaries.dart';
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
  @override
  void initState() {
    super.initState();
    _currentLanguage = widget.currentLanguage;
  }

  void _changeLanguage(String language) {
    setState(() {
      _currentLanguage = language;
    });
    widget.onChangeLanguage(language);
  }

  String _t(String key) {
    return widget.translations[_currentLanguage]?[key] ?? key;
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



// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: Text(_t('title1')), // Use _t method for translation
//     ),
//     body: Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               languageButton('Kiswahili'),
//               languageButton('Dholuo'),
//               languageButton('English'),
//             ],
//           ),
//           SizedBox(height: 20),
//           Expanded(
//             child: ListView.builder(
//               itemCount: widget.recommendations.length,
//               itemBuilder: (context, index) {
//                 List<String> individualRecommendations = widget.recommendations[index].split(', ');

//                 return Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text(
//                         widget.introTexts.length > index ? _t(widget.introTexts[index]) : '', 
//                         textAlign: TextAlign.center,
//                         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: Row(
//                         children: individualRecommendations.map((rec) {
//                           String translatedRec = RecommendationModel.getTranslatedRecommendation(rec.trim(), _currentLanguage, widget.translations);
//                           return Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Column(
//                               children: [
//                                 Image.asset(
//                                   RecommendationModel.getImageForRecommendation(rec.trim()), 
//                                   width: 100, 
//                                   height: 100
//                                 ),
//                                 Text(
//                                   translatedRec,
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(fontSize: 16),
//                                 ), 
//                                 ElevatedButton(
//                                   onPressed: () {
//                                   Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                   builder: (context) => ShortSummariesScreen(methodName: rec.trim()),
//                                   ),
//                                   );
//                                   },
//                                   child: Text('Learn More'),
//                               ),
//                               ],
//                             ),
//                           );
//                         }).toList(),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Container(
//                         padding: const EdgeInsets.all(10.0),
//                         decoration: BoxDecoration(
//                           color: Colors.grey.shade200,
//                           borderRadius: BorderRadius.circular(8.0),
//                         ),
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: <Widget>[
//                             Icon(Icons.lightbulb_outline, color: Colors.amber),
//                             SizedBox(width: 8),
//                             Expanded(
//                               child: Text(
//                                 widget.outroTexts.length > index ? _t(widget.outroTexts[index]) : '', 
//                                 style: TextStyle(fontSize: 16),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Divider(),
//                   ],
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: Text(_t('title1')), // Use _t method for translation
//     ),
//     body: Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               languageButton('Kiswahili'),
//               languageButton('Dholuo'),
//               languageButton('English'),
//             ],
//           ),
//           SizedBox(height: 20),
//           Expanded(
//             child: ListView.builder(
//               itemCount: widget.recommendations.length,
//               itemBuilder: (context, index) {
//                 List<String> individualRecommendations = widget.recommendations[index].split(', ');

//                 return Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text(
//                         widget.introTexts.length > index ? _t(widget.introTexts[index]) : '', 
//                         textAlign: TextAlign.center,
//                         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: Row(
//                         children: individualRecommendations.map((rec) {
//                           String trimmedRec = rec.trim();
//                           String translatedRec = RecommendationModel.getTranslatedRecommendation(trimmedRec, _currentLanguage, widget.translations);
//                           return Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Column(
//                               children: [
//                                 Stack(
//                                   alignment: Alignment.topRight,
//                                   children: [
//                                     Image.asset(
//                                       RecommendationModel.getImageForRecommendation(trimmedRec), 
//                                       width: 100, 
//                                       height: 100
//                                     ),
//                                     IconButton(
//                                       icon: Icon(
//                                         likedMethods.contains(trimmedRec) ? Icons.favorite : Icons.favorite_border,
//                                         color: likedMethods.contains(trimmedRec) ? Colors.red : Colors.grey,
//                                       ),
//                                       onPressed: () {
//                                         setState(() {
//                                           if (likedMethods.contains(trimmedRec)) {
//                                             likedMethods.remove(trimmedRec);
//                                           } else {
//                                             likedMethods.add(trimmedRec);
//                                           }
//                                         });
//                                       },
//                                     ),
//                                   ],
//                                 ),
//                                 Text(
//                                   translatedRec,
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(fontSize: 16),
//                                 ),
//                                 ElevatedButton(
//                                   onPressed: () {
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (context) => ShortSummariesScreen(methodName: trimmedRec),
//                                       ),
//                                     );
//                                   },
//                                   child: Text('Learn More'),
//                                 ),
//                               ],
//                             ),
//                           );
//                         }).toList(),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Container(
//                         padding: const EdgeInsets.all(10.0),
//                         decoration: BoxDecoration(
//                           color: Colors.grey.shade200,
//                           borderRadius: BorderRadius.circular(8.0),
//                         ),
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: <Widget>[
//                             Icon(Icons.lightbulb_outline, color: Colors.amber),
//                             SizedBox(width: 8),
//                             Expanded(
//                               child: Text(
//                                 widget.outroTexts.length > index ? _t(widget.outroTexts[index]) : '', 
//                                 style: TextStyle(fontSize: 16),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Divider(),
//                   ],
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }


// Widget languageButton(String language) {
//   bool isSelected = _currentLanguage == language;
//   return Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 8.0),
//     child: OutlinedButton(
//       onPressed: () => _changeLanguage(language),
//       child: Text(language),
//       style: OutlinedButton.styleFrom(
//         backgroundColor: isSelected ? Colors.grey : Colors.white,
//         foregroundColor: Colors.black,
//         side: BorderSide(color: isSelected ? Colors.black : Colors.grey),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//       ),
//     ),
//   );
// }
// }

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: Text(_t('title1')), // Use _t method for translation
//       actions: <Widget>[
//         IconButton(
//           icon: Icon(Icons.favorite),
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => LikedMethodsScreen(
//                   likedMethods: likedMethods,
//                   currentLanguage: _currentLanguage,
//                   translations: widget.translations,
//                   onMethodsChanged: (updatedMethods) {
//                     setState(() {
//                       likedMethods = updatedMethods;
//                     });
//                   },
//                 ),
//               ),
//             );
//           },
//         ),
//       ],
//     ),
//     body: Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               languageButton('Kiswahili'),
//               languageButton('Dholuo'),
//               languageButton('English'),
//             ],
//           ),
//           SizedBox(height: 20),
//           Expanded(
//             child: ListView.builder(
//               itemCount: widget.recommendations.length,
//               itemBuilder: (context, index) {
//                 List<String> individualRecommendations = widget.recommendations[index].split(', ');

//                 return Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text(
//                         widget.introTexts.length > index ? _t(widget.introTexts[index]) : '',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: Row(
//                         children: individualRecommendations.map((rec) {
//                           String trimmedRec = rec.trim();
//                           String translatedRec = RecommendationModel.getTranslatedRecommendation(trimmedRec, _currentLanguage, widget.translations);
//                           return Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Column(
//                               children: [
//                                 Stack(
//                                   alignment: Alignment.topRight,
//                                   children: [
//                                     Image.asset(
//                                       RecommendationModel.getImageForRecommendation(trimmedRec), 
//                                       width: 100, 
//                                       height: 100
//                                     ),
//                                     IconButton(
//                                       icon: Icon(
//                                         likedMethods.contains(trimmedRec) ? Icons.favorite : Icons.favorite_border,
//                                         color: likedMethods.contains(trimmedRec) ? Colors.red : Colors.grey,
//                                       ),
//                                       onPressed: () {
//                                         setState(() {
//                                           if (likedMethods.contains(trimmedRec)) {
//                                             likedMethods.remove(trimmedRec);
//                                           } else {
//                                             likedMethods.add(trimmedRec);
//                                           }
//                                         });
//                                       },
//                                     ),
//                                   ],
//                                 ),
//                                 Text(
//                                   translatedRec,
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(fontSize: 16),
//                                 ),
//                                 ElevatedButton(
//                                   onPressed: () {
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (context) => ShortSummariesScreen(methodName: trimmedRec),
//                                       ),
//                                     );
//                                   },
//                                   child: Text('Learn More'),
//                                 ),
//                               ],
//                             ),
//                           );
//                         }).toList(),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Container(
//                         padding: const EdgeInsets.all(10.0),
//                         decoration: BoxDecoration(
//                           color: Colors.grey.shade200,
//                           borderRadius: BorderRadius.circular(8.0),
//                         ),
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: <Widget>[
//                             Icon(Icons.lightbulb_outline, color: Colors.amber),
//                             SizedBox(width: 8),
//                             Expanded(
//                               child: Text(
//                                 widget.outroTexts.length > index ? _t(widget.outroTexts[index]) : '', 
//                                 style: TextStyle(fontSize: 16),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Divider(),
//                   ],
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text(_t('title1')), // Use _t method for translation
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.favorite),
          onPressed: navigateToLikedMethodsScreen,
        ),
      ],
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              languageButton('Kiswahili'),
              languageButton('Dholuo'),
              languageButton('English'),
            ],
          ),
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
                                          likedMethods.contains(trimmedRec) ? Icons.favorite : Icons.favorite_border,
                                          color: likedMethods.contains(trimmedRec) ? Colors.red : Colors.grey,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            if (likedMethods.contains(trimmedRec)) {
                                              likedMethods.remove(trimmedRec);
                                            } else {
                                              likedMethods.add(trimmedRec);
                                            }
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  _t(trimmedRec),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 16),
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
    ),
  );
}



Widget languageButton(String language) {
  bool isSelected = _currentLanguage == language;
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: OutlinedButton(
      onPressed: () => _changeLanguage(language),
      child: Text(language),
      style: OutlinedButton.styleFrom(
        backgroundColor: isSelected ? Colors.grey : Colors.white,
        foregroundColor: Colors.black,
        side: BorderSide(color: isSelected ? Colors.black : Colors.grey),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    ),
  );
}

void navigateToLikedMethodsScreen() {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => LikedMethodsScreen(
        likedMethods: likedMethods,
        currentLanguage: _currentLanguage,
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