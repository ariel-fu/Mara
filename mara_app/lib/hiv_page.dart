import 'package:flutter/material.dart';
import 'package:mara_app/icons/mara_icons_icons.dart';
import 'video.dart';

class HIVPage extends StatefulWidget {
  const HIVPage({Key? key}) : super(key: key);

  @override
  State<HIVPage> createState() => _HIVPageState();
}

class _HIVPageState extends State<HIVPage> {
  Widget methodContent = Text('DUMMY');
  int methodIndex = 0; // Index of the selected icon button, 0 for default
  int languageIndex = 0; // similar indexing for language
  final languages = ["Kiswahili", "Dholuo", "English"];
  bool overrideIndex = false;

  final double _aspectRatio = 16 / 10;

  final Map<String, List<String>> contentDescriptionMap1 = {
    "Kiswahili": [
      "Kutumia kondomu kila wakati unapojamiiana kutasaidia kuzuia Virusi Vya Ukimwi na maambukizo mengine kama vile warts, klamidia, gonorrhea na kaswende. Kama unavyojua, kondomu pia husaidia kuzuia mimba! Ikiwa kondomu itapasuka, unaweza kwenda kliniki haraka iwezekanavyo lakini ndani ya siku 3 kuomba dawa za kuzuia Virusi Vya Ukimwi (PEP).",
      "Kutumia kondomu kila wakati unapojamiiana kutasaidia kuzuia Virusi Vya Ukimwi na maambukizo mengine kama vile warts, klamidia, gonorrhea na kaswende. Kama unavyojua, kondomu pia husaidia kuzuia mimba! Ikiwa kondomu itapasuka, unaweza kwenda kliniki haraka iwezekanavyo lakini ndani ya siku 3 kuomba dawa za kuzuia Virusi Vya Ukimwi (PEP).",
      "Kutumia kondomu kila wakati unapojamiiana kutasaidia kuzuia Virusi Vya Ukimwi na maambukizo mengine kama vile warts, klamidia, gonorrhea na kaswende. Kama unavyojua, kondomu pia husaidia kuzuia mimba! Ikiwa kondomu itapasuka, unaweza kwenda kliniki haraka iwezekanavyo lakini ndani ya siku 3 kuomba dawa za kuzuia Virusi Vya Ukimwi (PEP).",
      "Kutumia kondomu kila wakati unapojamiiana kutasaidia kuzuia Virusi Vya Ukimwi na maambukizo mengine kama vile warts, klamidia, gonorrhea na kaswende. Kama unavyojua, kondomu pia husaidia kuzuia mimba! Ikiwa kondomu itapasuka, unaweza kwenda kliniki haraka iwezekanavyo lakini ndani ya siku 3 kuomba dawa za kuzuia Virusi Vya Ukimwi (PEP).",
      "Kutumia kondomu kila wakati unapojamiiana kutasaidia kuzuia Virusi Vya Ukimwi na maambukizo mengine kama vile warts, klamidia, gonorrhea na kaswende. Kama unavyojua, kondomu pia husaidia kuzuia mimba! Ikiwa kondomu itapasuka, unaweza kwenda kliniki haraka iwezekanavyo lakini ndani ya siku 3 kuomba dawa za kuzuia Virusi Vya Ukimwi (PEP).",
      "Kutumia kondomu kila wakati unapojamiiana kutasaidia kuzuia Virusi Vya Ukimwi na maambukizo mengine kama vile warts, klamidia, gonorrhea na kaswende. Kama unavyojua, kondomu pia husaidia kuzuia mimba! Ikiwa kondomu itapasuka, unaweza kwenda kliniki haraka iwezekanavyo lakini ndani ya siku 3 kuomba dawa za kuzuia Virusi Vya Ukimwi (PEP).",
      "Kutumia kondomu kila wakati unapojamiiana kutasaidia kuzuia Virusi Vya Ukimwi na maambukizo mengine kama vile warts, klamidia, gonorrhea na kaswende. Kama unavyojua, kondomu pia husaidia kuzuia mimba! Ikiwa kondomu itapasuka, unaweza kwenda kliniki haraka iwezekanavyo lakini ndani ya siku 3 kuomba dawa za kuzuia Virusi Vya Ukimwi (PEP).",
    ],
    "Dholuo": [
      "Tiyo gi rabo yunga kinde duto ma ibedo e achiel biro konyi geng'o kute mag ayaki kod tuoche mamoko kaka warts, chlamydia, gonorrhea, kod syphilis. Kaka ing'eyo, rabo yunga bende konyo e geng'o ich! Ka rabo yunga obwasore, inyalo dhi e klinik mapiyo kaka nyalore to ekind ndalo 3 mondo ikwa yedhe mag geng'o kute mag ayaki [PEP]",
      "Tiyo gi rabo yunga kinde duto ma ibedo e achiel biro konyi geng'o kute mag ayaki kod tuoche mamoko kaka warts, chlamydia, gonorrhea, kod syphilis. Kaka ing'eyo, rabo yunga bende konyo e geng'o ich! Ka rabo yunga obwasore, inyalo dhi e klinik mapiyo kaka nyalore to ekind ndalo 3 mondo ikwa yedhe mag geng'o kute mag ayaki [PEP]",
      "Tiyo gi rabo yunga kinde duto ma ibedo e achiel biro konyi geng'o kute mag ayaki kod tuoche mamoko kaka warts, chlamydia, gonorrhea, kod syphilis. Kaka ing'eyo, rabo yunga bende konyo e geng'o ich! Ka rabo yunga obwasore, inyalo dhi e klinik mapiyo kaka nyalore to ekind ndalo 3 mondo ikwa yedhe mag geng'o kute mag ayaki [PEP]",
      "Tiyo gi rabo yunga kinde duto ma ibedo e achiel biro konyi geng'o kute mag ayaki kod tuoche mamoko kaka warts, chlamydia, gonorrhea, kod syphilis. Kaka ing'eyo, rabo yunga bende konyo e geng'o ich! Ka rabo yunga obwasore, inyalo dhi e klinik mapiyo kaka nyalore to ekind ndalo 3 mondo ikwa yedhe mag geng'o kute mag ayaki [PEP]",
      "Tiyo gi rabo yunga kinde duto ma ibedo e achiel biro konyi geng'o kute mag ayaki kod tuoche mamoko kaka warts, chlamydia, gonorrhea, kod syphilis. Kaka ing'eyo, rabo yunga bende konyo e geng'o ich! Ka rabo yunga obwasore, inyalo dhi e klinik mapiyo kaka nyalore to ekind ndalo 3 mondo ikwa yedhe mag geng'o kute mag ayaki [PEP]",
      "Tiyo gi rabo yunga kinde duto ma ibedo e achiel biro konyi geng'o kute mag ayaki kod tuoche mamoko kaka warts, chlamydia, gonorrhea, kod syphilis. Kaka ing'eyo, rabo yunga bende konyo e geng'o ich! Ka rabo yunga obwasore, inyalo dhi e klinik mapiyo kaka nyalore to ekind ndalo 3 mondo ikwa yedhe mag geng'o kute mag ayaki [PEP]",
      "Tiyo gi rabo yunga kinde duto ma ibedo e achiel biro konyi geng'o kute mag ayaki kod tuoche mamoko kaka warts, chlamydia, gonorrhea, kod syphilis. Kaka ing'eyo, rabo yunga bende konyo e geng'o ich! Ka rabo yunga obwasore, inyalo dhi e klinik mapiyo kaka nyalore to ekind ndalo 3 mondo ikwa yedhe mag geng'o kute mag ayaki [PEP]",
    ],
    "English": [
      "Using a condom every time you have sex will help prevent HIV and other infections like warts, chlamydia, gonorrhea, and syphilis. As you know, condoms also help to prevent pregnancy! If a condom breaks, you can go to the clinic as soon as possible but within 3 days to ask for medications to prevent HIV (PEP).",
      "Using a condom every time you have sex will help prevent HIV and other infections like warts, chlamydia, gonorrhea, and syphilis. As you know, condoms also help to prevent pregnancy! If a condom breaks, you can go to the clinic as soon as possible but within 3 days to ask for medications to prevent HIV (PEP).",
      "Using a condom every time you have sex will help prevent HIV and other infections like warts, chlamydia, gonorrhea, and syphilis. As you know, condoms also help to prevent pregnancy! If a condom breaks, you can go to the clinic as soon as possible but within 3 days to ask for medications to prevent HIV (PEP).",
      "Using a condom every time you have sex will help prevent HIV and other infections like warts, chlamydia, gonorrhea, and syphilis. As you know, condoms also help to prevent pregnancy! If a condom breaks, you can go to the clinic as soon as possible but within 3 days to ask for medications to prevent HIV (PEP).",
      "Using a condom every time you have sex will help prevent HIV and other infections like warts, chlamydia, gonorrhea, and syphilis. As you know, condoms also help to prevent pregnancy! If a condom breaks, you can go to the clinic as soon as possible but within 3 days to ask for medications to prevent HIV (PEP).",
      "Using a condom every time you have sex will help prevent HIV and other infections like warts, chlamydia, gonorrhea, and syphilis. As you know, condoms also help to prevent pregnancy! If a condom breaks, you can go to the clinic as soon as possible but within 3 days to ask for medications to prevent HIV (PEP).",
      "Using a condom every time you have sex will help prevent HIV and other infections like warts, chlamydia, gonorrhea, and syphilis. As you know, condoms also help to prevent pregnancy! If a condom breaks, you can go to the clinic as soon as possible but within 3 days to ask for medications to prevent HIV (PEP).",
    ],
  };

