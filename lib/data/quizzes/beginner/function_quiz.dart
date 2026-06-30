import 'package:python_quiz/models/quiz_question.dart';

const functionsQuiz = [
  QuizQuestion(
    'Which keyword is used to define a function?',
    [
      'def',
      'function',
      'func',
      'define',
    ],
  ),

  QuizQuestion(
    'Which keyword returns a value from a function?',
    [
      'return',
      'yield',
      'break',
      'pass',
    ],
  ),

  QuizQuestion(
    'Why are functions useful?',
    [
      'To reuse code',
      'To slow down programs',
      'To declare variables',
      'To create comments',
    ],
  ),

  QuizQuestion(
    'What is a parameter?',
    [
      'A variable received by a function',
      'The returned value',
      'A loop',
      'A module',
    ],
  ),

  QuizQuestion(
    'Which function prints output to the console?',
    [
      'print()',
      'display()',
      'echo()',
      'show()',
    ],
  ),
  QuizQuestion(
    'How do you call a function named greet?',
    [
      'greet()',
      'call greet()',
      'function greet()',
      'run greet()',
    ],
  ),

  QuizQuestion(
    'What will this function return?\n\n'
        'def add(a, b):\n'
        '    return a + b\n\n'
        'print(add(2, 3))',
    [
      '5',
      '23',
      'Error',
      'None',
    ],
  ),

  QuizQuestion(
    'What happens if a function does not have a return statement?',
    [
      'It returns None',
      'It returns 0',
      'It causes a SyntaxError',
      'It returns an empty string',
    ],
  ),

  QuizQuestion(
    'What will this code print?\n\n'
        'def greet():\n'
        '    print("Hello")\n\n'
        'greet()',
    [
      'Hello',
      'greet',
      'None',
      'Error',
    ],
  ),

  QuizQuestion(
    'Which function can accept any number of positional arguments?',
    [
      'A function using *args',
      'A function using **kwargs',
      'A function with no parameters',
      'A lambda function',
    ],
  ),

  QuizQuestion(
    'Which function can accept any number of keyword arguments?',
    [
      'A function using **kwargs',
      'A function using *args',
      'A recursive function',
      'A generator function',
    ],
  ),
];