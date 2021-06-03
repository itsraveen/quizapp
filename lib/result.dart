import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    var resultText = 'You did it!';
    if (resultScore <= 0) {
      resultText = 'you bad bad!';
    } else if (resultScore <= 1) {
      resultText = 'you only got one right';
    } else if (resultScore <= 2) {
      resultText = 'You good good! Got both right! :)';
    } else {
      resultText = 'wot';
    }
    return resultText;
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
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            onPressed: resetHandler,
            child: Text(
              'Restart Quiz!',
            ),
            textColor: Colors.blue,
          )
        ],
      ),
    );
  }
}
