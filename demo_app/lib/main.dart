import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue, 
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cats'),
      ),
      drawer: AppDrawer(), 
      body: Center(
        child: Text(
          'All things cats!',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.lightGreen,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            title: Text('Quiz Section'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => QuizScreen()));
            },
          ),
                   ListTile(
            title: Text('FAQ Section'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => FAQScreen()));
            },
          ),
        ],
      ),
    );
  }
}

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<Map<String, dynamic>> questions = [
    {
      'question': 'Which country has the most cats?',
      'options': ['USA', 'China', 'Brazil', 'France'],
      'correctAnswer': 'USA',
    },
    {
      'question': 'Are cats intelligent?',
      'options': ['Yeah', 'No', 'Maybe?', 'I have no idea'],
      'correctAnswer': 'Yeah',
    },
    {
      'question': 'Do you love cats?',
      'options': ['Yeah', 'Of course!', 'They are awesome!!', 'I adore them'],
      'correctAnswer': 'They are awesome!!',
    },
  ];

  int currentQuestionIndex = 0;
  String? selectedAnswer;

  void checkAnswer(String answer) {
    setState(() {
      selectedAnswer = answer;
    });
  }

  void nextQuestion() {
    setState(() {
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
        selectedAnswer = null;
      } else {
        currentQuestionIndex = 0;
        selectedAnswer = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> currentQuestion = questions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('Cat Quiz'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Question ${currentQuestionIndex + 1}:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              currentQuestion['question'],
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 20.0),
            Column(
              children: List<Widget>.generate(currentQuestion['options'].length, (index) {
                String option = currentQuestion['options'][index];
                bool isSelected = option == selectedAnswer;

                return RadioListTile(
                  title: Text(option),
                  value: option,
                  groupValue: selectedAnswer,
                  onChanged: (value) {
                    checkAnswer(value.toString());
                  },
                );
              }),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                nextQuestion();
              },
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}

class FAQScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQ Section'),
      ),
      body: FAQList(),
    );
  }
}

class FAQList extends StatelessWidget {
  final List<Map<String, String>> faqList = [
    {
      'question': 'Which country has the most cats?',
      'answer': 'USA.'
    },
    {
      'question': 'Why does everyone love cats?',
      'answer': 'Because they are cute.'
    },
    {
      'question': 'Where are cats mostly found?',
      'answer': 'At home."'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: faqList.length,
      itemBuilder: (context, index) {
        return FAQItem(
          question: faqList[index]['question']!,
          answer: faqList[index]['answer']!,
        );
      },
    );
  }
}

class FAQItem extends StatefulWidget {
  final String question;
  final String answer;

  FAQItem({required this.question, required this.answer});

  @override
  _FAQItemState createState() => _FAQItemState();
}

class _FAQItemState extends State<FAQItem> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(widget.question),
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          trailing: Icon(isExpanded ? Icons.expand_less : Icons.expand_more),
        ),
        if (isExpanded)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(widget.answer),
          ),
        Divider(),
      ],
    );
  }
}


