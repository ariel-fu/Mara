import 'package:flutter/material.dart';
import 'package:mara_app/home2.dart';
import 'package:mara_app/icons/mara_icons_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'video.dart';
import 'package:mara_app/design/colors.dart';

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
      languageIndex = 2;
    } else if (_currentLanguage.contains('Dholuo')) {
      languageIndex = 1;
    } else {
      languageIndex = 0;
    }
  }

  final Map<String, String> titleContentMap = {
    "English": "Preventing HIV and STIs",
    "Kiswahili": "Kuzuia Virusi Vya Ukimwi na magonjwa ya zinaa",
    "Dholuo": "Geng'o kute mag ayaki kod Nyae"
  };

  final Map<String, String> subtitleContentMap = {
    "English": "You have the power to protect yourself!",
    "Kiswahili": "Una uwezo wa kujikinga!",
    "Dholuo": "In gi teko mar geng'ri iwuon!"
  };

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

  @override
  Widget build(BuildContext context) {
    HomePage2.stiVisited = true;

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
        ),
        title: Center(
            child: Text(
                titleContentMap[languages[languageIndex]] ?? "Title not found",
                style: TextStyle(
                    fontFamily: 'PoetsenOne',
                    color: MaraColors.purple,
                    fontSize: 36.0))),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(subtitleContentMap[languages[languageIndex]]!,
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: MaraColors.magentaPurple,
                  fontSize: 30.0)),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            SizedBox(
                width: 100,
                height: 100,
                child: ImageIcon(AssetImage('assets/misc-icons/disease.png'),
                    color: MaraColors.magentaPurple)),
            SizedBox(
                width: 100,
                height: 100,
                child: ImageIcon(
                    AssetImage('assets/misc-icons/spermcontraception.png'),
                    color: MaraColors.magentaPurple)),
          ]),
          Container(
              height: containerHeight * 0.1,
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
              )),
          SizedBox(height: 10.0),
          Container(
            height: containerHeight * 0.6, // Adjust as needed
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                contentBox('Male and Female Condoms', updateMethodContent1()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                        width: 150,
                        height: 150,
                        child: Image.asset('assets/options_images/2.png')),
                    SizedBox(
                        width: 120,
                        height: 120,
                        child: Image.asset('assets/misc-icons/twopeople.png',
                            color: MaraColors.magentaPurple)),
                    SizedBox(
                        width: 150,
                        height: 150,
                        child: Image.asset('assets/options_images/5.png')),
                  ],
                ),
                contentBox('PrEP', updateMethodContent2()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                        width: 150,
                        height: 150,
                        child: Image.asset('assets/misc-icons/prep_hands.png')),
                    SizedBox(
                        width: 120,
                        height: 120,
                        child: Image.asset('assets/misc-icons/preppills.png',
                            color: MaraColors.magentaPurple)),
                    SizedBox(
                        width: 150,
                        height: 150,
                        child: Image.asset('assets/misc-icons/prep_text.png')),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget languageButton(String language, int index) {
    bool isSelected = index == languageIndex;
    return ElevatedButton(
      onPressed: () {
        setState(() {
          languageIndex = index;
          overrideIndex = true;
          updateMethodContent1();
          updateMethodContent2();
          if (index == 0) {
            _switchLanguage('Kiswahili');
          } else if (index == 1) {
            _switchLanguage('Dholuo');
          } else {
            _switchLanguage('English');
          }
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.grey : null,
      ),
      child: Text(language),
    );
  }

  void _switchLanguage(String language) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedLanguage', language);
    setState(() {
      _currentLanguage = language;
    });
  }

  Widget contentBox(String title, String content) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: MaraColors.purple,
                    ),
                  ),
                  Text(
                    content,
                    style: TextStyle(fontFamily: 'Roboto', fontSize: 16.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String updateMethodContent1() {
    return contentDescriptionMap1[languages[languageIndex]]![methodIndex];
  }

  String updateMethodContent2() {
    return contentDescriptionMap2[languages[languageIndex]]![methodIndex];
  }
}
