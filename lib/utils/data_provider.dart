import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:my_meteorology_quiz_app/models/question.dart';

class DataProvider {
  static Future<List<Question>> getQuestions() async {
    final String response = await rootBundle.loadString('assets/questions.json');
    final List<dynamic> data = jsonDecode(response);

    return data.map((item) {
      return Question(
        questionText: item['questionText'],
        options: List<String>.from(item['options']),
        correctOptionIndex: item['correctOptionIndex'],
      );
    }).toList();
  }
}
