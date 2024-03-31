// import 'package:flutter/material.dart';
// import 'recommendation_model.dart';
// import 'liked_methods.dart';
// import 'short_summaries.dart';
// class RecommendationScreen extends StatefulWidget {
//   final List<String> recommendations;
//   final List<String> introTexts;
//   final List<String> outroTexts;
//   final String currentLanguage;
//   final Function(String) onChangeLanguage;
//   final Map<String, Map<String, String>> translations;

//   RecommendationScreen({
//     Key? key,
//     required this.recommendations,
//     required this.introTexts,
//     required this.outroTexts,
//     required this.currentLanguage,
//     required this.translations,
//     required this.onChangeLanguage,
//   }) : super(key: key);

//   @override
//   _RecommendationScreenState createState() => _RecommendationScreenState();
// }

// class _RecommendationScreenState extends State<RecommendationScreen> {
//   late String _currentLanguage;
//   Set<String> likedMethods = Set<String>(); // Store liked methods
//   @override
//   void initState() {
//     super.initState();
//     _currentLanguage = widget.currentLanguage;
//   }

//   void _changeLanguage(String language) {
//     setState(() {
//       _currentLanguage = language;
//     });
//     widget.onChangeLanguage(language);
//   }

//   String _t(String key) {
//     return widget.translations[_currentLanguage]?[key] ?? key;
//   }

//   void toggleLikeMethod(String method) {
//     setState(() {
//       if (likedMethods.contains(method)) {
//         likedMethods.remove(method);
//       } else {
//         likedMethods.add(method);
//       }
//     });
//   }



// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: Text(_t('title1')), // Use _t method for translation
//       actions: <Widget>[
//         IconButton(
//           icon: Icon(Icons.favorite),
//           onPressed: navigateToLikedMethodsScreen,
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
//                           return Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Column(
//                               children: [
//                                 Stack(
//                                   alignment: Alignment.center,
//                                   children: [
//                                     Image.asset(
//                                       RecommendationModel.getImageForRecommendation(trimmedRec), 
//                                       width: 100, 
//                                       height: 100
//                                     ),
//                                     Positioned(
//                                       top: -9,
//                                       right: -9,
//                                       child: IconButton(
//                                         icon: Icon(
//                                           likedMethods.contains(trimmedRec) ? Icons.thumb_up : Icons.thumb_up_off_alt,
//                                           color: likedMethods.contains(trimmedRec) ? Colors.brown[900] : Colors.brown[400],
//                                         ),
//                                         onPressed: () {
//                                           setState(() {
//                                             if (likedMethods.contains(trimmedRec)) {
//                                               likedMethods.remove(trimmedRec);
//                                             } else {
//                                               likedMethods.add(trimmedRec);
//                                             }
//                                           });
//                                         },
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 Text(
//                                   _t(trimmedRec),
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(fontSize: 16),
//                                 ),
//                                 ElevatedButton(
//                                       onPressed: () {
//                                         Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                             builder: (context) => ShortSummariesScreen(methodName: trimmedRec),
//                                           ),
//                                         );
//                                       },
//                                       child: Text('Learn More'),
//                                     ),
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
//     child: ElevatedButton(
//       onPressed: () => _changeLanguage(language),
//       style: ElevatedButton.styleFrom(
//         backgroundColor: isSelected ? Colors.grey : null, // Grey if selected
//       ),
//       child: Text(language),
//     ),
//   );
// }



// void navigateToLikedMethodsScreen() {
//   Navigator.push(
//     context,
//     MaterialPageRoute(
//       builder: (context) => LikedMethodsScreen(
//         likedMethods: likedMethods,
//         initialLanguage: _currentLanguage, // Use initialLanguage instead of currentLanguage
//         translations: widget.translations,
//         onMethodsChanged: (updatedMethods) {
//           setState(() {
//             likedMethods = updatedMethods;
//           });
//         },
//         // Removed onLanguageChanged as it's no longer needed
//       ),
//     ),
//   );
// }

// }
