import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:mara_app/options_page.dart';
import 'package:mara_app/pattern_page.dart';
import 'package:mara_app/quiz_screen.dart';
import 'package:mara_app/ready_to_have_baby.dart';
import 'package:mara_app/time_page.dart';
import 'package:mara_app/private_page.dart';
import 'package:mara_app/WhatChance.dart';

import 'package:mara_app/providers/provider_liked_methods.dart';
import 'package:mara_app/new_liked_methods.dart';


class HomePage2 extends StatefulWidget {
  const HomePage2({Key? key}) : super(key: key);
  
  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {

  final Map<String, List<String>> menuOptions = {
    "Kiswahili": [
      "Chaguzi zangu ni zipi?",
      "Nini kitafanyikia hedhi zangu",
      "Mbinu hiyo inafanya kazi kwa muda gani?",
      "Je, nafasi yangu ya kupata mimba ni ipi?",
      "Je, ninaweza kuiweka kwa usiri?",
      "Je, itakuaje ikiwa niko tayari kupata mtoto?",
      "Take the quiz"
    ],
    "Dholuo": [
      "Yierona gin mage?",
      "En ang'o mabiro timore ne remba mar dwe?",
      "Yor ni tiyo kuom kinde marom nade?",
      "Nyalona mar mako ich en ang'o?",
      "Bende anyalo kete mopondo?",
      "To ka ayikora mar mako ich to?",
      "Take the quiz"
    ],
    "English": [
      "What are my options?",
      "What will happen to my period?",
      "How long does the method work?",
      "What is my chance of getting pregnant? ",
      "Can I keep it private?",
      "What if I'm ready to have a baby?",
      "Take the quiz"
    ],
  };

  String _currentLanguage = 'English';

  // copied from options_page
  final Map<String, Map<String, String>> _translations = {
    'English': {
      'likedTitle': 'Your Favorites',
      'learnMore': 'Learn More',
    },
    'Dholuo': {
      'likedTitle': 'Ma ihero',
      'learnMore': 'Puonjri matut',
    },
    'Kiswahili' : {
      'likedTitle': 'Vipendwa vyako',
      'learnMore': 'Jifunze zaidi',
    },
  };

  String _t(String key) {
    String translation = _translations[_currentLanguage]?[key] ?? key;
    print('Key: $key, Language: $_currentLanguage, Translation: $translation');
    return translation;
  }

  final List<bool> _selections = List.generate(6, (_) => false);
  bool get _allSelected => _selections.every((bool selected) => selected);
  void _handleTap(int index) {
    setState(() { _selections[index] = true; });
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
  }

  void _switchLanguage(String language) {
    setState(() {
      _currentLanguage = language;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                        initialLanguage: _currentLanguage, 
                        translations: _translations,
                        // onMethodsChanged: likes.removeMethod,
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
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                languageButton('Kiswahili'),
                languageButton('Dholuo'),
                languageButton('English'),
              ],
            ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20.0),
            ListTile(
              leading: Image.asset('assets/birth_control_new.png', width: 44, height: 44),
              title: Text(menuOptions[_currentLanguage]![0]),
              onTap: () => _handleTap(0), 
              tileColor: _selections[0] ? Colors.green : null, 
            ),
            Divider(),
            ListTile(
              leading: Image.asset('assets/period_new.png', width: 44, height: 44),
              title: Text(menuOptions[_currentLanguage]![1]),
              onTap: () => _handleTap(1),
              tileColor: _selections[1] ? Colors.green : null, 
            ),
            Divider(),
            ListTile(
              leading: Image.asset('assets/calendar_new.png', width: 44, height: 44),
              title: Text(menuOptions[_currentLanguage]![2]),
              onTap: () => _handleTap(2),
              tileColor: _selections[2] ? Colors.green : null, 
            ),
            Divider(),
            ListTile(
              leading: Image.asset('assets/chance_new.png', width: 44, height: 44),
              title: Text(menuOptions[_currentLanguage]![3]),
              onTap: () => _handleTap(3),
              tileColor: _selections[3] ? Colors.green : null, 
            ),
            Divider(),
            ListTile(
              leading: Image.asset('assets/privacy_new.png', width: 44, height: 44),
              title: Text(menuOptions[_currentLanguage]![4]),
              onTap: () => _handleTap(4),
              tileColor: _selections[4] ? Colors.green : null, 
            ),
            Divider(),
            ListTile(
              leading: Image.asset('assets/preg_woman_new.png', width: 44, height: 44),
              title: Text(menuOptions[_currentLanguage]![5]),
              onTap: () => _handleTap(5),
              tileColor: _selections[5] ? Colors.green : null, 
            ),
            Divider(),  
            ListTile(
              leading: Image.asset('assets/take_quiz.png', width: 44, height: 44),
              title: Text(menuOptions[_currentLanguage]![6]),
              tileColor: _allSelected ? Colors.green : Colors.grey,
              onTap:_takeQuiz,
              // onTap: () {
              //   _allSelected ? Navigator.push(
              //    context,
              //    MaterialPageRoute(builder: (context) => QuizScreen()),
              //   ) : null;
              // },
            ),
          ],
        ),
      ),
    );
  }

  // originally from quiz screen; factor out
  Widget languageButton(String language) {
    bool isSelected = _currentLanguage == language;
    return ElevatedButton(
      onPressed: () => _switchLanguage(language),
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.grey : null,
        foregroundColor: isSelected ? Colors.white : null, // Optional: change text color based on selection
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
            title: Text("Please visit all sections before taking the quiz"),
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
    }
    else {
      _allSelected ? Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => QuizScreen()),
      ) : null;
    }
  }
}