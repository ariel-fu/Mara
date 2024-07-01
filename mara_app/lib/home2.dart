import 'dart:core';

import 'package:flutter/material.dart';
import 'package:mara_app/design/colors.dart';
import 'package:provider/provider.dart';

import 'package:mara_app/options_page.dart';
import 'package:mara_app/pattern_page.dart';
import 'package:mara_app/quiz_screen.dart';
import 'package:mara_app/ready_to_have_baby.dart';
import 'package:mara_app/time_page.dart';
import 'package:mara_app/private_page.dart';
import 'package:mara_app/WhatChance.dart';
import 'package:mara_app/hiv_page.dart';
import 'package:mara_app/emergency.dart';

import 'package:mara_app/providers/provider_liked_methods.dart';
import 'package:mara_app/new_liked_methods.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'session_manager.dart';

import 'audio.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({Key? key}) : super(key: key);
  static var emergencyVisited = false;

  static var stiVisited = false;

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  bool overrideIndex = false;
  int languageIndex = 2; // similar indexing for language
  final languages = ["Kiswahili", "Dholuo", "English"];

  final Map<String, List<String>> menuOptions = {
    "Kiswahili": [
      "Chaguzi zangu ni zipi?",
      "Nini kitafanyikia hedhi zangu",
      "Mbinu hiyo inafanya kazi kwa muda gani?",
      "Je, nafasi yangu ya kupata mimba ni ipi?",
      "Je, ninaweza kuiweka kwa usiri?",
      "Je, itakuaje ikiwa niko tayari kupata mtoto?",
      "Kuzuia Virusi Vya Ukimwi na magonjwa ya zinaa",
      "Chukua jaribio letu na utafute mbinu yako!",
      "Mambo 3 unayohitaji kujua kuhusu E-pill (P2)"
    ],
    "Dholuo": [
      "Yierona gin mage?",
      "En ang'o mabiro timore ne remba mar dwe?",
      "Yor ni tiyo kuom kinde marom nade?",
      "Nyalona mar mako ich en ang'o?",
      "Bende anyalo kete mopondo?",
      "To ka ayikora mar mako ich to?",
      "Geng'o kute mag ayaki kod Nyae",
      "Tim penj wa mondo iyud yori mar geng'o ich!",
      "Gik moko 3 ma onego ing'e ewi E-pill (P2)"
    ],
    "English": [
      "What are my options?",
      "What will happen to my period?",
      "How long does the method work?",
      "What is my chance of getting pregnant? ",
      "Can I keep it private?",
      "What if I'm ready to have a baby?",
      "Preventing HIV and STIs",
      "Take our quiz and find your method!",
      "3 things you need to know about the E-pill (P2)"
    ],
  };

  final Map<String, List<String>> audioContentMap = {
    "English": [
      'videoAudio/audio/title_audio/options_E.mp3',
      'videoAudio/audio/title_audio/title_period_E.mp3',
      'videoAudio/audio/title_audio/title_how_long_E.mp3',
      'videoAudio/audio/title_audio/title_what_chance_E.mp3',
      'videoAudio/audio/title_audio/title_private_E.mp3',
      'videoAudio/audio/title_audio/title_ready_baby_E.mp3',
      'videoAudio/audio/heyThis_HIV_STI_E.mp3', // unused
      'videoAudio/audio/title_audio/quiz_E.mp3', // these are fake
      'videoAudio/audio/3things_E.mp3',
    ],
    "Kiswahili": [
      'videoAudio/audio/title_audio/options_K.mp3',
      'videoAudio/audio/title_audio/title_period_K.mp3',
      'videoAudio/audio/title_audio/title_how_long_K.mp3',
      'videoAudio/audio/title_audio/title_what_chance_K.mp3',
      'videoAudio/audio/title_audio/title_private_K.mp3',
      'videoAudio/audio/title_audio/title_ready_baby_K.mp3',
      'videoAudio/audio/heyThis_HIV_STI_K.mp3', // unused
      'videoAudio/audio/title_audio/quiz_K.mp3', // these are fake
      'videoAudio/audio/3things_K.mp3',
    ],
    "Dholuo": [
      'videoAudio/audio/title_audio/options_L.mp3',
      'videoAudio/audio/title_audio/title_period_L.mp3',
      'videoAudio/audio/title_audio/title_how_long_L.mp3',
      'videoAudio/audio/title_audio/title_what_chance_L.mp3',
      'videoAudio/audio/title_audio/title_private_L.mp3',
      'videoAudio/audio/title_audio/title_ready_baby_L.mp3',
      'videoAudio/audio/heyThis_HIV_STI_L.mp3', // unused
      'videoAudio/audio/title_audio/quiz_L.mp3', // these are fake
      'videoAudio/audio/3things_L.mp3',
    ],
  };

  final Color visitedColor = MaraColors.magentaPurple;
  final Color notVisitedColor = MaraColors.purple;

  String _currentLanguage = 'English';

  @override
  void initState() {
    super.initState();
    _loadCurrentLanguage();
    SessionManager.logScreenEntry('Home2Page'); // Log entry time
  }

  @override
  void dispose() {
    SessionManager.logScreenExit(
        'Home2Page'); // Log exit time and calculate duration
    super.dispose();
  }

  // Future<void> _loadCurrentLanguage() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     _currentLanguage = prefs.getString('selectedLanguage') ?? 'English';
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

  // copied from options_page
  final Map<String, Map<String, String>> _translations = {
    'English': {
      'likedTitle': 'Your Favorites',
      'pleaseVisit': 'Please visit all sections before taking the quiz',
    },
    'Dholuo': {
      'likedTitle': 'Ma ihero',
      'pleaseVisit': 'Kiyie to lim Okeng\'e te kapok itimo penj',
    },
    'Kiswahili': {
      'likedTitle': 'Vipendwa vyako',
      'pleaseVisit':
          'Tafadhali tembelea sehemu zote kabla ya kuchukua chemsha bongo',
    },
  };

  String _t(String key) {
    String translation = _translations[_currentLanguage]?[key] ?? key;
    // print('Key: $key, Language: $_currentLanguage, Translation: $translation');
    return translation;
  }

  // final List<bool> _selections = List.generate(6, (_) => false);
  final List<bool> _selections = List.generate(6, (_) => false);

  bool get _allSelected => _selections.every((bool selected) => selected);

  void _handleTap(int index) {
    setState(() {
      _selections[index] = true;
    });
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OptionsPage()),
      );
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PatternPage()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TimePage()),
      );
    } else if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WhatChance()),
      );
    } else if (index == 4) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PrivatePage()),
      );
    } else if (index == 5) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ReadyPage()),
      );
    }
    // } else if (index == 6) {
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(builder: (context) => HIVPage()),
    //   );
    // }
  }

  // void _switchLanguage(String language) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('selectedLanguage', language);
  //   setState(() {
  //     _currentLanguage = language;
  //   });
  // }
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

  @override
  Widget build(BuildContext context) {
    final double containerWidth = MediaQuery.of(context).size.width;
    final double containerHeight = MediaQuery.of(context).size.height;
    double boxWidth = containerWidth;
    double boxHeight = containerHeight;
    double availableHeight = boxHeight;

    _loadCurrentLanguage();
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
              label:
                  Text(_t('likedTitle'), style: TextStyle(color: Colors.black)),
              // label: Text(methods[methodIndex]!.name, style: TextStyle(color: Colors.black)),
              onPressed: () {
                var likes = context.read<Likes>();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LikedMethodsScreen(
                      initialLanguage: _currentLanguage,
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
      // body: ListView.builder( // List view with builder to create dynamic list items
      //   itemBuilder: (context, index) =>
      //     CustomListTile( // Custom list tile widget with specific height
      //       height: 150, // Set custom height for each list tile
      //         leading: Image.asset('assets/birth_control_white.png', width: 60, height: 60),
      //         title: Text(menuOptions[_currentLanguage]![0]),
      //         titleTextStyle: TextStyle(color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.bold),
      //         onTap: () => _handleTap(0),
      //         tileColor: _selections[0] ? Colors.green : Colors.black,
      //       // Remaining list tile properties...
      //     ),
      //   itemCount: 1, // Number of list items to build
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // PreferredSize(
            //   preferredSize: Size.fromHeight(availableHeight * 0.05),
            //   child: Container(
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //       children: [
            //         languageButton('Kiswahili', 0),
            //         languageButton('Dholuo', 1),
            //         languageButton('English', 2),
            //       ],
            //     ),
            //   ),
            // ),
            //   Padding(
            //     padding: EdgeInsets.only(left: 500.0),
            //   child: Consumer<Likes>(
            //     builder: (context, likes, child) => ElevatedButton.icon(
            //       icon: Icon(Icons.thumb_up, color: Colors.black),
            //       label: Text(_t('likedTitle')),
            //       // label: Text(methods[methodIndex]!.name, style: TextStyle(color: Colors.black)),
            //       onPressed: () {
            //         var likes = context.read<Likes>();
            //         Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //             builder: (context) => LikedMethodsScreen(
            //               initialLanguage: _currentLanguage,
            //               translations: _translations,
            //             ),
            //           ),
            //         );
            //       },
            //       style: ElevatedButton.styleFrom(
            //         backgroundColor: Colors.deepPurple[100],
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(18.0),
            //         ),
            //         padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            //         alignment: Alignment.topRight,
            //       ),
            //     ),
            //   ),
            //   ),
            SizedBox(height: 20.0),
            ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 28.0),
              leading: IntrinsicWidth(
                  child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('assets/home_icons/white/birth_control_white.png',
                      width: 90, height: 90),
                  getAudio(audioContentMap, 0),
                ],
              )),
              title: Text(menuOptions[_currentLanguage]![0],
                  style: TextStyle(
                      fontFamily: 'PoetsenOne',
                      color: Colors.white,
                      fontSize: 28.0)),
              titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold),
              onTap: () => _handleTap(0),
              tileColor: _selections[0] ? visitedColor : notVisitedColor,
            ),
            Divider(),
            ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 28.0),
              leading: IntrinsicWidth(
                  child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('assets/home_icons/white/period_white.png',
                      width: 90, height: 90),
                  getAudio(audioContentMap, 1),
                ],
              )),
              title: Text(menuOptions[_currentLanguage]![1],
                  style: TextStyle(
                      fontFamily: 'PoetsenOne',
                      color: Colors.white,
                      fontSize: 28.0)),
              titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold),
              onTap: () => _handleTap(1),
              tileColor: _selections[1] ? visitedColor : notVisitedColor,
            ),
            Divider(),
            ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 28.0),
              leading: IntrinsicWidth(
                  child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('assets/home_icons/white/calendar_white.png',
                      width: 90, height: 90),
                  getAudio(audioContentMap, 2),
                ],
              )),
              title: Text(menuOptions[_currentLanguage]![2],
                  style: TextStyle(
                      fontFamily: 'PoetsenOne',
                      color: Colors.white,
                      fontSize: 28.0)),
              titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold),
              onTap: () => _handleTap(2),
              tileColor: _selections[2] ? visitedColor : notVisitedColor,
            ),
            Divider(),
            ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 28.0),
              leading: IntrinsicWidth(
                  child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('assets/home_icons/white/chance_white.png',
                      width: 90, height: 90),
                  getAudio(audioContentMap, 3),
                ],
              )),
              title: Text(menuOptions[_currentLanguage]![3],
                  style: TextStyle(
                      fontFamily: 'PoetsenOne',
                      color: Colors.white,
                      fontSize: 28.0)),
              titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold),
              onTap: () => _handleTap(3),
              tileColor: _selections[3] ? visitedColor : notVisitedColor,
            ),
            Divider(),
            ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 28.0),
              leading: IntrinsicWidth(
                  child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('assets/home_icons/white/privacy_white.png',
                      width: 90, height: 90),
                  getAudio(audioContentMap, 4),
                ],
              )),
              title: Text(menuOptions[_currentLanguage]![4],
                  style: TextStyle(
                      fontFamily: 'PoetsenOne',
                      color: Colors.white,
                      fontSize: 28.0)),
              titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold),
              onTap: () => _handleTap(4),
              tileColor: _selections[4] ? visitedColor : notVisitedColor,
            ),
            Divider(),
            ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 28.0),
              leading: IntrinsicWidth(
                  child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                      'assets/home_icons/white/ready_to_have_baby_pregnant_white.png',
                      width: 90,
                      height: 90),
                  getAudio(audioContentMap, 5),
                ],
              )),
              title: Text(menuOptions[_currentLanguage]![5],
                  style: TextStyle(
                      fontFamily: 'PoetsenOne',
                      color: Colors.white,
                      fontSize: 28.0)),
              titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold),
              onTap: () => _handleTap(5),
              tileColor: _selections[5] ? visitedColor : notVisitedColor,
            ),
            Divider(),
            getButtonRow(),
            Divider(),
            ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 28.0),
              leading: IntrinsicWidth(
                  child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('assets/home_icons/white/take_quiz_white.png',
                      width: 90, height: 90),
                  // getAudio(audioContentMap, 7),
                ],
              )),
              title: Text(menuOptions[_currentLanguage]![7],
                  style: TextStyle(
                      fontFamily: 'PoetsenOne',
                      color: Colors.white,
                      fontSize: 28.0)),
              titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold),
              tileColor: _allSelected ? visitedColor : notVisitedColor,
              onTap: _takeQuiz,
            ),
          ],
        ),
      ),
    );
  }

  // originally from quiz screen; factor out
  // Widget languageButton(String language) {
  //   bool isSelected = _currentLanguage == language;
  //   return ElevatedButton(
  //     onPressed: () => _switchLanguage(language),
  //     style: ElevatedButton.styleFrom(
  //       backgroundColor: isSelected ? Colors.grey : null,
  //       foregroundColor: isSelected
  //           ? Colors.white
  //           : null, // Optional: change text color based on selection
  //     ),
  //     child: Text(language),
  //   );
  // }
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

  void _takeQuiz() {
    //print('Attempting to submit. Selected options: $_selectedOptions');
    if (_allSelected == false) {
      print('incomplete');
      // Show an alert dialog or a message to complete the quiz
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(_t('pleaseVisit')),
            //content: Text(_t('incompleteMessage')),
            actions: <Widget>[
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return; // Exit the function without navigating if not all questions are answered
    } else {
      _allSelected
          ? Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => QuizScreen()),
            )
          : null;
    }
  }

  Widget getAudio(Map<String, List<String>> audioContentMap, int index) {
    return AudioWidget(audioAsset: audioContentMap[_currentLanguage]![index]);
  }

  Widget getButtonRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        getAudio(audioContentMap, 8),
        Expanded(
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  HomePage2.emergencyVisited
                      ? visitedColor
                      : Color.fromRGBO(208, 165, 229, 1)),
            ),
            onPressed: () async {
              // Handle button press
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EmergencyPage(
                          initialLanguage: _currentLanguage,
                        )),
              );
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setString("previousScreen", "home");
            },
            child: Padding(
              padding: EdgeInsets.all(8.0), // Adjust the padding as needed
              child: Text(menuOptions[_currentLanguage]![8],
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'PoetsenOne',
                      color: Colors.black,
                      fontSize: 28.0)),
            ),
          ),
        ),
        SizedBox(width: 15.0),
        // getAudio(audioContentMap, 6),
        Expanded(
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  HomePage2.stiVisited
                      ? visitedColor
                      : Color.fromRGBO(208, 165, 229, 1)),
            ),
            onPressed: () {
              // Handle button press
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HIVPage()),
              );
            },
            child: Padding(
              padding: EdgeInsets.all(8.0), // Adjust the padding as needed
              child: Text(menuOptions[_currentLanguage]![6],
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'PoetsenOne',
                      color: Colors.black,
                      fontSize: 28.0)),
            ),
          ),
        ),
      ],
    );
  }
}
