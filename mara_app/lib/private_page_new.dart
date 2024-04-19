import 'package:flutter/material.dart';
import 'package:mara_app/icons/mara_icons_icons.dart';
import 'package:mara_app/video.dart';

class PrivatePage extends StatefulWidget {
  const PrivatePage({Key? key}) : super(key: key);

  @override
  State<PrivatePage> createState() => _PrivatePageState();
}

class _PrivatePageState extends State<PrivatePage> {
  bool overrideIndex = false;
  // Widget methodContent = updateMethodContent();
  int methodIndex = 0; // Index of the selected icon button, 0 for default
  int languageIndex = 2; // similar indexing for language
  final languages = ["Kiswahili", "Dholuo", "English"];

  final Map<String, List<String>> videoContentMap = {
    "Kiswahili": [
      "videoAudio/videos/funnyCat.mp4",
      "videoAudio/videos/peer/peer3KS.mp4", // method 1 - condom
      "videoAudio/videos/peer/peer3KS.mp4",
      "videoAudio/videos/peer/peer3KS.mp4",
      "videoAudio/videos/peer/peer3KS.mp4",
      "videoAudio/videos/peer/peer3KS.mp4",
      "videoAudio/videos/peer/peer3KS.mp4",
      "videoAudio/videos/peer/peer3KS.mp4",
    ],
    "Dholuo": [
      "videoAudio/videos/peer/peer3DL.mp4",
      "videoAudio/videos/peer/peer3DL.mp4",
      "videoAudio/videos/peer/peer3DL.mp4",
      "videoAudio/videos/peer/peer3DL.mp4",
      "videoAudio/videos/peer/peer3DL.mp4",
      "videoAudio/videos/peer/peer3DL.mp4",
      "videoAudio/videos/peer/peer3DL.mp4",
    ],
    "English": [
      "videoAudio/videos/peer/peer3E.mp4",
      "videoAudio/videos/peer/peer3E.mp4",
      "videoAudio/videos/peer/peer3E.mp4",
      "videoAudio/videos/peer/peer3E.mp4",
      "videoAudio/videos/peer/peer3E.mp4",
      "videoAudio/videos/peer/peer3E.mp4",
      "videoAudio/videos/peer/peer3E.mp4",
    ],
  };

  final Map<String, String> titleMap = {
    "Kiswahili": "Je, ninaweza kuiweka kwa usiri?",
    "Dholuo": "Bende anyalo kete mopondo?",
    "English": "Can I keep it private?"
  };

  final Map<String, String> subtitleTranslations = {
    "Kiswahili": "Baadhi ya watu wanataka kuweka njia yao ya matumizi ya faragha kutoka kwa washirika, wazazi na wengine. Gonga njia zilizo hapa chini ili kupata maelezo zaidi kuhusu faragha.",
    "Dholuo": "Jomoko dwaroga tiyo gi yore mag komo nyuol e yo mopondo ma joheragi, jonyuol kod jomamoko ok ong'eyo. Mul piny ebwo yore mag komo nyuol mondo ipuonjri matut ewi tiyo kodgi mopondo",
    "English": "Some people want to keep their method use private from partners, parents, and others. Tap on the below methods to learn more about privacy."
  };

