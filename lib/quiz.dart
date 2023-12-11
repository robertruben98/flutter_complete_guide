import 'package:flutter/material.dart';

import 'package:flutter_complete_guide/question.dart';
import 'answer.dart';

class Quiz extends StatelessWidget {
  final VoidCallback answerQuestion;
  final List<Map<String, Object>> questions;
  final int questionIndex;

  Quiz(
      {
        required this.answerQuestion,
        required this.questions,
        required this.questionIndex
      });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[questionIndex]['title'] as String),
        ...(questions[questionIndex]['answers'] as List<String>)
            .map((answer) => Answer(answer, answerQuestion))
            .toList()
      ],
    );
  }
}
