import 'package:flutter/material.dart';
import 'package:mara_app/icons/mara_icons_icons.dart';
import 'package:mara_app/hiv_page.dart';

class TimePage extends StatefulWidget {
  const TimePage({Key? key}) : super(key: key);

  @override
  State<TimePage> createState() => _TimePageState();
}

class _TimePageState extends State<TimePage> {
  bool overrideIndex = false;
  // Widget methodContent = updateMethodContent();
  int methodIndex = 2; // Index of the selected icon button, 0 for default
  int languageIndex = 2; // similar indexing for language
  final languages = ["Kiswahili", "Dholuo", "English"];

  final Map<String, String> titleContentMap = {
    "Kiswahili": "Baadhi ya watu wanataka kuweka njia yao ya matumizi ya faragha kutoka kwa washirika, wazazi na wengine. Gonga njia zilizo hapa chini ili kupata maelezo zaidi kuhusu faragha.",
    "Dholuo": "Jomoko dwaroga tiyo gi yore mag komo nyuol e yo mopondo ma joheragi, jonyuol kod jomamoko ok ong'eyo. Mul piny ebwo yore mag komo nyuol mondo ipuonjri matut ewi tiyo kodgi mopondo",
    "English": "Some people want to keep their method use private from partners, parents, and others. Tap on the below methods to learn more about privacy."
  };

