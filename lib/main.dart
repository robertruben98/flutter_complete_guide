import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new MyAppState();
  }
}

class MyAppState extends State{
  String title = "APK para jenny";
  var questionIndex = 0;
  var questions = ["Naruto", "Meliodas", "Goku"];

  void answerQuestion() {
    setState(() {
      if (questionIndex < questions.length - 1) {
        questionIndex = questionIndex + 1;
      } else {
        questionIndex = 0;
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
          body: Row(
            children: [
              Text(
                questions[questionIndex]
              ),
              ElevatedButton(
                  onPressed: answerQuestion,
                  child: Text("Answer 1")),
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
