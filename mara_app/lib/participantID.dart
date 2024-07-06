import 'package:flutter/material.dart';
import 'package:mara_app/design/colors.dart';
import 'package:mara_app/session_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home2.dart';

class ParticipantIDScreen extends StatefulWidget {
  const ParticipantIDScreen({Key? key}) : super(key: key);

  @override
  State<ParticipantIDScreen> createState() => _ParticipantIDScreenState();
}

class _ParticipantIDScreenState extends State<ParticipantIDScreen> {
  TextEditingController _participantID_Controller = TextEditingController();

  // String participant_ID = "";

  @override
  void dispose() {
    _participantID_Controller.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  // recording fieldInput
  String participantID = "";

  @override
  Widget build(BuildContext context) {
    HomePage2.emergencyVisited = false;
    HomePage2.stiVisited = false;

    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Enter participant ID for next session',
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                controller: _participantID_Controller,
                validator: (value) {
                  // if (value == null || value.isEmpty) {
                  if (value == null || value.isEmpty) {
                    return 'Enter participant ID before starting next session';
                  }
                  print(value);
                  return null;
                },
                onChanged: (value) => setState(() => participantID = value),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _formKey.currentState == null ||
                      !_formKey.currentState!.validate()
                  ? null
                  : () {
                      // if (participant_ID.currentState!.validate()) {
                      SessionManager.startNewSession(); // Start a new session
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/launch', (Route<dynamic> route) => false);
                      saveParticipantID(_participantID_Controller.text);
                      // }
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: MaraColors.magentaPurple,
              ),
              child: Text(
                'Start Session',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  saveParticipantID(String input) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    try {
      preferences.setString('participantID', input);
    } catch (e) {
      print(e.toString());
    }
    print("saved to prefs");
  }
}
