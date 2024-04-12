import 'package:flutter/material.dart';
import 'recommendation_screen.dart';
import 'recommendation_model.dart';


class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  Map<String, String> _selectedOptions = {};
  String _currentLanguage = 'English';

  final List<String> subQuestionKeys = [
    'q1', 
    'q2', 
    'q3', 
    'q4', 
    'q5', 
    'subq1', // Light, irregular periods
    'subq2', // Periods might stop
    'subq3', // Periods might get heavier
    'q3sub1', 
    'q3sub2', 
    'q3sub3', 
    // ... other subquestions
  ];

  final List<String> optionKeys = [
    'option1', // Could be OK
    'option2', // Not OK
    'option3', // Not sure
    // ... other options
    'op1', 
    'op2', 
    'op3', 
    'o1', 
    'o2', 
    'o3', 
    'o51', 
    'o52', 
    'o53', 
    'o54'
  ];


final Map<String, Map<String, String>> _translations = {
  'English': {
    'title': 'Quiz', 
    'title1': 'Recommendations', 
    'q1': 'How do you feel about changes to your periods?', 
    'q2': 'If you had to guess, when do you think you might want a pregnancy?', 
    'q3': 'How long do you want your method to work?', 
    'q4': 'How important is it to you to keep your method private from your parents or partner?', 
    'q5': 'Which of the below factors is most important to you when choosing a method?', 
    'subq1': 'Light, irregular periods',
    'subq2': 'Periods might get heavier', 
    'subq3': 'Periods might stop', 
    'q3sub1': 'Use method every time you have sex', 
    'q3sub2': 'Lasts 3 months or less', 
    'q3sub3': 'Works for more than 1 year', 
    'option1': 'Could be OK',
    'option2': 'Not OK', 
    'option3': 'I\'m Not sure', 
    'op1': 'In More than 1 year', 
    'op2': 'In 6-12 months', 
    'op3': 'I\'m not sure', 
    // ... other English translations
    'o1': 'Extremely important', 
    'o2': 'Somewhat important', 
    'o3': 'Not important', 
    'o51': 'The lowest chance of getting pregnant', 
    'o52': 'Avoiding changes to my periods', 
    'o53': 'Keeping my method private', 
    'o54': 'Being able to get pregnant in the future',  
    'outroText1': 'Condoms are the best way to prevent HIV and other infections, but may not be the best method for preventing pregnancy for a long period of time.',
    'outroText2': 'The following method may also be a good option, but there may be a delay of 3-6 months in fertility after stopping: Depo', 
    'outroText3': 'We also recommend you start a prenatal vitamin for good pregnancy health.', 
    'outroText4': 'The following methods may be less private, but you might also want to consider them: Condoms, Pills. Condoms are the best way to prevent HIV and other infections, but rely on your partner to use.', 
    'outroText5': 'Condoms are the best way to prevent HIV and other infections, but rely on your partner to use and must be used every time you have sex to prevent pregnancy.', 
    'outroText6': 'The following methods may cause changes to your bleeding but these changes are not harmful and will not lead to fertility problems: Depo, Implant, IUCD', 
    'outroText7': 'Good news! NONE OF THE METHODS WILL CHANGE YOUR ABILITY TO GET PREGNANT IN THE FUTURE!!! If you want to get pregnant in the next 6 months, we recommend avoiding Depo.', 
    'outroText8': 'Your periods might be light and irregular or stop when using Depo or the implant, but this is not bad and does not lead to fertility problems.You might also consider the following methods, which do not lead to periods stopping:Pills, Condoms, IUCD', 
    'outroText9': 'Your periods might be heavier using the following method(s): IUCD', 
    'outroText10': 'You might also consider the following methods, which do not lead to periods stopping: Pills, Condoms, IUCD', 
    'outroText11': 'The following method may also be a good option, but there may be a delay of 3-6 months in fertility after stopping:Depo', 
    'outroText12': 'The Emergency Pill can help prevent pregnancy after sex but is not as effective.', 
    'outroText13': 'The following methods last 3 months or less but you might also want to use them: Condoms, Pills, Depo', 
    'outroText14': 'The following methods last longer than 3 months but you might also want to use them: Implant, IUCD', 
    'outroText15': 'The following methods last 1 or more years but you might also want to use them: Implant, IUCD', 
    'outroText16': 'The following methods last less than a year but you might also want to use them: Condoms, Pills, Depo', 
    'outroText17': 'The following methods may be less private, but you might also want to consider them: Condoms, Pills. Condoms are the best way to prevent HIV and other infections, but rely on your partner to use.', 
    'outroText18': 'Your periods might be light and irregular or stop when using Depo or the implant, but this is not bad and does not lead to fertility problems.', 
    'outroText19': 'Condoms are the best way to prevent HIV and other infections, but must be used every time you have sex to prevent pregnancy. The Emergency Pill can help prevent pregnancy after sex but is not as effective.', 
    'introText1': 'Based on how you feel about light irregular periods, these methods might be a good choice for you:', 
    'introText2': 'Based on how you feel about the possibility of your periods stopping, these methods might be a good choice for you:', 
    'introText3': 'Based on how you feel about your periods getting heavier, the following methods might be a good choice for you', 
    'introText4': 'Based on when you think you want a pregnancy, the following methods may be a good choice for you:', 
    'introText5': 'Based on how long you want a method to last, the following methods might be a good choice for you', 
    'introText6': 'Based on how important it is to you to keep your method private, the following methods might be a good choice for you:', 
    'introText7': 'Based on how important it is to you to prevent pregnancy, the following methods might be a good choice for you:', 
    'introText8': 'Based on how important it is to you to avoid changes to your periods, the following methods might be a good choice for you:', 
    'introText9': 'Based on how important it is to you to be able to get pregnant in the future, the following methods might be a good choice for you:', 
    'recommendationTitle': 'Here are some recommendations that might be right for you!', 
    'likedTitle': 'Your favorites', 
    'incomplete': 'Incomplete quiz', 
    'incompleteMessage': 'Please answer all questions before submitting the quiz', 
    'submit': 'Submit quiz', 
    'learnMore': 'Learn More',
    'none': 'None', 
    'summaryPage': 'Summary Page'
  },
  'Kiswahili': {
    'title': 'Chemsha bongo',
    'q1': 'Je, unajisikiaje kuhusu mabadiliko katika hedhi yako?',
    'q2': 'Ikiwa ulipaswa kukisia, unafikiri ni wakati gani unaweza kutaka mimba?',
    'q3': 'Je! ungependa mbinu yako ifanye kazi kwa muda gani?',
    'q4': 'Je, kuna umuhimu gani kwako kuweka njia yako ya faragha (kutoka kwa washirika, wazazi)?',  
    'q5': 'Je, ni kipi kati ya vipengele vilivyo hapa chini ambacho ni muhimu ZAIDI kwako wakati wa kuchagua njia?', 
    'subq1': 'Hedhi nyapesi, yasiyo kawaida',
    'subq2': 'Hedhi yanaweza kuwa nzito', 
    'subq3': 'Hedhi yanaweza kukoma', 
    'q3sub1': 'Tumia kila wakati unapofanya ngono', 
    'q3sub2': 'Hudumu miezi 3 au chini',
    'q3sub3': 'Inafanya kazi kwa zaidi ya mwaka 1',  
    'option1': 'Inaweza kuwa sawa',
    'option2': 'Si sawa',
    'option3': 'Sina uhakika', 
    'op1': 'Katika zaidi ya mwaka 1', 
    'op2': 'Katika miezi 6-12', 
    'op3': 'Sina uhakika', 
    'o1': 'Muhimu sana', 
    'o2': 'Muhimu kwa kiasi fulani', 
    'o3': 'Sio Muhimu', 
    'o51': 'Uwezekano mdogo wa kupata mimba', 
    'o52': 'Kuepuka mabadiliko ya hedhi yangu', 
    'o53': 'Kuweka njia yangu kwa usiri', 
    'o54': 'Kuwa na uwezo wa kupata mimba katika siku zijazo', 
    // ... other Kiswahili translations
    'title1': 'Mapendekezo', 
    'recommendationTitle': 'Haya hapa ni baadhi ya mapendekezo ambayo yanaweza kuwa sawa kwako!', 
    'outroText1': 'Kondomu ni njia bora ya kuzuia Virusi Vya Ukimwi na maambukizo mengine, lakini inaweza isiwe njia bora ya kuzuia mimba kwa muda mrefu.',  
    'outroText2': 'Njia ifuatayo inaweza pia kuwa chaguo nzuri, lakini kunaweza kuwa na kuchelewa kwa miezi 3-6 katika uzazi baada ya kuacha:', 
    'outroText3': 'Tunapendekeza pia uanzishe vitamini katika ujauzito kwa afya bora ya ujauzito.', 
    'outroText4': 'Njia zifuatazo zinaweza kuwa za faragha kidogo, lakini pia unaweza kutaka kuzizingatia: Condoms, Pills. Kondomu ni njia bora ya kuzuia VVU na maambukizo mengine, lakini tegemea mwenzako atumie.', 
    'outroText5': 'Kondomu ni njia bora ya kuzuia VVU na maambukizo mengine, lakini tegemea mpenzi wako kutumia na lazima zitumike kila wakati unapojamiiana ili kuzuia mimba.', 
    'outroText6': 'Mbinu zifuatazo zinaweza kusababisha mabadiliko katika kutokwa na damu kwako lakini mabadiliko haya hayana madhara na hayatasababisha matatizo ya uzazi: Depo, Implant, IUCD', 
    'outroText7': 'Habari njema! HAKUNA NJIA HIZO ITAKAYOBADILI UWEZO WAKO WA KUPATA MIMBA BAADAYE!!! Ikiwa unataka kupata mimba katika miezi 6 ijayo, tunapendekeza uepuke Depo.', 
    'outroText8': 'Hedhi yako inaweza kuwa nyepesi na isiyo ya kawaida au kukoma unapotumia Depo au Implant, lakini hii si mbaya na haileti matatizo ya uzazi.', 
    'outroText9': 'Hedhi yako unaweza kuwa mzito zaidi kwa kutumia mbinu zifuatazo: IUCD', 
    'outroText10': 'Unaweza pia kuzingatia njia zifuatazo, ambazo hazisababishi kusimamishwa kwa hedhi:', 
    'outroText11': 'Njia ifuatayo inaweza pia kuwa chaguo nzuri, lakini kunaweza kuwa na kuchelewa kwa miezi 3-6 katika uzazi baada ya kuacha: Depo', 
    'outroText12': 'Kidonge cha Dharura kinaweza kusaidia kuzuia mimba baada ya kujamiiana lakini hakifai.', 
    'outroText13': 'Njia zifuatazo hudumu kwa miezi 3 au chini ya hapo lakini pia unaweza kutaka kuzitumia: Condoms, Pills, Depo', 
    'outroText14': 'Njia zifuatazo hudumu zaidi ya miezi 3 lakini pia unaweza kutaka kuzitumia: Implant, IUCD',
    'outroText15': 'Njia zifuatazo hudumu mwaka 1 au zaidi lakini unaweza kutaka kuzitumia: Implant, IUCD', 
    'outroText16': 'Njia zifuatazo hudumu chini ya mwaka mmoja lakini pia unaweza kutaka kuzitumia: Condoms, Pills, Depo', 
    'outroText17': 'Njia zifuatazo zinaweza kuwa za faragha kidogo, lakini pia unaweza kutaka kuzizingatia: Condoms, Pills. Kondomu ni njia bora ya kuzuia VVU na maambukizo mengine, lakini tegemea mpenzi wako kutumia na lazima zitumike kila wakati unapojamiiana ili kuzuia mimba.', 
    'outroText18': 'Hedhi yako inaweza kuwa nyepesi na isiyo ya kawaida au kukoma unapotumia njia zifuatazo, lakini hii sio mbaya na haileti matatizo ya uzazi:', 
    'outroText19': 'Kondomu ni njia bora ya kuzuia Virusi Vya Ukimwi na maambukizo mengine, lakini inaweza isiwe njia bora ya kuzuia mimba kwa muda mrefu. Kidonge cha Dharura kinaweza kusaidia kuzuia mimba baada ya kujamiiana lakini hakifai.', 
    'introText1': 'Kulingana na jinsi unavyohisi kuhusu mwanga, hedhi isiyo ya kawaida, njia hizi zinaweza kuwa chaguo nzuri kwako:', 
    'introText2': 'Kulingana na jinsi unavyohisi kuhusu uwezekano wa hedhi kukoma, njia hizi zinaweza kuwa chaguo nzuri kwako', 
    'introText3': 'Kulingana na jinsi unavyohisi kuhusu hedhi yako kuwa nzito, njia hizi zinaweza kuwa chaguo nzuri kwako:', 
    'introText4': 'Kulingana na wakati unafikiri unataka mimba, njia zifuatazo zinaweza kuwa chaguo nzuri kwako:', 
    'introText5': 'Kulingana na muda gani unataka njia idumu, njia zifuatazo zinaweza kuwa chaguo nzuri kwako:', 
    'introText6': 'Kulingana na jinsi ilivyo muhimu kwako kuweka njia yako ya faragha, mbinu zifuatazo zinaweza kuwa chaguo nzuri kwako:', 
    'introText7': 'Kulingana na jinsi ni muhimu kwako kuzuia ujauzito, njia zifuatazo zinaweza kuwa chaguo nzuri kwako:', 
    'introText8': 'Kulingana na jinsi ilivyo muhimu kwako kuzuia mabadiliko katika kipindi chako, njia zifuatazo zinaweza kuwa chaguo nzuri kwako:', 
    'introText9': 'Kulingana na jinsi ilivyo muhimu kwako kupata mimba katika siku zijazo, njia zifuatazo zinaweza kuwa chaguo nzuri kwako:', 
    'likedTitle': 'Vipendwa vyako', 
    'incomplete': 'Maswali ambayo hayajakamilika', 
    'incompleteMessage': 'Tafadhali jibu maswali yote kabla ya kuwasilisha chemsha bongo',
    'submit': 'Wasilisha chemsha bongo', 
    'learnMore': 'Jifunze zaidi ',  
    'none': 'Onge', 
    'summaryPage': 'Ukurasa wa muhtasari'
  },
  'Dholuo': {
    'q1': 'Iwinjo nade ewi lokruok e chwer mar rembi mar dwe?', 
    'q2': 'Ka nyaka iduoki, en karang\'o ma iparo ni inyalo dwaro make ich?', 
    'q3': 'Idwaro ni yori mar geng\'o ich oti kuom kinde marom nade?', 
    'q4': 'Omokoni marom nade tiyo gi yor geng\'o ich e yo mopondo [kuom johera, jonyuol]?', 
    'q5': 'En ang\'o kuom gigo ma oler piny kae  ma omokoni AHINYA  ekinde ma iyiero yor geng\'o ich?', 
    'option1': 'Nyalo bedo maber', 
    'option2': 'Ok ber',
    'option3': 'Ok an gi adiera',  
    'subq1': 'Chwer matin, remb dwe mabiro kinde ma ok ochan.', 
    'subq2': 'Remb dwe nyalo chwer mang\'eny', 
    'subq3': 'Remb dwe ok bi', 
    'q3sub1': 'Tigo ekinde duto ma abedo e achiel', 
    'q3sub2': 'Obudh kuom dweche 3 kata matin ne', 
    'q3sub3': 'Oti kuom kinde mohingo higa 1', 
    'op1': 'Mokalo higa 1', 
    'op2': 'Ekind dweche 6-12', 
    'op3': 'Ok an gi adiera', 
    'o1': 'Omokona ahinya', 
    'o2': 'Omokona marach rach',
    'o3': 'Ok omokona', 
    'o51': 'Bedo gi nyalo matin mar mako ich.', 
    'o52': 'Bedo ni onge lokruok e chwer mar remba mar dwe.', 
    'o53': 'Tiyo gi yor geng\'o ich eyo mopondo', 
    'o54': 'Bedo ni anyalo mako ich e ndalo mabiro', 
    'title1': 'Ng\'eyo', 
    'title': 'Muro obuongo ', 
    'recommendationTitle': 'Erigo gikmoko mawaneno ni nyalo bedo maber kodi!', 
     'outroText1': 'Rabo yunga e yo maber mar geng\'o kute mag ayaki kod tuoche mamoko, to ok nyalo bedo yo maber mar geng\'o ich kuom kinde malach.', 
      'outroText2': 'Yore moluwogi bende nyalo bedo yiero maber, to deko nyalo bete mar dweche 3-6 e nyaloni mar mako ich bang weyo:', 
      'outroText3': 'Wa ng\'ado ni rieko bende ni mondo ichak muonyo antenatal vitamins mondo iting ich man gi ngima maber', 
      'outroText4': 'Yore moluwogi nyalo bedo ma ok opondo matin, to inyalo bende dwaro neno gi: Condoms, Pills. Rabo yunga e yo maber mogik e geng\'o kute mag ayaki kod tuoche mamoko, to nyaka jaherani ema tikode.', 
      'outroText5': 'Rabo yunga e yo mabe e geng\'o kute mag ayaki kod tuoche mamoko, to nyaka jaherani ema ti kode kendo nyaka ti kode kinde duto ma ibedo e achiel mondo ogeng ich.', 
      'outroText6': 'Yore moluwogi nyalo kelo lokruok e chwer mar rembi mar dwe to lokruok gi ok kel hinyruok kendo ok nyalo kelo chandruok e nyaloni mar mako ich: Depo, Implant, IUCD',
      'outroText7': 'Wach maber! ONGE YOR KOMO NYUOL MANYALO LOKO NYALONI MAR MAKO ICH E NDALO MABIRO !!! Ka idwaro mako ich e dweche 6 mabiro, wang\'ado ni rieko ni iwe tiyo gi Depo.', 
      'outroText8': 'Rembi mar dwe nyalo biro matin kendo biro ekinde ma ok ochan kata weyo chwer ka itiyo gi Depo kata implant, to ma ok rach kendo ok kel chandruok e nyaloni mar mako ich.', 
      'outroText9': 'Rembi mar dwe nyalo chwer mang\'eny ka itiyo gi yore moluwogi: IUCD',
      'outroText10': 'Inyalo  bende ng\'iyo yore ma oluwogi, ma ok mi chwer mar dwe chungi:', 
      'outroText11': 'Yore moluwogi bende nyalo bedo yiero maber, to deko nyalo bete mar dweche 3-6 e nyaloni mar mako ich bang weyo: Depo', 
      'outroText12': 'E-pill nyalo konyo geng\'o ich bang bedo e achiel to ok en yo matiyo maber ahinya.', 
      'outroText13':'Yore moluwogi kau dweche 3 kata matin to inyalo bende dwaro tiyo kodgi: Condoms, Pills, Depo', 
      'outroText14': 'Yore moluwogi kau dweche 3 kata matin to inyalo bende dwaro tiyo kodgi: Implant, IUCD', 
      'outroText15': 'Yore moluwogi kau higa 1 kata mang\'eny to inyalo bende dwao tiyo kodgi: Implant, IUCD', 
      'outroText16': 'Yore moluwogi kau kinde matin ne higa to inyalo bende dwaro tiyo kodgi: Condoms, Pills, Depo', 
      'outroText17': 'Yore moluwogi nyalo bedo ma ok opondo matin, to inyalo bende dwaro neno gi: Condoms, Pills Rabo yunga e yo mabe e geng\'o kute mag ayaki kod tuoche mamoko, to nyaka jaherani ema ti kode kendo nyaka ti kode kinde duto ma ibedo e achiel mondo ogeng ich.', 
      'outroText18': 'Rembi mar dwe nyalo chwer matin kendo biro e kinde ma ok ochan kata weyo chwer ka itiyo gi yore moluwogi, to ok rach kendo ok okel chandruok e nyaloni mar mako ich:', 
      'outroText19': 'Rabo yunga e yo maber mar geng\'o kute mag ayaki kod tuoche mamoko, to nyaka iti kode kinde duto ma ibedo e achiel mondo ogeng\' ich. E-pill nyalo konyo geng\'o ich bang bedo e achiel to ok en yo matiyo maber ahinya.', 
      'introText1': 'Kaluwore gi kaka iwinjo kuom bedo gi chwer matin, remo mar dwe mabiro ekinde ma ok ochan, yoregi nyalo bedo yiero maber ne in:', 
      'introText2': 'Gi kaka iwinjo kuom bedo ni chwer mar rembi mar dwe nyalo chung, yoregi nyalo bedo yiero maber ne in', 
      'introText3': 'Gi kaka iwinjo kuom rembi mar dwe chwer mang\'eny, yoregi nyalo bedo yiero maber ne in:', 
      'introText4': 'Kaluwore gi kinde ma iparo ni inyalo dwaro mako ich, yore moluwogi nyalo bedo yiero maber ne in:', 
      'introText5': 'Kaluwore gi kinde ma idwaro mondo yor komo nyuol okaw, yore moluwogi nyalo bedo yiero maber ne in.', 
      'introText6': 'Kaluwore gi kaka omokoni mondo ikan tiyo gi yor komo nyuol mopondo, yore moluwogi nyalo bedo yiero maber ne in:', 
      'introText7': 'Kaluwore gi kaka omokoni mondo igeng\' ich, yore moluwogi nyalo bedo yiero maber ne in:', 
      'introText8': 'Kaluwore gi kaka omokoni mondo igeng\' lokruok e rembi mar dwe, yore moluwogi nyalo bedo yiero maber ne in:', 
      'introText9': 'Kaluwore gi kaka omokoni mondo ibed ni inyalo mako ich e ndalo mabiro, yore moluwogi nyalo bedo yiero maber ne in:', 
      'likedTitle': 'Ma ihero', 
      'incomplete': 'Penjo mapok otiek duoko ', 
      'incompleteMessage': 'Kiyie to duok penjo te kapok ioro duoko mag penjo ma muro obuongo', 
      'submit': 'Oor duoko mag muro obuongo', 
      'learnMore': 'Puonjri matut', 
      'none': 'Hakuna', 
      'summaryPage': 'Oboke ma lero weche e yo machuok'
  }
};

