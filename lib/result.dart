import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final VoidCallback goBack;
  final int resultScore;

  Result({required this.goBack, required this.resultScore});

  String get resultPhrase {
    var resultText = "You did it!";
    if (resultScore <= 8) {
      resultText = 'You are awesome and innocent!';
    } else if (resultScore <= 12) {
      resultText = 'Different';
    } else if (resultScore <= 16) {
      resultText = "Superman";
    } else {
      resultText = "You are so bad!";
    }
    return resultText + " " + resultScore.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
              resultPhrase,
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold
              ),
            textAlign: TextAlign.center
          ),
          ElevatedButton(onPressed: goBack, child: Text("Go Back"))
        ],
      ),
    );
  }
}
