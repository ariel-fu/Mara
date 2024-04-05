import 'package:flutter/material.dart';
import 'package:mara_app/icons/mara_icons_icons.dart';
import 'video.dart';

class LearnMoreFertility extends StatefulWidget {
  const LearnMoreFertility({Key? key}) : super(key: key);

  @override
  State<LearnMoreFertility> createState() => _LearnMoreFertilityState();
}

class _LearnMoreFertilityState extends State<LearnMoreFertility> {
  Widget methodContent = Text('DUMMY');
  int methodIndex = 0; // Index of the selected icon button, 0 for default
  int languageIndex = 0; // Index for language
  final languages = ["Kiswahili", "Dholuo", "English"];
  bool overrideIndex = false; // Used to override language selection from route

  final Map<String, List<String>> contentDescriptionMap = {
    "Kiswahili": [
      "Kondomu haina athari kwenye mwili wako zaidi ya kuzuia mbegu za mpenzi wako kuingia ndani ya mwili wako. Ikiwa unatumia kondomu na uko tayari kupata mtoto, unaweza kuacha tu kuzitumia. Kumbuka, hata hivyo, kwamba ukiacha kutumia kondomu huwezi kulindwa dhidi ya Virusi Vya Ukimwi au magonjwa mengine ya zinaa.",
      "Kondomu haina athari kwenye mwili wako zaidi ya kuzuia mbegu za mpenzi wako kuingia ndani ya mwili wako. Ikiwa unatumia kondomu na uko tayari kupata mtoto, unaweza kuacha tu kuzitumia. Kumbuka, hata hivyo, kwamba ukiacha kutumia kondomu huwezi kulindwa dhidi ya Virusi Vya Ukimwi au magonjwa mengine ya zinaa.",
      "Siku chache baada ya kuacha dawa za kila siku, mwili wako utarudi kwenye kiwango chako cha kawaida cha uzazi. Hata kama hujawahi kupata mimba, au ikiwa unatumia vidonge kwa miaka mingi, haitakuwa vigumu zaidi kupata mimba baadaye kwa kutumia vidonge.", 
      "method 4 in Kiswahili", 
      "method 5 in Kiswahili", 
      "method 6 in Kiswahili", 
      "method 7 in Kiswahili", 
      
    ],
    "Dholuo": [
      "Rabo yunga onge gi rach moro amora e dendi kopogore gi geng'o pi nyodo mar jaherani donjo ei dendi. Ka itiyo gi rabo yunga kendo iyikori mar yudo nyathi, inyalo mana weyo tiyo kodgi. Ng'e gi pachi ni, ka iweyo tiyo gi rabo yunga ok ibi bedo ni igeng'ori kuom yudo kute mag ayaki kata nyae mamoko. ",
      "Rabo yunga onge gi rach moro amora e dendi kopogore gi geng'o pi nyodo mar jaherani donjo ei dendi. Ka itiyo gi rabo yunga kendo iyikori mar yudo nyathi, inyalo mana weyo tiyo kodgi. Ng'e gi pachi ni, ka iweyo tiyo gi rabo yunga ok ibi bedo ni igeng'ori kuom yudo kute mag ayaki kata nyae mamoko. ",
      "Ndalo machuok bang weyo muonyo pills mapile ka pile, dendi biro dok e nyaloni mar mako ich mapile. Kata ka pok ne imakoga ich, kata ka isetiyo gi pills kuom higni mang'eny, ok bi bedo matek mako ich e ndalo mabiro ka itiyo gi pills. ",
      "method 4 in Dholuo",
      "method 5 in Dholuo",
      "method 6 in Dholuo",
      "method 7 in Dholuo",
      // ... other methods in Dholuo
    ],
    "English": [
      "Condoms have no effect on your body other than to block your partner's sperm from going inside your body. If you use condoms and are ready to have a baby, you can just stop using them. Keep in mind, though, that if you stop using condoms you won't be protected from HIV or other STIs. ",
      "Condoms have no effect on your body other than to block your partner's sperm from going inside your body. If you use condoms and are ready to have a baby, you can just stop using them. Keep in mind, though, that if you stop using condoms you won't be protected from HIV or other STIs.",
      "A few days after stopping daily pills, your body will return to your normal level of fertility. Even if you have never had a pregnancy, or if use pills for many years, it will not be more difficult to get pregnant later using pills.",
      "method 4 in English",
      "method 5 in English",
      "method 6 in English",
      "method 7 in English",
      // ... other methods in English
    ],
  };

  @override
  Widget build(BuildContext context) {
    final int? routeArgumentIndex =
        ModalRoute.of(context)?.settings.arguments as int?;

    // Update languageIndex if a valid value is provided from the route
    if (routeArgumentIndex != null &&
        routeArgumentIndex >= 0 &&
        routeArgumentIndex < languages.length &&
        !overrideIndex) {
      languageIndex = routeArgumentIndex;
    }

    double screenWidth = MediaQuery.of(context).size.width;
    double boxWidth = screenWidth * 0.85;

    double screenHeight = MediaQuery.of(context).size.height;
    double availableHeight = screenHeight;
    double boxHeight = availableHeight * 0.25;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {
            Navigator.of(context).pushNamed('/home');
          },
        ),
        title: Text('What if I\'m ready to have a baby? '),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: availableHeight * 0.1,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  languageButton('Kiswahili', 0),
                  languageButton('Dholuo', 1),
                  languageButton('English', 2),
                ],
              ),
            ),
          ),
          SizedBox(height: 20.0),
          buildMethodSelectionRow(boxWidth),
          SizedBox(height: 20.0),
          buildContentArea(boxHeight, boxWidth),
        ],
      ),
    );
  }

  Widget languageButton(String language, int index) {
    bool isSelected = languageIndex == index;
    return ElevatedButton(
      onPressed: () {
        setState(() {
          languageIndex = index;
          overrideIndex = true;
          updateMethodContent();
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.grey : null,
      ),
      child: Text(language),
    );
  }

  Widget buildMethodSelectionRow(double boxWidth) {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height * 0.1,
      width: boxWidth,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildIconButton(MaraIcons.condom, 0),
            buildIconButton(MaraIcons.female_condom, 1),
            buildIconButton(MaraIcons.birth_control_pills, 2),
            buildIconButton(MaraIcons.syringe, 3),
            buildIconButton(MaraIcons.contraceptive_implant, 4),
            buildIconButton(MaraIcons.iud, 5),
            buildIconButton(MaraIcons.double_pills, 6),
          ],
        ),
      ),
    );
  }

  Widget buildIconButton(IconData iconData, int index) {
    bool isSelected = index == methodIndex;
    return IconButton(
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
    );
  }

  

  Widget buildContentArea(double boxHeight, double boxWidth) {
    return Padding(
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
            Icon(Icons.lightbulb_outline, color: Colors.amber, size: 24.0),
            SizedBox(width: 10.0),
            Expanded(
              child: Text(
                contentDescriptionMap[languages[languageIndex]]![methodIndex],
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  


  void updateMethodContent() {
    setState(() {
      methodContent = Text(
        contentDescriptionMap[languages[languageIndex]]![methodIndex],
        style: TextStyle(fontSize: 20.0, color: Colors.white),
      );
    });
  }
}