void navigateToRecommendationScreen(BuildContext context, String pregnancyTiming) {
  // Get recommendations based on the user's answer to the second question
  List<String> recommendations = RecommendationModel.getRecommendationsBasedOnPregnancyTiming(pregnancyTiming);
  print('Recommendations: $recommendations'); // Add this line to debug
  // Dummy introductory texts for demonstration purposes, replace with actual logic to generate introTexts
  List<String> introTexts = List<String>.generate(recommendations.length, (index) => 'Introductory text ${index + 1}');
  List<String> outroTexts = List<String>.generate(recommendations.length, (index) => 'Outro text ${index + 1}');
  // Navigate to the Recommendation Screen with the recommendations and introTexts
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => RecommendationScreen(
        recommendations: recommendations,
        introTexts: introTexts,
        outroTexts: outroTexts, 
        currentLanguage: _currentLanguage, // Pass currentLanguage here
        translations: _translations, 
        onChangeLanguage: _changeLanguage,
      ),
    ),
  );
}


String getConsistentKeyForQuestion(String questionText) {
  var invertedMap = <String, String>{};
  
  _translations.forEach((language, translations) {
    translations.forEach((key, value) {
      invertedMap[value] = key; // Invert the map to go from translation to key
    });
  });

  return invertedMap[questionText] ?? questionText;
}




