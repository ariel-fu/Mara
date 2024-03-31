import 'package:flutter/material.dart';
import 'recommendation_model.dart';
class ShortSummariesScreen extends StatelessWidget {
  final String methodName;

  ShortSummariesScreen({Key? key, required this.methodName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String methodSummary = RecommendationModel.getMethodSummary(methodName);

    return Scaffold(
      appBar: AppBar(
        title: Text(methodName),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(methodSummary),
      ),
    );
  }
}