import 'package:flutter/material.dart';
import 'package:mara_app/icons/mara_icons_icons.dart';
import 'package:mara_app/video.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pattern_page.dart';

class BleedingPage extends StatefulWidget {
  const BleedingPage({Key? key}) : super(key: key);

  @override
  State<BleedingPage> createState() => _BleedingPageState();
}

class _BleedingPageState extends State<BleedingPage> {
  
  Widget methodContent = Text('DUMMY');
  Widget video1 = VideoWidget(videoAsset: 'videoAudio/videos/funnyCat.mp4', title:'Video 1 Language Not Selected');

  bool overrideIndex = false;
  // Widget methodContent = updateMethodContent();
  int methodIndex = 2; // Index of the selected icon button, 0 for default
  int languageIndex = 2; // similar indexing for language
  final languages = ["Kiswahili", "Dholuo", "English"];

  String _currentLanguage = 'English';
  @override
  void initState() {
    super.initState();
    _loadCurrentLanguage();
  }

  Future<void> _loadCurrentLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _currentLanguage = prefs.getString('selectedLanguage') ?? 'English';
    });
    if (_currentLanguage.contains('English')) {
      languageIndex= 2;
    } else if (_currentLanguage.contains('Dholuo')) {
      languageIndex = 1;
    } else {
      languageIndex = 0;
    }
  }

  final Map<String, String> titleTranslations = {
    "English": "Period changes EXPLAINED", 
    "Kiswahili": "Mabadiliko ya hedhi IMEELEZWA", 
    "Dholuo": "Lokruok e chwer mar remb dwe OLER"
  };

  final Map<String, List<String>> contentDescriptionMap = {
    "Kiswahili": [
      "Mabadiliko ya hedhi yako ni ya kawaida unapotumia implant, depo, tembe za kila siku, IUCD, au E-pills. Njia hizi zote isipokuwa IUCD zina homoni ndani yake, ambazo zina athari kwenye siku zako za hedhi wakati unatumia mbinu hizo. Mabadiliko haya yatakoma ukiacha kutumia mbinu. IUCD haina homoni, lakini iko ndani ya tumbo la uzazi au uterasi ambayo inaweza kusababisha hedhi nzito au ya uchungu. Mabadiliko haya ya kutokwa na damu hayana uhusiano wowote na uwezo wako wa kupata ujauzito katika siku zijazo.",
      "Mabadiliko ya hedhi yako ni ya kawaida unapotumia implant, depo, tembe za kila siku, IUCD, au E-pills. Njia hizi zote isipokuwa IUCD zina homoni ndani yake, ambazo zina athari kwenye siku zako za hedhi wakati unatumia mbinu hizo. Mabadiliko haya yatakoma ukiacha kutumia mbinu. IUCD haina homoni, lakini iko ndani ya tumbo la uzazi au uterasi ambayo inaweza kusababisha hedhi nzito au ya uchungu. Mabadiliko haya ya kutokwa na damu hayana uhusiano wowote na uwezo wako wa kupata ujauzito katika siku zijazo.",
      "Mabadiliko ya hedhi yako ni ya kawaida unapotumia implant, depo, tembe za kila siku, IUCD, au E-pills. Njia hizi zote isipokuwa IUCD zina homoni ndani yake, ambazo zina athari kwenye siku zako za hedhi wakati unatumia mbinu hizo. Mabadiliko haya yatakoma ukiacha kutumia mbinu. IUCD haina homoni, lakini iko ndani ya tumbo la uzazi au uterasi ambayo inaweza kusababisha hedhi nzito au ya uchungu. Mabadiliko haya ya kutokwa na damu hayana uhusiano wowote na uwezo wako wa kupata ujauzito katika siku zijazo.",
      "Mabadiliko ya hedhi yako ni ya kawaida unapotumia implant, depo, tembe za kila siku, IUCD, au E-pills. Njia hizi zote isipokuwa IUCD zina homoni ndani yake, ambazo zina athari kwenye siku zako za hedhi wakati unatumia mbinu hizo. Mabadiliko haya yatakoma ukiacha kutumia mbinu. IUCD haina homoni, lakini iko ndani ya tumbo la uzazi au uterasi ambayo inaweza kusababisha hedhi nzito au ya uchungu. Mabadiliko haya ya kutokwa na damu hayana uhusiano wowote na uwezo wako wa kupata ujauzito katika siku zijazo.",
      "Mabadiliko ya hedhi yako ni ya kawaida unapotumia implant, depo, tembe za kila siku, IUCD, au E-pills. Njia hizi zote isipokuwa IUCD zina homoni ndani yake, ambazo zina athari kwenye siku zako za hedhi wakati unatumia mbinu hizo. Mabadiliko haya yatakoma ukiacha kutumia mbinu. IUCD haina homoni, lakini iko ndani ya tumbo la uzazi au uterasi ambayo inaweza kusababisha hedhi nzito au ya uchungu. Mabadiliko haya ya kutokwa na damu hayana uhusiano wowote na uwezo wako wa kupata ujauzito katika siku zijazo.",
      "Mabadiliko ya hedhi yako ni ya kawaida unapotumia implant, depo, tembe za kila siku, IUCD, au E-pills. Njia hizi zote isipokuwa IUCD zina homoni ndani yake, ambazo zina athari kwenye siku zako za hedhi wakati unatumia mbinu hizo. Mabadiliko haya yatakoma ukiacha kutumia mbinu. IUCD haina homoni, lakini iko ndani ya tumbo la uzazi au uterasi ambayo inaweza kusababisha hedhi nzito au ya uchungu. Mabadiliko haya ya kutokwa na damu hayana uhusiano wowote na uwezo wako wa kupata ujauzito katika siku zijazo.",
      "Mabadiliko ya hedhi yako ni ya kawaida unapotumia implant, depo, tembe za kila siku, IUCD, au E-pills. Njia hizi zote isipokuwa IUCD zina homoni ndani yake, ambazo zina athari kwenye siku zako za hedhi wakati unatumia mbinu hizo. Mabadiliko haya yatakoma ukiacha kutumia mbinu. IUCD haina homoni, lakini iko ndani ya tumbo la uzazi au uterasi ambayo inaweza kusababisha hedhi nzito au ya uchungu. Mabadiliko haya ya kutokwa na damu hayana uhusiano wowote na uwezo wako wa kupata ujauzito katika siku zijazo.",
    ],
    "Dholuo": [
      "Lokruok e chwer mar remb dwe en gima ni kare ekinde ma itiyo gi Implant, Depo, daily pills, IUCD, kata E-pills. Yoregi te maka mana IUCD nigi homons kuomgi, makelo chachruok e rembi mar dwe ekinde ma itiyo gi yoregi. Lokruokgi biro rumo ka iweyo tiyo gi yoregi. IUCD onge gi homons, to en ei ofuko mar nyuol ma nyalo kelochwer mang'eny kata rem mar dwe. lokruok e chwer mar dwe gi ONGE gi tudruok moro amora gi nyaloni mar mako ich e ndalo mabiro",
      "Lokruok e chwer mar remb dwe en gima ni kare ekinde ma itiyo gi Implant, Depo, daily pills, IUCD, kata E-pills. Yoregi te maka mana IUCD nigi homons kuomgi, makelo chachruok e rembi mar dwe ekinde ma itiyo gi yoregi. Lokruokgi biro rumo ka iweyo tiyo gi yoregi. IUCD onge gi homons, to en ei ofuko mar nyuol ma nyalo kelochwer mang'eny kata rem mar dwe. lokruok e chwer mar dwe gi ONGE gi tudruok moro amora gi nyaloni mar mako ich e ndalo mabiro",
      "Lokruok e chwer mar remb dwe en gima ni kare ekinde ma itiyo gi Implant, Depo, daily pills, IUCD, kata E-pills. Yoregi te maka mana IUCD nigi homons kuomgi, makelo chachruok e rembi mar dwe ekinde ma itiyo gi yoregi. Lokruokgi biro rumo ka iweyo tiyo gi yoregi. IUCD onge gi homons, to en ei ofuko mar nyuol ma nyalo kelochwer mang'eny kata rem mar dwe. lokruok e chwer mar dwe gi ONGE gi tudruok moro amora gi nyaloni mar mako ich e ndalo mabiro",
      "Lokruok e chwer mar remb dwe en gima ni kare ekinde ma itiyo gi Implant, Depo, daily pills, IUCD, kata E-pills. Yoregi te maka mana IUCD nigi homons kuomgi, makelo chachruok e rembi mar dwe ekinde ma itiyo gi yoregi. Lokruokgi biro rumo ka iweyo tiyo gi yoregi. IUCD onge gi homons, to en ei ofuko mar nyuol ma nyalo kelochwer mang'eny kata rem mar dwe. lokruok e chwer mar dwe gi ONGE gi tudruok moro amora gi nyaloni mar mako ich e ndalo mabiro",
      "Lokruok e chwer mar remb dwe en gima ni kare ekinde ma itiyo gi Implant, Depo, daily pills, IUCD, kata E-pills. Yoregi te maka mana IUCD nigi homons kuomgi, makelo chachruok e rembi mar dwe ekinde ma itiyo gi yoregi. Lokruokgi biro rumo ka iweyo tiyo gi yoregi. IUCD onge gi homons, to en ei ofuko mar nyuol ma nyalo kelochwer mang'eny kata rem mar dwe. lokruok e chwer mar dwe gi ONGE gi tudruok moro amora gi nyaloni mar mako ich e ndalo mabiro",
      "Lokruok e chwer mar remb dwe en gima ni kare ekinde ma itiyo gi Implant, Depo, daily pills, IUCD, kata E-pills. Yoregi te maka mana IUCD nigi homons kuomgi, makelo chachruok e rembi mar dwe ekinde ma itiyo gi yoregi. Lokruokgi biro rumo ka iweyo tiyo gi yoregi. IUCD onge gi homons, to en ei ofuko mar nyuol ma nyalo kelochwer mang'eny kata rem mar dwe. lokruok e chwer mar dwe gi ONGE gi tudruok moro amora gi nyaloni mar mako ich e ndalo mabiro",
      "Lokruok e chwer mar remb dwe en gima ni kare ekinde ma itiyo gi Implant, Depo, daily pills, IUCD, kata E-pills. Yoregi te maka mana IUCD nigi homons kuomgi, makelo chachruok e rembi mar dwe ekinde ma itiyo gi yoregi. Lokruokgi biro rumo ka iweyo tiyo gi yoregi. IUCD onge gi homons, to en ei ofuko mar nyuol ma nyalo kelochwer mang'eny kata rem mar dwe. lokruok e chwer mar dwe gi ONGE gi tudruok moro amora gi nyaloni mar mako ich e ndalo mabiro"
    ],
    "English": [
      "Changes to your periods are normal when you are using the implant, depo, daily pills, IUCD, or E-pills. All of these methods except the IUCD have hormones in them, which have effects on your periods while you are using the method. These changes will stop if you stop using the method. The IUCD does not have hormones, but is inside the womb or uterus which can lead to heavier or crampier periods. These bleeding changes have NOTHING to do with your ability to get pregnant in the future.",
      "Changes to your periods are normal when you are using the implant, depo, daily pills, IUCD, or E-pills. All of these methods except the IUCD have hormones in them, which have effects on your periods while you are using the method. These changes will stop if you stop using the method. The IUCD does not have hormones, but is inside the womb or uterus which can lead to heavier or crampier periods. These bleeding changes have NOTHING to do with your ability to get pregnant in the future.",
      "Changes to your periods are normal when you are using the implant, depo, daily pills, IUCD, or E-pills. All of these methods except the IUCD have hormones in them, which have effects on your periods while you are using the method. These changes will stop if you stop using the method. The IUCD does not have hormones, but is inside the womb or uterus which can lead to heavier or crampier periods. These bleeding changes have NOTHING to do with your ability to get pregnant in the future.",
      "Changes to your periods are normal when you are using the implant, depo, daily pills, IUCD, or E-pills. All of these methods except the IUCD have hormones in them, which have effects on your periods while you are using the method. These changes will stop if you stop using the method. The IUCD does not have hormones, but is inside the womb or uterus which can lead to heavier or crampier periods. These bleeding changes have NOTHING to do with your ability to get pregnant in the future.",
      "Changes to your periods are normal when you are using the implant, depo, daily pills, IUCD, or E-pills. All of these methods except the IUCD have hormones in them, which have effects on your periods while you are using the method. These changes will stop if you stop using the method. The IUCD does not have hormones, but is inside the womb or uterus which can lead to heavier or crampier periods. These bleeding changes have NOTHING to do with your ability to get pregnant in the future.",
      "Changes to your periods are normal when you are using the implant, depo, daily pills, IUCD, or E-pills. All of these methods except the IUCD have hormones in them, which have effects on your periods while you are using the method. These changes will stop if you stop using the method. The IUCD does not have hormones, but is inside the womb or uterus which can lead to heavier or crampier periods. These bleeding changes have NOTHING to do with your ability to get pregnant in the future.",
      "Changes to your periods are normal when you are using the implant, depo, daily pills, IUCD, or E-pills. All of these methods except the IUCD have hormones in them, which have effects on your periods while you are using the method. These changes will stop if you stop using the method. The IUCD does not have hormones, but is inside the womb or uterus which can lead to heavier or crampier periods. These bleeding changes have NOTHING to do with your ability to get pregnant in the future."
    ],
  };

  final double _aspectRatio = 16 / 10;

  @override
  Widget build(BuildContext context) {
    final int? routeArgumentIndex =
    ModalRoute.of(context)?.settings.arguments as int?;

  

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

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Center(child: Text(titleTranslations[languages[languageIndex]] ?? "Title not found")),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(availableHeight * 0.05),
          child: Container(
            // height: availableHeight * 0.1,
              child: Container(
                // padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2.0), // Adjust the padding as needed
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            languageIndex = 0;
                            overrideIndex = true;
                            updateMethodContent();
                            _switchLanguage(0);
                            //  video1 = getVideoContent1();
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: languageIndex == 0 ? Colors.grey : null,
                        ),
                        child: Text('Kiswahili'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0), // Adjust the padding as needed
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            languageIndex = 1;
                            overrideIndex = true;
                            updateMethodContent();
                            _switchLanguage(1);
                            // video1 = getVideoContent1();
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: languageIndex == 1 ? Colors.grey : null,
                        ),
                        child: Text('Dholuo'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0), // Adjust the padding as needed
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            languageIndex = 2;
                            overrideIndex = true;
                            updateMethodContent();
                            _switchLanguage(2);
                            // video1 = getVideoContent1();
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: languageIndex == 2 ? Colors.grey : null,
                        ),
                        child: Text('English'),
                      ),
                    ),
                  ],
                ),
              )),
          // preferredSize: Size.fromHeight(75),
        ),
        // actions: <Widget>[
        //
        // ]
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          
          Container(
            alignment: Alignment.center,
            // height: availableHeight * 0.15,
            // width: boxWidth,
            // padding: EdgeInsets.symmetric(horizontal: 0.1*boxWidth),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // SizedBox(width: 5),
                  buildIconButton(MaraIcons.syringe, "Injection (depo)", 3),
                  // SizedBox(width: 5),
                  buildIconButton(MaraIcons.contraceptive_implant, "Implant", 4),
                  // SizedBox(width: 5),
                  buildIconButton(MaraIcons.iud, "IUCD (coil)", 5),
                  // SizedBox(width: 5),
                  buildIconButton(MaraIcons.double_pills, "Emergency pill (E-pill, P2)", 6),
                  buildIconButton(MaraIcons.birth_control_pills, "Pills (daily pills)", 2),
                ],
              ),
            ),
          ),

          SizedBox(height: 15.0),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Icon(Icons.lightbulb_outline, color: Colors.amber, size: 24.0),
                SizedBox(width: 10.0),
                Expanded(
                  child: Text(
                    contentDescriptionMap[languages[languageIndex]]![methodIndex],
                    style: TextStyle(fontSize: 16.0, color: Colors.black),
                  ),
                ),
                
              ],
            ),
          ),
          
        ),
        ],
      ),
    );
  }
  Widget buildIconButton(IconData iconData, String caption, int index) {
    bool isSelected = index == methodIndex;

    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(
                iconData,
                size: isSelected ? 60 : 60,
                color: isSelected ? Colors.black : Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  methodIndex = index;
                  updateMethodContent();
                });
              },
              color: isSelected ? Colors.black : Colors.transparent,
              iconSize: isSelected ? 60 : 60,
              padding: EdgeInsets.all(10),
              splashRadius: 40,
              splashColor: Colors.grey.withOpacity(0.5),
              highlightColor: Colors.transparent,
            ),
            SizedBox(height: 5),
            Container (
                width: 100,
                child: Text(
                  caption,
                  softWrap: true, // Wrap text to the next line if needed
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: isSelected ? Colors.black : Colors.grey,
                  ),
                )
            )
          ],
        ),
      ],
    );
  }

  void _switchLanguage(int language) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String temp;
    if (language == 0 ) {
      temp =  'Kiswahili';
    } else if (language == 1) {
      temp = 'Dholuo';
    } else {
      temp =  'English';
    }
    await prefs.setString('selectedLanguage', temp);
    setState(()  { 
      _currentLanguage = temp;
    });
  }

  Widget updateMethodContent() {
    return Text(
      contentDescriptionMap[languages[languageIndex]]![methodIndex],
      style: TextStyle(
        fontSize: 20.0,
        color: Colors.black,
      )
    );
  }
}
