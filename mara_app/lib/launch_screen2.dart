import 'package:flutter/material.dart';
import 'package:mara_app/intermediate_launch_screen.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({super.key});

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  String _currentLanguage = 'English';

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

 void _switchLanguage(String language) {
    setState(() {
      _currentLanguage = language;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
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
            Text(translations[_currentLanguage]!, textAlign: TextAlign.center,),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => imLaunchScreen()),
                );
              },
              child: Text(translations2[_currentLanguage]!),
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
