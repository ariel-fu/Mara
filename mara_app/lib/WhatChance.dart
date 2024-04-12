import 'package:flutter/material.dart';
import 'package:mara_app/emergency.dart';
import 'package:mara_app/hiv_page.dart';
import 'package:mara_app/home2.dart';
import 'package:mara_app/icons/mara_icons_icons.dart';
import 'package:mara_app/time_page.dart';
import 'package:mara_app/whySomeMethodsBetter.dart';

class WhatChance extends StatefulWidget {
  const WhatChance({Key? key}) : super(key: key);

  @override
  State<WhatChance> createState() => _WhatChanceState();
}

class _WhatChanceState extends State<WhatChance> {
  bool overrideIndex = false;
  int methodIndex = 0; // Index of the selected icon button, 0 for default
  int languageIndex = 2; // similar indexing for language
  final languages = ["Kiswahili", "Dholuo", "English"];
  

  final Map<String, String> title = {
    "Kiswahili": "Je, nafasi yangu ya kupata mimba ni ipi?",
    "Dholuo": "Nyalona mar mako ich en ang'o?",
    "English": "What is my chance of getting pregnant?",
  };

  final Map<String, String> whyDo = {
    "Kiswahili": "KWA NINI baadhi ya mbinu za kupanga uzazi hufanya kazi vizuri zaidi kuliko zingine ili kuzuia mimba?",
    "Dholuo": "EN ANG'O MA OMIYO yore moko mag komo nyuol tiyoga maber mohingo moko e geng'o ich?",
    "English": "WHY do some methods work better than others to prevent pregnancy?",
  };

  final Map<String, String> heyThis = {
    "Kiswahili": "Hey! HII NI MUHIMU! Kondomu za kiume na za kike ndizo njia PEKEE za kupanga uzazi ambazo pia huzuia Virusi Vya Ukimwi na magonjwa mengine ya zinaa!",
    "Dholuo": "HEY! MA EN GIMA BER NG'EYO! Rabo yunga mar chuo gi mine e yore komo nyuol KENDE ma bende geng'o kute mag ayaki kod nyae mamoko!",
    "English": "HEY! THIS IS IMPORTANT! Male and female condoms are the ONLY family planning methods that also prevent HIV and other STIs!",
  };

  final Map<String, String> Epill = {
    "Kiswahili": "Jinsi E-pill inavyofanya kazi vizuri ili kuzuia mimba inategemea mambo mengi - ni muda gani unachukua baada ya ngono, na muda wa mzunguko wako wa kila mwezi. E-pill haijaundwa kutumiwa kama njia yako ya kawaida ya kila siku, na haifanyi kazi vizuri ikiwa unafanya ngono mara kwa mara.",
    "Dholuo": "Kaka E-pill tiyo maber e geng'o ich luwore gi gik mang'eny - kaka imuonye mapiyo marom nade bang bedo e achiel, kod kinde ma intie e sako ni mar dwe. E-pill ok olosi mondo oti godo kaka yori mapile mar geng'o ich kendo ok oti maber ka ibedo e achiel monuoyore ding'eny.",
    "English": "How well the E-pill works to prevent pregnancy depends on a lot of things - how soon you take it after sex, and the timing in your monthly cycle. The E-pill is not designed to be used as your regular daily method, and it is does not work well if you are having sex frequently.",
  };

  final Map<String, String> femaleCondom = {
    "Kiswahili": "Takriban wanawake 21 kati ya 100 wanaotumia kondomu za kike kwa mwaka mmoja watapata mimba.",
    "Dholuo": "Madirom mine 21 kuom 100 matiyo gi kondoms mar mine e higa biro mako ich.",
    "English": "About 21 out of 100 women using female condoms for a year will become pregnant."
  };

  final Map<String, String> maleCondom = {
    "Kiswahili": "Takriban wanawake 13 kati ya 100 wanaotumia kondomu za kiume kwa mwaka mmoja watapata mimba.",
    "Dholuo": "Madirom mine 13 kuom 100 matiyo gi kondoms mar chuo e higa biro mako ich.",
    "English": "About 13 out of 100 women using male condoms for a year will become pregnant.",
  };

  final Map<String, String> dailyPills = {
    "Kiswahili": "Takriban wanawake 7 kati ya 100 wanaotumia vidonge vya kila siku kwa mwaka watakuwa wajawazito.",
    "Dholuo": "Madirom mine 7 kuom 100 matiyo gi pills mapile ka pile e higa biro mako ich",
    "English": "About 7 out of 100 women using daily pills for a year will become pregnant.",
  };

  final Map<String, String> injection = {
    "Kiswahili": "Takriban wanawake 4 kati ya 100 wanaotumia sindano (depo) kwa mwaka watakuwa wajawazito.",
    "Dholuo": "madirom mine 4 kuom 100 matiyo gi sindan [Depo] e higa biro mako ich.",
    "English": "About 4 out of 100 women using the injection (depo) for a year will become pregnant.",
  };
  
