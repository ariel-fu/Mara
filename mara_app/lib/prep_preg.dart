import 'package:flutter/material.dart';



class PrepPage extends StatefulWidget {
  final String initialLanguage;

  PrepPage({Key? key, required this.initialLanguage}) : super(key: key);

  @override
  _PrepPageState createState() => _PrepPageState();
}

class _PrepPageState extends State<PrepPage> {
  List<bool> _isOpen = [false, false, false, false];
  late String _currentLanguage;

  @override
  void initState() {
    super.initState();
    _currentLanguage = widget.initialLanguage;
  }

  final Map<String, Map<String, String>> _translations = {
    'Preparing for a Healthy Pregnancy': {
      'Kiswahili': 'Kujiandaa kwa Ujauzito Wenye Afya',
      'Dholuo': 'Kujiandaa kwa Ujauzito Wenye Afya Luo',
      'English': 'Preparing for a Healthy Pregnancy',
    },
    'Detailed content goes here...': {
    'Kiswahili': 'Maelezo ya kina yanaenda hapa...',
    'Dholuo': 'Tim mabeyo manogi...',
    'English': 'Detailed content goes here...',
  },
  'Content Title 1': {
    'Kiswahili': 'Kichwa cha Maudhui 1',
    'Dholuo': 'Nyimbo Mar Dhok 1',
    'English': 'Content Title 1',
  },
    // Add other translations here
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
    return Scaffold(
      appBar: AppBar(
        title: Text(_t('Preparing for a Healthy Pregnancy')),
      ),
      body: ListView(
        children: <Widget>[
          // Language selection buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: ['Kiswahili', 'Dholuo', 'English']
                .map((language) => languageButton(language))
                .toList(),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/preg_woman.png',
                  width: 150,
                  height: 150,
                  fit: BoxFit.contain,
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _t('Preparing for a Healthy Pregnancy'),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Are you ready? Tap each check mark to learn about ways to promote a healthy pregnancy.',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ...List.generate(_isOpen.length, (index) {
            return Card(
              child: Column(
                children: [
                  ListTile(
                    leading: Checkbox(
                      value: _isOpen[index],
                      onChanged: (bool? value) {
                        setState(() {
                          _isOpen[index] = value!;
                        });
                      },
                    ),
                    title: Text(_t('Content Title ${index + 1}')),
                    onTap: () {
                      setState(() {
                        _isOpen[index] = !_isOpen[index];
                      });
                    },
                  ),
                  if (_isOpen[index])
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0).copyWith(bottom: 16.0),
                      child: Text(_t('Detailed content goes here...')),
                    ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
Widget languageButton(String language) {
  bool isSelected = _currentLanguage == language;
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: ElevatedButton(
      onPressed: () => _changeLanguage(language),
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.grey : null,
      ),
      child: Text(language),
    ),
  );
}
}