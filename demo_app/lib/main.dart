
// import 'package:english_words/english_words.dart';
// import 'package:animated_flip_card/animated_flip_card.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math';
import 'package:just_audio/just_audio.dart';
import 'package:video_player/video_player.dart';
import 'launch_screen.dart';

void main() {
  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => MyAppState(),
//       child: MaterialApp(
//         title: 'Mara App',
//         theme: ThemeData(
//           useMaterial3: true,
//           colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
//         ),
//         home: MyHomePage(),
//       ),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Cat Care',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        ),
        home: LaunchScreen(), // Change this to LaunchScreen
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  late String current;
  var favorites = <String>[];
  var nonfavorites = <String>[];
  var index = 0;
  final List<String> catImages = [
    'assets/images/image1.png',
    'assets/images/image2.png',
    'assets/images/image3.png',
    'assets/images/image4.png'
  ];

  final List<String> captions = ['Kibble', 'Vitamins', 'Litter box', 'Toys'];
  final List<String> descriptions= ['Kibble is really healthy for cats. It is yummy. It is delicious. It is krunchy.', 
                                  'Vitamins are necessary for cats. Cats will be shiny. Cats will be healthy. Cats will be happy.', 
                                  'Litter box is a must for you. The house will be clean. The house will be sparkling. The house will be amazing.', 
                                  'Toys are wanted by cats. Cats love to play. Cats love to chase. Cats love to nap.'];

  MyAppState() {
    current = getCatImage();
  }

  String getCatImage() {
    
    var indexNow = index;
    index++;
    index = index % catImages.length;
    return catImages[indexNow];
  }

  void getNext() {
    String curr = getCurrentCaption();
    if (!nonfavorites.contains(curr)) {
      nonfavorites.add(curr);
    }

    current = getCatImage();
    notifyListeners();
  }

  void toggleFavorite() {
    final currentCaption = getCurrentCaption();
    if (!favorites.contains(currentCaption)) {
      favorites.add(currentCaption);
    } else {
      favorites.remove(currentCaption);
    }
    notifyListeners();
  }

  String getCurrentCaption() {
    return captions[catImages.indexOf(current)];
  }

  String getCurrentDescription() {
    return descriptions[catImages.indexOf(current)];
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;
  bool isSpanish = false;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = GeneratorPage();
        break;
      case 1:
        page = FavoritesPage();
        break;
      case 2:
        page = ExcludedPage();
        break;
      case 3:
        page = FastFactsPage(); // Add the Q&A page
        break;
      case 4:
        page = QuizScreen();
        break;
      case 5:
        page = FAQScreen();
        break;
      case 6:
        page = AudioPage();
        break;
      case 7:
        page = VideoPage();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: Row(
            children: [
              SafeArea(
                child: NavigationRail(
                  extended: constraints.maxWidth >= 600,
                  destinations: [
                    NavigationRailDestination(
                      icon: Icon(Icons.home),
                      label: Text('Cat Needs'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.favorite),
                      label: Text('Favorites'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.clear),
                      label: Text('Discovered'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.grade),
                      label: Text('Fast Facts'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.question_answer),
                      label: Text('Q&A'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.note),
                      label: Text('FAQ'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.audio_file),
                      label: Text('Sounds'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.video_camera_front),
                      label: Text('Videos'),
                    ),
                  ],
                  selectedIndex: selectedIndex,
                  onDestinationSelected: (value) {
                    setState(() {
                      selectedIndex = value;
                    });
                  },
                ),
              ),
              Expanded(
                child: Container(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  child: page,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ExcludedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    if (appState.nonfavorites.isEmpty) {
      return Center(
        child: Text('No excluded yet.'),
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child:
              Text('You have ${appState.nonfavorites.length} non-favorites:'),
        ),
        for (var imageUrl in appState.nonfavorites)
          ListTile(
            leading: Icon(Icons.delete_outline),
            title: Text(imageUrl),
          ),
      ],
    );
  }
}

class AudioPage extends StatefulWidget {
  @override
  State<AudioPage> createState() => _AudioPage();
}

class _AudioPage extends State<AudioPage> {
  final AudioPlayer player1 = AudioPlayer();
  bool isPlaying1 = false;

  final AudioPlayer player2 = AudioPlayer();
  bool isPlaying2 = false;

  @override
  void dispose() {
    super.dispose();
    //releasing resources
    player1.dispose();
    player2.dispose();
  }

  Future<void> _toggleAudio1() async {
    if (isPlaying1) {
      await player1.pause();
      setState(() => isPlaying1 = false);
    } else {
      await player1.setAsset('assets/audio/purr.mp3');
      setState(() => isPlaying1 = true);
      await player1.play();
    }
  }

  Future<void> _toggleAudio2() async {
    if (isPlaying2) {
      await player2.pause();
      setState(() => isPlaying2 = false);
    } else {
      await player2.setAsset('assets/audio/meow.mp3');
      setState(() => isPlaying2 = true);
      await player2.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: Text('Cat Sounds!'),
      ),
      body: Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text('Cats purr when they are happy!', style: TextStyle(
                        fontSize: 18.0, fontWeight:FontWeight.bold
                      ),),
                      Text(' Listen Here: ', style: TextStyle(
                        fontSize: 18.0)),
                      IconButton(
                        icon: Icon(isPlaying1 ? Icons.pause : Icons.play_arrow),
                        onPressed: () async {
                          await _toggleAudio1();
                        },
        ),
                    ],
                  ),

                Text('For many years, researchers have been puzzled on how cats manage to generate the low-frequency vocalizations'),
                Text('typically between 20 and 30 hertz (Hz)—involved in purring.'),

                SizedBox(width: 30, height: 50),

                Column(
                  children: [
                    Text('Cats make screechy meows when they are distressed!', style: TextStyle(
                      fontSize: 18.0, fontWeight:FontWeight.bold
                    ),),
                    Text(' Listen Here: ', style: TextStyle(
                      fontSize: 18.0)),
                    
                    IconButton(
                      icon: Icon(isPlaying2 ? Icons.pause : Icons.play_arrow),
                      onPressed: () async {
                        await _toggleAudio2();
                      },
                    ),
                  ],
                ),
                Text('Why is your cat distressed? There are many, many factors that could have caused this.'),
                Text('Perhaps you forgot to feed your cat lunch. Or, maybe your cat is just moody!'),
              ],   
            ),
        ),
      );
  }
}