void _changeLanguage(String language) {
  setState(() {
    _currentLanguage = language;
  });
}

Map<String, String> getReverseLookupMap(String language) {
  Map<String, String> reverseMap = {};
  _translations[language]?.forEach((key, value) {
    reverseMap[value] = key;
  });
  return reverseMap;
}


// void _handleOptionSelection(String questionKey, String optionKey) {
//   setState(() {
//     // Using the raw question key because the _selectedOptions map uses them as keys
//     _selectedOptions[questionKey] = optionKey;
//     print('Selected options: $_selectedOptions');
//   });
// }

void _handleOptionSelection(String questionKey, String optionKey) {
    setState(() {
      _selectedOptions[questionKey] = optionKey;
    });
    print("Option selected: $questionKey = $optionKey");
  }



  String _t(String key) {
    return _translations[_currentLanguage]?[key] ?? key;
  }

void _submitQuiz() {
  print('Attempting to submit. Selected options: $_selectedOptions'); 
  if (!_areAllQuestionsAnswered()) {
    // Show an alert dialog or a message to complete the quiz
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(_t('incomplete')),
          content: Text(_t('incompleteMessage')),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
    return; // Exit the function without navigating if not all questions are answered
  }
  // Get the user's selection for question 1
  // String subq11 = _selectedOptions[_t('Light, irregular periods')] ?? '';

  String subq11 = _selectedOptions['subq1'] ?? '';

  print('subquestion1: $subq11');
  // String subq13 = _selectedOptions[_t('Periods might get heavier')] ?? '';
  String subq13 = _selectedOptions['subq3'] ?? '';
  print('subquestion1: $subq13');
  // String subq12 = _selectedOptions[_t('Periods might stop')] ?? '';
  String subq12 = _selectedOptions['subq2'] ?? '';
  print('subquestion1: $subq12');
  // get user's selection for q3
  // String subq31 = _selectedOptions[_t('Use method every time you have sex')] ?? '';
  String subq31 = _selectedOptions['q3sub1'] ?? '';
  String subq32 = _selectedOptions['q3sub2'] ?? '';
  String subq33 = _selectedOptions['q3sub3'] ?? '';
  String pregnancyTiming = _selectedOptions['q2'] ?? '';
  // Get the user's selection for question 4
  String privacyImportance = _selectedOptions['q4'] ?? '';
  String factors = _selectedOptions['q5'] ?? '';
  List<String> recommendations = [];
  List<String> introTexts = []; // List to store introductory texts
  List<String> outroTexts = [];
  print('Navigating with recommendations: $recommendations');
  switch (subq11) {
    case 'option1': // 'Could be OK'
      recommendations.addAll(['Depo, Implant']);
      // introTexts.add('Based on how you feel about light irregular periods, these methods might be a good choice for you:');
      introTexts.add('introText1');
      outroTexts.addAll(RecommendationModel.getOutroTextsBasedOnLightIrregular('Could be OK'));
      break;
    case 'option2': // Not OK
      recommendations.addAll(['Pills, Condoms, IUCD']);
      // introTexts.add('Based on how you feel about light irregular periods, these methods might be a good choice for you:');
      introTexts.add('introText1');
      outroTexts.addAll(RecommendationModel.getOutroTextsBasedOnLightIrregular('Not OK'));
      break;
    case 'option3': // Not sure 
      recommendations.addAll(['Depo, Implant']);
      // introTexts.add('Based on how you feel about light irregular periods, these methods might be a good choice for you:');
      introTexts.add('introText1');
      outroTexts.addAll(RecommendationModel.getOutroTextsBasedOnLightIrregular('Not sure'));
      break;
    default:
      break;
  }

  switch (subq12) {
    case 'option1': // 'Could be OK'
      recommendations.addAll(['Depo, Implant']);
      // introTexts.add('Based on how you feel about the possibility of your periods stopping, these methods might be a good choice for you:');
      introTexts.add('introText2');
      outroTexts.addAll(RecommendationModel.getOutroTextsBasedOnPeriodsStop('Could be OK'));
      break;
    case 'option2': // Not OK
      recommendations.addAll(['Pills, Condoms, IUCD']);
      // introTexts.add('Based on how you feel about the possibility of your periods stopping, these methods might be a good choice for you:');
      introTexts.add('introText2');
      outroTexts.addAll(RecommendationModel.getOutroTextsBasedOnPeriodsStop('Not OK'));
      break;
    case 'option3': // Not sure 
      recommendations.addAll(['Depo, Implant']);
      // introTexts.add('Based on how you feel about the possibility of your periods stopping, these methods might be a good choice for you:');
      introTexts.add('introText2');
      outroTexts.addAll(RecommendationModel.getOutroTextsBasedOnPeriodsStop('Not sure'));
      break;
    default:
      break;
  }

  switch (subq13) {
    case 'option1': // 'Could be OK'
      recommendations.addAll(['Depo, Implant, Pills, Condoms, IUCD']);
      // introTexts.add('Based on how you feel about your periods getting heavier, the following methods might be a good choice for you');
      introTexts.add('introText3');
      outroTexts.addAll(RecommendationModel.getOutroTextsBasedOnPeriodsHeavier('Could be OK'));
      break;
    case 'option2': // Not OK
      recommendations.addAll(['Depo, Implant, Pills, Condoms']);
      // introTexts.add('Based on how you feel about your periods getting heavier, these methods might be a good choice for you:');
      introTexts.add('introText3');
      outroTexts.addAll(RecommendationModel.getOutroTextsBasedOnPeriodsHeavier('Not OK'));
      break;
    case 'option3': // Not sure 
      recommendations.addAll(['Depo, Implant, Pills, Condoms, IUCD']);
      // introTexts.add('Based on how you feel about your periods getting heavier, the following methods might be a good choice for you');
      introTexts.add('introText3');
      outroTexts.addAll(RecommendationModel.getOutroTextsBasedOnPeriodsHeavier('Not sure'));
      break;
    default:
      break;
  }
  // Decision tree for question 2
  switch (pregnancyTiming) {
    case 'op1': // More than 1 year
      recommendations.addAll([
          'Implant, IUCD, Depo, Pills',
          // 'Start a prenatal vitamin for good pregnancy health.'
        ]);
      //recommendations.addAll(RecommendationModel.getRecommendationsBasedOnPregnancyTiming('More than 1 year'));
      // introTexts.add('Based on when you think you want a pregnancy, the following methods may be a good choice for you:');
      introTexts.add('introText4');
      outroTexts.addAll(RecommendationModel.getOutroTextsBasedOnPregnancyTiming('More than 1 year'));
      break;
    case 'op2': // In 6-12 months
      recommendations.addAll([
          'Pills, Condoms, Implant, IUCD',
          // 'Start a prenatal vitamin for good pregnancy health.'
        ]);
      //recommendations.addAll(RecommendationModel.getRecommendationsBasedOnPregnancyTiming('In 6-12 months'));
      // introTexts.add('Based on when you think you want a pregnancy, the following methods may be a good choice for you:');
      introTexts.add('introText4');
       outroTexts.addAll(RecommendationModel.getOutroTextsBasedOnPregnancyTiming('In 6-12 months'));
      break;
    case 'op3': // Now or very soon
      recommendations.addAll([
          'No method, Pills, Condoms',
          // 'Start a prenatal vitamin for good pregnancy health.'
        ]);
      //recommendations.addAll(RecommendationModel.getRecommendationsBasedOnPregnancyTiming('Not sure'));
      // introTexts.add('Based on when you think you want a pregnancy, the following methods may be a good choice for you:');
      introTexts.add('introText4');
      outroTexts.addAll(RecommendationModel.getOutroTextsBasedOnPregnancyTiming('Now or very soon'));
      break;
  }

  print('Navigating with recommendations: $recommendations');
  

  switch (subq31) {
    case 'option1': // 'Could be OK'
      recommendations.addAll(['Condoms, Implant, IUCD, Depo, Pills']);
      // introTexts.add('Based on how long you want a method to last, the following methods might be a good choice for you');
      introTexts.add('introText5');
      outroTexts.addAll(RecommendationModel.getOutroTextsBasedOnLastEverytimeSex('Could be OK'));
      break;
    case 'option2': // Not OK
      recommendations.addAll(['Implant, IUCD, Depo, Pills']);
      // introTexts.add('Based on how long you want a method to last, the following methods might be a good choice for you');
      introTexts.add('introText5');
      outroTexts.addAll(RecommendationModel.getOutroTextsBasedOnLastEverytimeSex('Not OK'));
      break;
    case 'option3': // Not sure 
      recommendations.addAll(['Condoms, Implant, IUCD, Depo, Pills']);
      // introTexts.add('Based on how long you want a method to last, the following methods might be a good choice for you');
      introTexts.add('introText5');
      outroTexts.addAll(RecommendationModel.getOutroTextsBasedOnLastEverytimeSex('Not sure'));
      break;
    default:
      break;
  }

  print('Navigating with recommendations: $recommendations');

  switch (subq32) {
    case 'option1': // 'Could be OK'
      recommendations.addAll(['Depo, Pills, Condoms']);
      // introTexts.add('Based on how long you want a method to last, the following methods might be a good choice for you');
      introTexts.add('introText5');
      outroTexts.addAll(RecommendationModel.getOutroTextsBasedOnLast3Months('Could be OK'));
      break;
    case 'option2': // Not OK
      recommendations.addAll(['Implant, IUCD']);
      // introTexts.add('Based on how long you want a method to last, the following methods might be a good choice for you');
      introTexts.add('introText5');
      outroTexts.addAll(RecommendationModel.getOutroTextsBasedOnLast3Months('Not OK'));
      break;
    case 'option3': // Not sure 
      recommendations.addAll(['Implant, IUCD']);
      // introTexts.add('Based on how long you want a method to last, the following methods might be a good choice for you');
      introTexts.add('introText5');
      outroTexts.addAll(RecommendationModel.getOutroTextsBasedOnLast3Months('Not sure'));
      break;
    default:
      break;
  }

  print('Navigating with recommendations: $recommendations');

  switch (subq33) {
    case 'option1': // 'Could be OK'
      recommendations.addAll(['Implant, IUCD']);
      // introTexts.add('Based on how long you want a method to last, the following methods might be a good choice for you');
      introTexts.add('introText5');
      outroTexts.addAll(RecommendationModel.getOutroTextsBasedOnMoreThan1Yr('Could be OK'));
      break;
    case 'option2': // Not OK
      recommendations.addAll(['Depo, Pills, Condoms']);
      // introTexts.add('Based on how long you want a method to last, the following methods might be a good choice for you');
      introTexts.add('introText5');
      outroTexts.addAll(RecommendationModel.getOutroTextsBasedOnMoreThan1Yr('Not OK'));
      break;
    case 'option3': // Not sure 
      recommendations.addAll(['Implant, IUCD']);
      // introTexts.add('Based on how long you want a method to last, the following methods might be a good choice for you');
      introTexts.add('introText5');
      outroTexts.addAll(RecommendationModel.getOutroTextsBasedOnMoreThan1Yr('Not sure'));
      break;
    default:
      break;
  }

  print('Navigating with recommendations: $recommendations');

  // Decision tree for question 4
  switch (privacyImportance) {
    case 'o1': // Extremely important
      recommendations.addAll([
        // 'Depo',
        // 'Implant',
        // 'IUCD'
        'Depo, Implant , IUCD'
      ]);
      // introTexts.add('Based on how important it is to you to keep your method private, the following methods might be a good choice for you:');
      introTexts.add('introText6');
      outroTexts.addAll(RecommendationModel.getOutroTextsBasedOnPartner('Extremely important'));
      break;
    case 'o2': // Somewhat important
      recommendations.addAll([
        // 'Depo',
        // 'Implant',
        // 'IUCD',
        // 'Condoms',
        // 'Pills'
        'Depo, Implant, IUCD, Condoms, Pills'
      ]);
      // introTexts.add('Based on how important it is to you to keep your method private, the following methods might be a good choice for you:');
      introTexts.add('introText6');
      outroTexts.addAll(RecommendationModel.getOutroTextsBasedOnPartner('Somewhat important'));
      break;
    case 'o3': // Not important
      recommendations.addAll([
        // 'Depo',
        // 'Implant',
        // 'IUCD',
        // 'Condoms',
        // 'Pills'
        'Depo, Implant, IUCD, Condoms, Pills'
      ]);
      // introTexts.add('Based on how important it is to you to keep your method private, the following methods might be a good choice for you:');
      introTexts.add('introText6');
      outroTexts.addAll(RecommendationModel.getOutroTextsBasedOnPartner('Not important'));
      break;
    default:
      // Handle default case if necessary
      break;
  }

  // decision tree for question 5
   switch (factors) {
    case 'o51':
      recommendations.addAll([
        // 'Depo',
        // 'Implant',
        // 'IUCD'
        'Depo, Implant, IUCD'
      ]);
      // introTexts.add('Based on how important it is to you to prevent pregnancy, the following methods might be a good choice for you: ');
      introTexts.add('introText7');
      outroTexts.addAll(RecommendationModel.getOutroTextsBasedOnFactorsImp('The lowest chance of getting pregnant'));
      break;
    case 'o52':
      recommendations.addAll([
        // 'Condoms',
        // 'Pills',
        'Condoms, Pills'
      ]);
      // introTexts.add('Based on how important it is to you to avoid changes to your periods, the following methods might be a good choice for you: ');
      introTexts.add('introText8');
      outroTexts.addAll(RecommendationModel.getOutroTextsBasedOnFactorsImp('Avoiding changes to my periods'));
      break;
    case 'o53':
      recommendations.addAll([
        // 'Depo',
        // 'Implant',
        // 'IUCD'
        'Depo, Implant, IUCD'
      ]);
      // introTexts.add('Based on how important it is to you to keep your method private, the following methods might be a good choice for you: ');
      introTexts.add('introText6');
      outroTexts.addAll(RecommendationModel.getOutroTextsBasedOnFactorsImp('Keeping my method private'));
      break;
    case 'o54': 
      recommendations.addAll([
        // 'Condoms',
        // 'Pills',
        // 'IUCD', 
        // 'Depo', 
        // 'Implant', 
        // 'Emergency Pill'
        'Condoms, Pills, IUCD, Depo, Implant, Emergency'
      ]);
      // introTexts.add('Based on how important it is to you to be able to get pregnant in the future, the following methods might be a good choice for you: ');
      introTexts.add('introText9');
      outroTexts.addAll(RecommendationModel.getOutroTextsBasedOnFactorsImp('Being able to get pregnant in the future'));
      break;
   }

  // Navigate to the Recommendation Screen with the recommendations and introductory texts
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => RecommendationScreen(
        recommendations: recommendations,
        introTexts: introTexts, // Pass introTexts here
        outroTexts: outroTexts,
        currentLanguage: _currentLanguage,
        translations: _translations,
        onChangeLanguage: _changeLanguage,
      ),
    ),
  );
}