  final Map<String, List<String>> contentDescriptionMap = {
    "Kiswahili": [
      "Ni wazi...hutaweza kuweka matumizi ya kondomu kuwa siri kutoka kwa mpenzi wako wakati yeye ndiye anayevaa kondomu! Hata unapotaka kutumia kondomu, inaweza kuwa vigumu ikiwa mpenzi wako hataki. Unaweza kuweka njia hii kuwa ya faragha kutoka kwa watu wengine, isipokuwa waipate nyumbani kwako au kwenye mkoba wako.",
      "Kondomu za kike labda zitatambuliwa na mpenzi wako, kwa kuwa zinaonekana kwa nje, mara nyingi unaweza kuzihisi wakati wa ngono, na zinaweza kutoa sauti wakati wa ngono. Unaweza kuweka njia hii kuwa ya faragha kutoka kwa watu wengine, isipokuwa waipate nyumbani kwako au kwenye mkoba wako.",
      "Inawezekana kuweka tembe za kila siku kuwa za faragha kutoka kwa watu ambao hawakai na wewe, lakini mpenzi au mtu mwingine anaweza kuzipata nyumbani kwako au kwenye mkoba wako. Unahitaji kumeza kidonge kila siku, kwa hivyo ukienda shule ya bweni au kusafiri mahali pengine unahitaji kuja na vidonge.",
      "Sindano (depo) ni moja ya njia za kibinafsi, kwani mara tu unapochomwa, hakuna mtu anayeweza kuona au kujua njia hiyo iko kwenye mwili wako na hauitaji kupeleka chochote nyumbani. Utahitaji kupata sindano kila baada ya miezi 3 kwenye kliniki au duka la dawa, ambayo inaweza kuwa ngumu kuelezea kwa wengine.",
      "Baadhi ya watu wanaona kuwa Implant ni cha faragha sana, lakini inawezekana kwamba wenzi au wengine wanaweza kuhisi Implant wakati wa kugusa mkono wako wa juu, au wanaweza kuona bandeji au kovu dogo baada ya kuwekewa.",
      "IUCD (coil) ni mojawapo ya njia za faragha, kwani huwezi kuiona au kujua iko baada ya kuwekwa kwenye tumbo la uzazi au uterasi. Ni nyuzi tu ziko nje ya tumbo la uzazi, na zimefichwa ndani ya uke. Washirika wengi hawawezi kuhisi nyuzi ikiwa hawajui IUCD iko. Wapenzi wengine wanaweza kulalamika kwa kubana au kuchomwa wakati wa ngono.",
      "E-pill ni rahisi kuweka faragha, isipokuwa kwa ukweli kwamba una kwenda na kununua. Unaweza kuinywa mara tu baada ya kuinunua na hakuna mtu anayeweza kujua kuwa umeitumia, kwa kuwa ni kidonge kimoja au mbili zilizochukuliwa kwa wakati mmoja na hakuna chochote unachopaswa kuleta nyumbani."
    ],
    "Dholuo": [
      "En gima ong'ere... ok obi nyalo tiyo gi rabo yunga e yo mopondo majaherani ok ong'eyo nikech en ema orwako rabo yunga! Kata ka idwaro tiyo gi rabo yunga, nyalo bedo matek ka jaherano ok dwar. Inyalo tiyo gi rabo yunga ma ji ok ong'eyo, mak mana ka giyude ei odi kata ei kibetini.",
      "Kondom mar joma mine ibiro ne gi jaherani, nikech gin gik ma inyalone gioko, inyako winjonjgi ekinde terruok, kendo ginyalo goyo koko ekinde terruok. Inyalo tiyo gi yorni e yo ma opondo ma jok ma moko ok ong'eyo, mak mana ka ng'ato oyudogi e odi kata e kibetini.",
      "En gima nyalore mondo iti gi pills ma pile ka pile mopondo ma joma ok odak kodi ok ng'e, to jaherani kata ng'at machielo nyalo yudogi ei ot kata e kibetini. Dwarore ni imuony pill achiel pile ka pile, koro ka idhi e boarding school kata idhi e wuoth kamachielo nyaka iting pills.",
      "Sindan [Depo] en achiel kuom yore mag komo nyuol ma opondo, nikech kosechuoyi, onge ng'ama nyalo nene kata ng'eyo ni yath nitie e dendi kendo onge gima dwarore ni idhi godo dala. Biro dwarore ni ochuoyi sindan ban dweche 3 ka dweche 3 e klinik kata e od yath, ma nyako bedoni matek lero ne jomoko. ",
      "Jomoko nenoga ni Implant en yor komo nyuol ma opondo, to en gima nyalore ni johera kata jomoko nyalo winjo implant ka gimulo malo mar badi, kata nyalo neno bandej kata mbala matin bang koseket implant.",
      "IUCD [koil] en achiel kuom yore mag komo nyuol mopondo, nikech ok inyal nene kata ng'eyo ni en tie bang ka osesoye e ofuko mar nyuol. Mana tonde ema ni oko mar ofuko nyuol, kendo gipondo ei duong miyo. Ng'eny johera ok nyal winjo tonde ka gikia ni IUCD nitie eiye kanyo, Johera moko nyalo winjo ka nitie dhuno kata chuopo ekinde ma ubedo e achiel.",
      "E-pill yot mondo iti godo e yo mopondo, makmana e adiera ni nyaka idhi ing'iewe. Inyalo muonye bang nyiewe sano sano kendo onge ng'ama nyalo ng'eyo ni ne itiyo kode, nikech en adila achiel kata ariyo ma imuonyo dichiel kanyakla kendo onge gima nyaka iting' idhi godo dala."
    ],
    "English": [
      "Obviously...you won't be able to keep condom use private from your partner when he is the one who wears the condom! Even when you want to use a condom, it can be difficult if your partner doesn't want to. You can keep this method private from others, unless they find one at your home or in your purse.",
      "Female condoms will probably be noticed by your partner, since they are visible on the outside, you can often feel them during sex, and they can make a sound during sex. You can keep this method private from others, unless they find one at your home or in your purse.  ",
      "It is possible to keep daily pills private from people who do not stay with you, but a partner or someone else could find them at your home or in your purse. You need to take a pill every day, so if you go boarding school or travel somewhere else you need to bring pills with you. ",
      "The injection (depo) is one of the most private methods, as once you are injected, no one can see or know the method is in your body and you do not need to take anything home. You will need to get an injection every 3 months at a clinic or pharmacy though, which could be hard to explain to others. ",
      "Some people find the implant very private, but it is possible that partners or others could feel the implant when touching your upper arm, or could see the bandage or small scar after the implant is placed. ",
      "The IUCD (coil) is one of the most private methods, as you cannot see it or know it is there after it is placed in the womb or uterus. Only the strings are outside of the womb, and they are hidden inside the vagina. Most partners cannot feel the strings if they do not know the IUCD is there. Some partners might complain of pinching or poking during sex. ",
      "The E-pill is easy to keep private, except for the fact that you have to go and buy it. You can take it right after you buy it and no one can know that you used it, since it is one or two pills taken at the same time and there is nothing you have to bring home."
    ],
  };

