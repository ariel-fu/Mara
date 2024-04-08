import 'package:flutter/material.dart';

import 'package:mara_app/options_page.dart';
import 'package:mara_app/pattern_page.dart';
import 'package:mara_app/quiz_screen.dart';
import 'package:mara_app/ready_to_have_baby.dart';
import 'package:mara_app/time_page.dart';
import 'package:mara_app/private_page.dart';

void main() => runApp(HomePage2());


class HomePage2 extends StatefulWidget {
  const HomePage2({Key? key}) : super(key: key);
  
  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
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
      // Navigator.push(
      // context,
      // MaterialPageRoute(builder: (context) => MainScreen()),
      // ).then((_) { setState(() { _selections[index] = true; }); });
    } else if (index == 4) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PrivatePage()),
      );
    } else if (index == 5) {
      Navigator.pushNamed(context, '/ready_baby');
    } else if (index == 6) {
      Navigator.pushNamed(context, '/quiz');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
         actions: [
          Spacer(),
          ElevatedButton(
            onPressed: () {
              //do something
            },
            child: Text(
              'Kiswahili',
            ),
          ),
          const SizedBox(width: 20),
          ElevatedButton(
            onPressed: () {
              //do something else
            },
            child: Text(
              'Dholuo',
            ),
          ),
          const SizedBox(width: 20),
          ElevatedButton(
            onPressed: () {
              //different still
            },      
            child: Text(
              'English',
            ),
          ),
          Spacer(),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.info_outline),
              title: Text('What are my options?'),
              onTap: () => _handleTap(0), 
              tileColor: _selections[0] ? Colors.green : null, 
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text('What will happen to my period?'),
              onTap: () => _handleTap(1),
              tileColor: _selections[1] ? Colors.green : null, 
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.hourglass_empty),
              title: Text('How long does the method work?'),
              onTap: () => _handleTap(2),
              tileColor: _selections[2] ? Colors.green : null, 
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.pregnant_woman),
              title: Text('What is my chance of getting pregnant?'),
              onTap: () => _handleTap(3),
              tileColor: _selections[3] ? Colors.green : null, 
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.lock_outline), 
              title: Text('Can I keep it private?'),
              onTap: () => _handleTap(4),
              tileColor: _selections[4] ? Colors.green : null, 
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.baby_changing_station),
              title: Text('What if I’m ready to have a baby?'),
              onTap: () => _handleTap(5),
              tileColor: _selections[5] ? Colors.green : null, 
            ),
            Divider(),  
            ListTile(
              leading: Icon(Icons.question_answer),
              title: Text('Take the Quiz'),
              tileColor: _allSelected ? Colors.green : Colors.grey,
              onTap: () {
                Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context) => QuizScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
