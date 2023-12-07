import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/answer.dart';
import 'package:flutter_complete_guide/question.dart';

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
  var _questionIndex = 0;

  @override
  Widget build(BuildContext context) {
    // const build time is a runtime constant
    const questions = [
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

    void _answerQuestion() {
      setState(() {
        if (_questionIndex < questions.length) {
          _questionIndex = _questionIndex + 1;
        }
      });
    }

    void _goBack() {
      setState(() {
        _questionIndex = 0;
      });
    }

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text(this.title),
          ),
          body: _questionIndex < questions.length
              ? Column(
                  children: [
                    Question(questions[_questionIndex]['title'] as String),
                    ...(questions[_questionIndex]['answers'] as List<String>)
                        .map((answer) => Answer(answer, _answerQuestion))
                        .toList()
                  ],
                )
              : Center(
                  child: Column(
                    children: [
                      Text("You did it!"),
                      ElevatedButton(onPressed: _goBack, child: Text("Go Back"))
                    ],
                  ),
                )),
    );
  }
}
