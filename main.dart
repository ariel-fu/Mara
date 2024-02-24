import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double roundnessFactor = 50.0;

    path.moveTo(0, size.height * 0.3);
    path.lineTo(0, size.height - roundnessFactor);
    path.quadraticBezierTo(0, size.height, roundnessFactor, size.height);
    path.lineTo(size.width - roundnessFactor, size.height);
    path.quadraticBezierTo(size.width, size.height, size.width, size.height - roundnessFactor);
    path.lineTo(size.width, roundnessFactor * 2);
    path.quadraticBezierTo(size.width, 0, size.width - roundnessFactor * 2, roundnessFactor * 2);
    path.lineTo(roundnessFactor, size.height * 0.3 + roundnessFactor);
    path.quadraticBezierTo(0, size.height * 0.3, 0, size.height * 0.3 + roundnessFactor * 2);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'What are my options?',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? _selectedMethod;
  String? _selectedDetails;
  String _language = 'English'; // Default language

  final Map<String, Map<String, String>> translations = {
    'Method 1': {
      'English': 'Details about Method 1',
      'Kiswahili': 'Maelezo kuhusu Njia 1',
      'Dholuo': 'Wach mar Jodong’ 1',
    },
  };

  void _showContraceptiveInfo(String contraceptiveName) {
    String details = translations[contraceptiveName]?[_language] ?? 'Details not available';
  setState(() {
      _selectedMethod = contraceptiveName;
      _selectedDetails = translations[contraceptiveName]?[_language];
    });

  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent, 
    builder: (BuildContext context) {
      return Container(
        color: Colors.transparent, 
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0),
            ),
          ),
          child: Wrap(
            children: <Widget>[
              ListTile(
                title: Text(
                  contraceptiveName,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(details),
              ),
              ListTile(
                title: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Close'),
                ),
              ),
            ],
          ),
        ),
      );
    },
  ).then((value) {
    // Clear the selection when the bottom sheet is closed
    setState(() {
      _selectedMethod = null;
      _selectedDetails = null;
    });
  });
}

Widget languageButton(String language) {
    return OutlinedButton(
      onPressed: () => _changeLanguage(language),
      child: Text(language),
      style: OutlinedButton.styleFrom(
        primary: Colors.black,
        side: BorderSide(color: Colors.black),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }

  void _changeLanguage(String lang) {
    setState(() {
      _language = lang;
      if (_selectedMethod != null) {
        _selectedDetails = translations[_selectedMethod!]?[_language];
      }
    });
  }


 Widget buildIcon(BuildContext context, String assetName, String methodName) {
  bool isSelected = _selectedMethod == methodName;
  String methodDetails = translations[methodName]?[_language] ?? 'Details not available';

  return GestureDetector(
    onTap: () => _showContraceptiveInfo(methodName),
    child: Container(
      decoration: isSelected ? BoxDecoration(
        border: Border.all(color: Colors.black, width: 3),
        borderRadius: BorderRadius.circular(8),
      ) : null,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Opacity(
          opacity: isSelected ? 0.5 : 1.0,
          child: Image.asset(assetName, height: 80),
        ),
      ),
    ),
  );
}


  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('What are my options?'),
      backgroundColor: Colors.white, // Explicitly set the AppBar's background to white
      foregroundColor: Colors.black, // Ensures the title and other icons are in contrast color, usually black
    ),
    body: Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            languageButton('Kiswahili'),
            SizedBox(width: 8), // Space between buttons
            languageButton('Dholuo'),
            SizedBox(width: 8), // Space between buttons
            languageButton('English'),
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Add padding if needed to position the icons lower
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              buildIcon(context, 'assets/method_1.png', 'Method 1'),
                              buildIcon(context, 'assets/method_2.png', 'Method 2'),
                              buildIcon(context, 'assets/method_3.png', 'Method 3'),
                            ],
                          ),
                        ),
                        Flexible(
                          child: Image.asset('assets/woman_img.png', height: MediaQuery.of(context).size.height * 0.55),
                        ),
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              buildIcon(context, 'assets/method_4.png', 'Method 4'),
                              buildIcon(context, 'assets/method_5.png', 'Method 5'),
                              buildIcon(context, 'assets/method_6.png', 'Method 6'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
}
