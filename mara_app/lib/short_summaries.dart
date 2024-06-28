import 'package:flutter/material.dart';

import 'package:mara_app/icons/misc_icons.dart';
import 'package:mara_app/recommendation_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mara_app/design/colors.dart';
import 'session_manager.dart';
class MethodDetailsScreen extends StatefulWidget { // new entry for each visit; timestamps not overridden 
  final String methodName;
  final Map<String, dynamic>? methodDetails;
  final String currentLanguage;
  final Map<String, Map<String, String>> translations;
  final Function(String) onChangeLanguage;

  MethodDetailsScreen({
    Key? key,
    required this.methodName,
    this.methodDetails,
    required this.currentLanguage,
    required this.translations,
    required this.onChangeLanguage,
  }) : super(key: key);

  @override
  State<MethodDetailsScreen> createState() => _MethodDetailsScreenState();
}

class _MethodDetailsScreenState extends State<MethodDetailsScreen> {
  final languages = ["Kiswahili", "Dholuo", "English"];
  bool overrideIndex = false;
  int languageIndex = 2; // similar indexing for language
  String _currentLanguage = 'English';
  DateTime? _screenEntryTime;
  @override
  void initState() {
    super.initState();
    _loadCurrentLanguage();
    _screenEntryTime = DateTime.now(); 
    _logScreenEntry();
  }

  void _logScreenEntry() {
    SessionManager.logScreenEntry('MethodDetailsScreen');
    debugPrint('Screen Entry: MethodDetailsScreen');
  }

  void _logScreenExit() {
    if (_screenEntryTime != null) {
      SessionManager.logScreenExit('MethodDetailsScreen');
      debugPrint('Screen Exit: MethodDetailsScreen');
    }
  }

  @override
  void dispose() {
    _logScreenExit();
    super.dispose();
  }

  final double _aspectRatio = 16 / 10;

  Future<void> _loadCurrentLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _currentLanguage = prefs.getString('selectedLanguage') ?? 'English';
    });
    if (_currentLanguage.contains('English')) {
      languageIndex = 2;
    } else if (_currentLanguage.contains('Dholuo')) {
      languageIndex = 1;
    } else {
      languageIndex = 0;
    }
  }

  void _changeLanguage(String language) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedLanguage', language);
    setState(() {
      _currentLanguage = language;
    });
    widget.onChangeLanguage(language);
  }




  final Map<String, String>  titleTranslations = {
    'Kiswahili': 'Ukurasa wa muhtasari',
    'Dholuo': 'Oboke ma lero weche e yo machuok',
    'English': 'Summary page',
  };

  String _t(String key) {
    String translation = widget.translations[_currentLanguage]?[key] ?? key;
    debugPrint('Current Language: $_currentLanguage');
  debugPrint('Key: $key');
  debugPrint('Translation: $translation');
    return widget.translations[_currentLanguage]?[key] ?? key;
}


void asyncmethod(String language) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('selectedLanguage', language);
}


