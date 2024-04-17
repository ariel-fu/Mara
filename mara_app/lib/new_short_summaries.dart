import 'package:flutter/material.dart';
import 'package:mara_app/recommendation_model.dart';

class MethodDetailsScreen extends StatefulWidget {
  final String methodName;
  final Map<String, dynamic>? methodDetails;
  final String currentLanguage;
  final Map<String, Map<String, String>> translations;
  final Function(String) onChangeLanguage;

  MethodDetailsScreen({
    Key? key,
    required this.methodName,
    this.methodDetails,
    required this.currentLanguage,
    required this.translations,
    required this.onChangeLanguage,
  }) : super(key: key);

  @override
  State<MethodDetailsScreen> createState() => _MethodDetailsScreenState();
}

class _MethodDetailsScreenState extends State<MethodDetailsScreen> {
  late String _currentLanguage;

  @override
  void initState() {
    super.initState();
    _currentLanguage = widget.currentLanguage;
  }

  String _t(String key) {
    String translation = widget.translations[_currentLanguage]?[key] ?? key;
    debugPrint('Current Language: $_currentLanguage');
  debugPrint('Key: $key');
  debugPrint('Translation: $translation');
    return widget.translations[_currentLanguage]?[key] ?? key;
}


  Widget _languageButton(String language) {
    bool isSelected = _currentLanguage == language;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ElevatedButton(
        onPressed: () {
          if (!isSelected) {
            setState(() {
              _currentLanguage = language;
            });
            widget.onChangeLanguage(language);
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Colors.grey : null,
        ),
        child: Text(language),
      ),
    );
  }

@override
Widget build(BuildContext context) {
  if (widget.methodDetails == null) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Error'),
      ),
      body: Center(child: Text('No data available for ${widget.methodName}')),
    );
  }

  String methodName = widget.methodDetails?['name']?[_currentLanguage] ?? widget.methodName;
  // String iconPath = widget.methodDetails?['icon'] ?? 'assets/method_default.png';
  String subtitle = widget.methodDetails?['subtitles']?[_currentLanguage] ?? '';

  return Scaffold(
    appBar: AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back), 
        onPressed: () => Navigator.of(context).pop(), 
      ),
      title: Text(_t('summaryPage')),
    ),
    body: ListView(
      padding: EdgeInsets.all(8.0),
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: ['Kiswahili', 'Dholuo', 'English'].map(_languageButton).toList(),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(RecommendationModel.getIconForRecommendation(widget.methodName), size: 50),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(methodName, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      Text(subtitle, style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic)), // Subtitle displayed here
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        buildContentCard('assets/birth_control_new.png', '', 'how_it_works'),
        buildContentCard('assets/period_new.png', 'what_period', 'side_effects'),
        buildContentCard('assets/calendar_new.png', 'how_long', 'lasts'),
        buildContentCard('assets/chance_new.png', 'how_effective', 'effectiveness'),
        buildContentCard('assets/privacy_new.png', 'can_private', 'privacy'),
        buildContentCard('assets/preg_woman_new.png', 'ready_to_have_baby', 'fertility'),
      ],
    ),
  );
}

Widget buildContentCard(String iconPath, String titleKey, String contentKey) {
  String translatedTitle = widget.methodDetails?[titleKey]?[_currentLanguage] ?? '';
  String content = widget.methodDetails?[contentKey]?[_currentLanguage] ?? 'No information available';

  // Check if a title is provided, if not, adjust layout accordingly.
  bool hasTitle = translatedTitle.isNotEmpty;

  return Container(
    margin: EdgeInsets.only(bottom: 10),
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.grey.shade200,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(iconPath, width: 44, height: 44),
        SizedBox(width: 10),
        Expanded(
          child: hasTitle
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    translatedTitle,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    content,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              )
            : Text(
                content,
                style: TextStyle(fontSize: 16),
              ),
        ),
      ],
    ),
  );
}
}