bool _areAllQuestionsAnswered() {
  // Assuming 'q1', 'q2', etc. are the constant keys for your questions
  List<String> mainQuestions = ['q2', 'q4', 'q5'];
  for (var key in mainQuestions) {
    if (_selectedOptions[key]?.isEmpty ?? true) {
      print("Unanswered main question: $key");
      return false;
    }
  }

  List<String> subQuestions = ['subq1', 'subq2', 'subq3', 'q3sub1', 'q3sub2', 'q3sub3'];
  for (var key in subQuestions) {
    if (_selectedOptions[key]?.isEmpty ?? true) {
      print("Unanswered subquestion: $key");
      return false;
    }
  }

  return true;
}

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_t('title')),
      ),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              languageButton('Kiswahili'),
              languageButton('Dholuo'),
              languageButton('English'),
            ],
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                quizSection(context, 'q1', []),
                subQuestionSection(context, 'subq1', ['option1', 'option2', 'option3']),
                subQuestionSection(context, 'subq2', ['option1', 'option2', 'option3']),
                subQuestionSection(context, 'subq3', ['option1', 'option2', 'option3']),
                quizSection(context, 'q2', ['op1', 'op2', 'op3']),
                quizSection(context, 'q3', []),
                subQuestionSection(context, 'q3sub1', ['option1', 'option2', 'option3']),
                subQuestionSection(context, 'q3sub2', ['option1', 'option2', 'option3']),
                subQuestionSection(context, 'q3sub3', ['option1', 'option2', 'option3']),
                quizSection(context, 'q4', ['o1', 'o2', 'o3']),
                quizSection(context, 'q5', ['o51', 'o52', 'o53', 'o54']),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: _submitQuiz,
                      child: Text(_t('submit')),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }



