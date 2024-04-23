import 'package:flutter/material.dart';

class imLaunchScreen extends StatefulWidget {
  const imLaunchScreen({super.key});

  @override
  State<imLaunchScreen> createState() => _imLaunchState();
}
class _imLaunchState extends State<imLaunchScreen> {
  String _currentLanguage = 'English';

  Map<String, String> translations = {
    'English': "Let's get started!",
    'Kiswahili': "Tuanze!",
    'Dholuo': "Wachaki!",
  };

  Map<String, String> translations2 = {
    'English': "If this isn’t the right time for you to get pregnant, you have lots of options! \n \n Figuring out which options are right for you can feel overwhelming, especially with all the things you might hear out there - from people in your life and other sources. \n \n  This app is designed especially for young women to help you get the information you need to make an empowered decision, when you need it. \n \n Whether you know what method you want, have never used a method, or are already using a method, you can go through each section of this guide to get informed!",
    'Kiswahili': "Ikiwa huu sio wakati unaofaa kwako kupata Ujauzito, una chaguzi nyingi! \n \n  Kubaini ni chaguo zipi zinazokufaa kunaweza kulemewa, hasa kwa mambo yote unayoweza kusikia - kutoka kwa watu katika maisha yako na vyanzo vingine. \n \n  Programu hii imeundwa mahsusi kwa ajili ya wanawake vijana ili kukusaidia kupata taarifa unayohitaji ili kufanya uamuzi uliowezeshwa, unapoihitaji. pata maelezo zaidi kuhusu chaguo zako. Iwe unajua ni njia gani unayotaka, hujawahi kutumia njia, au tayari unatumia mbinu, unaweza kupitia kila sehemu ya mwongozo huu ili kupata taarifa!",
    'Dholuo': "Ka ma ok en saa maber kodi mako ich, in gi yiero mang'eny! \n \n Temo yiero yo maber kodi nyalo bedo matek ahinya, nikech weche mangeny ma samoro ing'eyo kata isewinjo oko kucha koa kuom jogo mantie e ngimani kod kuonde mamoko. \n \n App ni olos ng'enyne ne mine matindo mondo okonyi yudo weche makare ma idwaro mondo itim yiero makare, ekinde ma idware. Kata ka ing'eyo yor komo nyuol ma idwaro, pok ne itiyo gi yor komo nyuol moro amora, kata itiyo gi yor komo nyuol sani, inyalo somo okang ka okang mar app ni mondo iyud puonjruok!",
  };

  Map<String, String> translations3 = {
    'English': "Let's get started!",
    'Kiswahili': "Tuanze!",
    'Dholuo': "Wachaki!",
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
        backgroundColor: Colors.transparent,
        elevation: 0,
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
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.center,  // change, to reposition image
            image: AssetImage("assets/imlaunchscreenimg.png"),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 90.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                translations[_currentLanguage]!, textAlign: TextAlign.right,
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 40.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                translations2[_currentLanguage]!,
                style: TextStyle(fontSize: 16.0), textAlign: TextAlign.center
              ),
            ),
            
            SizedBox(height: 20.0),
            Center (
              child:
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    '/home',
                  );
                },
                child: Text(translations3[_currentLanguage]!,),
              ),
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