  final Map<String, List<String>> contentDescriptionMap = {
    "Kiswahili": [
      "Ili kuzuia mimba, unahitaji kutumia kondomu kila mara unapofanya ngono. Inaweza kuwa changamoto sana kutabiri siku zako salama, kwa hivyo kondomu zinahitajika kutumika kila wakati unapojamiiana ili kufanya kazi vizuri.",
      "Ili kuzuia mimba, unahitaji kutumia kondomu kila mara unapofanya ngono. Inaweza kuwa changamoto sana kutabiri siku zako salama, kwa hivyo kondomu zinahitajika kutumika kila wakati unapojamiiana ili kufanya kazi vizuri.",
      "Vidonge vya kila siku vinahitaji kuchukuliwa kila siku ili kuzuia mimba. Ukikosa vidonge, mwili wako unaweza kutoa yai, na unaweza kupata mimba. Inaweza kusaidia kumeza kidonge chako cha kila siku kama sehemu ya utaratibu, kama vile kabla ya kulala, au kabla ya kuanza siku yako asubuhi.",
      "Sindano (depo) hudumu kwa miezi 3. Ikiwa umechelewa kwa zaidi ya wiki 2 kwa picha yako inayofuata, unaweza kupata mimba, kwa hivyo ni vizuri kukaa kwenye ratiba ikiwa unataka kuzuia mimba!",
      "Implant hudumu kwa miaka 3 (Nexplanon) au miaka 5 (Jadelle), kulingana na aina gani unayopata. Ikiwa hupendi au unataka kupata mimba, unaweza kuiondoa wakati wowote unapotaka - huna kusubiri miaka 3-5! Kipandikizi kinaweza kuwa njia nzuri hata kwa mwaka mmoja au miwili tu.",
      "IUCD (coil) inafanya kazi hadi miaka 12! Watu wengi hawaihifadhi kwa muda mrefu hivyo, na wanaweza kuitumia kwa mwaka mmoja au miwili. Unaweza kuondoa IUCD wakati wowote unapotaka, ikiwa hupendi au unataka kupata mimba.",
      "E-pill (P2) haifanyi kazi kwa muda fulani, lakini inakusudiwa kupunguza uwezekano wa kupata mimba baada ya kufanya ngono. Usifikiri kwamba bado itafanya kazi ikiwa utafanya ngono tena siku moja au mbili baada ya kumeza E-pill...ni bora kutumia njia tofauti kama njia yako ya kawaida!"
    ],
    "Dholuo": [
      "Mondo igeng ich, dwarore ni mondo iti gi rabo yunga kinde duto ma ibedo e achiel. Onyalo bedo gima pek ng'eyo kinde ma ionge thuolo mar mako ich, koro rabo yunga onego tigodo kinde duto ma ibedo e achiel mondo oti maber.",
      "Mondo igeng ich, dwarore ni mondo iti gi rabo yunga kinde duto ma ibedo e achiel. Onyalo bedo gima pek ng'eyo kinde ma ionge thuolo mar mako ich, koro rabo yunga onego tigodo kinde duto ma ibedo e achiel mondo oti maber.",
      "Pills ma pile ka pile onego muony pile ka pile mondo ogeng ich. Ka ok imuonyo pills, dendi nyalo golo tong, kendo inyalo mako ich. Nyalo bedo gima konyo ka imuonyo pills pile ka pile kaka gino ma iketo e chenro, kaka kapok idhi e kitanda, kata kapok ichako odiechiengi gokinyi.",
      "Sindan [Depo] bet e del kuom dweche 3. Ka ileo gi jumbe 2 yudo sindan machielo, inyalo mako ich, koro ber mondo irit tarik mochiki e dok e sindan ka idwaro geng'o ich!",
      "Implant budho kuom higni 3 [Nexplanon] kata higni 5 [Jadelle], kaluwore e kido ma oketni. ka ok ihere kata idwaro mako ich, inyalo dhi mondo ogolni godo saa asaya ma idwaro - ok ochuno ni nyaka irit higni 3-5! Implant nyalo bedo yo maber ahinya kata mana e higa kata higni ariyo.",
      "IUCD [koil] tiyo nyaka higni 12! Ng'eny ji ok weye kanyo mang'eny kamano, kendo nyalo mana tiyo kode kuom higa kata higni ariyo. Inyalo golo IUCD saa asaya ma idwaro, ka ok idware kata idwaro mako ich.",
      "E-pill [P2] ok ti kuom kinde moko, to en mar duoko chien nyaloni mar mako ich bang bedo e achiel. Kik ipar ni podi odhi tiyo ka ibedo e achiel kendo odiechieng achiel kata ariyo bang muonyo E-pill... Ber mondo iti gi yo machielo kaka yori mapile mar geng'o ich!"
    ],
    "English": [
      "To prevent pregnancy, you need to use a condom every time you have sex. It can be very challenging to predict your safe days, so condoms need to be used every time you have sex in order to work well.",
      "To prevent pregnancy, you need to use a condom every time you have sex. It can be very challenging to predict your safe days, so condoms need to be used every time you have sex in order to work well.",
      "Daily pills need to be taken every day to prevent pregnancy. If you miss pills, your body might release an egg, and you could get pregnant. It can be helpful to take your daily pill as part of a routine, like right before you go to bed, or before you start your day in the morning.",
      "The injection (depo) lasts for 3 months. If you are more than 2 weeks late for your next shot, you can get pregnant, so it is good to stay on schedule if you want to prevent pregnancy!",
      "The implant lasts for 3 years (Nexplanon) or 5 years (Jadelle), depending on which type you get. If you don't like it or you want to get pregnant, you can have it removed whenever you want - you don't have to wait 3-5 years! The implant can be a great method even just for a year or two.",
      "The IUCD (coil) works for up to 12 years! Many people don't keep it in that long, and might just use it for a year or two. You can have the IUCD removed whenever you want, if you don't like it or want to get pregnant.",
      "The E-pill (P2) does not work for a particular length of time, but is meant to reduce the chance of pregnancy after having sex. Don't assume it is still going to work if you have sex again a day or two after taking the E-pill...it is better to use a different method as your regular method!"
    ],
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
        title: Center(child: Text('How long does the method work?')),
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
                    titleContentMap[languages[languageIndex]]!,
                    softWrap: true, // Wrap text to the next line if needed
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                      fontSize: 18.0
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
    Container(
      width: boxWidth * 0.9,
      height: boxHeight * 0.2,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(Icons.lightbulb_outline, color: Colors.amber),
          Center(
            child: SizedBox(
              width: boxWidth * 0.75,
              height: boxHeight * 0.5 * 0.3,
              child: Center(
                child: updateMethodContent(),
              ),
            ),
          ),
        ],
      ),
    ),
  ],
),
SizedBox(height: 15.0),
Container(
  width: boxWidth,
  height: boxHeight * 0.5 * 0.6 - 50,
  decoration: BoxDecoration(
    color: Colors.grey.shade200,
    borderRadius: BorderRadius.circular(8.0),
  ),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      ImageIcon(AssetImage('assets/noun_project/important.png')),
      Text(
        "ATTENTION ALL YOUNG WOMEN:  Male and female condoms are the ONLY family planning methods that also prevent HIV and other STIs! | " +
            contentDescriptionMap[languages[languageIndex]]![methodIndex],
      ),
      Text('CLICK BELOW TO LEARN MORE'),
      IconButton(
        icon: const ImageIcon(AssetImage('assets/noun_project/question.png')),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HIVPage()),
          );
        },
      ),
    ],
  ),
),

        ],
      ),  
    );

    Widget buildSecondaryContext() {
    return Text("ATTENTION ALL YOUNG WOMEN:  Male and female condoms are the ONLY family planning methods that also prevent HIV and other STIs! | " + 
      contentDescriptionMap[languages[languageIndex]]![methodIndex]);
  }}

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
