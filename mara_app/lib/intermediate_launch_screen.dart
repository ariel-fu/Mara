import 'package:flutter/material.dart';
import 'package:mara_app/home2.dart';

class imLaunchScreen extends StatelessWidget {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "If this isn't the right time for you to get pregnant, you have lots of options!",
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Figuring out which options are right for you can feel overwhelming, especially with all the things you might hear out there - from people in your life and other sources.",
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "This app is designed especially for young women to help you get the information you need to make an empowered decision when you need it.",
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Whether you know what method you want, have never used a method, or are already using a method, you can go through each section of this guide to get informed!",
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            SizedBox(height: 20.0),
            Center(
              child: Image.asset(
                'assets/imlaunchscreenimg.png',
                width: MediaQuery.of(context).size.width * 0.8,
              ),
            ),
            SizedBox(height: 20.0),
            Center (
              child:
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => home2()),
                  );
                },
                child: const Text('continue'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