class VideoPage extends StatefulWidget {
  @override
  State<VideoPage> createState() => _VideoPage();
}

class _VideoPage extends State<VideoPage> {
  late VideoPlayerController cat1;
  late VideoPlayerController cat2;

  @override
  void initState() {
    super.initState();

    cat1 = VideoPlayerController.asset(
      'assets/video/funnyCat.mp4',
    );

    cat2 = VideoPlayerController.asset(
      'assets/video/funnyCat2.mp4',
    );

    // Initialize asynchronously with error handling
    Future.wait([
      cat2.initialize().then((_) {
        // Handle completion for cat2
        setState(() {}); // Trigger rebuild to display video
      }).catchError((error) {
        // Handle errors for cat2
        print('Error initializing cat2: $error');
      }),
      cat1.initialize().then((_) {
        // Handle completion for cat1
        setState(() {}); // Trigger rebuild to display video
      }).catchError((error) {
        // Handle errors for cat1
        print('Error initializing cat1: $error');
      }),
    ]);
  }

  @override
  void dispose() {
    super.dispose();
    //releasing resources
    cat2.dispose();
    cat1.dispose();
  }

  void _onPressedCat1() {
    setState(() {
      cat1.value.isPlaying ? cat1.pause() : cat1.play();
    });
  }