@override
Widget build(BuildContext context) {

    double containerWidth = MediaQuery.of(context).size.width;
    double containerHeight = MediaQuery.of(context).size.height;
    if (containerHeight / containerWidth > _aspectRatio) {
      containerHeight = containerWidth * _aspectRatio;
    } else {
      containerWidth = containerHeight / _aspectRatio;
    }
    double boxWidth = containerWidth;
    double boxHeight = containerHeight;
    double availableHeight = boxHeight;

  if (widget.methodDetails == null) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Error'),
      ),
      body: Center(child: Text('No data available for ${widget.methodName}')),
    );
  }

  String methodName = widget.methodDetails?['name']?[_currentLanguage] ?? widget.methodName;
  // String iconPath = widget.methodDetails?['icon'] ?? 'assets/method_default.png';
  String subtitle = widget.methodDetails?['subtitles']?[_currentLanguage] ?? '';

  return Scaffold(
    appBar: AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back), 
        onPressed: () => Navigator.of(context).pop(), 
      ),
      centerTitle: true,
        title: PreferredSize(
          preferredSize: Size.fromHeight(availableHeight * 0.05),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                languageButton('Kiswahili', 0),
                SizedBox(width: 40),
                languageButton('Dholuo', 1),
                SizedBox(width: 40),
                languageButton('English', 2),
              ],
            ),
          ),
        ),
      // title: Center(
      //   child: Text(titleTranslations[_currentLanguage] ?? "Title not found",
      //     style: TextStyle(
      //                   fontFamily: 'PoetsenOne',
      //                   color: MaraColors.purple,
      //                   fontSize: 36.0)
      //   ),
      // ),

    ),
    body: Column(
      //padding: EdgeInsets.all(8.0),
      children: <Widget> [
        // Padding(
        //   padding: EdgeInsets.all(8.0),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //     children: [
        //       languageButton('Kiswahili'),
        //       languageButton('Dholuo'),
        //       languageButton('English'),
        //     ]
        //   ),
        // ),
        Center(
        child: Text(titleTranslations[_currentLanguage] ?? "Title not found",
          style: TextStyle(fontFamily: 'PoetsenOne', color: MaraColors.purple, fontSize: 36.0),
            textAlign: TextAlign.center,
        ),
      ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    RecommendationModel.getIconForRecommendation(widget.methodName), 
                    size: 80,
                    color: MaraColors.magentaPurple),
                  // Image.asset(iconPath, width: 50, height: 50),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(methodName, style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold)),
                      Text(subtitle, style: TextStyle(fontSize: 25, fontStyle: FontStyle.italic)), // Subtitle displayed here
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
            child: RawScrollbar(
              thumbColor: const Color.fromARGB(255, 232, 132, 165),
              thumbVisibility: true,
              trackVisibility: false,
              thickness: 15.0,
              radius: Radius.circular(20),
            child: ListView(
              children: <Widget>[
                buildContentCard(MiscIcons.birth_control, '', 'how_it_works'),
                buildContentCard(MiscIcons.period, 'what_period', 'side_effects'),
                buildContentCard(MiscIcons.calendar, 'how_long', 'lasts'),
                buildContentCard(MiscIcons.chance, 'how_effective', 'effectiveness'),
                buildContentCard(MiscIcons.private, 'can_private', 'privacy'),
                buildContentCard(MiscIcons.pregnant_woman, 'ready_to_have_baby', 'fertility'),
              ]
            )
            )
        )
      ],
    ),
  );
}

void _switchLanguage(int language) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String temp;
    if (language == 0) {
      temp = 'Kiswahili';
    } else if (language == 1) {
      temp = 'Dholuo';
    } else {
      temp = 'English';
    }
    await prefs.setString('selectedLanguage', temp);
    setState(() {
      _currentLanguage = temp;
    });

  }

  Widget languageButton(String language, int index) {
    bool isSelected = languages[languageIndex] == language;

    return ElevatedButton(
      onPressed: () {
        _switchLanguage(index);
        setState(() {
          languageIndex = index;
          overrideIndex = true;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.grey : null,
      ),
      child: Text(language),
    );
  }


Widget buildContentCard(IconData summaryIcon, String titleKey, String contentKey) {
  String translatedTitle = widget.methodDetails?[titleKey]?[_currentLanguage] ?? '';
  String content = widget.methodDetails?[contentKey]?[_currentLanguage] ?? 'No information available';

  // Check if a title is provided, if not, adjust layout accordingly.
  bool hasTitle = translatedTitle.isNotEmpty;

  return Container(
    margin: EdgeInsets.only(bottom: 10),
    padding: EdgeInsets.only(right: 20.0, top: 10.0, bottom:10.0),
    // padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: MaraColors.purple,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(summaryIcon, size: 60, color: Colors.white),
        SizedBox(width: 10),
        Expanded(
          child: hasTitle
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    translatedTitle,
                    style: TextStyle(fontFamily: 'Roboto', color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    content,
                    style: TextStyle(fontFamily: 'Roboto', color: Colors.white, fontSize: 22.0),
                  ),
                ],
              )
            : Text(
                content,
                style: TextStyle(fontFamily: 'Roboto', color: Colors.white, fontSize: 22.0),
              ),
        ),
      ],
    ),
  );
}




}
