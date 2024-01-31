import 'package:flutter/material.dart';
import 'main.dart'; // Import your main.dart file

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings Page'),
      ),
      body: Center (
        child: Column (
          children: [
            SizedBox(height:20),
            Text('Change App Language', style: TextStyle(
                        fontSize: 18.0, fontWeight:FontWeight.bold
                      ),),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () {}, child: Text('Change App Language to Spanish', style: TextStyle(
                        fontSize: 18.0, fontWeight:FontWeight.bold
                      ),)),
            SizedBox(height: 60),
            Text('Appearance (Light/Dark Mode)', style: TextStyle(
                        fontSize: 18.0, fontWeight:FontWeight.bold
                      ),),
            SizedBox(height:20),
            ElevatedButton(onPressed: () {}, child: Text('Change to Dark Mode', style: TextStyle(
                        fontSize: 18.0, fontWeight:FontWeight.bold
                      ),)),
            SizedBox(height: 60),
            Text('Change Font Size', style: TextStyle(
                        fontSize: 18.0, fontWeight:FontWeight.bold
                      ),),
            SizedBox(height: 20),
            Row (
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {},
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ],)
      ),
    ); 
  }
}