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
        "Blue",
        "Black",
        "White",
      ]
    },
    {
      'title': "What's your favorite animal?",
      'answers': ["Lion", "Dolphin", "Tiger"]
    },
  ];
  var _questionIndex = 0;

  void _answerQuestion() {
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
              : Result(goBack: _goBack))
    );
  }
}
