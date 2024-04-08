import 'package:flutter/material.dart';
import 'package:mara_app/intermediate_launch_screen.dart';

class LaunchScreen extends StatelessWidget {
  const LaunchScreen({super.key});

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
      body: Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Image.asset(
                'assets/maralogo.png',
                width: MediaQuery.of(context).size.width * 0.5,
              ),
            ),
            const Text("The best family planning choice is the option that you feel is right for you.", textAlign: TextAlign.center,),
            const SizedBox(height: 50),
            //Divider(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => imLaunchScreen()),
                );
              },
              child: const Text('Learn more about your options'),
            ),
          ],
        ),
      ),
    );
  }
}