import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class USADetailScreenGSheet extends StatefulWidget {
  @override
  _USADetailScreenStateGSheet createState() => _USADetailScreenStateGSheet();
}

class _USADetailScreenStateGSheet extends State<USADetailScreenGSheet> {
  Map<String, dynamic> _data = {};
  String language = "English";
  String _title = "";
  String _description = "";
  String _subtitle = "";
  String _subdescription = "";
  
  var isEnglish = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final String apiUrl = 'https://script.google.com/macros/s/AKfycbyM7dh9TTAFWYUnwlfFoGzpejXFEsNxBoVhrOkFbiPVUxfrTWgeuKW03R12pEGF7hnI1Q/exec?sheetName=$language';
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        print(response.body);
        setState(() {
          _data = json.decode(response.body);
          _title = _data['title'] ?? 'No title';
          _description = _data['description'] ?? 'No description';
          _subtitle = _data['subtitle'] ?? 'No subtitle';
          _subdescription = _data['subdescription'] ?? 'No subdescription';
          print(_data);
        });
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print('Caught exception: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
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
                      if (isEnglish) {
                        language = "English";
                        fetchData();
                      } else {
                        language = "Swahili";
                        fetchData();
                      }
                    });
                  },
                  child: Text(isEnglish? "Swahili" : "English"),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              _title,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              _description,
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  _subtitle,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                //for (String info in keyInformation[isEnglish ? 'english' : 'swahili']!.sublist(1))
                  Text(
                    _subdescription,
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

