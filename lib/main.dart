import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/quiz.dart';
import 'package:flutter_complete_guide/result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _MyAppState();
  }
}

// final is a variable that doesn't change. If doesn't change after created
// const compile time constant, not like final, that is runtime constant. Already after you wrote the code is locked
// all is a object
// const question = const []. Addresses to object in memory.
// var questions = const []. You can assign a new value for questions. But const in value can be change

class _MyAppState extends State {
  final String title = "APK para jenny";

  // const build time is a runtime constant
  final _questions = const [
    {
      'title': "What's your favorite color?",
      'answers': [
        {"text": "Blue", "score": 1},
        {"text": "White", "score": 2},
        {"text": "Black", "score": 3},
        {"text": "Red", "score": 4},
        {"text": "Yellow", "score": 5},
      ]
    },
    {
      'title': "Some more colors?",
      'answers': [
        {"text": "Violet", "score": 1},
        {"text": "Brown", "score": 2},
        {"text": "Noise", "score": 3},
        {"text": "Green", "score": 4},
        {"text": "Ruby", "score": 5},
      ]
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      if (_questionIndex < _questions.length) {
        _questionIndex = _questionIndex + 1;
      }
    });
  }

  void _goBack() {
    setState(() {
      _questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text(this.title),
          ),
          body: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                )
              : Result(goBack: _goBack, resultScore: _totalScore))
    );
  }
}