  final Map<String, List<String>> videoTitleMap = {
    "Kiswahili": [
      "Video: Mwenzio anaelezea"
    ],
    "Dholuo": [
      "Video: Mbasni lero "
    ],
    "English": [
     "Video: a peer explains"
    ],
  };

  List<Map<String, dynamic>> iconButtons = [
  {'icon': MaraIcons.condom, 'label': "Condom", 'index': 0},
  {'icon': MaraIcons.female_condom, 'label': "Female Condom", 'index': 1},
  {'icon': MaraIcons.birth_control_pills, 'label': "Pills (daily pills)", 'index': 2},
  {'icon': MaraIcons.syringe, 'label': "Injection (depo)", 'index': 3},
  {'icon': MaraIcons.contraceptive_implant, 'label': "Implant", 'index': 4},
  {'icon': MaraIcons.iud, 'label': "IUCD (coil)", 'index': 5},
  {'icon': MaraIcons.double_pills, 'label': "Emergency pill (E-pill, P2)", 'index': 6}
];
  final double _aspectRatio = 16 / 10;

  @override
  Widget build(BuildContext context) {
    final int? routeArgumentIndex =
    ModalRoute.of(context)?.settings.arguments as int?;

    // Update languageIndex if a valid value is provided from the route
    // if (routeArgumentIndex != null &&
    //     routeArgumentIndex >= 0 &&
    //     routeArgumentIndex < languages.length &&
    //     !overrideIndex) {
    //   languageIndex = routeArgumentIndex;
    // }

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
        title: Center(child: Text(titleMap[languages[languageIndex]]!)),
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
          // SizedBox(height: availableHeight*0.01),
          Container (
              width: boxWidth*0.8,
              child: Padding (
                  padding: const EdgeInsets.only(top: 5.0, bottom: 20.0), // Adjust the padding as needed,
                  child: Text(
                    subtitleTranslations[languages[languageIndex]]!,
                    softWrap: true, // Wrap text to the next line if needed
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0
                    ),
                  )
              )
              
          ),
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
                  buildIconButton(MaraIcons.condom, "Condom", 0),
                  // SizedBox(width: 5),
                  buildIconButton(MaraIcons.female_condom, "Female Condom", 1),
                  // SizedBox(width: 5),
                  buildIconButton(MaraIcons.birth_control_pills, "Pills (daily pills)", 2),
                  // SizedBox(width: 5),
                  buildIconButton(MaraIcons.syringe, "Injection (depo)", 3),
                  // SizedBox(width: 5),
                  buildIconButton(MaraIcons.contraceptive_implant, "Implant", 4),
                  // SizedBox(width: 5),
                  buildIconButton(MaraIcons.iud, "IUCD (coil)", 5),
                  // SizedBox(width: 5),
                  buildIconButton(MaraIcons.double_pills, "Emergency pill (E-pill, P2)", 6),
                ],
              ),
            ),
          ),
          SizedBox(height: 15.0),
          Flex(
  direction: Axis.vertical,
  children: [
    
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
                Icon(Icons.lightbulb_outline, color: Colors.amber, size: 24.0),
                SizedBox(width: 10.0),
                Expanded( // Changed from Flexible to Expanded for better text handling
                  child: Text(
                    contentDescriptionMap[languages[languageIndex]]![methodIndex],
                    style: TextStyle(
                      fontSize: 16.0, // Updated font size for consistency
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
  ],
),

          SizedBox(height: 15.0),
          SizedBox(
            width: boxWidth*0.8,
            height: availableHeight * 0.6 * 0.5,
            child: Center(
              child: getVideoContent(),
            ),
          )
        ],
      ),
    );
  }


