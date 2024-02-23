import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: QuizScreen(),
    );
  }
}

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
    'subq1', // Light, irregular periods
    'subq2', // Periods might stop
    'subq3', // Periods might get heavier
    // ... other subquestions
  ];

  final List<String> optionKeys = [
    'option1', // Could be OK
    'option2', // Not OK
    'option3', // Not sure
    // ... other options
  ];


final Map<String, Map<String, String>> _translations = {
  'English': {
    'title': 'Quiz', 
    'q1': 'How do you feel about changes to your periods?', 
    'q2': 'If you had to guess, when do you think you might want a pregnancy?', 
    'q3': 'How long do you want your method to last?', 
    'subq1': 'Light, irregular periods',
    'option1': 'Could be OK',
    'option2': 'Not OK', 
    'option3': 'Not sure'
    // ... other English translations
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
  },
  'Dholuo': {
    // add all the luo translations 
  }
};

void _changeLanguage(String language) {
  setState(() {
    _currentLanguage = language;
  });
}

 void _handleOptionSelection(String subQuestionKey, String optionKey) {
  setState(() {
    _selectedOptions[subQuestionKey] = optionKey;
  });
}


String _t(String key) {
  return _translations[_currentLanguage]?[key] ?? key;
}

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text(_t('title')), // call translation method
    ),
    body: Column(
      children: <Widget>[
        // Language selection buttons
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
              quizSection(context, _t('q1'), [
                _t('Light, irregular periods'),
                _t('Periods might stop'),
                _t('Periods might get heavier'),
              ]),
              quizSection(context, _t('If you had to guess, when do you think you might want a pregnancy?'), [
                _t('More than 1 year'),
                _t('In 6-12 months'),
                _t('Now or very soon'),
              ]),
              quizSection(context, _t('How long do you want your method to last?'), [
                _t('Lasts more than a year'),
                _t('Lasts 3 months or less'),
                _t('Use every time you have sex'),
              ]),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget languageButton(String language) {
    bool isSelected = _currentLanguage == language;
    return OutlinedButton(
      onPressed: () => _changeLanguage(language),
      child: Text(language),
      style: OutlinedButton.styleFrom(
        backgroundColor: isSelected ? Colors.grey : Colors.white,
        primary: Colors.black,
        side: BorderSide(color: isSelected ? Colors.black : Colors.grey),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }

Widget quizSection(BuildContext context, String questionTextKey, List<String> subQuestionKeys) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(_t(questionTextKey), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        for (String subQuestionKey in subQuestionKeys) ...[
          Divider(color: Colors.black),
          ListTile(
            title: Text(_t(subQuestionKey)), 
            subtitle: Wrap(
              spacing: 8.0,
              children: optionKeys.map((optionKey) {
                String translatedOption = _t(optionKey);
                String selectedOptionKey = _selectedOptions[subQuestionKey] ?? '';

                return ChoiceChip(
                  label: Text(translatedOption),
                  selected: selectedOptionKey == optionKey,
                  onSelected: (selected) {
                    _handleOptionSelection(subQuestionKey, optionKey);
                  },
                  selectedColor: Colors.purple.shade200,
                );
              }).toList(),
            ),
          ),
        ]
      ],
    ),
  );
}
}