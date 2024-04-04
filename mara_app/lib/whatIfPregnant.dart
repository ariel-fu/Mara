import 'package:flutter/material.dart';

class whatIfPreg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '...',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: whatIfScreen(),
    );
  }
}

class whatIfScreen extends StatelessWidget {
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
              'English',
            ),
          ),
          const SizedBox(width: 20),
          ElevatedButton(
            onPressed: () {
              //do something else
            },
            child: Text(
              'Swahili',
            ),
          ),
          const SizedBox(width: 20),
          ElevatedButton(
            onPressed: () {
              //different still
            },      
            child: Text(
              'Guo',
            ),
          ),
          Spacer(),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.pregnant_woman,
                    size: 48,
                  ),
                  Expanded(
                    child: Text(
                      'What if I\'m ready to have a baby?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'ATTENTION ALL YOUNG WOMEN: Using family planning methods will NOT change your ability to get pregnant in the future!',
                textAlign: TextAlign.center,
              ),
            ),
            Divider(),
            GestureDetector(
              onTap: () {
                //play video
              },
              child: Container(
                margin: EdgeInsets.all(16.0),
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4.0,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Center(
                  child: Icon(
                    Icons.play_circle_filled,
                    size: 64,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.info_outline),
              title: Text('LEARN MORE about the fertility considerations of each method'),
              onTap: () {
                // tapped
              },
            ),
            ListTile(
              leading: Icon(Icons.check_circle_outline),
              title: Text('Preparing for a healthy pregnancy'),
              onTap: () {
                // tapped again
              },
            ),
          ],
        ),
      ),
    );
  }
}