Widget methodSelectionRow() {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: buildIconButtons(),
    ),
  );
}

Widget buildIconButton(IconData iconData, String caption, int index) {
  bool isSelected = index == methodIndex;
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4.0),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(
            iconData,
            size: isSelected ? 60 : 40, // Adjusted size here
            color: isSelected ? Colors.black : Colors.grey,
          ),
          onPressed: () {
            setState(() {
              methodIndex = index;
              updateMethodContent();
            });
          },
          splashRadius: isSelected ? 40 : 20,
          splashColor: Colors.grey.withOpacity(0.5),
          highlightColor: Colors.transparent,
        ),
        SizedBox(height: 5),
        Container(
          width: 100,
          child: Text(
            caption,
            softWrap: true,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected ? Colors.black : Colors.grey,
            ),
          ),
        ),
      ],
    ),
  );
}



Widget getVideoContent() {
    String asset = videoContentMap[languages[languageIndex]]![methodIndex];
    String title = videoTitleMap[languages[languageIndex]]![0];
    return VideoWidget(videoAsset: asset, title: title);
  }

  List<Widget> buildIconButtons() {
  return iconButtons.map((button) {
    bool isSelected = button['index'] == methodIndex;
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(
                button['icon'],
                size: isSelected ? 60 : 50,
                color: isSelected ? Colors.black : Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  methodIndex = button['index'];
                  // Update other stateful data here if necessary
                });
              },
              splashRadius: 40,
              splashColor: Colors.grey.withOpacity(0.5),
              highlightColor: Colors.transparent,
            ),
            SizedBox(height: 5),
            Text(
              button['label'],
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isSelected ? Colors.black : Colors.grey,
              ),
            )
          ],
        ),
      ],
    );
  }).toList();
  
}

  

  Widget languageButton(String language) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          languageIndex = languages.indexOf(language);
          overrideIndex = true;
          updateMethodContent();
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: languages[languageIndex] == language ? Colors.grey : null,
      ),
      child: Text(language),
    );
  }

  // Widget subtitleSection() {
  //   return Container(
  //     alignment: Alignment.center,
  //     padding: EdgeInsets.symmetric(vertical: 10.0),
  //     child: Text(
  //       subtitleTranslations[languages[languageIndex]] ?? "Translation not found",
  //       style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
  //       textAlign: TextAlign.center,
  //     ),
  //   );
  // }

  Widget subtitleSection() {
  return Container(
    alignment: Alignment.center,
    padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0), // Adjust padding as needed
    decoration: BoxDecoration(
      color: Colors.grey.shade200, // Use the desired background color
      borderRadius: BorderRadius.circular(10.0), // Adjust border radius as needed
    ),
    child: Text(
      subtitleTranslations[languages[languageIndex]] ?? "Translation not found",
      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    ),
  );
}

  // Widget contentArea() {
  //   return Padding(
  //     padding: EdgeInsets.all(10.0),
  //     child: Container(
  //       padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
  //       decoration: BoxDecoration(
  //         color: Colors.grey.shade200,
  //         borderRadius: BorderRadius.circular(10),
  //         border: Border.all(color: Colors.grey),
  //       ),
  //       child: Row(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Icon(Icons.lightbulb_outline, color: Colors.amber, size: 24.0),
  //           SizedBox(width: 10.0),
  //           Flexible(
  //             child: Text(
  //               contentDescriptionMap[languages[languageIndex]]![methodIndex],
  //               style: TextStyle(fontSize: 16.0),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget contentArea() {
  return Padding(
    padding: EdgeInsets.all(10.0),
    child: SingleChildScrollView( // Add SingleChildScrollView here
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
            Flexible(
              child: Text(
                contentDescriptionMap[languages[languageIndex]]![methodIndex],
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    ),
  );
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
  