  final Map<String, String> implant = {
    "Kiswahili": "Chini ya mwanamke 1 kati ya 100 wanaotumia implant kwa mwaka mmoja watapata ujauzito.",
    "Dholuo": "Matin ne miyo 1 kuom 100 matiyo gi Implant e higa biro mako ich.",
    "English": "Fewer than 1 in 100 women using the implant for a year will become pregnant.",
  };

  final Map<String, String> IUCD = {
    "Kiswahili": "Chini ya mwanamke 1 kati ya 100 wanaotumia IUCD (coil) kwa mwaka mmoja watapata mimba.",
    "Dholuo": "Matin ne miyo 1 kuom 100 matiyo gi IUCD [koil] e higa biro mako ich.",
    "English": "Fewer than 1 in 100 women using the IUCD (coil) for a year will become pregnant.",
  };

  final Map<String, String> EpillText = {
    "Kiswahili": "Pata maelezo zaidi kuhusu jinsi ya kumeza kidonge cha E kwa usalama",
    "Dholuo": "Ponjri matut ewi kaka inyalo muonyo E-pill eyo makare",
    "English": "Learn more about how to take the E-pill safely",
  };

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
        title: Center(child: Text(title[languages[languageIndex]]!)),
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
                            updateText();
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
                            updateText();
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
                            updateText();
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
                  padding: const EdgeInsets.only(top: 15.0, bottom: 0.0), // Adjust the padding as needed,
                  child: Text(
                    title[languages[languageIndex]]!,
                    softWrap: true, // Wrap text to the next line if needed
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                      fontSize: 24.0
                    ),
                  )
              )

          ),
          Container(
            alignment: Alignment.center,
            //  height: availableHeight * 0.199,
            //  width: boxWidth,
            //  padding: EdgeInsets.symmetric(horizontal: 0.08*boxWidth),
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
          //Divider(),
          SizedBox(height: 15.0),
          SizedBox(
            height: availableHeight * 0.45, // Adjust as needed
                child: Flex(
                crossAxisAlignment: CrossAxisAlignment.center,
                direction: Axis.vertical,
                children: [
                  Container(
                      width: boxWidth,
                      height: boxHeight*0.15,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Icon(Icons.lightbulb_outline, color: Colors.amber,),
                            Center(
                                child: Container(
                                  width: boxWidth * 0.9,
                                  height: availableHeight * 0.1,
                                    child: Center(
                                      child: updateText(),
                                  )                                  
                                )
                            )
                          ]
                      )
                  ),
                  //Divider(),
                  Container(
                    width: boxWidth,
                    height: availableHeight * 0.25,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(0, 255, 255, 255),
                        borderRadius: BorderRadius.circular(1.0),
                      ),
                    child: Center(
                      child: getPic(),
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            TextButton(onPressed: () { WhyDoPage(); }, 
            child:
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/chance_of_preg/search.png',
                  width: 40,
                  height: 40,
                ),
                SizedBox(width: 8),
                if (methodIndex != 6)
                Text(
                  whyDo[languages[languageIndex]]!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.0,
                  ),
                ),
                if (methodIndex == 6)
                Text(
                  EpillText[languages[languageIndex]]!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
            ),

            //Divider(),
            if (methodIndex == 0 || methodIndex == 1) 
            TextButton(onPressed: () { 
                if (methodIndex == 6) {
                  HIVPage();
                } else {
                  EmergencyPage();
                }
              }, 
            child:
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/chance_of_preg/exclaim.png',
                  width: 40,
                  height: 40,
                ),
                SizedBox(width: 8),
                Text(
                  heyThis[languages[languageIndex]]!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
            ),
            if (methodIndex == 0 || methodIndex == 1) 
            Divider()
        ],
      ),
    );
  }
  void WhyDoPage () {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => WhySomeMethodsBetter()),
  );
  }
  Widget getPic() {
    String imageNum = "assets/method_efficiency_pics/efficacy images_Page_$methodIndex.jpg";
    return Image.asset(
                imageNum,
                width: MediaQuery.of(context).size.width * 0.8,
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
                  updateText();
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

  Widget updateText() {
    String text;
  if (methodIndex == 0) {
    text = maleCondom[languages[languageIndex]]!;
  } else if (methodIndex == 1) {
    text = femaleCondom[languages[languageIndex]]!;
  } else if (methodIndex == 2) {
    text = dailyPills[languages[languageIndex]]!;
  } else if (methodIndex == 3) {
    text = injection[languages[languageIndex]]!;
  } else if (methodIndex == 4) {
    text = implant[languages[languageIndex]]!;
  } else if (methodIndex == 5) {
    text = IUCD[languages[languageIndex]]!;
  } else if (methodIndex == 6) {
    text = Epill[languages[languageIndex]]!;
  } else {
    text = "error";
  }

  return SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: Container(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 17.0,
          color: Colors.black,
        ),
      ),
    ),
  );
  }
}