Widget languageButton(String language) {
  bool isSelected = _currentLanguage == language;
  return ElevatedButton(
    onPressed: () => _changeLanguage(language),
    style: ElevatedButton.styleFrom(
      backgroundColor: isSelected ? Colors.grey : null,
      foregroundColor: isSelected ? Colors.white : Colors.black, // Optional: change text color based on selection
    ),
    child: Text(language),
  );
}


Widget subQuestionSection(BuildContext context, String questionKey, List<String> options) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(48.0, 8.0, 16.0, 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _t(questionKey), 
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey.shade700),
          ),
          SizedBox(height: 4),
          Wrap(
            spacing: 8.0,
            children: options.map((option) {
              String selectedOptionKey = _selectedOptions[questionKey] ?? '';
              return ChoiceChip(
                label: Text(
                  _t(option),
                  style: TextStyle(fontSize: 16),
                ),
                selected: selectedOptionKey == option,
                onSelected: (selected) {
                  _handleOptionSelection(questionKey, option);
                },
                selectedColor: Colors.purple.shade200,
                backgroundColor: Colors.white,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

 Widget quizSection(BuildContext context, String questionKey, List<String> options) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _t(questionKey),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Wrap(
              spacing: 8.0,
              children: options.map((option) {
                String selectedOptionKey = _selectedOptions[questionKey] ?? '';
                return ChoiceChip(
                  label: Text(
                    _t(option),
                    style: TextStyle(color: Colors.black),
                  ),
                  selected: selectedOptionKey == option,
                  onSelected: (selected) {
                    _handleOptionSelection(questionKey, option);
                  },
                  selectedColor: Colors.purple.shade200,
                  backgroundColor: Colors.white,
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }





}
