import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/question.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _MyAppState();
  }
}

class _MyAppState extends State {
  String title = "APK para jenny";
  var _questionIndex = 0;
  var questions = ["Naruto", "Meliodas", "Goku"];

  void _answerQuestion() {
    setState(() {
      if (_questionIndex < questions.length - 1) {
        _questionIndex = _questionIndex + 1;
      } else {
        _questionIndex = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text(this.title),
          ),
          body: Column(
            children: [
              Question(questions[_questionIndex]),
              ElevatedButton(
                  onPressed: _answerQuestion, child: Text("Answer 1")),
              // ElevatedButton(
              //     onPressed: answerQuestion,
              //     child: Text("Select 2")),
              // ElevatedButton(
              //     onPressed: answerQuestion,
              //     child: Text("Select 3"))
            ],
          )),
    );
  }
}
