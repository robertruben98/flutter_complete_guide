import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  String title;
  final VoidCallback selectHandler;

  Answer(this.title, this.selectHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.purple
        ),
        child: Text(title),
        onPressed: selectHandler,
      )
    );
  }
}