  final Map<String, List<String>> contentDescriptionMap2 = {
    "Kiswahili": [
      "PrEP ni kidonge cha kila siku unachotumia kuzuia VVU. Inafanya kazi tu ikiwa unainywa, kama vile vidonge vya kila siku vya kuzuia mimba. Unaweza kuipata kwenye kliniki nyingi na kwenye maduka ya dawa. Hili ni chaguo bora kwa watu ambao hawawezi kutumia kondomu na wapenzi wao au kama wanataka kupata mimba. Haizuii maambukizo mengine ingawa, kama vile warts, chlamydia, gonorrhea, na kaswende.",
      "PrEP ni kidonge cha kila siku unachotumia kuzuia VVU. Inafanya kazi tu ikiwa unainywa, kama vile vidonge vya kila siku vya kuzuia mimba. Unaweza kuipata kwenye kliniki nyingi na kwenye maduka ya dawa. Hili ni chaguo bora kwa watu ambao hawawezi kutumia kondomu na wapenzi wao au kama wanataka kupata mimba. Haizuii maambukizo mengine ingawa, kama vile warts, chlamydia, gonorrhea, na kaswende.",
      "PrEP ni kidonge cha kila siku unachotumia kuzuia VVU. Inafanya kazi tu ikiwa unainywa, kama vile vidonge vya kila siku vya kuzuia mimba. Unaweza kuipata kwenye kliniki nyingi na kwenye maduka ya dawa. Hili ni chaguo bora kwa watu ambao hawawezi kutumia kondomu na wapenzi wao au kama wanataka kupata mimba. Haizuii maambukizo mengine ingawa, kama vile warts, chlamydia, gonorrhea, na kaswende.",
      "PrEP ni kidonge cha kila siku unachotumia kuzuia VVU. Inafanya kazi tu ikiwa unainywa, kama vile vidonge vya kila siku vya kuzuia mimba. Unaweza kuipata kwenye kliniki nyingi na kwenye maduka ya dawa. Hili ni chaguo bora kwa watu ambao hawawezi kutumia kondomu na wapenzi wao au kama wanataka kupata mimba. Haizuii maambukizo mengine ingawa, kama vile warts, chlamydia, gonorrhea, na kaswende.",
      "PrEP ni kidonge cha kila siku unachotumia kuzuia VVU. Inafanya kazi tu ikiwa unainywa, kama vile vidonge vya kila siku vya kuzuia mimba. Unaweza kuipata kwenye kliniki nyingi na kwenye maduka ya dawa. Hili ni chaguo bora kwa watu ambao hawawezi kutumia kondomu na wapenzi wao au kama wanataka kupata mimba. Haizuii maambukizo mengine ingawa, kama vile warts, chlamydia, gonorrhea, na kaswende.",
      "PrEP ni kidonge cha kila siku unachotumia kuzuia VVU. Inafanya kazi tu ikiwa unainywa, kama vile vidonge vya kila siku vya kuzuia mimba. Unaweza kuipata kwenye kliniki nyingi na kwenye maduka ya dawa. Hili ni chaguo bora kwa watu ambao hawawezi kutumia kondomu na wapenzi wao au kama wanataka kupata mimba. Haizuii maambukizo mengine ingawa, kama vile warts, chlamydia, gonorrhea, na kaswende.",
      "PrEP ni kidonge cha kila siku unachotumia kuzuia VVU. Inafanya kazi tu ikiwa unainywa, kama vile vidonge vya kila siku vya kuzuia mimba. Unaweza kuipata kwenye kliniki nyingi na kwenye maduka ya dawa. Hili ni chaguo bora kwa watu ambao hawawezi kutumia kondomu na wapenzi wao au kama wanataka kupata mimba. Haizuii maambukizo mengine ingawa, kama vile warts, chlamydia, gonorrhea, na kaswende.",
    ],
    "Dholuo": [
      "PrEP en pill ma imuonyo pile ka pile mondo ogeng kute mag ayaki. Otiyo mana ka imuonye, odwaro chalo gi pills ma pile ka pile mag geng'o ich. Inyalo yude e ng'eny kliniks kod ute yath moko. Ma en yo maber ahinya ne jogo ma ok nyal tiyo gi rabo yunga gi joheragi kata ka gidwaro mako ich. Ok ogeng tuoche mamoko, kaka warts, chlamydia, gonorrhea kod syphilis.",
      "PrEP en pill ma imuonyo pile ka pile mondo ogeng kute mag ayaki. Otiyo mana ka imuonye, odwaro chalo gi pills ma pile ka pile mag geng'o ich. Inyalo yude e ng'eny kliniks kod ute yath moko. Ma en yo maber ahinya ne jogo ma ok nyal tiyo gi rabo yunga gi joheragi kata ka gidwaro mako ich. Ok ogeng tuoche mamoko, kaka warts, chlamydia, gonorrhea kod syphilis.",
      "PrEP en pill ma imuonyo pile ka pile mondo ogeng kute mag ayaki. Otiyo mana ka imuonye, odwaro chalo gi pills ma pile ka pile mag geng'o ich. Inyalo yude e ng'eny kliniks kod ute yath moko. Ma en yo maber ahinya ne jogo ma ok nyal tiyo gi rabo yunga gi joheragi kata ka gidwaro mako ich. Ok ogeng tuoche mamoko, kaka warts, chlamydia, gonorrhea kod syphilis.",
      "PrEP en pill ma imuonyo pile ka pile mondo ogeng kute mag ayaki. Otiyo mana ka imuonye, odwaro chalo gi pills ma pile ka pile mag geng'o ich. Inyalo yude e ng'eny kliniks kod ute yath moko. Ma en yo maber ahinya ne jogo ma ok nyal tiyo gi rabo yunga gi joheragi kata ka gidwaro mako ich. Ok ogeng tuoche mamoko, kaka warts, chlamydia, gonorrhea kod syphilis.",
      "PrEP en pill ma imuonyo pile ka pile mondo ogeng kute mag ayaki. Otiyo mana ka imuonye, odwaro chalo gi pills ma pile ka pile mag geng'o ich. Inyalo yude e ng'eny kliniks kod ute yath moko. Ma en yo maber ahinya ne jogo ma ok nyal tiyo gi rabo yunga gi joheragi kata ka gidwaro mako ich. Ok ogeng tuoche mamoko, kaka warts, chlamydia, gonorrhea kod syphilis.",
      "PrEP en pill ma imuonyo pile ka pile mondo ogeng kute mag ayaki. Otiyo mana ka imuonye, odwaro chalo gi pills ma pile ka pile mag geng'o ich. Inyalo yude e ng'eny kliniks kod ute yath moko. Ma en yo maber ahinya ne jogo ma ok nyal tiyo gi rabo yunga gi joheragi kata ka gidwaro mako ich. Ok ogeng tuoche mamoko, kaka warts, chlamydia, gonorrhea kod syphilis.",
      "PrEP en pill ma imuonyo pile ka pile mondo ogeng kute mag ayaki. Otiyo mana ka imuonye, odwaro chalo gi pills ma pile ka pile mag geng'o ich. Inyalo yude e ng'eny kliniks kod ute yath moko. Ma en yo maber ahinya ne jogo ma ok nyal tiyo gi rabo yunga gi joheragi kata ka gidwaro mako ich. Ok ogeng tuoche mamoko, kaka warts, chlamydia, gonorrhea kod syphilis.",
    ],
    "English": [
      "PrEP is a daily pill you take to prevent HIV. It only works if you take it, sort of like the daily pills for pregnancy prevention. You can get it at most clinics and at some pharmacies. This is a great option for people who can't use condoms with their partners or if they want to get pregnant. It doesn't prevent the other infections though, like warts, chlamydia, gonorrhea, and syphilis.",
      "PrEP is a daily pill you take to prevent HIV. It only works if you take it, sort of like the daily pills for pregnancy prevention. You can get it at most clinics and at some pharmacies. This is a great option for people who can't use condoms with their partners or if they want to get pregnant. It doesn't prevent the other infections though, like warts, chlamydia, gonorrhea, and syphilis.",
      "PrEP is a daily pill you take to prevent HIV. It only works if you take it, sort of like the daily pills for pregnancy prevention. You can get it at most clinics and at some pharmacies. This is a great option for people who can't use condoms with their partners or if they want to get pregnant. It doesn't prevent the other infections though, like warts, chlamydia, gonorrhea, and syphilis.",
      "PrEP is a daily pill you take to prevent HIV. It only works if you take it, sort of like the daily pills for pregnancy prevention. You can get it at most clinics and at some pharmacies. This is a great option for people who can't use condoms with their partners or if they want to get pregnant. It doesn't prevent the other infections though, like warts, chlamydia, gonorrhea, and syphilis.",
      "PrEP is a daily pill you take to prevent HIV. It only works if you take it, sort of like the daily pills for pregnancy prevention. You can get it at most clinics and at some pharmacies. This is a great option for people who can't use condoms with their partners or if they want to get pregnant. It doesn't prevent the other infections though, like warts, chlamydia, gonorrhea, and syphilis.",
      "PrEP is a daily pill you take to prevent HIV. It only works if you take it, sort of like the daily pills for pregnancy prevention. You can get it at most clinics and at some pharmacies. This is a great option for people who can't use condoms with their partners or if they want to get pregnant. It doesn't prevent the other infections though, like warts, chlamydia, gonorrhea, and syphilis.",
      "PrEP is a daily pill you take to prevent HIV. It only works if you take it, sort of like the daily pills for pregnancy prevention. You can get it at most clinics and at some pharmacies. This is a great option for people who can't use condoms with their partners or if they want to get pregnant. It doesn't prevent the other infections though, like warts, chlamydia, gonorrhea, and syphilis.",
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

    // double screenWidth = MediaQuery.of(context).size.width;
    // double boxWidth = screenWidth * 0.85;

    // double screenHeight = MediaQuery.of(context).size.height;
    // double availableHeight = screenHeight;
    // double boxHeight = availableHeight * 0.25;

  double containerWidth = MediaQuery.of(context).size.width;
  double containerHeight = MediaQuery.of(context).size.height;
  if (containerHeight / containerWidth > _aspectRatio) {
    containerHeight = containerWidth * _aspectRatio;
  } else {
    containerWidth = containerHeight / _aspectRatio;
  }
  double boxWidth = containerWidth;
  double boxHeight = containerHeight;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
          // onPressed: () {
          //   Navigator.of(context).pushNamed('/time');
          // },
        ),
        title: Text('Preventing HIV and STDs...and pregnancy'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("You have the power to protect yourself!"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:[
            SizedBox(width:60, height:60, child:ImageIcon(AssetImage('assets/misc-icons/disease.png'))),
            SizedBox(width:60, height:60, child:ImageIcon(AssetImage('assets/misc-icons/spermcontraception.png'))),
          ]),
          Container(
              height: containerHeight * 0.1,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          languageIndex = 0;
                          overrideIndex = true;
                          updateMethodContent1();
                          updateMethodContent2();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                        languageIndex == 0 ? Colors.grey : null,
                      ),
                      child: Text('Kiswahili'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          languageIndex = 1;
                          overrideIndex = true;
                          updateMethodContent1();
                          updateMethodContent2();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                        languageIndex == 1 ? Colors.grey : null,
                      ),
                      child: Text('Dholuo'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          languageIndex = 2;
                          overrideIndex = true;
                          updateMethodContent1();
                          updateMethodContent2();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                        languageIndex == 2 ? Colors.grey : null,
                      ),
                      child: Text('English'),
                    ),
                  ],
                ),
              )),
          SizedBox(height: 20.0),
          Container (
            height: containerHeight * 0.6, // Adjust as needed
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: boxWidth,
                  height: boxHeight * 0.25,
                  decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                  child: Column(
                    children:[
                      Text('Male and Female Condoms'),
                      updateMethodContent1(),
                      SizedBox(width:15, height:15, child:Image.asset('assets/misc-icons/twopeople.png')),
                    ],
                  ),
                ),
                Container(
                  width: boxWidth,
                  height: boxHeight * 0.25,
                  decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                  child: Column(
                    children: [
                      Text('PrEP'),
                      updateMethodContent2(),
                      SizedBox(width:15, height:15, child:Image.asset('assets/misc-icons/preppills.png')),
                    ],
                  ),
                ),                 
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget buildSecondaryContext() {
  //   return Text("some text here " +
  //       contentDescriptionMap[languages[languageIndex]]![methodIndex]);
  // }

  Widget buildIconButton(IconData iconData, int index) {
    bool isSelected = index == methodIndex;

    return Stack(
      alignment: Alignment.center,
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
              updateMethodContent1();
              updateMethodContent2();
            });
          },
          color: isSelected ? Colors.black : Colors.transparent,
          iconSize: isSelected ? 60 : 60,
          padding: EdgeInsets.all(10),
          splashRadius: 40,
          splashColor: Colors.grey.withOpacity(0.5),
          highlightColor: Colors.transparent,
        ),
      ],
    );
  }

  Widget updateMethodContent1() {
    return Text(
      contentDescriptionMap1[languages[languageIndex]]![methodIndex],
      style: TextStyle(
        fontSize: 20.0,
        color: Colors.black,
      )
    );
  }

  Widget updateMethodContent2() {
    return Text(
      contentDescriptionMap2[languages[languageIndex]]![methodIndex],
      style: TextStyle(
        fontSize: 20.0,
        color: Colors.black,
      )
    );
  }
}
