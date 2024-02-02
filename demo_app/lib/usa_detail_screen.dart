import 'package:flutter/material.dart';

class USADetailScreen extends StatefulWidget {
  @override
  _USADetailScreenState createState() => _USADetailScreenState();
}

class _USADetailScreenState extends State<USADetailScreen> {
  bool isEnglish = true; // Default language is English

  // Define text content in both English and Swahili
  final Map<String, String> content = {
    'english': 'The United States of America is home to a diverse cat population. Cats in the USA are cherished companions, and they play various roles in households and communities.',
    'swahili': 'Marekani ni nyumbani kwa idadi tofauti ya paka. Paka Marekani wanathaminiwa na wanacheza jukumu mbalimbali katika nyumba na jamii.',
  };

  final Map<String, List<String>> keyInformation = {
    'english': [
      'Key Information:',
      '- The American Shorthair is one of the most popular cat breeds in the USA.',
      '- Cats are often adopted from animal shelters and rescue organizations.',
      '- Many cities have cat cafes where you can enjoy coffee and spend time with cats.',
    ],
    'swahili': [
      'Taarifa muhimu:',
      '- American Shorthair ni moja ya nyoka maarufu sana nchini Marekani.',
      '- Paka mara nyingi huchukuliwa kutoka kwa makazi ya wanyama na mashirika ya uokoaji.',
      '- Miji mingi ina kafe za paka ambapo unaweza kufurahia kahawa na kutumia muda na paka.',
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cats in USA'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isEnglish = !isEnglish;
                    });
                  },
                  child: Text(isEnglish ? 'Swahili' : 'English'),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              'Cats in the USA',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              isEnglish ? content['english']! : content['swahili']!,
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  isEnglish ? keyInformation[isEnglish ? 'english' : 'swahili']![0] : keyInformation[isEnglish ? 'swahili' : 'english']![0],
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                for (String info in keyInformation[isEnglish ? 'english' : 'swahili']!.sublist(1))
                  Text(
                    info,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

