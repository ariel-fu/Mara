import 'package:flutter/material.dart';

import 'package:mara_app/options_page.dart';
import 'package:mara_app/pattern_page.dart';
import 'package:mara_app/quiz_screen.dart';
import 'package:mara_app/ready_to_have_baby.dart';
import 'package:mara_app/time_page.dart';
import 'package:mara_app/private_page.dart';
import 'package:mara_app/WhatChance.dart';


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
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(0.0),
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
              leading: Icon(Icons.info_outline),
              title: Text(menuOptions[_currentLanguage]![0]),
              onTap: () => _handleTap(0), 
              tileColor: _selections[0] ? Colors.green : null, 
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text(menuOptions[_currentLanguage]![1]),
              onTap: () => _handleTap(1),
              tileColor: _selections[1] ? Colors.green : null, 
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.hourglass_empty),
              title: Text(menuOptions[_currentLanguage]![2]),
              onTap: () => _handleTap(2),
              tileColor: _selections[2] ? Colors.green : null, 
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.pregnant_woman),
              title: Text(menuOptions[_currentLanguage]![3]),
              onTap: () => _handleTap(3),
              tileColor: _selections[3] ? Colors.green : null, 
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.lock_outline), 
              title: Text(menuOptions[_currentLanguage]![4]),
              onTap: () => _handleTap(4),
              tileColor: _selections[4] ? Colors.green : null, 
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.baby_changing_station),
              title: Text(menuOptions[_currentLanguage]![5]),
              onTap: () => _handleTap(5),
              tileColor: _selections[5] ? Colors.green : null, 
            ),
            Divider(),  
            ListTile(
              leading: Icon(Icons.question_answer),
              title: Text(menuOptions[_currentLanguage]![6]),
              tileColor: _allSelected ? Colors.green : Colors.grey,
              onTap: () {
                _allSelected ? Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context) => QuizScreen()),
                ) : null;
              },
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
}
