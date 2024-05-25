import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mara_app/icons/mara_icons_icons.dart';
import 'video.dart';

class EmergencyPage extends StatefulWidget {
  final String initialLanguage;
  EmergencyPage({Key? key, required this.initialLanguage}) : super(key: key);
  //const EmergencyPage({Key? key}) : super(key: key);


  @override
  // State<EmergencyPage> createState() => _EmergencyPageState();
  _EmergencyPageState createState() => _EmergencyPageState();
}

class _EmergencyPageState extends State<EmergencyPage> {
  //Widget methodContent = Text('DUMMY');
  Widget video1 = VideoWidget(videoAsset: 'videoAudio/videos/peer/peer3E.mp4', title:'Video 1 Language Not Selected');
  int methodIndex = 0; // Index of the selected icon button, 0 for default
  int languageIndex = 2; // similar indexing for language
  final languages = ["Kiswahili", "Dholuo", "English"];
  bool overrideIndex = false;
  late String _currentLanguage;

  @override
  void initState() {
    super.initState();
    _currentLanguage = widget.initialLanguage;
  }

  final double _aspectRatio = 16 / 10;

  final Map<String, String> titleContentMap = {
    "English": "It's an emergency!",
    "Kiswahili": "Ni ya dharura!",
    "Dholuo": "En gima imuonyo e resruok!"

  };

  final Map<String, String> subtitleContentMap = {
    "English": "All you need to know about taking the E-pill (P2).",
    "Kiswahili": "Unachohitaji kujua kuhusu kumeza E-pill (P2).",
    "Dholuo": "Gik moko te ma onego ing'e ewi muonyo E-pill [P2]"
  };

  final Map<String, Map<String, String>> _translations = {
    "content1": {
      "Kiswahili": "E-pill ni chaguo zuri ikiwa unafanya ngono bila kondomu, lakini ni bora kufikiria kama chaguo mbadala, sio kama njia kuu unayotumia kuzuia ujauzito.",
      "Dholuo": "E-pill en yo maber tiyo godo ka ibedo e achiel maonge rabo yunga, to ber mondo iti kode kaka yor resruok, ok kaka yori maduong ma itiyo godo e geng'o ich",
      "English": "The E-pill is a good option if you have sex without a condom, but it's best to think of it as a backup option, not as the main method you are using to prevent pregnancy."
    },
    "content2" :{
      "Kiswahili": "Muda ni muhimu kwa sababu muda gani unachukua baada ya kufanya ngono hufanya tofauti kubwa katika jinsi inavyofanya kazi vizuri kuzuia mimba. Chukua haraka iwezekanavyo, lakini ndani ya siku 5 za ngono. Watoa huduma wengine watakuambia siku 3. mapema ni bora!",
      "Dholuo": "Ng'iyo saa ma imuonye ber nikech mapiyo ma imuonye bang bedo e achiel biro kelo pogruok maduong e kaka otiyo maber e geng'o ich. Muonye mapiyo ahinya  kaka inyalo, to ekind ndalo 5 mar bedo e achiel. Jochiw thieth moko biro nyisi ndalo 3. Mapiyo mogik ber!",
      "English": "Timing is important because how soon you take it after sex makes a big difference in how well it works to prevent pregnancy. Take as soon as you can, but within 5 days of sex. Some providers will tell you 3 days. The sooner the better!"
    },

    "content3" :{
      "Kiswahili": "Hakuna kikomo kwa mara ngapi unaweza kumeza kidonge cha E-pill kwa mwezi, lakini kunaweza kusababisha athari kama vile kwa tumbo na mabadiliko ya hedhi yako ambayo yanaweza kuudhi. Pia, ni bei ghali!",
      "Dholuo": "Onge giko ne ndalo ma inyalo muonye E-pill e dwe, to nitie nyalruok ni obiro keloni rach motudore gi yath kaka ich makuot kod lokruok e chwer mar rembi mar dwe manyalo wang'o ich. Bende, en gima beche tek!",
      "English": "There is no limit to how many times you can take the E-pill in a month, but it will likely cause side effects like upset stomach and changes to your period that might be annoying. Also, it is expensive!"
    },

    "content4" :{
       "Kiswahili": "Je, unajua kwamba unaweza kuanza njia nyingine ya kuzuia mimba kwa wakati mmoja unapotumia E-pill?",
       "Dholuo": "Be ing'eyo ni inyalo tiyo gi yore mamoko mag geng'o mako ich sama itiyo gi E-pill?",
       "English": "Did you know that you can start another pregnancy prevention method at the same time as you take the E-pill?"
    },

    "content5" :{
      "Kiswahili": "Ikiwa ulifanya ngono bila kinga, E-pill ndiyo hatua bora zaidi ya kwanza, na unaweza kupata sindano, kuanzisha tembe, au kuwekewa kipandikizi mara tu unapotaka baada ya kumeza E-pill - hata siku hiyo hiyo! Ukianza kutumia njia na huna uhakika kama ulipata hedhi, fanya mtihani wa ujauzito takriban wiki 2 baada ya kutumia kidonge cha E, ili tu kuwa na uhakika.",
      "Dholuo": "Kapo ni ne inindo gi ng'ato maok iritoi maber, E-pill e okang' mokwongo maber moloyo, kendo inyalo yudo sindan, chako tiyo gi yedhe, kata tiyo gi implant mapiyo kaka idwaro bang' tiyo gi E-pill - ⁠kata mana e odiechieng'no! Kapo ni ichako tiyo gi yorni to ok ing'eyo kabe mano e kinde monego ichak tiyogo, tim nonro mar mako ich bang' jumbe 2 bang' tiyo gi E-pill, mana mondo ibed gadier.",
      "English": "If you had unprotected sex, the E-pill is the best first step, and you can get the injection, start pills, or have an implant inserted as soon as you want after taking the E-pill - even the same day! If you start a method and you aren’t sure if you got your period, take a pregnancy test about 2 weeks after the E-pill, just to be sure."
    }
  };

