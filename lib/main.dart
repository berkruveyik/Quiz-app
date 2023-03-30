import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText':
          'Q1.Which of the following is not an object-oriented programming language?',
      'answers': [
        {'text': 'Java', 'score': -2},
        {'text': 'Python', 'score': -2},
        {'text': 'C++', 'score': 10},
        {'text': 'HTML', 'score': -2},
      ],
    },
    {
      'questionText':
          'Q2. What is the purpose of a conditional statement in programming?',
      'answers': [
        {'text': 'To loop through code', 'score': -2},
        {'text': 'To define variables', 'score': -2},
        {'text': 'Web Development Kit', 'score': 10},
        {'text': 'Web Development Kit', 'score': -2},
      ],
    },
    {
      'questionText':
          ' Q3. What is the purpose of a conditional statement in programming?',
      'answers': [
        {'text': 'To loop through code', 'score': -2},
        {'text': 'To define variables', 'score': -2},
        {'text': 'To perform mathematical operations', 'score': -2},
        {'text': 'To execute code based on a condition', 'score': 10},
      ],
    },
    {
      'questionText':
          'Q4. What is the difference between an abstract class and an interface?',
      'answers': [
        {
          'text':
              'An abstract class can be instantiated, while an interface cannot',
          'score': -4
        },
        {
          'text':
              ' An abstract class can implement methods, while an interface cannot',
          'score': -5
        },
        {
          'text':
              'An interface can have default method implementations, while an abstract class cannot',
          'score': -5
        },
        {
          'text':
              ' An abstract class can have constructor implementations, while an interface cannot',
          'score': 10
        },
      ],
    },
    {
      'questionText': 'Q5. What is the purpose of a binary search algorithm?',
      'answers': [
        {'text': 'To sort a list of numbers in ascending order', 'score': -4},
        {'text': 'To find the largest number in a list ', 'score': -5},
        {
          'text':
              ' To find a specific value in a sorted list more efficiently than a linear search',
          'score': 10
        },
        {
          'text': ' To compare two lists of numbers and find their differences',
          'score': -5
        },
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
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Quiz App'),
          backgroundColor: Color.fromARGB(255, 116, 39, 179),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 131, 104, 211),
                Color.fromARGB(255, 139, 113, 184)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: _questionIndex < _questions.length
                ? Quiz(
                    answerQuestion: _answerQuestion,
                    questionIndex: _questionIndex,
                    questions: _questions,
                  )
                : Result(_totalScore, _resetQuiz),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
