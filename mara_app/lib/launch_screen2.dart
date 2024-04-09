import 'package:flutter/material.dart';
import 'package:mara_app/intermediate_launch_screen.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({super.key});

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  String currentLanguage = 'English';

  Map<String, String> translations = {
    'English': "The best family planning choice is the option that you feel is right for you.",
    'Kiswahili': "Chaguo bora zaidi la kupanga uzazi ni chaguo ambalo unahisi linakufaa.",
    'Dholuo': "Yor komo nyuol maber mogik en ma ineno ka ber kodi.",
  };

  Map<String, String> translations2 = {
    'English': "Learn more about your options",
    'Kiswahili': "Pata maelezo zaidi kuhusu chaguo zako",
    'Dholuo': "Puonjri matut ewi yiero ma in godo",
  };

 void switchLanguage(String language) {
    setState(() {
      currentLanguage = language;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        actions: [
          Spacer(),
          ElevatedButton(
            onPressed: () => switchLanguage('Kiswahili'),
            child: Text('Kiswahili'),
          ),
          const SizedBox(width: 20),
          ElevatedButton(
            onPressed: () => switchLanguage('Dholuo'),
            child: Text('Dholuo'),
          ),
          const SizedBox(width: 20),
          ElevatedButton(
            onPressed: () => switchLanguage('English'),
            child: Text('English'),
          ),
          Spacer(),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Image.asset(
                'assets/maralogo.png',
                width: MediaQuery.of(context).size.width * 0.5,
              ),
            ),
            Text(translations[currentLanguage]!, textAlign: TextAlign.center,),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => imLaunchScreen()),
                );
              },
              child: Text(translations2[currentLanguage]!),
            ),
          ],
        ),
      ),
    );
  }
}
