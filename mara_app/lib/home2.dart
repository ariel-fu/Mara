import 'package:flutter/material.dart';
import 'package:mara_app/options_page.dart';
import 'package:mara_app/pattern_page.dart';
import 'package:mara_app/quiz_screen.dart';
import 'package:mara_app/ready_to_have_baby.dart';
import 'package:mara_app/time_page.dart';

class home2 extends StatefulWidget {

  const home2({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<home2> {
  List<bool> _selections = List.generate(6, (_) => false);
  bool get _allSelected => _selections.every((bool selected) => selected);
  void _handleTap(int index) async {
  setState(() { _selections[index] = true; });
  if (index == 0) {
    await Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => OptionsPage()),
  );
  } else if (index == 1) {
    await Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => PatternPage()),
  );
  } else if (index == 2) {
    //await Navigator.push(
    //context,
    //MaterialPageRoute(builder: (context) => TimePage()),
  //);
  } else if (index == 3) {
    //Navigator.push(
    //context,
    //MaterialPageRoute(builder: (context) => MainScreen()), //need a better name for that screen
    //).then((_) { setState(() { _selections[index] = true; }); });
  }
  setState(() {});
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
                //Navigator.push(
                //  context,
                //  MaterialPageRoute(builder: (context) => QuizScreen()),
                //);
              },
            ),
          ],
        ),
      ),
    );
  }
}
