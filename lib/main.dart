import 'package:flutter/material.dart';
import 'package:projects/quiz.dart';
import 'package:projects/result.dart';

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
      'questionText': 'What\'s your favorite Actor?',
      'answers': [
        {'text': 'Tom Cruise', 'score': 7},
        {'text': 'Leonardo Dicaprio', 'score': 5},
        {'text': 'Will Smith', 'score': 3},
        {'text': 'Robert Downey Jr.', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favorite movie?',
      'answers': [
        {'text': 'Harry Potter', 'score': 8},
        {'text': 'Game of thrones', 'score': 6},
        {'text': 'Batman', 'score': 4},
        {'text': 'Spider man', 'score': 2},
      ],
    },
    {
      'questionText': 'Who\'s your favorite Actress?',
      'answers': [
        {'text': 'Angelina Jolie', 'score': 10},
        {'text': 'Keira Knightley', 'score': 15},
        {'text': 'Scarlett Johansson', 'score': 20},
        {'text': 'Megan Fox', 'score': 5},
      ],
    },
    {
      'questionText': 'Which one is the longest film to be shown in Cinema?',
      'answers': [
        {'text': 'Grandmother Martha', 'score': 30},
        {'text': 'The Clock', 'score': 35},
        {'text': 'The Cure of Insomnia', 'score': 40},
        {'text': 'Heimat:A Chronicle of Germany', 'score': 45},
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
    setState(() {
      _questionIndex += 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Quiz App'),
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
