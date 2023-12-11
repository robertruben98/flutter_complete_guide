import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final VoidCallback goBack;

  Result({required this.goBack});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text("You did it!"),
          ElevatedButton(onPressed: goBack, child: Text("Go Back"))
        ],
      ),
    );
  }
}
