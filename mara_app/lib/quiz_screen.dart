import 'package:flutter/material.dart';
import 'recommendation_model.dart';
import 'recommendation_screen.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final Map<String, String> _selectedOptions = {};
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
    'q3': 'How long do you want your method to last?', 
    'q4': 'How important is it to you to keep your method private from your parents or partner?', 
    'q5': 'Which of the below factors is most important to you when choosing a method?', 
    'subq1': 'Light, irregular periods',
    'subq2': 'Periods might get heavier', 
    'subq3': 'Periods might stop', 
    'q3sub1': 'Use method every time you have sex', 
    'q3sub2': '3 months or less', 
    'q3sub3': 'Lasts more than a year', 
    'option1': 'Could be OK',
    'option2': 'Not OK', 
    'option3': 'Not sure', 
    'op1': 'More than 1 year', 
    'op2': 'In 6-12 months', 
    'op3': 'Not sure', 
    // ... other English translations
    'o1': 'Extremely important', 
    'o2': 'Somewhat important', 
    'o3': 'Not important', 
    'o51': 'The lowest chance of getting pregnant', 
    'o52': 'Avoiding changes to my periods', 
    'o53': 'Keeping my method private', 
    'o54': 'Being able to get pregnant in the future', 
    'condoms': 'Condoms',
    'Condoms': 'Condoms', 
    'iucd': 'IUCD',
    'depo': 'Depo',
    'Implant': 'Implant', 
    'implant': 'implant', 
    'pills': 'pills', 
    'Pills': 'Pills', 
    'outroText1': 'Condoms are the best way to prevent HIV and other infections, but may not be the best method for preventing pregnancy for a long period of time.',
    'outroText2': 'The following method may also be a good option, but there may be a delay of 3-6 months in fertility after stopping: Depo', 
    'outroText3': 'We also recommend you start a prenatal vitamin for good pregnancy health.', 
    // 'learnMore': 'Learn More',
  },
  'Kiswahili': {
    'title': 'Jaribio',
    'q1': 'Unajisikiaje kuhusu mabadiliko ya vipindi vyako?',
    'q2': 'Ikiwa ulipaswa kukisia, unafikiri ni wakati gani unaweza kutaka mimba?',
    'q3': 'Je! ungependa mbinu yako idumu kwa muda gani?', 
    'subq1': 'Vipindi vyepesi, visivyo vya kawaida',
    'option1': 'Inaweza kuwa sawa',
    'option2': 'Si sawa',
    'option3': 'Sina uhakika', 
    // ... other Kiswahili translations
    'title1': 'Mapendekezo', 
    'Implant': 'pandikiza', 
    'implant': 'pandikiza', 
    'condoms': 'kondomu', 
    'Condoms': 'kondomu', 
    'pills': 'dawa', 
    'Pills': 'dawa', 
    // 'learnMore': 'Jifunze Zaidi',
  },
  'Dholuo': {
    // add all the luo translations 
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
          title: Text("Incomplete Quiz"),
          content: Text("Please answer all questions before submitting the quiz."),
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
      introTexts.add('Based on how you feel about light irregular periods, these methods might be a good choice for you:');
      outroTexts.addAll(RecommendationModel.getOutroTextsBasedOnLightIrregular('Could be OK'));
      break;
    case 'option2': // Not OK
      recommendations.addAll(['Pills, Condoms, IUCD']);
      introTexts.add('Based on how you feel about light irregular periods, these methods might be a good choice for you:');
      outroTexts.addAll(RecommendationModel.getOutroTextsBasedOnLightIrregular('Not OK'));
      break;
    case 'option3': // Not sure 
      recommendations.addAll(['Depo, Implant']);
      introTexts.add('Based on how you feel about light irregular periods, these methods might be a good choice for you:');
      outroTexts.addAll(RecommendationModel.getOutroTextsBasedOnLightIrregular('Not sure'));
      break;
    default:
      break;
  }

  switch (subq12) {
    case 'option1': // 'Could be OK'
      recommendations.addAll(['Depo, Implant']);
      introTexts.add('Based on how you feel about the possibility of your periods stopping, these methods might be a good choice for you:');
      outroTexts.addAll(RecommendationModel.getOutroTextsBasedOnPeriodsStop('Could be OK'));
      break;
    case 'option2': // Not OK
      recommendations.addAll(['Pills, Condoms, IUCD']);
      introTexts.add('Based on how you feel about the possibility of your periods stopping, these methods might be a good choice for you:');
      outroTexts.addAll(RecommendationModel.getOutroTextsBasedOnPeriodsStop('Not OK'));
      break;
    case 'option3': // Not sure 
      recommendations.addAll(['Depo, Implant']);
      introTexts.add('Based on how you feel about the possibility of your periods stopping, these methods might be a good choice for you:');
      outroTexts.addAll(RecommendationModel.getOutroTextsBasedOnPeriodsStop('Not sure'));
      break;
    default:
      break;
  }

  switch (subq13) {
    case 'option1': // 'Could be OK'
      recommendations.addAll(['Depo, Implant, Pills, Condoms, IUCD']);
      introTexts.add('Based on how you feel about your periods getting heavier, the following methods might be a good choice for you');
      outroTexts.addAll(RecommendationModel.getOutroTextsBasedOnPeriodsHeavier('Could be OK'));
      break;
    case 'option2': // Not OK
      recommendations.addAll(['Depo, Implant, Pills, Condoms']);
      introTexts.add('Based on how you feel about your periods getting heavier, these methods might be a good choice for you:');
      outroTexts.addAll(RecommendationModel.getOutroTextsBasedOnPeriodsHeavier('Not OK'));
      break;
    case 'option3': // Not sure 
      recommendations.addAll(['Depo, Implant, Pills, Condoms, IUCD']);
      introTexts.add('Based on how you feel about your periods getting heavier, the following methods might be a good choice for you');
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
      introTexts.add('Based on when you think you want a pregnancy, the following methods may be a good choice for you:');
      outroTexts.addAll(RecommendationModel.getOutroTextsBasedOnPregnancyTiming('More than 1 year'));
      break;
    case 'op2': // In 6-12 months
      recommendations.addAll([
          'Pills, Condoms, Implant, IUCD',
          // 'Start a prenatal vitamin for good pregnancy health.'
        ]);
      //recommendations.addAll(RecommendationModel.getRecommendationsBasedOnPregnancyTiming('In 6-12 months'));
      introTexts.add('Based on when you think you want a pregnancy, the following methods may be a good choice for you:');
       outroTexts.addAll(RecommendationModel.getOutroTextsBasedOnPregnancyTiming('In 6-12 months'));
      break;
    case 'op3': // Now or very soon
      recommendations.addAll([
          'No method, Pills, Condoms',
          // 'Start a prenatal vitamin for good pregnancy health.'
        ]);
      //recommendations.addAll(RecommendationModel.getRecommendationsBasedOnPregnancyTiming('Not sure'));
      introTexts.add('Based on when you think you want a pregnancy, the following methods may be a good choice for you:');
      outroTexts.addAll(RecommendationModel.getOutroTextsBasedOnPregnancyTiming('Now or very soon'));
      break;
  }

  print('Navigating with recommendations: $recommendations');
  

  switch (subq31) {
    case 'option1': // 'Could be OK'
      recommendations.addAll(['Condoms, Implant, IUCD, Depo, Pills']);
      introTexts.add('Based on how long you want a method to last, the following methods might be a good choice for you');
      outroTexts.addAll(RecommendationModel.getOutroTextsBasedOnLastEverytimeSex('Could be OK'));
      break;
    case 'option2': // Not OK
      recommendations.addAll(['Implant, IUCD, Depo, Pills']);
      introTexts.add('Based on how long you want a method to last, the following methods might be a good choice for you');
      outroTexts.addAll(RecommendationModel.getOutroTextsBasedOnLastEverytimeSex('Not OK'));
      break;
    case 'option3': // Not sure 
      recommendations.addAll(['Condoms, Implant, IUCD, Depo, Pills']);
      introTexts.add('Based on how long you want a method to last, the following methods might be a good choice for you');
      outroTexts.addAll(RecommendationModel.getOutroTextsBasedOnLastEverytimeSex('Not sure'));
      break;
    default:
      break;
  }

  print('Navigating with recommendations: $recommendations');

  switch (subq32) {
    case 'option1': // 'Could be OK'
      recommendations.addAll(['Depo, Pills, Condoms']);
      introTexts.add('Based on how long you want a method to last, the following methods might be a good choice for you');
      outroTexts.addAll(RecommendationModel.getOutroTextsBasedOnLast3Months('Could be OK'));
      break;
    case 'option2': // Not OK
      recommendations.addAll(['Implant, IUCD']);
      introTexts.add('Based on how long you want a method to last, the following methods might be a good choice for you');
      outroTexts.addAll(RecommendationModel.getOutroTextsBasedOnLast3Months('Not OK'));
      break;
    case 'option3': // Not sure 
      recommendations.addAll(['Implant, IUCD']);
      introTexts.add('Based on how long you want a method to last, the following methods might be a good choice for you');
      outroTexts.addAll(RecommendationModel.getOutroTextsBasedOnLast3Months('Not sure'));
      break;
    default:
      break;
  }

  print('Navigating with recommendations: $recommendations');

  switch (subq33) {
    case 'option1': // 'Could be OK'
      recommendations.addAll(['Implant, IUCD']);
      introTexts.add('Based on how long you want a method to last, the following methods might be a good choice for you');
      outroTexts.addAll(RecommendationModel.getOutroTextsBasedOnMoreThan1Yr('Could be OK'));
      break;
    case 'option2': // Not OK
      recommendations.addAll(['Depo, Pills, Condoms']);
      introTexts.add('Based on how long you want a method to last, the following methods might be a good choice for you');
      outroTexts.addAll(RecommendationModel.getOutroTextsBasedOnMoreThan1Yr('Not OK'));
      break;
    case 'option3': // Not sure 
      recommendations.addAll(['Implant, IUCD']);
      introTexts.add('Based on how long you want a method to last, the following methods might be a good choice for you');
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
      introTexts.add('Based on how important it is to you to keep your method private, the following methods might be a good choice for you:');
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
      introTexts.add('Based on how important it is to you to keep your method private, the following methods might be a good choice for you:');
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
      introTexts.add('Based on how important it is to you to keep your method private, the following methods might be a good choice for you:');
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
      introTexts.add('Based on how important it is to you to prevent pregnancy, the following methods might be a good choice for you: ');
      outroTexts.addAll(RecommendationModel.getOutroTextsBasedOnFactorsImp('The lowest chance of getting pregnant'));
      break;
    case 'o52':
      recommendations.addAll([
        // 'Condoms',
        // 'Pills',
        'Condoms, Pills'
      ]);
      introTexts.add('Based on how important it is to you to avoid changes to your periods, the following methods might be a good choice for you: ');
      outroTexts.addAll(RecommendationModel.getOutroTextsBasedOnFactorsImp('Avoiding changes to my periods'));
      break;
    case 'o53':
      recommendations.addAll([
        // 'Depo',
        // 'Implant',
        // 'IUCD'
        'Depo, Implant, IUCD'
      ]);
      introTexts.add('Based on how important it is to you to keep your method private, the following methods might be a good choice for you: ');
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
      introTexts.add('Based on how important it is to you to be able to get pregnant in the future, the following methods might be a good choice for you: ');
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
            mainAxisAlignment: MainAxisAlignment.center,
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
                      child: Text('Submit Quiz'),
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