  String videoAsset1 = 'videoAudio/videos/peer/peer3E.mp4';
  String videoTitle1 = 'A Peer Perspective Language Not Selected';
  // String videoAsset2 = 'videoAudio/videos/funnyCat2.mp4';
  // String videoTitle2 = 'Video 2 Language Not Selected';

  final Map<String, Map<String, Map<String, String>>> languageToVideo = {
    'video1': {
      '0': { // Language code 0
        'video': 'videoAudio/videos/peer/peer3KS.mp4',
        'text': 'Video: Mwenzio anaelezea',
      },
      '1': { // Language code 1
        'video': 'videoAudio/videos/peer/peer3DL.mp4',
        'text': 'Video: Mbasni lero',
      },
      '2': { // Language code 2
        'video': 'videoAudio/videos/peer/peer3E.mp4',
        'text': 'Video: a peer explains',
      },
    },
    'video2': {
      '0': {
        'video': 'videoAudio/videos/chimes.mp4',
        'text': 'Kiswahili Video #2',
      },
      '1': {
        'video': 'videoAudio/videos/funnyCat.mp4',
        'text': 'Dholuo Video #2',
      },
      '2': {
        'video': 'videoAudio/videos/funnyCat2.mp4',
        'text': 'English Video #2',
      },
    },
  };

  String _t(String key) {
    return _translations[key]?[_currentLanguage] ?? key;
  }

