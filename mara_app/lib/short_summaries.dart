import 'package:flutter/material.dart';

class MethodDetailsScreen extends StatefulWidget {
  final String methodName;
  final Map<String, dynamic>? methodDetails; // Allow null for methodDetails
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
  _MethodDetailsScreenState createState() => _MethodDetailsScreenState();
}

class _MethodDetailsScreenState extends State<MethodDetailsScreen> {
  Map<String, bool> contentVisible = {
    'how_it_works': false,
    'side_effects': false,
    'preg_chances': false,
  'privacy': false,
  'periods': false,
    // Add other categories as needed
  };
  late String _currentLanguage;

  @override
  void initState() {
    super.initState();
    _currentLanguage = widget.currentLanguage;
  }


  void toggleContentVisibility(String category) {
    setState(() {
      contentVisible[category] = !(contentVisible[category] ?? false);
    });
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
        backgroundColor: isSelected ? Colors.grey : null, // Grey if selected
      ),
      child: Text(language),
    ),
  );
}

  

@override
Widget build(BuildContext context) {
  // Check if methodDetails is null
  if (widget.methodDetails == null) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Error'),
      ),
      body: Center(child: Text('No data available for ${widget.methodName}')),
    );
  }


  String howItWorks = widget.methodDetails?['how_it_works'] ?? 'No information available';
  String sideEffects = widget.methodDetails?['side_effects'] ?? 'No information available';
  String periodsEffects = widget.methodDetails?['periods'] ?? 'No information available';
  String pregEffects = widget.methodDetails?['preg_chances'] ?? 'No information available';
  String privacyEffects = widget.methodDetails?['privacy'] ?? 'No information available';
  // Extract the icon path
  String iconPath = widget.methodDetails?['icon'] ?? 'assets/method_1.png'; // default icon if not available
  // String imagePath = widget.methodDetails?['use_image'] ?? 'assets/birth_control.png'; // default image if not available
  return Scaffold(
    appBar: AppBar(
      title: Text('Learn More About ${widget.methodName}'),
    ),
    body: Column(
      children: [
        
        // Language Buttons
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _languageButton('Kiswahili'),
              _languageButton('Dholuo'),
              _languageButton('English'),
            ],
          ),
        ),
        // Method Title and Icon centered
        // Method Title and Icon in the center
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisSize: MainAxisSize.min, // Aligns the row's children in the center
              children: [
                Image.asset(iconPath, width: 50, height: 50), // Icon
                SizedBox(width: 10), // Space between icon and text
                Text(widget.methodName, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)), // Method Name
                // SizedBox(width: 10), // Space between text and image
                // Image.asset(imagePath, width: 50, height: 50), // Additional Imag
              ],
            ),
          ),
        ),
      //   Container(
      //   padding: EdgeInsets.all(16.0),
      //   child: Row(
      //     children: [
      //       Image.asset(iconPath, width: 50, height: 50),
      //       SizedBox(width: 10),
      //       Text(widget.methodName, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      //     ],
      //   ),
      // ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.all(8.0),
            children: [
              buildToggleCard('how_it_works', Icons.medical_information, 'How It Works', howItWorks),
              buildToggleCard('side_effects', Icons.warning, 'Side Effects', sideEffects),
              buildToggleCard('periods', Icons.water_drop, 'Period Effects', periodsEffects), 
              buildToggleCard('privacy', Icons.remove_red_eye, 'Privacy', privacyEffects),
               buildToggleCard('preg_chances', Icons.pregnant_woman, 'Pregnancy chances', pregEffects),
              // Add more cards as needed
            ],
          ),
        ),
      ],
    ),
  );
}


Widget buildToggleCard(String category, IconData icon, String tooltip, String content) {
  return Card(
    margin: EdgeInsets.all(10.0),
    child: InkWell(
      onTap: () => toggleContentVisibility(category),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, size: 44), // Icon
            SizedBox(width: 10), // Space between icon and text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tooltip,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Visibility(
                    visible: contentVisible[category] ?? false,
                    child: Text(
                      content,
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}





IconData getCategoryIcon(String category) {
  switch (category) {
    case 'how_it_works':
      return Icons.info_outline; 
    case 'side_effects':
      return Icons.warning_amber_outlined; 
    case 'preg_chances':
      return Icons.pregnant_woman; 
    case 'periods':
      return Icons.water_drop;
    case 'privacy':
      return Icons.remove_red_eye; 
    // Add other cases for each category
    default:
      return Icons.help_outline; // Fallback icon
  }
}

String getCategoryTooltip(String category) {
  switch (category) {
    case 'how_it_works':
      return 'How It Works'; 
    case 'side_effects':
      return 'Side Effects';
    case 'preg_chances':
      return 'Pregnancy chances'; 
    case 'periods':
      return 'Periods';
    case 'privacy':
      return 'Privacy'; 
    // Add other cases for each category
    default:
      return 'Info'; // Fallback tooltip
  }
}


  Widget buildToggleIcon(String category, IconData icon, String tooltip) {
    return GestureDetector(
      onTap: () => toggleContentVisibility(category),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 50),
          Text(tooltip, textAlign: TextAlign.center),
        ],
      ),
    );
  }

  Widget buildContent(String category, String content) {
    return Visibility(
      visible: contentVisible[category] ?? false,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        alignment: Alignment.center,
        child: Text(
          content,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
