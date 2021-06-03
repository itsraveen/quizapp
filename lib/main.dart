import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

// void main() {
//   runApp(MyApp());
// }
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'Which of the following is correct?',
      'answers': [
        {'text': 'Raveen is handsome', 'score': 0},
        {'text': 'Raveen is charming', 'score': 0},
        {'text': 'Raveen is kind', 'score': 0},
        {'text': 'All of the above', 'score': 1}
      ],
    },
    {
      'questionText': 'What is Raveen\'s birthday and age?',
      'answers': [
        {'text': '02 April 1999, 21', 'score': 1},
        {'text': '02 April 2000, 21', 'score': 0},
        {'text': '02 April 1999, 22', 'score': 0},
        {'text': '02 April 2000, 22', 'score': 0}
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    // setState() calls build() again
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    // The MaterialApp takes in home as a named argument
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