  void _changeLanguage(String language) {
    setState(() {
      _currentLanguage = language;
    });
  }

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
            child:
            Text(titleContentMap[languages[languageIndex]]!)
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
              subtitleContentMap[languages[languageIndex]]!
          ),
          //children: [
          Container(
              height: containerHeight * 0.1,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  // children: ['Kiswahili', 'Dholuo', 'English']
                  //     .map((language) => languageButton(language))
                  //     .toList(),
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          languageIndex = 0;
                          _currentLanguage = 'Kiswahili';
                          overrideIndex = true;
                          //updateMethodContent('content1');
                          video1 = updateVideoContent1();
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
                          _currentLanguage = 'Dholuo';
                          overrideIndex = true;
                          //updateMethodContent('content2');
                          video1 = updateVideoContent1();
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
                          _currentLanguage = 'English';
                          overrideIndex = true;
                          //updateMethodContent('content3');
                          video1 = updateVideoContent1();
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

          // Expanded(child: RawScrollbar(
          //     thumbColor: const Color.fromARGB(255, 232, 132, 165),
          //     thumbVisibility: true,
          //     trackVisibility: false,
          //     thickness: 25.0,
          //     radius: Radius.circular(20),
          //     child: Container (
          //   //height: containerHeight * 0.6, // Adjust as needed
          //   child: Flex(
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     direction: Axis.vertical,
          //     children: [
          //       contentBox('content1'),
          //       contentBox('content2'),
          //       contentBox('content3'),
          //       SizedBox(
          //         width: boxWidth * 0.5,
          //         height: boxHeight * 0.5 * 0.4,
          //         child: Center(child:video1),
          //       ),
          //       contentBox('content4'),
          //       contentBox('content5'),
          //       Image.asset(
          //               'assets/new_icons/emergency_photos.png',
          //               width: 100,
          //               height: 100,
          //               fit: BoxFit.cover,
          //       ),
          //     ]
          //   ),
          // ),
          // ),
          // ),

          Container (
            //height: containerHeight * 0.6, // Adjust as needed
      
              child: Flex(
                crossAxisAlignment: CrossAxisAlignment.center,
                direction: Axis.vertical,
                children: [
                  contentBox2('content1', '1'),
                  contentBox2('content2', '2'),
                  contentBox2('content3', '3'),
                  SizedBox(
                    width: boxWidth * 0.6,
                    height: boxHeight * 0.5 * 0.6,
                    child: Center(child:video1),
                  ),
                  contentBox('content4'),
                  Expanded(
                    child: Wrap(
                      spacing: 8.0, // space between adjacent chips
                      runSpacing: 4.0, // space between lines
                      alignment: WrapAlignment.start, // aligns the chips starting from the left
                      children: [
                        contentBox('content5'),
                        Container(
                          width: 150,
                          height: 150,
                          child: Image.asset(
                            'assets/new_icons/emergency_photos.png',
                            fit: BoxFit.cover,
                          ),
                        ),
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

  Widget updateMethodContent(String contentKey) {
    return Text(
        _t(contentKey),
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.black,
        )
    );
  }

  String _getAsset(String videoKey, String language) {
    return languageToVideo[videoKey]?[language]?['video'] ?? 'Asset not found';
  }

  String _getTitle(String videoKey, String language) {
    return languageToVideo[videoKey]?[language]?['text'] ?? 'Text not found';
  }

  Widget updateVideoContent1() {
    if (languageIndex == 0) {
      videoAsset1 = _getAsset('video1', '0');
      videoTitle1 = _getTitle('video1', '0');
    } else if (languageIndex == 1) {
      videoAsset1 = _getAsset('video1', '1');
      videoTitle1 = _getTitle('video1', '1');
    } else if (languageIndex == 2) {
      videoAsset1 = _getAsset('video1', '2');
      videoTitle1 = _getTitle('video1', '2');
    }
    return VideoWidget(videoAsset: videoAsset1, title: videoTitle1);
  }

  Widget languageButton(String language) {
    bool isSelected = _currentLanguage == language;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ElevatedButton(
        onPressed: () => _changeLanguage(language),
        // onPressed: () {
        //   setState(() {
        //     languageIndex = languageIndex;
        //     overrideIndex = true;
        //     video1 = updateVideoContent1();
        //   });
        // },
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Colors.grey : null,
        ),
        child: Text(language),
      ),
    );
  }

  Widget contentBox(String contentKey) {
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
              child: Text(
                _t(contentKey),
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget contentBox2(String contentKey, String number) {
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
            // Icon(Icons.lightbulb_outline, color: Colors.amber, size: 24.0),
            Text(number, style:TextStyle(fontWeight:FontWeight.bold)),
            SizedBox(width: 10.0),
            Expanded(
              child: Text(
                _t(contentKey),
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