  void _onPressedCat2() {
    setState(() {
      cat2.value.isPlaying ? cat2.pause() : cat2.play();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Funny Cat Videos!'),
      ),
      body: Column(
        children: [
            Column(
              children: [
                Text('Cat With Red Bandana Has Fun', style: TextStyle(
                  fontSize: 18.0, fontWeight:FontWeight.bold
                ),),
                
                SizedBox(
                  width: 300,
                  height: 200,
                  child: VideoPlayer(cat1),
                ),
                
                IconButton(
                  icon: Icon(
                    cat1.value.isPlaying ? Icons.pause : Icons.play_arrow,
                  ),
                  onPressed: () => _onPressedCat1(),
                ),

                VideoProgressIndicator(
                  cat1,
                  allowScrubbing: true, // Enable scrubbing for seeking
                  padding: const EdgeInsets.all(8.0),
                ),
              ],
            ),
            SizedBox(width: 40, height:40),
            Column(
              children: [
                Text('Black Cat With The Coolest Eye', style: TextStyle(
                  fontSize: 18.0, fontWeight:FontWeight.bold
                )),

                SizedBox(
                  width: 300,
                  height: 200,
                  child: VideoPlayer(cat2),
                ),

                IconButton(
                  icon: Icon(
                    cat2.value.isPlaying ? Icons.pause : Icons.play_arrow,
                  ),
                  onPressed: () => _onPressedCat2(),
                ),

                VideoProgressIndicator(
                  cat2,
                  allowScrubbing: true, // Enable scrubbing for seeking
                  padding: const EdgeInsets.all(8.0),
                ),
              ],
            ),
          ]),
      );
  }
}

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    if (appState.favorites.isEmpty) {
      return Center(
        child: Text('No favorites yet.'),
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('You have ${appState.favorites.length} favorites:'),
        ),
        for (var imageUrl in appState.favorites)
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text(imageUrl),
          ),
      ],
    );
  }
}

class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    IconData icon;
    if (appState.favorites.contains(appState.current)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 20), // Add margin for spacing
            child: Text(
              "Learn more about cats and their needs",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          BigCard(
            imagePath: appState.current,
            caption: appState.captions[appState.catImages.indexOf(appState.current)],
            appState: appState,
            description: appState.descriptions[appState.catImages.indexOf(appState.current)]
          ),
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  appState.toggleFavorite();
                  appState.getNext();
                },
                icon: Icon(icon),
                label: Text('Like'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  appState.getNext();
                },
                child: Text('Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


class FastFactsPage extends StatefulWidget {
  @override
  State<FastFactsPage> createState() => _FastFactsPageState();
}

class _FastFactsPageState extends State<FastFactsPage> {
  bool isSpanish = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fast Facts About Cats (In Spanish Too!)'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              setState(() {
                isSpanish = !isSpanish;
              });
            },
            child: Text(isSpanish ? 'Switch to English' : 'Cambiar a Español'),
          ),
          Expanded(
            child: ListView(
              children: [
                QACard(
                  question: isSpanish ? '¿Cómo ronronean los gatos?' : 'How do cats purr?',
                  answer: isSpanish
                      ? 'Los gatos producen el sonido del ronroneo utilizando sus cuerdas vocales.'
                      : 'Cats produce the sound of purring by using their vocal cords.',
                ),
                QACard(
                  question: isSpanish ? '¿Cuál es la esperanza de vida promedio de un gato?' : 'What is a cat\'s average lifespan?',
                  answer: isSpanish
                      ? 'La esperanza de vida promedio de un gato es de alrededor de 12-15 años.'
                      : 'The average lifespan of a cat is around 12-15 years.',
                ),
                // Add more QACard widgets with different questions and answers
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class QACard extends StatelessWidget {
  final String question;
  final String answer;

  const QACard({
    Key? key,
    required this.question,
    required this.answer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Q: $question',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('A: $answer'),
          ],
        ),
      ),
    );
  }
}


class BigCard extends StatelessWidget {
  const BigCard({
    Key? key,
    required this.imagePath,
    required this.caption,
    required this.appState,
    required this.description
  }) : super(key: key);

  final String imagePath;
  final String caption;
  final MyAppState appState;
  final String description;

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      front: _buildCardSide(imagePath, context),
      back: _buildBackCardSide(context, description), // Replace with your text
    );
  }

  Card _buildCardSide(String imageUrl, BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primary,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Image.asset(
              imagePath,
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(caption, style: TextStyle(fontSize: 16, color: Colors.white)),
          ),
        ],
      ),
    );
  }

Widget _buildBackCardSide(BuildContext context, String textContent) {
  return Card(
    color: Theme.of(context).colorScheme.primary,
    child: Container(
      width: 220,
      height: 220,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Text(
            textContent,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ),
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
